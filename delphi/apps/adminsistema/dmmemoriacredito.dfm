inherited dtmMemoriaCredito: TdtmMemoriaCredito
  OldCreateOrder = False
  Left = 523
  Top = 189
  Height = 233
  Width = 427
  object qryProcuraClientes: TtecQuery
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
      'Select  codigo,'
      '            coalesce(razao,nome) as nome,'
      '            tipo'
      'From     vfornecedores '
      'Where  (codigo  = :codigo) and'
      '             (tipo = :tipocliente)')
    RequestLive = True
    Left = 40
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftString
        Name = 'tipocliente'
        ParamType = ptUnknown
      end>
    object qryProcuraClientescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraClientesnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryProcuraClientestipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
  end
  object dsrProcuraClientes: TtecDataSource
    DataSet = qryProcuraClientes
    Left = 136
    Top = 12
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
      'Select coalesce(v.razao,v.nome) as nome,'
      '           formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,'
      '           v.codigo,'
      '           v.estado,'
      '           v.tipo,'
      '           descricao_tipocliente(v.tipo) as tipocliente,'
      '           c.nome as nomecidade'
      'From   vfornecedores v, cidades c'
      '/*  Preenchida em RunTime  */ Where false'
      '    and (v.tipo <> '#39'L'#39') '
      '    and (v.estado = c.estado)'
      '    and (v.cidade = c.codigo)'
      'Order by UPPER(TO_ASCII(v.nome,''LATIN1''))')
    RequestLive = False
    Left = 234
    Top = 12
    object qryConsultaClientesnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 40
    end
    object qryConsultaClientespessoanumero: TStringField
      DisplayLabel = 'CPF/CNPJ'
      DisplayWidth = 18
      FieldName = 'pessoanumero'
      Size = 18
    end
    object qryConsultaClientesnomecidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'nomecidade'
      Size = 30
    end
    object qryConsultaClientesestado: TStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qryConsultaClientescodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryConsultaClientestipocliente: TStringField
      DisplayLabel = 'Tipo Cliente'
      FieldName = 'tipocliente'
      Size = 14
    end
    object qryConsultaClientestipo: TStringField
      FieldName = 'tipo'
      Visible = False
      Size = 1
    end
  end
  object qryParametros: TtecQuery
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
      'SELECT CAST(Campo[1]  AS INTEGER) AS C1,'
      '       CAST(Campo[2]  AS INTEGER) AS C2,'
      '       CAST(Campo[3]  AS INTEGER) AS C3,'
      '       CAST(Campo[4]  AS INTEGER) AS C4,'
      '       CAST(Campo[5]  AS INTEGER) AS C5,'
      '       CAST(Campo[6]  AS INTEGER) AS C6,'
      '       CAST(Campo[7]  AS INTEGER) AS C7,'
      '       CAST(Campo[8]  AS INTEGER) AS C8,'
      '       CAST(Campo[9]  AS INTEGER) AS C9,'
      '       CAST(Campo[10] AS INTEGER) AS C10,'
      '       CAST(Campo[11] AS INTEGER) AS C11,'
      '       CAST(Campo[12] AS INTEGER) AS C12,'
      '       CAST(Campo[13] AS INTEGER) AS C13,'
      '       CAST(Campo[14] AS VARCHAR) AS C14,'
      '       CAST(Campo[15] AS INTEGER) AS C15,'
      '       CAST(Campo[16] AS VARCHAR) AS C16,'
      '       CAST(Campo[17] AS INTEGER) AS C17,'
      '       CAST(Campo[18] AS VARCHAR) AS C18,'
      '       CAST(Campo[19] AS INTEGER) AS C19,'
      '       CAST(Campo[20] AS INTEGER) AS C20,'
      '       CAST(Campo[21] AS INTEGER) AS C21,'
      '       CAST(Campo[22] AS VARCHAR) AS C22,'
      '       CAST(Campo[23] AS INTEGER) AS C23,'
      '       CAST(Campo[24] AS INTEGER) AS C24,'
      '       CAST(Campo[25] AS INTEGER) AS C25,'
      '       CAST(Campo[26] AS INTEGER) AS C26,'
      '       CAST(Campo[27] AS INTEGER) AS C27,'
      '       CAST(Campo[28] AS INTEGER) AS C28,'
      '       CAST(Campo[29] AS INTEGER) AS C29,'
      '       CAST(Campo[30] AS INTEGER) AS C30,'
      '       CAST(Campo[31] AS INTEGER) AS C31,'
      '       CAST(Campo[32] AS INTEGER) AS C32,'
      '       CAST(Campo[33] AS INTEGER) AS C33,'
      '       CAST(Campo[34] AS INTEGER) AS C34,'
      '       CAST(Campo[35] AS INTEGER) AS C35,'
      '            Campo[36]             AS C36,'
      '       CAST(Campo[37] AS INTEGER) AS C37,'
      '            Campo[38]             AS C38,'
      '            Campo[39]             AS C39,'
      '            Campo[40]             AS C40,'
      '            Campo[41]             AS C41,'
      '       CAST(Campo[42] AS INTEGER) AS C42,'
      '       CAST(Campo[43] AS INTEGER) AS C43,'
      '            Campo[44]             AS C44,'
      '            Campo[45]             AS C45,'
      '            Campo[46]             AS C46,'
      '       CAST(Campo[47] AS INTEGER) AS C47,'
      '       CAST(Campo[48] AS INTEGER) AS C48,'
      '            Campo[49]             AS C49,'
      ''
      '       CASE CAST(Campo[50] AS INTEGER)'
      '            WHEN 0 THEN NULL'
      '            ELSE CAST(TO_CHAR('
      
        '                 CAST(Campo[50] AS INTEGER), '#39'00/00/0000'#39') AS VA' +
        'RCHAR)'
      '       END                        AS C50,'
      ''
      '       CAST(Campo[51] AS INTEGER) AS C51,'
      '       CAST(Campo[52] AS INTEGER) AS C52,'
      '            Campo[53]             AS C53,'
      ''
      '       CASE CAST(Campo[54] AS INTEGER)'
      '            WHEN 0 THEN NULL'
      '            ELSE CAST(TO_CHAR('
      
        '                 CAST(Campo[54] AS INTEGER), '#39'00/00/0000'#39') AS VA' +
        'RCHAR)'
      '       END                        AS C54,'
      '            Campo[55]             AS C55,'
      '            Campo[56]             AS C56,'
      '            Campo[57]             AS C57,'
      '            Campo[58]             AS C58,'
      '            Campo[59]             AS C59,'
      '            Campo[60]             AS C60,'
      '            Campo[61]             AS C61,'
      ''
      '       CAST(Campo[55] AS NUMERIC) +'
      '       CAST(Campo[56] AS NUMERIC) +'
      '       CAST(Campo[57] AS NUMERIC) AS C62,'
      ''
      '       CAST(Campo[58] AS NUMERIC) +'
      '       CAST(Campo[59] AS NUMERIC) +'
      '       CAST(Campo[60] AS NUMERIC) AS C63,'
      ''
      '       CAST(Campo[55] AS NUMERIC) +'
      '       CAST(Campo[56] AS NUMERIC) +'
      '       CAST(Campo[57] AS NUMERIC) +'
      '       CAST(Campo[58] AS NUMERIC) +'
      '       CAST(Campo[59] AS NUMERIC) +'
      '       CAST(Campo[60] AS NUMERIC) AS C64'
      ''
      ''
      'FROM (SELECT (Credito_CalculoDoLimite(:Cliente,'
      '                                      :Tipo,'
      '                                      :ValorNota,'
      '                                      :Emissao)'
      '             ) AS Campo'
      '     ) AS TEMP;')
    RequestLive = False
    Left = 40
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorNota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Emissao'
        ParamType = ptUnknown
      end>
    object qryParametrosc1: TIntegerField
      FieldName = 'c1'
      DisplayFormat = '0'
    end
    object qryParametrosc2: TIntegerField
      FieldName = 'c2'
      DisplayFormat = '0'
    end
    object qryParametrosc3: TIntegerField
      FieldName = 'c3'
      DisplayFormat = '0'
    end
    object qryParametrosc4: TIntegerField
      FieldName = 'c4'
      DisplayFormat = '0'
    end
    object qryParametrosc5: TIntegerField
      FieldName = 'c5'
      DisplayFormat = '0'
    end
    object qryParametrosc6: TIntegerField
      FieldName = 'c6'
      DisplayFormat = '0'
    end
    object qryParametrosc7: TIntegerField
      FieldName = 'c7'
      DisplayFormat = '0'
    end
    object qryParametrosc8: TIntegerField
      FieldName = 'c8'
      DisplayFormat = '0'
    end
    object qryParametrosc9: TIntegerField
      FieldName = 'c9'
      DisplayFormat = '0'
    end
    object qryParametrosc10: TIntegerField
      FieldName = 'c10'
      DisplayFormat = '0'
    end
    object qryParametrosc11: TIntegerField
      FieldName = 'c11'
      DisplayFormat = '0'
    end
    object qryParametrosc12: TIntegerField
      FieldName = 'c12'
      DisplayFormat = '0'
    end
    object qryParametrosc13: TIntegerField
      FieldName = 'c13'
      DisplayFormat = '0'
    end
    object qryParametrosc14: TStringField
      FieldName = 'c14'
      Size = 50
    end
    object qryParametrosc15: TIntegerField
      FieldName = 'c15'
      DisplayFormat = '0'
    end
    object qryParametrosc16: TStringField
      FieldName = 'c16'
      Size = 50
    end
    object qryParametrosc17: TIntegerField
      FieldName = 'c17'
      DisplayFormat = '0'
    end
    object qryParametrosc18: TStringField
      FieldName = 'c18'
      Size = 50
    end
    object qryParametrosc19: TIntegerField
      FieldName = 'c19'
      DisplayFormat = '0'
    end
    object qryParametrosc20: TIntegerField
      FieldName = 'c20'
      DisplayFormat = '0'
    end
    object qryParametrosc21: TIntegerField
      FieldName = 'c21'
      DisplayFormat = '0'
    end
    object qryParametrosc22: TStringField
      FieldName = 'c22'
      Size = 50
    end
    object qryParametrosc23: TIntegerField
      FieldName = 'c23'
      DisplayFormat = '0'
    end
    object qryParametrosc24: TIntegerField
      FieldName = 'c24'
      DisplayFormat = '0'
    end
    object qryParametrosc25: TIntegerField
      FieldName = 'c25'
      DisplayFormat = '0'
    end
    object qryParametrosc26: TIntegerField
      FieldName = 'c26'
      DisplayFormat = '0'
    end
    object qryParametrosc27: TIntegerField
      FieldName = 'c27'
      DisplayFormat = '0'
    end
    object qryParametrosc28: TIntegerField
      FieldName = 'c28'
      DisplayFormat = '0'
    end
    object qryParametrosc29: TIntegerField
      FieldName = 'c29'
      DisplayFormat = '0'
    end
    object qryParametrosc30: TIntegerField
      FieldName = 'c30'
      DisplayFormat = '0'
    end
    object qryParametrosc31: TIntegerField
      FieldName = 'c31'
      DisplayFormat = '0'
    end
    object qryParametrosc32: TIntegerField
      FieldName = 'c32'
      DisplayFormat = '0'
    end
    object qryParametrosc33: TIntegerField
      FieldName = 'c33'
      DisplayFormat = '0'
    end
    object qryParametrosc34: TIntegerField
      FieldName = 'c34'
      DisplayFormat = '0'
    end
    object qryParametrosc35: TIntegerField
      FieldName = 'c35'
      DisplayFormat = '0'
    end
    object qryParametrosc36: TFloatField
      FieldName = 'c36'
      DisplayFormat = '0.00'
    end
    object qryParametrosc37: TIntegerField
      FieldName = 'c37'
      DisplayFormat = '0'
    end
    object qryParametrosc38: TFloatField
      FieldName = 'c38'
      DisplayFormat = '0.00'
    end
    object qryParametrosc39: TFloatField
      FieldName = 'c39'
      DisplayFormat = '0.00'
    end
    object qryParametrosc40: TFloatField
      FieldName = 'c40'
      DisplayFormat = '0.00'
    end
    object qryParametrosc41: TFloatField
      FieldName = 'c41'
      DisplayFormat = '0.00'
    end
    object qryParametrosc42: TIntegerField
      FieldName = 'c42'
      DisplayFormat = '0'
    end
    object qryParametrosc43: TIntegerField
      FieldName = 'c43'
      DisplayFormat = '0'
    end
    object qryParametrosc44: TFloatField
      FieldName = 'c44'
      DisplayFormat = '0.00'
    end
    object qryParametrosc45: TFloatField
      FieldName = 'c45'
      DisplayFormat = '0.00'
    end
    object qryParametrosc46: TFloatField
      FieldName = 'c46'
      DisplayFormat = '0.00'
    end
    object qryParametrosc49: TFloatField
      FieldName = 'c49'
      DisplayFormat = '0.00'
    end
    object qryParametrosc53: TFloatField
      FieldName = 'c53'
      DisplayFormat = '0.00'
    end
    object qryParametrosc55: TFloatField
      FieldName = 'c55'
      DisplayFormat = '0.00'
    end
    object qryParametrosc56: TFloatField
      FieldName = 'c56'
      DisplayFormat = '0.00'
    end
    object qryParametrosc57: TFloatField
      FieldName = 'c57'
      DisplayFormat = '0.00'
    end
    object qryParametrosc58: TFloatField
      FieldName = 'c58'
      DisplayFormat = '0.00'
    end
    object qryParametrosc59: TFloatField
      FieldName = 'c59'
      DisplayFormat = '0.00'
    end
    object qryParametrosc60: TFloatField
      FieldName = 'c60'
      DisplayFormat = '0.00'
    end
    object qryParametrosc61: TFloatField
      FieldName = 'c61'
      DisplayFormat = '0.00'
    end
    object qryParametrosc62: TFloatField
      FieldName = 'c62'
      DisplayFormat = '0.00'
    end
    object qryParametrosc63: TFloatField
      FieldName = 'c63'
      DisplayFormat = '0.00'
    end
    object qryParametrosc64: TFloatField
      FieldName = 'c64'
      DisplayFormat = '0.00'
    end
    object qryParametrosc50: TStringField
      FieldName = 'c50'
      Size = 50
    end
    object qryParametrosc54: TStringField
      FieldName = 'c54'
      Size = 50
    end
    object qryParametrosc47: TIntegerField
      FieldName = 'c47'
    end
    object qryParametrosc48: TIntegerField
      FieldName = 'c48'
    end
    object qryParametrosc51: TIntegerField
      FieldName = 'c51'
    end
    object qryParametrosc52: TIntegerField
      FieldName = 'c52'
    end
  end
  object dsrParametros: TtecDataSource
    DataSet = qryParametros
    Left = 136
    Top = 72
  end
  object qryClientes: TtecQuery
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
      'SELECT *,'
      '       CAST((CASE WHEN FoneTipo = '#39'P'#39' '
      
        '                  THEN CASE WHEN CAST(SUBSTR(FoneNumero,1,1) AS ' +
        'VARCHAR) IN ('#39'8'#39', '#39'9'#39') '
      '                            THEN '#39'Celular'#39
      '                            ELSE '#39'Fixo'#39
      '                       END'
      '                  WHEN FoneTipo = '#39'R'#39' THEN '#39'Recado'#39
      '                  WHEN FoneTipo = '#39'N'#39' THEN '#39'Nenhum'#39
      '              END) AS VARCHAR) AS Fone,'
      ''
      '       CAST((CASE WHEN Civil = '#39'C'#39' THEN '#39'Casado'#39
      '                  WHEN Civil = '#39'S'#39' THEN '#39'Solteiro'#39
      '                  WHEN Civil = '#39'D'#39' THEN '#39'Divorciado'#39
      '                  WHEN Civil = '#39'V'#39' THEN '#39'Vi'#250'vo'#39
      '                  WHEN Civil = '#39'O'#39' THEN '#39'Outros'#39
      '              END) AS VARCHAR) AS EstadoCivil,'
      ''
      '       CAST((CASE WHEN ResTipo = '#39'A'#39' THEN '#39'Alugada'#39
      '                  WHEN ResTipo = '#39'F'#39' THEN '#39'Financiada'#39
      '                  WHEN ResTipo = '#39'P'#39' THEN '#39'Pr'#243'pria'#39
      '                  WHEN ResTipo = '#39'T'#39' THEN '#39'Trabalho'#39
      '                  WHEN ResTipo = '#39'R'#39' THEN '#39'Parentes'#39
      '              END) AS VARCHAR) AS Residencia,'
      ''
      '       CAST((CASE WHEN RefTipo = '#39'A'#39' THEN '#39'Amigo'#39
      '                  WHEN RefTipo = '#39'P'#39' THEN '#39'Parente'#39
      '                  WHEN RefTipo = '#39'T'#39' THEN '#39'Trabalho'#39
      '                                     ELSE '#39'Nenhum'#39
      '              END) AS VARCHAR) AS TipoReferencia'
      'FROM  Clientes'
      'WHERE Codigo = :Cliente')
    RequestLive = False
    Left = 40
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end>
    object qryClientescodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryClientesnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryClientesnascto: TDateField
      Alignment = taCenter
      FieldName = 'nascto'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesapelido: TStringField
      FieldName = 'apelido'
    end
    object qryClientessexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryClientescivil: TStringField
      FieldName = 'civil'
      Size = 1
    end
    object qryClientescivildata: TDateField
      Alignment = taCenter
      FieldName = 'civildata'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesiddocumento: TStringField
      FieldName = 'iddocumento'
    end
    object qryClientesidorgao: TStringField
      FieldName = 'idorgao'
      Size = 5
    end
    object qryClientesiddata: TDateField
      Alignment = taCenter
      FieldName = 'iddata'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesidestado: TStringField
      FieldName = 'idestado'
      Size = 2
    end
    object qryClientespessoatipo: TStringField
      FieldName = 'pessoatipo'
      Size = 1
    end
    object qryClientespessoanumero: TStringField
      FieldName = 'pessoanumero'
      Size = 14
    end
    object qryClientesmae: TStringField
      FieldName = 'mae'
      Size = 40
    end
    object qryClientespai: TStringField
      FieldName = 'pai'
      Size = 40
    end
    object qryClientesconceito: TIntegerField
      FieldName = 'conceito'
      DisplayFormat = '0'
    end
    object qryClientesnaturalcidade: TIntegerField
      FieldName = 'naturalcidade'
      DisplayFormat = '0'
    end
    object qryClientesnaturalestado: TStringField
      FieldName = 'naturalestado'
      Size = 2
    end
    object qryClientesrua: TStringField
      FieldName = 'rua'
      Size = 100
    end
    object qryClientesestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryClientescidade: TIntegerField
      FieldName = 'cidade'
      DisplayFormat = '0'
    end
    object qryClientesbairro: TIntegerField
      FieldName = 'bairro'
      DisplayFormat = '0'
    end
    object qryClientescep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryClientesfonetipo: TStringField
      FieldName = 'fonetipo'
      Size = 1
    end
    object qryClientesfoneddd: TIntegerField
      FieldName = 'foneddd'
      DisplayFormat = '0'
    end
    object qryClientesfonenumero: TIntegerField
      FieldName = 'fonenumero'
      DisplayFormat = '0'
    end
    object qryClientesfoneramal: TStringField
      FieldName = 'foneramal'
      Size = 10
    end
    object qryClientesfone2ddd: TIntegerField
      FieldName = 'fone2ddd'
      DisplayFormat = '0'
    end
    object qryClientesfone2numero: TIntegerField
      FieldName = 'fone2numero'
      DisplayFormat = '0'
    end
    object qryClientesfone2ramal: TStringField
      FieldName = 'fone2ramal'
      Size = 10
    end
    object qryClientesrestipo: TStringField
      FieldName = 'restipo'
      Size = 1
    end
    object qryClientesresonus: TFloatField
      FieldName = 'resonus'
      DisplayFormat = '0.00'
    end
    object qryClientesrestempo: TDateField
      Alignment = taCenter
      FieldName = 'restempo'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesempresa: TStringField
      FieldName = 'empresa'
      Size = 40
    end
    object qryClientesempadmissao: TDateField
      Alignment = taCenter
      FieldName = 'empadmissao'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesempcep: TIntegerField
      FieldName = 'empcep'
      DisplayFormat = '0'
    end
    object qryClientesempcomprovado: TBooleanField
      FieldName = 'empcomprovado'
    end
    object qryClientesempfoneddd: TIntegerField
      FieldName = 'empfoneddd'
      DisplayFormat = '0'
    end
    object qryClientesempfonenumero: TIntegerField
      FieldName = 'empfonenumero'
      DisplayFormat = '0'
    end
    object qryClientesempfoneramal: TStringField
      FieldName = 'empfoneramal'
      Size = 10
    end
    object qryClientesempoutrasdescricao: TStringField
      FieldName = 'empoutrasdescricao'
      Size = 40
    end
    object qryClientesempoutrasfaixa: TIntegerField
      FieldName = 'empoutrasfaixa'
      DisplayFormat = '0'
    end
    object qryClientesempoutrasvalor: TFloatField
      FieldName = 'empoutrasvalor'
      DisplayFormat = '0.00'
    end
    object qryClientesemprendafaixa: TIntegerField
      FieldName = 'emprendafaixa'
      DisplayFormat = '0'
    end
    object qryClientesemprendavalor: TFloatField
      FieldName = 'emprendavalor'
      DisplayFormat = '0.00'
    end
    object qryClientesemprua: TStringField
      FieldName = 'emprua'
      Size = 100
    end
    object qryClientesempestado: TStringField
      FieldName = 'empestado'
      Size = 2
    end
    object qryClientesempcidade: TIntegerField
      FieldName = 'empcidade'
      DisplayFormat = '0'
    end
    object qryClientesempbairro: TIntegerField
      FieldName = 'empbairro'
      DisplayFormat = '0'
    end
    object qryClientesempcargo: TIntegerField
      FieldName = 'empcargo'
      DisplayFormat = '0'
    end
    object qryClientesconjuge: TIntegerField
      FieldName = 'conjuge'
      DisplayFormat = '0'
    end
    object qryClientesconnome: TStringField
      FieldName = 'connome'
      Size = 40
    end
    object qryClientesconadmissao: TDateField
      Alignment = taCenter
      FieldName = 'conadmissao'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesconcep: TIntegerField
      FieldName = 'concep'
      DisplayFormat = '0'
    end
    object qryClientesconempresa: TStringField
      FieldName = 'conempresa'
      Size = 40
    end
    object qryClientesconfoneddd: TIntegerField
      FieldName = 'confoneddd'
      DisplayFormat = '0'
    end
    object qryClientesconfonenumero: TIntegerField
      FieldName = 'confonenumero'
      DisplayFormat = '0'
    end
    object qryClientesconfoneramal: TStringField
      FieldName = 'confoneramal'
      Size = 10
    end
    object qryClientesconnascto: TDateField
      Alignment = taCenter
      FieldName = 'connascto'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesconrendafaixa: TIntegerField
      FieldName = 'conrendafaixa'
      DisplayFormat = '0'
    end
    object qryClientesconrendavalor: TFloatField
      FieldName = 'conrendavalor'
      DisplayFormat = '0.00'
    end
    object qryClientesconrua: TStringField
      FieldName = 'conrua'
      Size = 100
    end
    object qryClientesconestado: TStringField
      FieldName = 'conestado'
      Size = 2
    end
    object qryClientesconcidade: TIntegerField
      FieldName = 'concidade'
      DisplayFormat = '0'
    end
    object qryClientesconbairro: TIntegerField
      FieldName = 'conbairro'
      DisplayFormat = '0'
    end
    object qryClientesconcargo: TIntegerField
      FieldName = 'concargo'
      DisplayFormat = '0'
    end
    object qryClientesreferencia: TStringField
      FieldName = 'referencia'
      Size = 40
    end
    object qryClientesreftipo: TStringField
      FieldName = 'reftipo'
      Size = 1
    end
    object qryClientesrefrua: TStringField
      FieldName = 'refrua'
      Size = 100
    end
    object qryClientesrefestado: TStringField
      FieldName = 'refestado'
      Size = 2
    end
    object qryClientesrefcidade: TIntegerField
      FieldName = 'refcidade'
      DisplayFormat = '0'
    end
    object qryClientesrefbairro: TIntegerField
      FieldName = 'refbairro'
      DisplayFormat = '0'
    end
    object qryClientesrefcep: TIntegerField
      FieldName = 'refcep'
      DisplayFormat = '0'
    end
    object qryClientesreffoneddd: TIntegerField
      FieldName = 'reffoneddd'
      DisplayFormat = '0'
    end
    object qryClientesreffonenumero: TIntegerField
      FieldName = 'reffonenumero'
      DisplayFormat = '0'
    end
    object qryClientesreffoneramal: TStringField
      FieldName = 'reffoneramal'
      Size = 10
    end
    object qryClientesreffone2ddd: TIntegerField
      FieldName = 'reffone2ddd'
      DisplayFormat = '0'
    end
    object qryClientesreffone2numero: TIntegerField
      FieldName = 'reffone2numero'
      DisplayFormat = '0'
    end
    object qryClientesreffone2ramal: TStringField
      FieldName = 'reffone2ramal'
      Size = 10
    end
    object qryClientesobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 512
    end
    object qryClientesemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object qryClientesautomovel: TBooleanField
      FieldName = 'automovel'
    end
    object qryClientescartaocredito: TBooleanField
      FieldName = 'cartaocredito'
    end
    object qryClientescartaoloja: TBooleanField
      FieldName = 'cartaoloja'
    end
    object qryClientescheque: TBooleanField
      FieldName = 'cheque'
    end
    object qryClienteschequeespecial: TBooleanField
      FieldName = 'chequeespecial'
    end
    object qryClientesdependentes: TIntegerField
      FieldName = 'dependentes'
      DisplayFormat = '0'
    end
    object qryClientesonus: TFloatField
      FieldName = 'onus'
      DisplayFormat = '0.00'
    end
    object qryClientesenderecoalterado: TDateField
      Alignment = taCenter
      FieldName = 'enderecoalterado'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesfilialcadastro: TIntegerField
      FieldName = 'filialcadastro'
      DisplayFormat = '0'
    end
    object qryClientesdatacadastro: TDateField
      Alignment = taCenter
      FieldName = 'datacadastro'
      EditMask = '99/99/9999;1; '
    end
    object qryClientesfone: TStringField
      FieldName = 'fone'
      Size = 50
    end
    object qryClientesestadocivil: TStringField
      FieldName = 'estadocivil'
      Size = 50
    end
    object qryClientesresidencia: TStringField
      FieldName = 'residencia'
      Size = 50
    end
    object qryClientestiporeferencia: TStringField
      FieldName = 'tiporeferencia'
      Size = 50
    end
  end
  object dsrClientes: TtecDataSource
    DataSet = qryClientes
    Left = 136
    Top = 136
  end
end
