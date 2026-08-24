inherited dtmArquivoDimob: TdtmArquivoDimob
  OldCreateOrder = False
  Left = 291
  Top = 143
  Height = 400
  Width = 737
  object qryRegistro_03: TtecQuery
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
        Name = 'SQLListadeFiliais'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT (SELECT CNPJ FROM Filiais'
      '           WHERE Codigo = vi.Filial) AS FilialCNPJ,'
      ''
      '        vf.PessoaNumero AS CNPJouCPF,'
      '        COALESCE(vf.Razao, vf.Nome) AS NomeComprador,'
      ''
      '        vi.Contrato,'
      '        vi.Data,'
      '        vi.ValorTotal AS ValorOperacao,'
      ''
      '       (SELECT SUM(pi.ValorPagto)'
      '           FROM ParcelasImoveis pi'
      '           WHERE pi.Contrato = vi.Contrato AND'
      
        '                 EXTRACT(YEAR FROM pi.DataPagto) = :AnoBase) AS ' +
        'ValorPago,'
      ''
      '        CAST('#39'U'#39' AS CHAR(1)) AS TipoImovel,'
      ''
      '       (SELECT e.Rua ||'
      '               CASE WHEN e.Numero IS NULL'
      '                    THEN '#39#39
      '                    ELSE '#39', '#39' || CAST(e.Numero AS VARCHAR)'
      '               END'
      '           FROM Empreendimentos e'
      '           WHERE e.Codigo = (SELECT b.Empreendimento'
      '                                FROM Blocos b'
      
        '                                WHERE b.Codigo = (SELECT iv.Bloc' +
        'o'
      
        '                                                     FROM Imovei' +
        'sVendidos iv'
      
        '                                                     WHERE iv.Co' +
        'ntrato = vi.Contrato LIMIT 1))) AS Endereco,'
      '       (SELECT e.CEP'
      '           FROM Empreendimentos e'
      '           WHERE e.Codigo = (SELECT b.Empreendimento'
      '                                FROM Blocos b'
      
        '                                WHERE b.Codigo = (SELECT iv.Bloc' +
        'o'
      
        '                                                     FROM Imovei' +
        'sVendidos iv'
      
        '                                                     WHERE iv.Co' +
        'ntrato = vi.Contrato LIMIT 1))) AS CEP,'
      '       (SELECT c.CodigoDIMOB'
      '           FROM Cidades c'
      
        '           WHERE (c.Estado, c.codigo) IN (SELECT e.Estado, e.Cid' +
        'ade'
      
        '                                             FROM Empreendimento' +
        's e'
      
        '                                             WHERE e.Codigo = (S' +
        'ELECT b.Empreendimento'
      
        '                                                                ' +
        '  FROM Blocos b'
      
        '                                                                ' +
        '  WHERE b.Codigo = (SELECT iv.Bloco'
      
        '                                                                ' +
        '                       FROM ImoveisVendidos iv'
      
        '                                                                ' +
        '                       WHERE iv.Contrato = vi.Contrato LIMIT 1))' +
        ')) AS CodigoDIMOB,'
      ''
      '       (SELECT e.Estado'
      '           FROM Empreendimentos e'
      '           WHERE e.Codigo = (SELECT b.Empreendimento'
      '                                FROM Blocos b'
      
        '                                WHERE b.Codigo = (SELECT iv.Bloc' +
        'o'
      
        '                                                     FROM Imovei' +
        'sVendidos iv'
      
        '                                                     WHERE iv.Co' +
        'ntrato = vi.Contrato LIMIT 1))) AS UF,'
      '        cr.Percentual,'
      ''
      '       (SELECT COUNT(*)'
      '           FROM Compradores cr2'
      '           WHERE cr2.Contrato = vi.Contrato AND'
      
        '                 COALESCE(cr2.Percentual, 0) <> 0) AS NComprador' +
        'es'
      ''
      'FROM VendasImoveis vi'
      '     JOIN Compradores cr'
      
        '          JOIN vFornecedores vf ON cr.Cliente     = vf.Codigo AN' +
        'D'
      '                                   cr.TipoCliente = vf.Tipo'
      '     ON vi.Contrato = cr.Contrato'
      ''
      'WHERE (EXTRACT(YEAR FROM vi.Data) = :AnoBase AND'
      '       vi.Situacao IN ('#39'V'#39',  /* [V]endido       */'
      '                         '#39'F'#39')) /* Tran[F]erido de */'
      '  AND COALESCE(cr.Percentual,0) <> 0'
      ''
      '      %SQLListadeFiliais '
      ''
      'ORDER BY vi.Data, vi.Contrato'
      ''
      '')
    RequestLive = False
    Left = 136
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AnoBase'
        ParamType = ptUnknown
      end>
    object qryRegistro_03filialcnpj: TStringField
      FieldName = 'filialcnpj'
      Size = 50
    end
    object qryRegistro_03cnpjoucpf: TStringField
      FieldName = 'cnpjoucpf'
      Size = 14
    end
    object qryRegistro_03nomecomprador: TStringField
      FieldName = 'nomecomprador'
      Size = 50
    end
    object qryRegistro_03contrato: TIntegerField
      FieldName = 'contrato'
      Required = True
      DisplayFormat = '0'
    end
    object qryRegistro_03data: TDateField
      Alignment = taCenter
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryRegistro_03valoroperacao: TFloatField
      FieldName = 'valoroperacao'
      DisplayFormat = '0.00'
    end
    object qryRegistro_03valorpago: TFloatField
      FieldName = 'valorpago'
      DisplayFormat = '0.00'
    end
    object qryRegistro_03endereco: TMemoField
      FieldName = 'endereco'
      BlobType = ftMemo
    end
    object qryRegistro_03cep: TIntegerField
      FieldName = 'cep'
      DisplayFormat = '0'
    end
    object qryRegistro_03codigodimob: TIntegerField
      FieldName = 'codigodimob'
      DisplayFormat = '0'
    end
    object qryRegistro_03uf: TStringField
      FieldName = 'uf'
      Size = 50
    end
    object qryRegistro_03percentual: TFloatField
      FieldName = 'percentual'
      DisplayFormat = '0.00'
    end
    object qryRegistro_03ncompradores: TLargeintField
      FieldName = 'ncompradores'
    end
    object qryRegistro_03tipoimovel: TStringField
      FieldName = 'tipoimovel'
      Size = 1
    end
  end
end
