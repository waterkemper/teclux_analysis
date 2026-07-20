inherited frmvisualizarlogcontratos: Tfrmvisualizarlogcontratos
  Left = 281
  Top = 170
  ActiveControl = dbgvisualizarlogcontratos
  Caption = 'Hist'#243'rico do Contrato'
  ClientHeight = 521
  ClientWidth = 835
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgvisualizarlogcontratos: TtecDBGrid
    Left = 0
    Top = 0
    Width = 835
    Height = 521
    Align = alClient
    DataSource = dsrHistoricoContrato
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    RowWrap = 60
    Large = False
    DoubleRowColor = True
    TitleMinHeight = 100
    CellHeights = 100
    StrippedColor = 16054260
    CanDelete = False
    CanNotInsertFromGrid = False
    PostOnEnter = False
    PostOnSetUpDown = False
    DenySort = False
    DefaultRowHeight = 18
    ExibirNumerodaLinha = False
    NaoAtribuirDadosaTabelaaoDigitar = False
    ShowWhenFieldInvisible = False
    CanClickWhenEditing = False
  end
  object qryvisualizarlogcamposcontratos: TtecQuery
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
      'select * from contratos_log_modified(:contrato, :id1, :id2);'
      ''
      ''
      '/*'
      ''
      '  AQUI PENDURO MINHAS CHUTEIRAS'
      ''
      ''
      
        '        CREATE OR REPLACE FUNCTION "public"."contratos_log_modif' +
        'ied" (varchar, varchar, varchar) RETURNS SETOF "public"."tp_camp' +
        'oalterado" AS'
      '        $body$'
      '        declare'
      '           contrato           alias for $1;'
      '           trigger_id_1       alias for $2;'
      '           trigger_id_2       alias for $3;'
      ''
      '           v_sql VARCHAR;'
      '           dados tp_campoalterado;'
      '           tabela     record;'
      '           resultado RECORD;'
      ''
      '        begin'
      ''
      '          v_sql := '#39#39';'
      ''
      '          for tabela in SELECT column_name'
      '              FROM information_schema.columns'
      '              WHERE table_schema = '#39'public'#39
      '                AND table_name   = '#39'contratos_log'#39' '
      
        '                and substring(column_name from 1 for 8)<>'#39'trigge' +
        'r_'#39' loop'
      #9#9
      
        '            v_sql := '#39' select ct_l1.numero, '#39#39#39' || tabela.column' +
        '_name || '#39#39#39' as CampoAlterado, cast(ct_l1.'#39'||tabela.column_name|' +
        '|'#39' as varchar) as ValorAnterior, cast(ct_l2.'#39'||tabela.column_nam' +
        'e||'#39' as varchar) as ValorAlterado'#39
      
        '                     '#39' from contratos_log ct_l1 left join contra' +
        'tos_log ct_l2 on ct_l1.numero = ct_l2.numero where ct_l1.numero ' +
        '= '#39#39#39'||contrato||'#39#39#39' and ct_l1.trigger_id = '#39'||trigger_id_1||'
      
        '               '#39' and ct_l2.trigger_id = '#39'||trigger_id_2||'#39' and c' +
        't_l1.'#39'||tabela.column_name ||'#39' <> ct_l2.'#39'||tabela.column_name;'
      '    '#9#9#9#9
      '            FOR resultado IN EXECUTE v_sql LOOP'
      
        '                dados.campoalterado := cast(resultado.CampoAlter' +
        'ado as varchar);'
      
        '                dados.valoranterior := cast(resultado.ValorAnter' +
        'ior as varchar);'
      
        '                dados.valoralterado := cast(resultado.ValorAlter' +
        'ado as varchar);'
      '                RETURN NEXT dados;'
      '            END LOOP;'#9#9
      #9#9
      ''
      '          end loop;'
      ''
      '          return;'
      ''
      '        END;'
      '        $body$'
      
        '        LANGUAGE '#39'plpgsql'#39' VOLATILE CALLED ON NULL INPUT SECURIT' +
        'Y INVOKER;'
      ''
      ''
      '*/')
    RequestLive = False
    Left = 1637
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
        Value = '567554'
      end
      item
        DataType = ftString
        Name = 'id1'
        ParamType = ptUnknown
        Value = #39'3'#39
      end
      item
        DataType = ftString
        Name = 'id2'
        ParamType = ptUnknown
        Value = #39'4'#39
      end
      item
        DataType = ftUnknown
        Name = '='
        ParamType = ptUnknown
      end>
    object qryvisualizarlogcamposcontratoscampoalterado: TStringField
      FieldName = 'campoalterado'
      Size = 10
    end
    object qryvisualizarlogcamposcontratosvaloranterior: TStringField
      FieldName = 'valoranterior'
      Size = 5
    end
    object qryvisualizarlogcamposcontratosvaloralterado: TStringField
      FieldName = 'valoralterado'
      Size = 6
    end
  end
  object dsrvisualizarlogcamposcontratos: TtecDataSource
    DataSet = qryvisualizarlogcamposcontratos
    Left = 1637
    Top = 224
  end
  object qryHistoricoContrato: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doHourGlass, doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryvisualizarlogcontratosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select c.*,'
      ''
      ''
      '       cast (case when c.situacao = '#39'O'#39' then '#39'OR'#199'ADO'#39
      '                        when c.situacao = '#39'R'#39' then '#39'RESERVADO'#39
      '                        when c.situacao = '#39'F'#39' then'
      '                             case when'
      ''
      '                                 coalesce((select true'
      '                                           from dadosfiscais df'
      
        '                                           where df.contrato = c' +
        'oalesce(c.primogenito,c.numero)'
      
        '                                             and df.situacao = '#39 +
        'N'#39
      
        '                                             and mod(df.codigofi' +
        'scal,1000) = 922 limit 1), false)'
      
        '                             then '#39'SIMPLES FATURAMENTO'#39' else '#39'FA' +
        'TURADO'#39' end'
      
        '                        when c.situacao = '#39'P'#39' then '#39'NOTA PARCIAL' +
        #39
      '                        when c.situacao = '#39'N'#39' then '#39'NOTA FISCAL'#39
      '                        when c.situacao = '#39'C'#39' then '#39'CANCELADO'#39
      '             end as varchar(20)) as NomeSituacao'
      'from'
      '   contratos_log c'
      'where'
      '   c.numero = :contrato'
      'order by'
      '   c.trigger_changed'
      ' , c.trigger_id'
      '')
    RequestLive = False
    Left = 128
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryHistoricoContratonumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Required = True
    end
    object qryHistoricoContratocliente: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'cliente'
    end
    object qryHistoricoContratotipocliente: TStringField
      DisplayLabel = 'T'
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryHistoricoContratosituacao: TStringField
      DisplayLabel = 'Sit'
      FieldName = 'situacao'
      Size = 1
    end
    object qryHistoricoContratonomesituacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'nomesituacao'
    end
    object qryHistoricoContratovendedor: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'vendedor'
    end
    object qryHistoricoContratodata: TDateField
      DisplayLabel = 'Data'
      FieldName = 'data'
    end
    object qryHistoricoContratofaturamento: TDateField
      DisplayLabel = 'Faturamento'
      FieldName = 'faturamento'
    end
    object qryHistoricoContratovalorprazo: TFloatField
      DisplayLabel = 'Valor a Prazo'
      FieldName = 'valorprazo'
    end
    object qryHistoricoContratotrigger_changed: TDateTimeField
      FieldName = 'trigger_changed'
    end
    object qryHistoricoContratotrigger_user: TStringField
      FieldName = 'trigger_user'
      Size = 32
    end
    object qryHistoricoContratorenegociacao: TDateField
      DisplayLabel = 'Renegociacao'
      FieldName = 'renegociacao'
    end
    object qryHistoricoContratoos_garantia: TBooleanField
      FieldName = 'os_garantia'
    end
    object qryHistoricoContratoos_garantia_status: TStringField
      FieldName = 'os_garantia_status'
      Size = 1
    end
    object qryHistoricoContratoos_garantia_processo: TStringField
      FieldName = 'os_garantia_processo'
      Size = 50
    end
    object qryHistoricoContratoos_cortesia: TBooleanField
      FieldName = 'os_cortesia'
    end
    object qryHistoricoContratotrigger_mode: TStringField
      FieldName = 'trigger_mode'
      Size = 10
    end
    object qryHistoricoContratotrigger_tuple: TStringField
      FieldName = 'trigger_tuple'
      Size = 5
    end
    object qryHistoricoContratotrigger_id: TLargeintField
      FieldName = 'trigger_id'
      Required = True
    end
    object qryHistoricoContratoavalista: TIntegerField
      DisplayLabel = 'Avalista'
      FieldName = 'avalista'
    end
    object qryHistoricoContratofilialvenda: TIntegerField
      DisplayLabel = 'Filial de venda'
      FieldName = 'filialvenda'
    end
    object qryHistoricoContratovalorvista: TFloatField
      DisplayLabel = 'Valor a Vista'
      FieldName = 'valorvista'
    end
    object qryHistoricoContratocreditotroca: TFloatField
      DisplayLabel = 'Cred. Troca'
      FieldName = 'creditotroca'
    end
    object qryHistoricoContratodesconto: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'desconto'
    end
    object qryHistoricoContratofrete: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'frete'
    end
    object qryHistoricoContratoseguro: TFloatField
      DisplayLabel = 'Seguro'
      FieldName = 'seguro'
    end
    object qryHistoricoContratoagente: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'agente'
    end
    object qryHistoricoContratoanalista: TIntegerField
      DisplayLabel = 'Analista'
      FieldName = 'analista'
    end
    object qryHistoricoContratoorigem: TStringField
      FieldName = 'origem'
    end
    object qryHistoricoContratoprimogenito: TStringField
      FieldName = 'primogenito'
    end
    object qryHistoricoContratoplano: TIntegerField
      FieldName = 'plano'
    end
    object qryHistoricoContratotaxajuros: TFloatField
      FieldName = 'taxajuros'
    end
    object qryHistoricoContratoconsideracoes: TStringField
      FieldName = 'consideracoes'
      Size = 1000
    end
    object qryHistoricoContratoempcargo: TIntegerField
      FieldName = 'empcargo'
    end
    object qryHistoricoContratoobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 1000
    end
    object qryHistoricoContratoquitado: TBooleanField
      FieldName = 'quitado'
    end
    object qryHistoricoContratocan_data: TDateField
      FieldName = 'can_data'
    end
    object qryHistoricoContratocan_usuariologado: TIntegerField
      FieldName = 'can_usuariologado'
    end
    object qryHistoricoContratocan_usuarioautorizacao: TIntegerField
      FieldName = 'can_usuarioautorizacao'
    end
    object qryHistoricoContratodatareservado: TDateField
      FieldName = 'datareservado'
    end
    object qryHistoricoContratocontribicms: TBooleanField
      FieldName = 'contribicms'
    end
    object qryHistoricoContratovendaconsumidorfinal: TBooleanField
      FieldName = 'vendaconsumidorfinal'
    end
    object qryHistoricoContratousuariologadoalteracao: TIntegerField
      FieldName = 'usuariologadoalteracao'
    end
    object qryHistoricoContratousuarioalteracao: TIntegerField
      FieldName = 'usuarioalteracao'
    end
    object qryHistoricoContratosuframa: TStringField
      FieldName = 'suframa'
      Size = 9
    end
    object qryHistoricoContratoentrua: TStringField
      FieldName = 'entrua'
      Size = 100
    end
    object qryHistoricoContratoentnumero: TIntegerField
      FieldName = 'entnumero'
    end
    object qryHistoricoContratoentbairro: TIntegerField
      FieldName = 'entbairro'
    end
    object qryHistoricoContratoentcep: TIntegerField
      FieldName = 'entcep'
    end
    object qryHistoricoContratoentcomplemento: TStringField
      FieldName = 'entcomplemento'
      Size = 100
    end
    object qryHistoricoContratoentcidade: TIntegerField
      FieldName = 'entcidade'
    end
    object qryHistoricoContratoentestado: TStringField
      FieldName = 'entestado'
      Size = 2
    end
    object qryHistoricoContratoentrada: TDateField
      FieldName = 'entrada'
    end
  end
  object dsrHistoricoContrato: TtecDataSource
    DataSet = qryHistoricoContrato
    Left = 120
    Top = 248
  end
  object qryHistoricoContrato_Anterior: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryvisualizarlogcontratosAfterScroll
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      ';'
      'select selecao.*'
      'from'
      '('
      ''
      
        'select coalesce(cast(to_char(ct_l.trigger_changed, '#39'YYYY-MM-DD H' +
        'H24:MI:SS'#39') as timestamp), cast(ct.data as timestamp)) as dataho' +
        'ra,'
      '       ct_l.trigger_user as loginusuario,'
      
        '       cast('#39'ABERTURA - Vendedor '#39'||cast(ct.vendedor as varchar)' +
        '||'#39' '#39'||cast(u.nome as varchar)  as varchar(100)) as evento'
      'from contratos ct'
      '     join usuarios u on'
      '     ct.vendedor = u.codigo'
      '     left join'
      '     (select ct_l.* from contratos_log ct_l'
      '      where ct_l.trigger_mode='#39'INSERT'#39
      '        and ct_l.numero = :contrato'
      '        order by ct_l.trigger_changed, ct_l.trigger_id limit 1'
      '        ) as ct_l'
      '        on ct.numero = ct_l.numero'
      'where ct.numero = :contrato'
      '  and ct.origem is null'
      ''
      'union all'
      '  '
      
        'select coalesce(cast(to_char(ct_l.trigger_changed, '#39'YYYY-MM-DD H' +
        'H24:MI:SS'#39') as timestamp), cast(ct.data as timestamp)) as dataho' +
        'ra,'
      '       ct_l.trigger_user as loginusuario,'
      
        '       cast('#39'ABERTURA POR RENEGOCIA'#199#195'O DO CONTRATO ORIGEM N. '#39'||' +
        'ct.origem as varchar(100)) as evento'
      'from contratos ct'
      '     left join'
      '     (select ct_l.* from contratos_log ct_l'
      '      where ct_l.trigger_mode='#39'INSERT'#39
      '        and ct_l.numero = :contrato'
      '        order by ct_l.trigger_changed, ct_l.trigger_id limit 1'
      '        ) as ct_l'
      '        on ct.numero = ct_l.numero'
      'where ct.numero = :contrato'
      '  and ct.origem  is not null'
      ''
      ''
      'union all'
      ''
      
        'select coalesce(cast(to_char(ct_l.trigger_changed, '#39'YYYY-MM-DD H' +
        'H24:MI:SS'#39') as timestamp), cast(ct.datareservado as timestamp)) ' +
        'as datahora,'
      '       ct_l.trigger_user as loginusuario,'
      '       cast('#39'RESERVA'#39' as varchar(100)) as evento'
      'from contratos ct'
      '/*'
      '     join usuarios u on'
      '     ct.analista = u.codigo'
      '     */'
      '     left join'
      '     (select ct_l.* from contratos_log ct_l'
      '      where ct_l.trigger_mode='#39'UPDATE'#39
      '        and ct_l.numero = :contrato'
      '        and ct_l.situacao = '#39'R'#39
      
        '      order by ct_l.trigger_changed, ct_l.trigger_id limit 1) as' +
        ' ct_l'
      '        on ct.numero = ct_l.numero'
      'where ct.numero = :contrato'
      '    and ct.situacao not in ('#39'O'#39')'
      '    and ct.origem is null'
      ''
      'union all'
      ''
      
        'select coalesce(cast(to_char(ct_l.trigger_changed, '#39'YYYY-MM-DD H' +
        'H24:MI:SS'#39') as timestamp), cast(ct.faturamento as timestamp)) as' +
        ' datahora,'
      '       ct_l.trigger_user as loginusuario,'
      '       case when ct.analista is not null then'
      
        '         cast('#39'FATURAMENTO - Analista '#39'||cast(ct.analista as var' +
        'char)||'#39' '#39'||cast(u.nome as varchar)  as varchar(100))'
      '       else'
      '         cast('#39'FATURAMENTO'#39' as varchar(100))'
      '       end as evento'
      'from contratos ct'
      '     left join usuarios u on'
      '     ct.analista = u.codigo'
      '     left join'
      '     (select ct_l.* from contratos_log ct_l'
      '      where ct_l.trigger_mode='#39'UPDATE'#39
      '        and ct_l.numero = :contrato'
      '        and ct_l.situacao = '#39'F'#39
      
        '      order by ct_l.trigger_changed, ct_l.trigger_id limit 1) as' +
        ' ct_l'
      '        on ct.numero = ct_l.numero'
      'where ct.numero = :contrato'
      '  and ct.situacao not in ('#39'O'#39','#39'R'#39')'
      '  and ct.origem is null'
      ''
      'union all'
      ''
      
        'select distinct coalesce(df.dhprocnfe,df.datahoraemissao) as dat' +
        'ahora,'
      '       ct_l.trigger_user as loginusuario,'
      ''
      '       case when n.dadofiscal is not null then'
      
        '          cast('#39'EMISS'#195'O NOTA FISCAL - Modelo '#39'||cast(df.modelodo' +
        'cto as varchar)||'#39' S'#233'rie '#39
      
        '                                              ||cast(n.serie as ' +
        'varchar)||'#39' N. '#39
      
        '                                              ||cast(n.numero as' +
        ' varchar)||'#39' Situa'#231#227'o: '#39
      
        '                                              ||cast(df.situacao' +
        ' as varchar) as varchar(100))'
      '            when c.dadofiscal is not null then'
      
        '          cast('#39'EMISS'#195'O CUPOM FISCAL - Maq. '#39'||cast(c.maquina as' +
        ' varchar)||'#39' Int. '#39
      
        '                                              ||cast(c.intervens' +
        'ao as varchar)||'#39' N. '#39
      
        '                                              ||cast(c.numero as' +
        ' varchar)||'#39' Situa'#231#227'o: '#39
      
        '                                              ||cast(df.situacao' +
        ' as varchar) as varchar(100))'
      '        end as evento'
      ''
      'from dadosfiscais df'
      '     left join notas n on df.numero = n.dadofiscal'
      '     left join cupons c on df.numero = c.dadofiscal'
      '     /*'
      '     join usuarios u on'
      '     df.vendedor = u.codigo'
      '     */'
      '     left join'
      ''
      '     (select ct_l.* from contratos_log ct_l'
      '      where ct_l.trigger_mode='#39'UPDATE'#39
      '        and ct_l.numero = :contrato'
      '        and (ct_l.situacao = '#39'N'#39' or ct_l.situacao = '#39'P'#39')'
      '      order by ct_l.trigger_changed, ct_l.trigger_id) as ct_l'
      '        on df.contrato = ct_l.numero'
      'where df.contrato = :contrato'
      ''
      'union all'
      ''
      ''
      'select coalesce(np.dhprocnfe,np.datahoraemissao) as datahora,'
      ''
      '       cast(u.usename as varchar) loginusuario,'
      ''
      
        '       cast('#39'DEVOLU'#199#195'O NF - Mod. '#39'||cast(np.modelodocto as varch' +
        'ar)||'#39' S'#233'rie '#39
      
        '                                              ||cast(np.serie as' +
        ' varchar)||'#39' N. '#39
      
        '                                              ||cast(np.numero a' +
        's varchar)'
      
        '                                              ||'#39' Sit. '#39'||cast(n' +
        'p.situacao as varchar)'
      '                                              ||'#39' Prod. '#39
      
        '                                              ||p.codigovisual||' +
        #39' '#39
      
        '                                              ||'#39' Qtdade '#39'||cast' +
        '(replace(to_char(pnp.quantidade, '#39'999999D999'#39'),'#39'.'#39','#39','#39') as varch' +
        'ar)'
      ''
      '                                              as varchar(100)'
      ''
      ''
      '                                              ) as evento'
      ''
      ''
      'from notaspag np'
      '     join produtosnotaspag pnp'
      '          join movimentos m'
      '               join usuarios u on m.usuariologado = u.codigo'
      '          ON'
      '          pnp.codigonota = m.codigonota'
      '          and pnp.produto = m.produto'
      '          and pnp.numero = m.numerocontrole'
      ''
      '          join produtos p on pnp.produto = p.codigo'
      '     on np.codigo = pnp.codigonota'
      ''
      '     join contratosdevolvidos cv'
      '       on np.contrato = cv.contrato'
      '      and pnp.produto = cv.produto'
      '      and cv.situacao = '#39'N'#39
      '      and cv.tipo = '#39'D'#39
      ''
      'where np.contrato = :contrato'
      ''
      'union all'
      ''
      'select coalesce(np.dhprocnfe,np.datahoraemissao) as datahora,'
      ''
      '       cast(u.usename as varchar) loginusuario,'
      ''
      
        '       cast('#39'TROCA NF - Mod. '#39'||cast(np.modelodocto as varchar)|' +
        '|'#39' S'#233'rie '#39
      
        '                                              ||cast(np.serie as' +
        ' varchar)||'#39' N. '#39
      
        '                                              ||cast(np.numero a' +
        's varchar)'
      
        '                                              ||'#39' Sit. '#39'||cast(n' +
        'p.situacao as varchar)'
      '                                              ||'#39' Prod. '#39
      
        '                                              ||p.codigovisual||' +
        #39' '#39
      
        '                                              ||'#39' Qtdade '#39'||cast' +
        '(replace(to_char(pnp.quantidade, '#39'999999D999'#39'),'#39'.'#39','#39','#39') as varch' +
        'ar)'
      ''
      '                                              as varchar(100)'
      ''
      ''
      '                                              ) as evento'
      ''
      ''
      'from notaspag np'
      '     join produtosnotaspag pnp'
      '          join movimentos m'
      '               join usuarios u on m.usuariologado = u.codigo'
      '          ON'
      '          pnp.codigonota = m.codigonota'
      '          and pnp.produto = m.produto'
      '          and pnp.numero = m.numerocontrole'
      ''
      '          join produtos p on pnp.produto = p.codigo'
      '     on np.codigo = pnp.codigonota'
      ''
      '     join contratosdevolvidos cv'
      '       on np.contrato = cv.contrato'
      '      and pnp.produto = cv.produto'
      '      and cv.situacao = '#39'N'#39
      '      and cv.tipo = '#39'T'#39
      ''
      'where np.contrato = :contrato'
      ''
      ''
      ''
      'union all'
      ''
      'select cast(m.data||'#39' '#39'||m.hora as timestamptz) as datahora,'
      '       cast(u.usename as varchar) loginusuario,'
      '              cast('#39'DEVOLU'#199#195'O CONTRATO FATURADO - Prod. '#39
      
        '                                              ||p.codigovisual||' +
        #39' '#39
      
        '                                              ||'#39' Qtdade '#39'||cast' +
        '(replace(to_char(cv.quantidade, '#39'999999D999'#39'),'#39'.'#39','#39','#39') as varcha' +
        'r)'
      ''
      '                                              as varchar(100)'
      ''
      ''
      '                                              ) as evento'
      'from contratosdevolvidos cv'
      '     join produtos p'
      '     on cv.produto = p.codigo'
      ''
      '     join movimentos m'
      '          join usuarios u on m.usuariologado = u.codigo'
      '     on m.data = cv.devolucao'
      '     and m.produto = cv.produto'
      '     and m.contrato = cv.contrato'
      'where cv.contrato = :contrato'
      '  and situacao = '#39'F'#39' and tipo = '#39'D'#39
      ''
      'union all'
      ''
      'select distinct'
      '       cast(m.data||'#39' '#39'||m.hora as timestamptz) as datahora,'
      '       cast(u.usename as varchar) loginusuario,'
      '              cast('#39'TROCA CONTRATO FATURADO - Prod. '#39
      
        '                                              ||p.codigovisual||' +
        #39' '#39
      
        '                                              ||'#39' Qtdade '#39'||cast' +
        '(replace(to_char(cv.quantidade, '#39'999999D999'#39'),'#39'.'#39','#39','#39') as varcha' +
        'r)'
      ''
      '                                              as varchar(100)'
      ''
      ''
      '                                              ) as evento'
      'from contratosdevolvidos cv'
      '     join produtos p'
      '     on cv.produto = p.codigo'
      ''
      '     join movimentos m'
      '          join usuarios u on m.usuariologado = u.codigo'
      '     on m.data = cv.devolucao'
      '     and m.produto = cv.produto'
      '     and m.contrato = cv.contrato'
      'where cv.contrato = :contrato'
      '  and situacao = '#39'F'#39' and tipo = '#39'T'#39
      ''
      'union all'
      ''
      ''
      
        'select coalesce(cast(to_char(ct_l.trigger_changed, '#39'YYYY-MM-DD H' +
        'H24:MI:SS'#39') as timestamp), cast(ct.data as timestamp)) as dataho' +
        'ra,'
      '       ct_l.trigger_user as loginusuario,'
      
        '       cast('#39'RENEGOCIADO PARA O CONTRATO N. '#39'||ct.numero  as var' +
        'char(100)) as evento'
      'from contratos ct'
      '     left join'
      '     (select ct_l.* from contratos_log ct_l'
      '      where ct_l.trigger_mode='#39'INSERT'#39
      
        '        and ct_l.numero = (select ct2.numero from contratos ct2 ' +
        'where ct2.origem = :contrato)'
      '        order by ct_l.trigger_changed, ct_l.trigger_id limit 1'
      '        ) as ct_l'
      '        on ct.numero = ct_l.numero'
      'where ct.origem = :contrato'
      ''
      ') as selecao'
      ''
      'order by datahora')
    RequestLive = False
    Left = 704
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'datahora'
    end
    object StringField1: TStringField
      FieldName = 'loginusuario'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'evento'
      Size = 100
    end
  end
end
