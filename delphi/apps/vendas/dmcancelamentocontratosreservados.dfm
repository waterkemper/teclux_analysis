inherited dtmCancelamentoContratosReservados: TdtmCancelamentoContratosReservados
  Left = 111
  Top = 180
  Height = 244
  Width = 622
  inherited qryConsultaFilial: TtecQuery
    Left = 364
  end
  inherited dsrVendedores: TtecDataSource
    Top = 166
  end
  inherited qryConsultaVendedores: TtecQuery
    Left = 364
  end
  inherited qryContratos: TtecQuery
    Sql.Strings = (
      'SELECT t.numero, t.data, t.cliente,'
      '                  t.valorprazo, t.vendedor,'
      '                  t.plano, c.nome'
      '/*  Marcar */'
      'FROM contratos t , clientes c'
      'WHERE (t.cliente = c.codigo) AND (t.situacao = '#39'R'#39')'
      '/* Filial */'
      '/* Vendedor*/'
      'ORDER BY t.data'
      '              ')
  end
  object spcMovimentosProximo: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AutoCalcFields = False
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT movimentos_proximonumero()  AS numero'
      'FROM estoques'
      'WHERE ( produto = :produto ) AND'
      '                  ( filial = :filial )  FOR UPDATE')
    RequestLive = False
    Left = 364
    Top = 113
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object spcMovimentosProximonumero: TIntegerField
      FieldName = 'numero'
    end
  end
  object qryMovimentos: TtecQuery
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
      'SELECT numero, data, produto, '
      '                  filial, quantidade, '
      '                  referencia, tipomovimento'
      'FROM movimentos'
      'LIMIT 1')
    RequestLive = True
    Left = 189
    Top = 166
    object qryMovimentosnumero: TIntegerField
      FieldName = 'numero'
    end
    object qryMovimentosdata: TDateField
      FieldName = 'data'
    end
    object qryMovimentosproduto: TIntegerField
      FieldName = 'produto'
    end
    object qryMovimentosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryMovimentosquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object qryMovimentosreferencia: TStringField
      FieldName = 'referencia'
      Size = 30
    end
    object qryMovimentostipomovimento: TStringField
      FieldName = 'tipomovimento'
      Size = 3
    end
  end
  object qryProdutosContratos: TtecQuery
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
      'SELECT contrato, produto, filial,  movimento,'
      '                  quantidade, futuro, reserva'
      'FROM produtoscontratos'
      'WHERE contrato = :contrato')
    RequestLive = False
    Left = 366
    Top = 166
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryProdutosContratoscontrato: TStringField
      FieldName = 'contrato'
    end
    object qryProdutosContratosproduto: TIntegerField
      FieldName = 'produto'
      Required = True
    end
    object qryProdutosContratosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryProdutosContratosquantidade: TIntegerField
      FieldName = 'quantidade'
      Required = True
    end
    object qryProdutosContratosmovimento: TIntegerField
      FieldName = 'movimento'
    end
    object qryProdutosContratosfuturo: TIntegerField
      FieldName = 'futuro'
    end
    object qryProdutosContratosreserva: TIntegerField
      FieldName = 'reserva'
    end
  end
end
