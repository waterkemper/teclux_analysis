inherited dtmLancamentoContas: TdtmLancamentoContas
  Left = 310
  Top = 302
  Height = 499
  Width = 871
  object qryLancamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterOpen = qryLancamentosAfterOpen
    BeforeClose = qryLancamentosBeforeClose
    AfterPost = qryLancamentosAfterPost
    AfterCancel = qryLancamentosAfterCancel
    AfterDelete = qryLancamentosAfterDelete
    AfterScroll = qryLancamentosAfterScroll
    OnCalcFields = qryLancamentosCalcFields
    OnNewRecord = qryLancamentosNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'LancamentosPorLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT *,'
      '       CAST(CASE WHEN Origem = '#39'B'#39' THEN '#39'BANCOS'#39
      '                 WHEN Origem = '#39'D'#39' THEN '#39'DOC PAGAR'#39
      '                 WHEN Origem = '#39'E'#39' THEN '#39'NF ENTRADA'#39
      '                 WHEN Origem = '#39'M'#39' THEN '#39'MANUAL'#39
      '                 WHEN Origem = '#39'P'#39' THEN '#39'PAGAMENTO'#39
      '                 WHEN Origem = '#39'A'#39' THEN '#39'ADIANTAMENTO'#39
      '                 WHEN Origem = '#39'R'#39' THEN '#39'RECEBIMENTO'#39
      '                 WHEN Origem = '#39'S'#39' THEN '#39'NF SA'#205'DA'#39
      '                 WHEN Origem = '#39'L'#39' THEN '#39'LOTES'#39
      '                 WHEN Origem = '#39'X'#39' THEN '#39'ENCERRAMENTO'#39
      '                 WHEN Origem = '#39'I'#39' THEN '#39'IMPORTA'#199#195'O'#39
      '                 WHEN Origem = '#39'V'#39' THEN '#39'VENDAS IM'#211'VEIS'#39
      '                 WHEN Origem = '#39'H'#39' THEN '#39'CHAVES IM'#211'VEIS'#39
      '                 WHEN Origem = '#39'O'#39' THEN '#39'AT. MONET'#193'RIA IM'#211'VEIS'#39
      '                 WHEN Origem = '#39'T'#39' THEN '#39'RECEBIMENTOS IM'#211'VEIS'#39
      '            END AS VARCHAR(21)'
      '            ) AS DescricaoOrigem,'
      '      case when origem in ('#39'L'#39','#39'X'#39','#39'I'#39') then'
      '                nrorigem'
      '           else cast(null as bigint) end as nrorigemlote,'
      '      false as numerocriado,'
      '      cast('#39'N'#39' as char(1)) as DebitoVerificado,'
      '      cast('#39'N'#39' as char(1)) as CreditoVerificado'
      ''
      'FROM lancamentos'
      ''
      'WHERE NrLancto IS NOT NULL'
      '  AND  ((:Campo = 0)     AND'
      '        (:Operacao = 0) AND'
      #9'(exercicio = :exercicio) AND'
      #9'(nrlancto  = :nrlancto) AND'
      #9'(filial = :filialbase))'
      ''
      '  %LancamentosPorLote'
      ''
      '/* NrLancto */'
      '  OR (:Campo = 1 AND'
      '               /* PRIMEIRO */'
      '              ((:Operacao = 1 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Nrlancto  = (SELECT MIN(NrLancto)'
      
        '                                                   FROM  Lancame' +
        'ntos'
      
        '                                                   WHERE Exercic' +
        'io = :Exercicio'
      
        '                                                     AND Filial ' +
        '   = :FilialBase))'
      '               /* ANTERIOR */'
      '            OR (:Operacao = 2 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      '                              AND NrLancto  < :NrLancto)'
      ''
      '               /* PR'#211'XIMO */'
      '            OR (:Operacao = 3 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      '                              AND NrLancto  > :NrLancto)'
      ''
      '               /* '#218'LTIMO */'
      '            OR (:Operacao = 4 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND NrLancto  = (SELECT MAX(Nrlancto)'
      
        '                                                  FROM Lancament' +
        'os'
      
        '                                                  WHERE Exercici' +
        'o = :Exercicio'
      
        '                                                    AND Filial  ' +
        '  = :FilialBase))))'
      '/* Data */'
      '  OR (:Campo = 2 AND'
      '               /* PRIMEIRO */'
      '              ((:Operacao = 1 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Data = (SELECT MIN(Data)'
      '                                             FROM  Lancamentos'
      
        '                                             WHERE Exercicio = :' +
        'Exercicio'
      
        '                                               AND Filial    = :' +
        'FilialBase))'
      '               /* ANTERIOR */'
      '            OR (:Operacao = 2 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      '                              AND (Data      < :Data OR'
      '                                  (Data      = :Data AND'
      '                                   NrLancto  < :NrLancto)))'
      ''
      ''
      '               /* PR'#211'XIMO */'
      '            OR (:Operacao = 3 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      '                              AND (Data     > :Data OR'
      '                                  (Data     = :Data AND'
      '                                   NrLancto > :NrLancto)))'
      '               /* '#218'LTIMO */'
      '            OR (:Operacao = 4 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Data = (SELECT MAX(Data)'
      '                                             FROM  Lancamentos'
      
        '                                             WHERE Exercicio = :' +
        'Exercicio'
      
        '                                               AND Filial    = :' +
        'FilialBase))))'
      '/* Debitar */'
      '  OR (:Campo = 3 AND'
      '               /* PRIMEIRO */'
      '              ((:Operacao = 1 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Debitar = (SELECT MIN(Debitar)'
      
        '                                                FROM  Lancamento' +
        's'
      
        '                                                WHERE Exercicio ' +
        '= :Exercicio'
      
        '                                                  AND Filial    ' +
        '= :FilialBase))'
      '               /* ANTERIOR */'
      '            OR (:Operacao = 2 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      
        '                              AND                         (Debit' +
        'ar  < :Debitar OR'
      
        '                                  (Debitar  = :Debitar AND Data ' +
        '    < :Data)   OR'
      '                                  (Debitar  = :Debitar AND'
      
        '                                   Data     = :Data    AND NrLan' +
        'cto < :NrLancto)))'
      '               /* PR'#211'XIMO */'
      '            OR (:Operacao = 3 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      
        '                              AND                         (Debit' +
        'ar  > :Debitar OR'
      
        '                                  (Debitar  = :Debitar AND Data ' +
        '    > :Data)   OR'
      '                                  (Debitar  = :Debitar AND'
      
        '                                   Data     = :Data    AND NrLan' +
        'cto > :NrLancto)))'
      ''
      '               /* '#218'LTIMO */'
      '            OR (:Operacao = 4 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Debitar = (SELECT MAX(Debitar)'
      
        '                                                FROM  Lancamento' +
        's'
      
        '                                                WHERE Exercicio ' +
        '= :Exercicio'
      
        '                                                  AND Filial    ' +
        '= :FilialBase))))'
      '/* Creditar */'
      '  OR (:Campo = 4 AND'
      '               /* PRIMEIRO */'
      '              ((:Operacao = 1 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Creditar = (SELECT MIN(Creditar)'
      
        '                                                FROM  Lancamento' +
        's'
      
        '                                                WHERE Exercicio ' +
        '= :Exercicio'
      
        '                                                  AND Filial    ' +
        '= :FilialBase))'
      '               /* ANTERIOR */'
      '            OR (:Operacao = 2 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      
        '                              AND                          (Cred' +
        'itar < :Creditar OR'
      
        '                                  (Creditar = :Creditar AND Data' +
        '     < :Data)   OR'
      '                                  (Creditar = :Creditar AND'
      
        '                                   Data     = :Data     AND NrLa' +
        'ncto < :NrLancto)))'
      '               /* PR'#211'XIMO */'
      '            OR (:Operacao = 3 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      
        '                              AND                          (Cred' +
        'itar > :Creditar OR'
      
        '                                  (Creditar = :Creditar AND Data' +
        '     > :Data)    OR'
      '                                  (Creditar = :Creditar AND'
      
        '                                   Data     = :Data     AND NrLa' +
        'ncto > :NrLancto)))'
      ''
      '               /* '#218'LTIMO */'
      '            OR (:Operacao = 4 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Creditar = (SELECT MAX(Creditar)'
      
        '                                                FROM  Lancamento' +
        's'
      
        '                                                WHERE Exercicio ' +
        '= :Exercicio'
      
        '                                                  AND Filial    ' +
        '= :FilialBase))))'
      ''
      '/* Valor */'
      '  OR (:Campo = 5 AND'
      '               /* PRIMEIRO */'
      '              ((:Operacao = 1 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Valor = (SELECT MIN(Valor)'
      '                                              FROM  Lancamentos'
      
        '                                              WHERE Exercicio = ' +
        ':Exercicio'
      
        '                                                AND Filial    = ' +
        ':FilialBase))'
      '               /* ANTERIOR */'
      '            OR (:Operacao = 2 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      
        '                              AND                    (Valor    <' +
        ' :Valor OR'
      
        '                                  (Valor = :Valor AND Data     <' +
        ' :Data) OR'
      '                                  (Valor = :Valor AND'
      
        '                                   Data  = :Data  AND NrLancto <' +
        ' :NrLancto)))'
      '               /* PR'#211'XIMO */'
      '            OR (:Operacao = 3 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      
        '                              AND                    (Valor    >' +
        ' :Valor OR'
      
        '                                  (Valor = :Valor AND Data     >' +
        ' :Data) OR'
      '                                  (Valor = :Valor AND'
      
        '                                   Data  = :Data  AND NrLancto >' +
        ' :NrLancto)))'
      ''
      '               /* '#218'LTIMO */'
      '            OR (:Operacao = 4 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Valor = (SELECT MAX(Valor)'
      
        '                                                FROM  Lancamento' +
        's'
      
        '                                                WHERE Exercicio ' +
        '= :Exercicio'
      
        '                                                  AND Filial    ' +
        '= :FilialBase))))'
      ''
      '/*Historico*/'
      '  OR (:Campo = 6 AND'
      '               /* PRIMEIRO */'
      '              ((:Operacao = 1 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Historico = (SELECT MIN(Historico)'
      
        '                                                  FROM  Lancamen' +
        'tos'
      
        '                                                  WHERE Exercici' +
        'o = :Exercicio'
      
        '                                                    AND Filial  ' +
        '  = :FilialBase))'
      '               /* ANTERIOR */'
      '            OR (:Operacao = 2 AND Exercicio  = :Exercicio'
      '                              AND Filial     = :FilialBase'
      
        '                              AND                            (Hi' +
        'storico < :Historico OR'
      
        '                                  (Historico = :Historico AND Da' +
        'ta      < :Data)     OR'
      '                                  (Historico = :Historico AND'
      
        '                                   Data      = :Data      AND Nr' +
        'Lancto  < :NrLancto)))'
      '               /* PR'#211'XIMO */'
      '            OR (:Operacao = 3 AND Exercicio  = :Exercicio'
      '                              AND Filial     = :FilialBase'
      
        '                              AND                            (Hi' +
        'storico > :Historico OR'
      
        '                                  (Historico = :Historico AND Da' +
        'ta      > :Data)     OR'
      '                                  (Historico = :Historico AND'
      
        '                                   Data      = :Data      AND Nr' +
        'Lancto  > :NrLancto)))'
      ''
      '               /* '#218'LTIMO */'
      '            OR (:Operacao = 4 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND Historico = (SELECT MAX(Historico)'
      
        '                                                  FROM  Lancamen' +
        'tos'
      
        '                                                  WHERE Exercici' +
        'o = :Exercicio'
      
        '                                                    AND Filial  ' +
        '  = :FilialBase))))'
      ''
      '/* NrOrigem */'
      '  OR (:Campo = 7 AND'
      '               /* PRIMEIRO */'
      '              ((:Operacao = 1 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND NrOrigem  = (SELECT MIN(NrOrigem)'
      '                                               FROM  Lancamentos'
      
        '                                               WHERE Exercicio =' +
        ' :Exercicio'
      
        '                                                 AND Filial    =' +
        ' :FilialBase'
      #9#9#9#9#9#9' AND Origem    in ('#39'L'#39','#39'X'#39','#39'I'#39') ))'
      ''
      '               /* ANTERIOR */'
      '            OR (:Operacao = 2 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      '                              AND NrOrigem  < :NrOrigem'
      #9#9#9'      AND Origem    in ('#39'L'#39','#39'X'#39','#39'I'#39') )'
      ''
      '               /* PR'#211'XIMO */'
      '            OR (:Operacao = 3 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      '                              AND NrOrigem  > :NrOrigem'
      #9#9#9'      AND Origem    in ('#39'L'#39','#39'X'#39','#39'I'#39') )'
      ''
      '               /* '#218'LTIMO */'
      '            OR (:Operacao = 4 AND Exercicio = :Exercicio'
      '                              AND Filial    = :FilialBase'
      #9'                      AND NrOrigem  = (SELECT MAX(NrOrigem)'
      '                                               FROM Lancamentos'
      
        '                                               WHERE Exercicio =' +
        ' :Exercicio'
      
        '                                                 AND Filial    =' +
        ' :FilialBase'
      #9#9#9#9#9#9' AND Origem    in ('#39'L'#39','#39'X'#39','#39'I'#39') ))))'
      ''
      '%Ordenacao')
    RequestLive = True
    Left = 70
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Campo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nrlancto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'debitar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'creditar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'historico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NrOrigem'
        ParamType = ptUnknown
      end>
    object qryLancamentosexercicio: TIntegerField
      FieldName = 'exercicio'
      Required = True
      DisplayFormat = '0'
    end
    object qryLancamentosnrlancto: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'N'#176' Lan'#231'amento'
      FieldName = 'nrlancto'
      DisplayFormat = '0'
    end
    object qryLancamentosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryLancamentosdata: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'data'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryLancamentosorigem: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'origem'
      Size = 1
    end
    object qryLancamentosdebitar: TIntegerField
      DisplayLabel = 'Debitar'
      FieldName = 'debitar'
      DisplayFormat = '0'
    end
    object qryLancamentoscreditar: TIntegerField
      DisplayLabel = 'Creditar'
      FieldName = 'creditar'
      DisplayFormat = '0'
    end
    object qryLancamentoshistorico: TIntegerField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'historico'
      DisplayFormat = '0'
    end
    object qryLancamentoscomplemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'complemento'
      Size = 512
    end
    object qryLancamentosvalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '0.00'
      currency = True
    end
    object qryLancamentosdescricaoorigem: TStringField
      FieldName = 'descricaoorigem'
      Size = 50
    end
    object qryLancamentosnrorigem: TLargeintField
      FieldName = 'nrorigem'
      DisplayFormat = '0'
    end
    object qryLancamentosnumerocriado: TBooleanField
      FieldName = 'numerocriado'
    end
    object qryLancamentosdebitoverificado: TStringField
      FieldName = 'debitoverificado'
      Size = 1
    end
    object qryLancamentoscreditoverificado: TStringField
      FieldName = 'creditoverificado'
      Size = 1
    end
    object qryLancamentosnrorigemlote: TLargeintField
      FieldName = 'nrorigemlote'
    end
    object qryLancamentosdescricaoorigemstatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'descricaoorigemstatus'
      Size = 30
      Calculated = True
    end
  end
  object dsrLancamentos: TtecDataSource
    DataSet = qryLancamentos
    OnDataChange = dsrLancamentosDataChange
    Left = 140
    Top = 9
  end
  object qryConsultaLancamentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryConsultaLancamentosBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'nrlancto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'historico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorinicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorfinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ordenacao'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      
        'Select l.nrlancto, l.filial, l.data, l.origem, l.debitar, l.cred' +
        'itar, l.valor, l.complemento'
      'From lancamentos l'
      'where l.exercicio = :exercicio'
      '    and l.filial = :filialbase'
      '%nrlancto'
      '%plano'
      '%historico'
      '%data'
      '%dataalteracao'
      '%valorinicial'
      '%valorfinal'
      '%origem'
      '%ordenacao')
    RequestLive = True
    Left = 73
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filialbase'
        ParamType = ptUnknown
      end>
    object qryConsultaLancamentosnrlancto: TIntegerField
      DisplayLabel = 'N'#186' Lancto'
      FieldName = 'nrlancto'
      Required = True
      DisplayFormat = '0'
    end
    object qryConsultaLancamentosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryConsultaLancamentosdata: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryConsultaLancamentosorigem: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'origem'
      Size = 1
    end
    object qryConsultaLancamentosdebitar: TIntegerField
      DisplayLabel = 'Debitar'
      FieldName = 'debitar'
      DisplayFormat = '0'
    end
    object qryConsultaLancamentoscreditar: TIntegerField
      DisplayLabel = 'Creditar'
      FieldName = 'creditar'
      DisplayFormat = '0'
    end
    object qryConsultaLancamentosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
    object qryConsultaLancamentoscomplemento: TStringField
      FieldName = 'complemento'
      Size = 512
    end
  end
  object qryProcuraHistorico: TtecQuery
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
      'Select  descricao,'
      '        codigo'
      'From    historicos'
      'Where   codigo = :codigo'
      '  and   inativo is null')
    RequestLive = False
    Left = 542
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraHistoricodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryProcuraHistoricocodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object dsrProcuraHistorico: TtecDataSource
    DataSet = qryProcuraHistorico
    Left = 574
    Top = 32
  end
  object qryProcuraDebitar: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryProcuraDebitarBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'inativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListaContaContabil'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT Codigo,'
      
        '       CAST(BTRIM(Classificacao, '#39'. '#39') AS VARCHAR) as Classifica' +
        'cao,'
      '       Descricao'
      ''
      'FROM   planocontas'
      ''
      'WHERE  Codigo  = :Codigo'
      '  AND  Codigo <> :ContaCredito'
      '  AND  Tipo    = '#39'A'#39
      '  %inativo'
      '  %SQLListaContaContabil'
      '')
    RequestLive = False
    Left = 222
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contacredito'
        ParamType = ptUnknown
      end>
    object qryProcuraDebitarcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraDebitarclassificacao: TStringField
      FieldName = 'classificacao'
      Size = 50
    end
    object qryProcuraDebitardescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrProcuraDebitar: TtecDataSource
    DataSet = qryProcuraDebitar
    Left = 254
    Top = 32
  end
  object qryConsultaHistorico: TtecQuery
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
        Name = 'consulta'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'select descricao, codigo'
      'from historicos'
      'where inativo is null'
      '%consulta'
      'order by UPPER(TO_ASCII(Descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 577
    Top = 80
    object qryConsultaHistoricodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 50
    end
    object qryConsultaHistoricocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
  end
  object spcLancamentosProximo: TtecQuery
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
      
        'SELECT lancamentos_proximonrlancto(:Exercicio, :Filial) as codig' +
        'o')
    RequestLive = True
    Left = 407
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end>
    object spcLancamentosProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryProcuraCreditar: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryProcuraCreditarBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'inativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListaContaContabil'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT Codigo,'
      
        '       CAST(BTRIM(Classificacao, '#39'. '#39') AS VARCHAR) as Classifica' +
        'cao,'
      '       Descricao'
      ''
      'FROM   planocontas'
      ''
      'WHERE  Codigo  = :Codigo'
      '  AND  Codigo <> :ContaDebito'
      '  AND  Tipo    = '#39'A'#39
      '  %inativo'
      '  %SQLListaContaContabil'
      '')
    RequestLive = False
    Left = 374
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contadebito'
        ParamType = ptUnknown
      end>
    object qryProcuraCreditarcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraCreditarclassificacao: TStringField
      FieldName = 'classificacao'
      Size = 50
    end
    object qryProcuraCreditardescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrProcuraCreditar: TtecDataSource
    DataSet = qryProcuraCreditar
    Left = 406
    Top = 24
  end
  object qryConsultaConta: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterClose = qryConsultaContaAfterClose
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'inativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SQLListaContaContabil'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      
        'SELECT   /*cast(repeat('#39' '#39', length(btrim(p.classificacao)))||p.D' +
        'escricao as varchar) as DescricaoEdentada,*/'
      '         p.descricao as descricaoedentada,'
      '         p.descricao,'
      '         p.classificacao,'
      '         p.Codigo,'
      '         p.tipo'
      'FROM     planocontas p'
      'where p.codigo <> :codigo and p.tipo='#39'A'#39
      '%inativo'
      '%SQLListaContaContabil'
      '/*order by p.classificacao, p.descricao, p.codigo*/'
      
        'order by UPPER(TO_ASCII(p.Descricao,'#39'LATIN1'#39')), p.classificacao,' +
        ' p.codigo')
    RequestLive = True
    Left = 249
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryConsultaContadescricaoedentada: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricaoedentada'
      Size = 52
    end
    object qryConsultaContadescricao: TStringField
      FieldName = 'descricao'
      Visible = False
      Size = 50
    end
    object qryConsultaContaclassificacao: TStringField
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'classificacao'
    end
    object qryConsultaContacodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryConsultaContatipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 1
    end
  end
  object dsrConsultaLancamentos: TtecDataSource
    DataSet = qryConsultaLancamentos
    Left = 104
    Top = 96
  end
  object qryProcuraPlanoConsulta: TtecQuery
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
      
        'select codigo, cast(btrim(classificacao, '#39'. '#39') as varchar) as cl' +
        'assificacao, descricao'
      'from planocontas'
      'where codigo = :codigo'
      '  and tipo = '#39'A'#39
      '  and inativo is null')
    RequestLive = False
    Left = 176
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraPlanoConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryProcuraPlanoConsultaclassificacao: TStringField
      FieldName = 'classificacao'
      Size = 50
    end
    object qryProcuraPlanoConsultadescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsrProcuraPlanoConsulta: TtecDataSource
    DataSet = qryProcuraPlanoConsulta
    Left = 216
    Top = 160
  end
  object qryProcuraHistoricoConsulta: TtecQuery
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
      'Select  descricao,'
      '        codigo'
      'From    historicos'
      'Where   codigo = :codigo'
      '  and   inativo is null')
    RequestLive = False
    Left = 400
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraHistoricoConsultadescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object qryProcuraHistoricoConsultacodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object dsrProcuraHistoricoConsulta: TtecDataSource
    DataSet = qryProcuraHistoricoConsulta
    Left = 432
    Top = 160
  end
  object qryLancamentosLotes: TtecQuery
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
      '; select *'
      ' FROM'
      '('
      '('
      'select l.exercicio,'
      '          l.nrlancto,  '
      '          l.filial,'
      '          l.data,'
      '          l.origem,'
      '       CAST(CASE WHEN Origem = '#39'D'#39' THEN '#39'DOC PAGAR'#39
      '                 WHEN Origem = '#39'E'#39' THEN '#39'NF ENTRADA'#39
      '                 WHEN Origem = '#39'M'#39' THEN '#39'MANUAL'#39
      '                 WHEN Origem = '#39'P'#39' THEN '#39'PAGAMENTO'#39
      '                 WHEN Origem = '#39'R'#39' THEN '#39'RECEBIMENTO'#39
      '                 WHEN Origem = '#39'S'#39' THEN '#39'NF SA'#205'DA'#39
      '                 WHEN Origem = '#39'L'#39' THEN '#39'LOTES'#39
      '                 WHEN Origem = '#39'X'#39' THEN '#39'ENCERRAMENTO'#39
      '                 WHEN Origem = '#39'I'#39' THEN '#39'IMPORTA'#199#195'O'#39
      '            END AS VARCHAR'
      '            ) AS DescricaoOrigem,'
      '          l.nrorigem,'
      '          l.debitar,'
      '          cast(null as integer) as creditar,'
      '          l.valor,          '
      '          l.debitar as ContaContabil,'
      '          pl.descricao as DescricaoContaContabil,'
      '          pl.classificacao as ClassificacaoContaContabil,'
      '          l.valor as valordebito,'
      '          cast(null as numeric(11,2)) as valorcredito,'
      '          l.historico,'
      '          l.complemento'
      'from lancamentos l join planocontas pl on pl.codigo = l.debitar'
      
        'Where ( ((case when :origem = '#39'B'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-4)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-4))'
      
        '               when :origem = '#39'P'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-8)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-8))'
      '             else                     l.nrorigem = :nrorigem'
      '         end) and l.origem = :origem) or'
      ''
      '           (l.nrlancto = :nrlancto'
      '           and l.filial =:filial))'
      ''
      '     and l.exercicio = :exercicio'
      '     and l.debitar is not null'
      ')'
      'union all'
      '('
      'select l.exercicio,'
      '          l.nrlancto,'
      '          l.filial,'
      '          l.data,'
      '          l.origem,'
      '       CAST(CASE WHEN Origem = '#39'D'#39' THEN '#39'DOC PAGAR'#39
      '                 WHEN Origem = '#39'E'#39' THEN '#39'NF ENTRADA'#39
      '                 WHEN Origem = '#39'M'#39' THEN '#39'MANUAL'#39
      '                 WHEN Origem = '#39'P'#39' THEN '#39'PAGAMENTO'#39
      '                 WHEN Origem = '#39'R'#39' THEN '#39'RECEBIMENTO'#39
      '                 WHEN Origem = '#39'S'#39' THEN '#39'NF SA'#205'DA'#39
      '                 WHEN Origem = '#39'L'#39' THEN '#39'LOTES'#39
      '                 WHEN Origem = '#39'X'#39' THEN '#39'ENCERRAMENTO'#39
      '                 WHEN Origem = '#39'I'#39' THEN '#39'IMPORTA'#199#195'O'#39
      '            END AS VARCHAR'
      '            ) AS DescricaoOrigem,'
      '          l.nrorigem,'
      '          cast(null as integer) as debitar,'
      '          l.creditar,'
      '          l.valor,'
      '          l.creditar as ContaContabil,'
      '          pl.descricao as DescricaoContaContabil,'
      '          pl.classificacao as ClassificacaoContaContabil,'
      '          cast(null as numeric(11,2)) as valordebito,'
      '          l.valor as valorcredito,'
      '          l.historico,'
      '          l.complemento'
      'from lancamentos l join planocontas pl on pl.codigo = l.creditar'
      ''
      
        'Where ( ((case when :origem = '#39'B'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-4)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-4))'
      
        '               when :origem = '#39'P'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-8)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-8))'
      '             else                     l.nrorigem = :nrorigem'
      '         end) and l.origem = :origem) or'
      ''
      '           (l.nrlancto = :nrlancto'
      '           and l.filial =:filial))'
      ''
      '    and l.exercicio = :exercicio'
      '    and l.creditar is not null'
      ')'
      ') as contabilidade'
      'order by nrlancto')
    RequestLive = True
    Left = 160
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nrorigem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nrlancto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryLancamentosLotesexercicio: TIntegerField
      FieldName = 'exercicio'
      DisplayFormat = '0'
    end
    object qryLancamentosLotesnrlancto: TIntegerField
      FieldName = 'nrlancto'
      DisplayFormat = '0'
    end
    object qryLancamentosLotesdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryLancamentosLotesorigem: TStringField
      FieldName = 'origem'
      Size = 50
    end
    object qryLancamentosLotesdebitar: TIntegerField
      FieldName = 'debitar'
      DisplayFormat = '0'
    end
    object qryLancamentosLotescreditar: TIntegerField
      FieldName = 'creditar'
      DisplayFormat = '0'
    end
    object qryLancamentosLoteshistorico: TIntegerField
      FieldName = 'historico'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object qryLancamentosLotescomplemento: TStringField
      FieldName = 'complemento'
      Size = 50
    end
    object qryLancamentosLotesdescricaoorigem: TStringField
      FieldName = 'descricaoorigem'
      Size = 50
    end
    object qryLancamentosLotesfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryLancamentosLotesvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
    object qryLancamentosLotesnrorigem: TLargeintField
      FieldName = 'nrorigem'
    end
    object qryLancamentosLotescontacontabil: TIntegerField
      FieldName = 'contacontabil'
      DisplayFormat = '0'
    end
    object qryLancamentosLotesdescricaocontacontabil: TStringField
      FieldName = 'descricaocontacontabil'
      Size = 50
    end
    object qryLancamentosLotesclassificacaocontacontabil: TStringField
      FieldName = 'classificacaocontacontabil'
      Size = 50
    end
    object qryLancamentosLotesvalordebito: TFloatField
      FieldName = 'valordebito'
      DisplayFormat = '###,###,##0.00'
    end
    object qryLancamentosLotesvalorcredito: TFloatField
      FieldName = 'valorcredito'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrLancamentosLotes: TtecDataSource
    DataSet = qryLancamentosLotes
    OnDataChange = dsrLancamentosDataChange
    Left = 200
    Top = 318
  end
  object qryTotais: TtecQuery
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
      'select'
      '(select sum(l.valor) as TotalDebito'
      'from lancamentos l'
      
        'Where ( ((case when :origem = '#39'B'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-4)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-4))'
      
        '               when :origem = '#39'P'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-8)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-8))'
      '               else                     l.nrorigem = :nrorigem'
      '         end) and l.origem = :origem) or'
      ''
      '           (l.nrlancto = :nrlancto'
      '           and l.filial =:filial))'
      ''
      '     and l.exercicio = :exercicio'
      '     and l.debitar is not null'
      ') as TotalDebito,'
      ''
      '('
      'select  sum(l.valor) as TotalCredito'
      'from lancamentos l'
      
        'Where ( ((case when :origem = '#39'B'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-4)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-4))'
      
        '               when :origem = '#39'P'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-8)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-8))'
      '             else                     l.nrorigem = :nrorigem'
      '         end) and l.origem = :origem) or'
      ''
      '           (l.nrlancto = :nrlancto'
      '           and l.filial =:filial))'
      '    and l.exercicio = :exercicio'
      '    and l.creditar is not null'
      ') as TotalCredito,'
      ''
      '(select min(l.data)'
      'from lancamentos l'
      
        'Where ( ((case when :origem = '#39'B'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-4)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-4))'
      
        '               when :origem = '#39'P'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-8)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-8))'
      '             else                     l.nrorigem = :nrorigem'
      '         end) and l.origem = :origem) or'
      ''
      '           (l.nrlancto = :nrlancto'
      '           and l.filial =:filial))'
      '     and l.exercicio = :exercicio'
      '     and l.debitar is not null'
      ') as DataInicial,'
      ''
      '(select max(l.data)'
      'from lancamentos l'
      
        'Where ( ((case when :origem = '#39'B'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-4)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-4))'
      
        '               when :origem = '#39'P'#39' then substr(l.nrorigem,1, abs(' +
        'length(l.nrorigem)-8)) = substr(:nrorigem,1, abs(length(:nrorige' +
        'm)-8))'
      '             else                     l.nrorigem = :nrorigem'
      '         end) and l.origem = :origem) or'
      ''
      '           (l.nrlancto = :nrlancto'
      '           and l.filial =:filial))'
      '     and l.exercicio = :exercicio'
      '     and l.debitar is not null'
      ') as DataFinal')
    RequestLive = True
    Left = 336
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nrorigem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nrlancto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exercicio'
        ParamType = ptUnknown
      end>
    object qryTotaistotaldebito: TFloatField
      DisplayWidth = 12
      FieldName = 'totaldebito'
      DisplayFormat = '###,###,##0.00'
    end
    object qryTotaistotalcredito: TFloatField
      FieldName = 'totalcredito'
      DisplayFormat = '###,###,##0.00'
    end
    object qryTotaisdatainicial: TDateField
      Alignment = taCenter
      FieldName = 'datainicial'
      EditMask = '99/99/9999;1; '
    end
    object qryTotaisdatafinal: TDateField
      Alignment = taCenter
      FieldName = 'datafinal'
      EditMask = '99/99/9999;1; '
    end
  end
  object dsrTotais: TtecDataSource
    DataSet = qryTotais
    Left = 368
    Top = 320
  end
  object spcLotesProximo: TtecQuery
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
      'SELECT lancamentos_proximolote(:Exercicio, :Filial) as codigo')
    RequestLive = True
    Left = 415
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Exercicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Filial'
        ParamType = ptUnknown
      end>
    object spcLotesProximocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object qryBloquearLancamentos: TtecQuery
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
      'LOCK TABLE lancamentos IN EXCLUSIVE MODE;')
    RequestLive = False
    Left = 624
    Top = 240
  end
end
