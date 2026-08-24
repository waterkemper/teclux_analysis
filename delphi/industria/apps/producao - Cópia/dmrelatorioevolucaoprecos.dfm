inherited dtmRelatorioEvolucaoPrecos: TdtmRelatorioEvolucaoPrecos
  OldCreateOrder = False
  Left = 539
  Top = 190
  Height = 387
  Width = 658
  object dsrEvolucaoPrecos: TtecDataSource
    DataSet = qryEvolucaoPrecos
    Left = 104
    Top = 128
  end
  object qryEvolucaoPrecos: TtecQuery
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
        Name = 'FiltroPeriodo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroClientes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FiltroGrupoProdutos'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      
        '   select TipoCliente, Cliente, Nome, NomePais, grupo, codigovis' +
        'ual, produto_cliente, pn,'
      '          min(datainicio) as datainicio, datafinal,'
      '          PrecoUnitario'
      '  from'
      '  ('
      ''
      
        '   select TipoCliente, Cliente, Nome, NomePais, grupo, codigovis' +
        'ual, produto_cliente, pn,'
      '          datainicio,'
      '          (select df.data - 1'
      '           from dadosfiscais df'
      '                join produtosdadosfiscais pdf'
      '                     join produtos p'
      '                          join caracteristicas c'
      '                          on p.caracteristica = c.codigo'
      '                     on p.codigo = pdf.produto'
      '                on df.numero = pdf.dadofiscal'
      ''
      '           WHERE df.Situacao = '#39'N'#39
      
        '             AND (MOD(df.CodigoFiscal,1000) BETWEEN 101 AND 125 ' +
        'OR'
      
        '                  MOD(df.codigofiscal,1000) BETWEEN 401 and 405 ' +
        'OR'
      '                  MOD(df.CodigoFiscal,1000) BETWEEN 501 AND 503)'
      ''
      '             %FiltroPeriodo'
      '             %FiltroClientes'
      '             %FiltroGrupoProdutos'
      ''
      '             and pdf.produto = selecao.produto'
      '             and df.data > selecao.datainicio'
      ''
      '             and  cast((pdf.quantidade*pdf.precovenda) /'
      
        '           /*cast(*/(case when c.unidade = '#39'MIL'#39' then 1000*pdf.q' +
        'uantidade'
      
        '                        when c.unidade = '#39'CT'#39'  then 100*pdf.quan' +
        'tidade'
      
        '                                                 else pdf.quanti' +
        'dade'
      '                   end'
      
        '               ) /*as numeric(9,0))*/ AS NUMERIC(11,2)) <> selec' +
        'ao.Precounitario'
      '             and df.cliente = selecao.cliente'
      '             order by df.data limit 1'
      '             ) as datafinal,'
      ''
      '          PrecoUnitario'
      '   from'
      '   ('
      ''
      
        '   select TipoCliente, Cliente, Nome, NomePais, grupo, codigovis' +
        'ual, produto, produto_cliente, pn,'
      '          data as datainicio,'
      '          PrecoUnitario'
      '   from'
      '   ('
      '     select df.TipoCliente,'
      '          df.cliente,'
      '          vf.Nome,'
      ''
      '          case when vf.estado = '#39'.'#39' then'
      '            (select c.nome'
      '             from cidades c'
      '             where (c.estado = vf.estado) and'
      '                   (c.codigo = vf.cidade))'
      '          else'
      '            cast('#39'BRASIL'#39' as varchar(50))'
      '          end as NomePais,'
      ''
      '          c.grupo,'
      ''
      '          p.codigovisual,'
      '          pdf.produto,'
      ''
      '          (select cp.produto_cliente'
      '           from clientesprodutos cp'
      '           where cp.produto = pdf.produto'
      '             and cp.cliente = df.cliente'
      '             and cp.tipocliente = df.tipocliente'
      
        '           order by cp.dataultimavenda desc limit 1) as produto_' +
        'cliente,'
      ''
      
        '          (select case when cp.origem is not null then cast(cp.p' +
        'n as varchar)||'#39'-'#39'||cast(cp.origem as varchar)'
      
        '                                                  else cast(cp.p' +
        'n as varchar) end'
      '           from clientesprodutos cp'
      '           where cp.produto = pdf.produto'
      '             and cp.cliente = df.cliente'
      '             and cp.tipocliente = df.tipocliente'
      '           order by cp.dataultimavenda desc limit 1) as pn,'
      ''
      '           df.data,'
      ''
      '           cast((pdf.quantidade*pdf.precovenda) /'
      ''
      
        '           /*cast(*/(case when c.unidade = '#39'MIL'#39' then 1000*pdf.q' +
        'uantidade'
      
        '                        when c.unidade = '#39'CT'#39'  then 100*pdf.quan' +
        'tidade'
      
        '                                                 else pdf.quanti' +
        'dade'
      '                   end'
      
        '               ) /*as numeric(9,0))*/ AS NUMERIC(11,2)) as Preco' +
        'Unitario'
      ''
      ''
      ''
      '          FROM DadosFiscais df'
      '               join produtosdadosfiscais pdf'
      '                    join produtos p'
      '                         join caracteristicas c'
      '                         on p.caracteristica = c.codigo'
      '                    on pdf.produto = p.codigo'
      '               on df.numero = pdf.dadofiscal'
      ''
      
        '               JOIN vFornecedores vf on df.Cliente     = vf.Codi' +
        'go AND'
      '                                        df.TipoCliente = vf.Tipo'
      ''
      '     WHERE df.Situacao = '#39'N'#39'   '
      '       AND (MOD(df.CodigoFiscal,1000) BETWEEN 101 AND 125 OR'
      
        '                 MOD(df.codigofiscal,1000) BETWEEN 401 and 405 O' +
        'R'
      '                 MOD(df.CodigoFiscal,1000) BETWEEN 501 AND 503)'
      ''
      '       %FiltroPeriodo'
      '       %FiltroClientes'
      '       %FiltroGrupoProdutos'
      ''
      '   ) as selecao'
      
        '   GROUP BY  TipoCliente, Cliente, Nome, NomePais, grupo, codigo' +
        'visual, produto, produto_cliente, pn, data, PrecoUnitario'
      
        '   order BY  TipoCliente, Cliente, Nome, NomePais, grupo, codigo' +
        'visual, produto, produto_cliente, pn, data, PrecoUnitario'
      '   ) as selecao'
      '   ) as selecao'
      
        '   GROUP BY  TipoCliente, Cliente, Nome, NomePais, grupo, codigo' +
        'visual, produto_cliente, pn, datafinal, PrecoUnitario'
      
        '   order BY  TipoCliente, Cliente, Nome, NomePais, grupo, codigo' +
        'visual, produto_cliente, pn, min(datainicio), datafinal, PrecoUn' +
        'itario'
      ''
      ''
      '/*'
      ''
      ':DataInicial'
      ':DataFinal'
      ''
      '*/')
    RequestLive = False
    Left = 56
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
    object qryEvolucaoPrecostipocliente: TStringField
      DisplayLabel = 'T'
      FieldName = 'tipocliente'
      Size = 1
    end
    object qryEvolucaoPrecoscliente: TIntegerField
      DisplayLabel = 'CLIENTE'
      FieldName = 'cliente'
    end
    object qryEvolucaoPrecosnome: TStringField
      DisplayLabel = 'NOME DO CLIENTE'
      FieldName = 'nome'
      Size = 50
    end
    object qryEvolucaoPrecosnomepais: TStringField
      DisplayLabel = 'PA'#205'S'
      FieldName = 'nomepais'
      Size = 50
    end
    object qryEvolucaoPrecosgrupo: TStringField
      DisplayLabel = 'GRUPO DE PRODUTOS'
      FieldName = 'grupo'
      Size = 4
    end
    object qryEvolucaoPrecoscodigovisual: TStringField
      DisplayLabel = 'PRODUTO'
      FieldName = 'codigovisual'
      Size = 30
    end
    object qryEvolucaoPrecosproduto_cliente: TStringField
      DisplayLabel = 'PRODUTO NO CLIENTE'
      FieldName = 'produto_cliente'
      Size = 50
    end
    object qryEvolucaoPrecospn: TStringField
      DisplayLabel = 'PART NUMBER'
      FieldName = 'pn'
      Size = 10
    end
    object qryEvolucaoPrecosdatainicio: TDateField
      DisplayLabel = 'DATA DE IN'#205'CIO'
      FieldName = 'datainicio'
    end
    object qryEvolucaoPrecosdatafinal: TDateField
      DisplayLabel = 'DATA DE FIM'
      FieldName = 'datafinal'
    end
    object qryEvolucaoPrecosprecounitario: TFloatField
      DisplayLabel = 'PRE'#199'O UNIT'#193'RIO'
      FieldName = 'precounitario'
    end
  end
  object ExcelExport1: TExcelExport
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'MS Sans Serif'
    FontTitles.Style = [fsBold]
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'MS Sans Serif'
    FontData.Style = []
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 80
    WorksheetName = 'Evolu'#231#227'o_de_Pre'#231'os'
    Dataset = qryEvolucaoPrecos
    Left = 288
    Top = 88
  end
end
