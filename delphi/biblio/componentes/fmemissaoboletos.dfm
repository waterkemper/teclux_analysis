object frmImpressaoBoletoCodigoBarras: TfrmImpressaoBoletoCodigoBarras
  Left = 197
  Top = 202
  Width = 582
  Height = 255
  BorderIcons = []
  Caption = 'Impress'#227'o do Boleto Banc'#225'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMinimized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object boleto: TgbTitulo
    TipoOcorrencia = toRemessaRegistrar
    LocalPagamento = 'PAG'#193'VEL EM QUALQUER BANCO AT'#201' O VENCIMENTO'
    Cedente.TipoInscricao = tiPessoaJuridica
    Sacado.TipoInscricao = tiPessoaFisica
    AceiteDocumento = adNao
    EspecieDocumento = edDuplicataMercantil
    EmissaoBoleto = ebClienteEmite
    Left = 216
    Top = 32
  end
  object dbaTecSoft: TtecDatabase
    Host = '10.16.1.1'
    Port = '5432'
    Database = 'newbelle'
    Encoding = etNone
    Login = 'tecsoft'
    Password = 'alpinismo'
    LoginPrompt = False
    Connected = True
    Left = 322
    Top = 94
  end
  object tstTecSoft: TtecTransact
    Options = [toHourGlass]
    AutoCommit = False
    Database = dbaTecSoft
    AutoRecovery = True
    TransactSafe = True
    TransIsolation = ptDefault
    Left = 322
    Top = 126
  end
  object qryParcelas: TtecQuery
    Tag = -1
    Database = dbaTecSoft
    Transaction = tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryParcelasCalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select cc.carteira,'
      '       cc.cedente                     as cedente_codigocedente,'
      
        '       cc.banco                       as cedente_contabancaria_b' +
        'anco_codigo,'
      
        '       cc.agencia                     as Cedente_ContaBancaria_C' +
        'odigoAgencia,'
      
        '       cc.digito                      as Cedente_ContaBancaria_D' +
        'igitoConta,'
      
        '       cc.conta                       as Cedente_ContaBancaria_N' +
        'umeroConta,'
      '       cc.usodobanco,'
      '       (Select b.nome'
      '        From bairros b'
      '        Where f.estado = b.estado'
      '          and f.cidade = b.cidade'
      
        '          and f.bairro = b.codigo)    as Cedente_Endereco_bairro' +
        ','
      
        '       cast(lpad(f.cep,8,'#39'0'#39') as varchar(8))  as Cedente_Enderec' +
        'o_Cep,'
      '      (Select cd.nome'
      '       From cidades cd'
      '       Where f.estado = cd.estado'
      
        '         and f.cidade = cd.codigo)    as Cedente_Endereco_Cidade' +
        ','
      
        '       f.estado                       as Cedente_Endereco_Estado' +
        ','
      '       f.rua                          as Cedente_Endereco_Rua,'
      '       f.razao                        as Cedente_Nome,'
      '       f.cnpj                         as Cedente_NumeroCPFCGC,'
      '       c.faturamento                  as DataDocumento,'
      ''
      
        '      (select cast(replace(parametros_valor('#39'DESCONTO PAG ANTECI' +
        'PADO'#39', c.filialvenda),'#39','#39','#39'.'#39') as numeric(9,2)))'
      '                                      as PercentualDesconto,'
      ''
      '      (select parametros_valor('#39'DIAS ATRASO 1'#39'))'
      '                                      as diasatraso1,'
      
        '      (select cast(replace(parametros_valor('#39'PERCENTUAL ATRASO J' +
        'UROS 1'#39',c.filialvenda), '#39','#39', '#39'.'#39') as numeric(5,2)))'
      '                                      as PercentualMoraJuros,'
      '       p.datavencto,'
      '       cc.instrucoesboleto            as instrucoes,'
      '       cc.localpagamento,'
      
        '       cast(p.contrato||lpad(p.numero,2,'#39'0'#39') as varchar)      as' +
        ' NossoNumero,'
      '       (select max(n.numero)'
      '        from notas n, dadosfiscais df'
      '        where n.dadofiscal = df.numero'
      '          and df.contrato = c.numero) as NotaFiscal,'
      '       (select count(*)'
      '        from notas n, dadosfiscais df'
      '        where n.dadofiscal = df.numero'
      '          and df.contrato = c.numero) as qtNotaFiscais,'
      '       p.contrato,'
      '       (Select b.nome'
      '        From bairros b'
      '        Where c.estado = b.estado'
      '          and c.cidade = b.cidade'
      '          and c.bairro = b.codigo)    as Sacado_Endereco_Bairro,'
      
        '       cast(lpad(c.cep,8,'#39'0'#39') as varchar(8))  as Sacado_Endereco' +
        '_Cep,'
      '       (Select cd.nome'
      '          From cidades cd'
      '         Where c.estado = cd.estado'
      '           and c.cidade = cd.codigo)  as Sacado_Endereco_cidade,'
      '       c.estado                       as Sacado_Endereco_estado,'
      '       c.rua                          as Sacado_Endereco_rua,'
      '       c.nome                         as Sacado_Nome,'
      '       c.pessoaTipo,'
      '       c.pessoanumero                 as Sacado_NumeroCPFCGC,'
      '       p.contrato||'#39'-'#39'||p.numero      as SeuNumero,'
      '       p.valorvencto                  as ValorDocumento'
      ''
      '/*'
      '           p.datapagto,'
      '           p.valorpagto,'
      '           (((p.valorvencto * 2) / 30) / 100) as jurosbloquete,'
      '           (p.valorpagto - p.valorvencto) as jurodesconto,'
      '           (p.datapagto - p.datavencto) as diasatraso,'
      '           (case when (p.datapagto - p.datavencto) > 0 then'
      
        '                      ((p.valorpagto - p.valorvencto)  /  (p.dat' +
        'apagto - p.datavencto))'
      '                    else   (p.valorpagto - p.valorvencto)'
      '            end)  as jurosdias,'
      '           f.codigo as filial,'
      
        '          (select parametros_valor('#39'DIAS ATRASO 1'#39')) AS diasatra' +
        'so1,'
      
        '          (select parametros_valor('#39'DIAS ATRASO 2'#39')) AS diasatra' +
        'so2,'
      
        '          (select parametros_valor('#39'PERCENTUAL ATRASO JUROS 1'#39'))' +
        ' AS percentualatrasojuros1,'
      
        '          (select parametros_valor('#39'PERCENTUAL ATRASO JUROS 2'#39'))' +
        ' AS percentualatrasojuros,'
      
        '          (select parametros_valor('#39'PERCENTUAL ATRASO MULTAS 1'#39')' +
        ') AS percentualatrasomultas1,'
      
        '          (select parametros_valor('#39'PERCENTUAL ATRASO MULTAS 2'#39')' +
        ') AS percentualatrasomultas2,'
      
        '          (select(((p.valorvencto * cast(parametros_valor('#39'PERCE' +
        'NTUAL ATRASO JUROS 1'#39') as numeric(9,2)))) / 30) / 100) as jurosa' +
        'traso1,'
      
        '          (select(((p.valorvencto * cast(parametros_valor('#39'PERCE' +
        'NTUAL ATRASO JUROS 2'#39') as numeric(9,2)))) / 30) / 100) as jurosa' +
        'traso2'
      '*/'
      ''
      
        ' From  parcelas p, contratos c, filiais f, contas cc, agencias a' +
        ', bancos b'
      'Where  (c.numero = p.contrato) and'
      '            (c.filialvenda = f.codigo) and'
      '            (p.contrato = :contrato) and'
      
        '      cc.conta =  parametros_valor('#39'Conta banc'#225'ria para emiss'#227'o ' +
        'do boleto'#39',c.filialvenda) and'
      '      cc.agencia = a.codigo and'
      '      cc.banco = a.banco and'
      '      a.banco = b.codigo and'
      '      p.datapagto is null'
      ''
      'Order By p.datavencto, p.datapagto')
    RequestLive = True
    Left = 82
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryParcelascarteira: TStringField
      FieldName = 'carteira'
      Size = 10
    end
    object qryParcelascedente_codigocedente: TStringField
      FieldName = 'cedente_codigocedente'
    end
    object qryParcelascedente_contabancaria_banco_codigo: TIntegerField
      FieldName = 'cedente_contabancaria_banco_codigo'
      DisplayFormat = '0'
    end
    object qryParcelascedente_contabancaria_codigoagencia: TIntegerField
      FieldName = 'cedente_contabancaria_codigoagencia'
      DisplayFormat = '0'
    end
    object qryParcelascedente_contabancaria_digitoconta: TStringField
      FieldName = 'cedente_contabancaria_digitoconta'
      Size = 2
    end
    object qryParcelascedente_contabancaria_numeroconta: TIntegerField
      FieldName = 'cedente_contabancaria_numeroconta'
      Required = True
      DisplayFormat = '0'
    end
    object qryParcelascedente_endereco_bairro: TStringField
      FieldName = 'cedente_endereco_bairro'
      Size = 50
    end
    object qryParcelascedente_endereco_cep: TStringField
      FieldName = 'cedente_endereco_cep'
      Size = 8
    end
    object qryParcelascedente_endereco_cidade: TStringField
      FieldName = 'cedente_endereco_cidade'
      Size = 50
    end
    object qryParcelascedente_endereco_estado: TStringField
      FieldName = 'cedente_endereco_estado'
      Required = True
      Size = 2
    end
    object qryParcelascedente_endereco_rua: TStringField
      FieldName = 'cedente_endereco_rua'
      Required = True
      Size = 100
    end
    object qryParcelascedente_nome: TStringField
      FieldName = 'cedente_nome'
      Required = True
      Size = 40
    end
    object qryParcelascedente_numerocpfcgc: TStringField
      FieldName = 'cedente_numerocpfcgc'
      Size = 14
    end
    object qryParcelasDataDesconto: TDateField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'DataDesconto'
      EditMask = '99/99/9999;1; '
      Calculated = True
    end
    object qryParcelaspercentualdesconto: TFloatField
      FieldName = 'percentualdesconto'
      DisplayFormat = '0.00'
    end
    object qryParcelasValorDesconto: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorDesconto'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryParcelasdatadocumento: TDateField
      Alignment = taCenter
      FieldName = 'datadocumento'
      EditMask = '99/99/9999;1; '
    end
    object qryParcelasDataMoraJuros: TDateField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'DataMoraJuros'
      EditMask = '99/99/9999;1; '
      Calculated = True
    end
    object qryParcelaspercentualmorajuros: TFloatField
      FieldName = 'percentualmorajuros'
      DisplayFormat = '0.00'
    end
    object qryParcelasdiasatraso1: TStringField
      FieldName = 'diasatraso1'
      Size = 50
    end
    object qryParcelasdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryParcelaslocalpagamento: TStringField
      FieldName = 'localpagamento'
      Size = 100
    end
    object qryParcelasNumeroDocumento: TStringField
      FieldKind = fkCalculated
      FieldName = 'NumeroDocumento'
      Calculated = True
    end
    object qryParcelasnotafiscal: TIntegerField
      FieldName = 'notafiscal'
      DisplayFormat = '0'
    end
    object qryParcelasqtnotafiscais: TLargeintField
      FieldName = 'qtnotafiscais'
    end
    object qryParcelascontrato: TStringField
      FieldName = 'contrato'
      Required = True
    end
    object qryParcelassacado_endereco_bairro: TStringField
      FieldName = 'sacado_endereco_bairro'
      Size = 50
    end
    object qryParcelassacado_endereco_cep: TStringField
      FieldName = 'sacado_endereco_cep'
      Size = 8
    end
    object qryParcelassacado_endereco_cidade: TStringField
      FieldName = 'sacado_endereco_cidade'
      Size = 50
    end
    object qryParcelassacado_endereco_estado: TStringField
      FieldName = 'sacado_endereco_estado'
      Size = 2
    end
    object qryParcelassacado_endereco_rua: TStringField
      FieldName = 'sacado_endereco_rua'
      Size = 100
    end
    object qryParcelassacado_nome: TStringField
      FieldName = 'sacado_nome'
      Size = 40
    end
    object qryParcelaspessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryParcelassacado_numerocpfcgc: TStringField
      FieldName = 'sacado_numerocpfcgc'
      Size = 14
    end
    object qryParcelasseunumero: TMemoField
      FieldName = 'seunumero'
      BlobType = ftMemo
    end
    object qryParcelasvalordocumento: TFloatField
      FieldName = 'valordocumento'
      DisplayFormat = '0.00'
    end
    object qryParcelasinstrucoes: TStringField
      FieldName = 'instrucoes'
      Size = 300
    end
    object qryParcelasnossonumero: TStringField
      FieldName = 'nossonumero'
      Size = 50
    end
    object qryParcelasValorMoraJuros: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorMoraJuros'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryParcelasusodobanco: TStringField
      FieldName = 'usodobanco'
      Size = 15
    end
  end
end
