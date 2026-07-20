object fraAtendimentosDocumentos: TfraAtendimentosDocumentos
  Left = 0
  Top = 0
  Width = 775
  Height = 288
  TabOrder = 0
  OnConstrainedResize = FrameConstrainedResize
  OnEnter = FrameEnter
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Height = 288
  end
  object lbxExibirInformes: TRichEdit
    Left = 3
    Top = 0
    Width = 772
    Height = 288
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'helvetica'
    Font.Pitch = fpVariable
    Font.Style = []
    HideScrollBars = False
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object dsrOcorrencias: TtecDataSource
    DataSet = qryocorrencias
    Left = 162
    Top = 50
  end
  object qryocorrencias: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    Filtered = True
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'Select a.origem,'
      '       a.codigo,'
      '       a.data,'
      '       a.lembrar,'
      '       a.informes,'
      '       a.tipo,'
      
        '      (select ta.descricao from tiposatendimentos ta where ta.co' +
        'digo = a.tipoatendimento) as descricaotipo,'
      '       a.assunto,'
      '       a.usuario,'
      
        '       (select u.nome from usuarios u where u.codigo = a.usuario' +
        ') as nomeusuario,'
      '       a.datainclusao,'
      '       a.lembrarhora,'
      '       a.status'
      ''
      'From atendimentos a'
      'Where (a.orcamento =:orcamento and :tipoatendimento=2) or'
      '      (a.contrato =:contrato and :tipoatendimento=1)'
      
        'order by coalesce(a.origem, a.codigo+1) desc, a.datainclusao des' +
        'c')
    RequestLive = False
    Left = 120
    Top = 39
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orcamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipoatendimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptUnknown
      end>
    object qryocorrenciasorigem: TIntegerField
      FieldName = 'origem'
      DisplayFormat = '0'
    end
    object qryocorrenciascodigo: TIntegerField
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryocorrenciasdata: TDateField
      Alignment = taCenter
      FieldName = 'data'
      EditMask = '99/99/9999;1; '
    end
    object qryocorrenciaslembrar: TDateField
      Alignment = taCenter
      FieldName = 'lembrar'
      EditMask = '99/99/9999;1; '
    end
    object qryocorrenciastipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qryocorrenciasassunto: TStringField
      FieldName = 'assunto'
      Size = 100
    end
    object qryocorrenciasusuario: TIntegerField
      FieldName = 'usuario'
      DisplayFormat = '0'
    end
    object qryocorrenciasnomeusuario: TStringField
      FieldName = 'nomeusuario'
      Size = 100
    end
    object qryocorrenciasdatainclusao: TDateTimeField
      FieldName = 'datainclusao'
    end
    object qryocorrenciasdescricaotipo: TStringField
      FieldName = 'descricaotipo'
      Size = 30
    end
    object qryocorrenciaslembrarhora: TTimeField
      Alignment = taCenter
      FieldName = 'lembrarhora'
      EditMask = '99:99;1; '
    end
    object qryocorrenciasstatus: TStringField
      FieldName = 'status'
      Size = 1
    end
    object qryocorrenciasinformes: TMemoField
      FieldName = 'informes'
      BlobType = ftMemo
    end
  end
end
