inherited dtmcomissaovendedorespagtoparcelas: Tdtmcomissaovendedorespagtoparcelas
  OldCreateOrder = False
  Left = 612
  Top = 211
  Height = 540
  Width = 725
  object qryComissoesRecebimentos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    Filtered = True
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'SQLContratoDataRecebimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ListaCondicionalVendedores'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      'SELECT ct.filialvenda,'
      '       f.nome as nomefilialvenda,'
      '       cv.Vendedor,'
      '       u.nome as nomevendedor,'
      '       p.DataVencto,'
      '       p.DataPagto,'
      '       p.ValorPagto,'
      '       cv.perccomissao,'
      ''
      '       ((cv.perccomissao *  p.ValorPagto)/100) as ValorComissao,'
      ''
      ''
      '       p.Contrato,'
      '       ct.nome as nomecliente,'
      '       ct.licitacao,'
      '       li.NrProposta,'
      '       li.Observacoes,'
      ''
      '       (SELECT string_agg(cast(n.Numero as varchar), '#39','#39')'
      '           FROM Notas n'
      '           WHERE n.DadoFiscal in  (SELECT df.Numero'
      '                                    FROM DadosFiscais df'
      '                                    WHERE df.Situacao <> '#39'C'#39' AND'
      
        '                                          df.Contrato = p.Contra' +
        'to)'
      '       ) as NotasFiscais'
      ''
      ''
      '   FROM Parcelas p'
      '        JOIN Contratos ct'
      ''
      '             join filiais f'
      '             on ct.filialvenda = f.codigo'
      ''
      '             join contratosvendedores cv'
      '                  join usuarios u'
      '                  on cv.vendedor = u.codigo'
      '             on ct.numero = cv.contrato'
      '        ON ct.Numero = p.Contrato'
      ''
      '        LEFT JOIN Licitacoes li'
      '        ON li.Numero = ct.Licitacao'
      ''
      '   WHERE ct.situacao in ('#39'F'#39','#39'N'#39','#39'P'#39')'
      ''
      '   %SQLContratoDataRecebimento'
      ''
      '   %ListaCondicionalVendedores'
      ''
      ''
      
        'order by ct.filialvenda, f.nome, cv.vendedor, p.datapagto, p.con' +
        'trato')
    RequestLive = False
    Left = 72
    Top = 24
    object qryComissoesRecebimentosfilialvenda2: TIntegerField
      FieldName = 'filialvenda'
      Required = True
    end
    object qryComissoesRecebimentosnomefilialvenda: TStringField
      FieldName = 'nomefilialvenda'
      Required = True
      Size = 60
    end
    object qryComissoesRecebimentosvendedor: TIntegerField
      FieldName = 'vendedor'
      Required = True
    end
    object qryComissoesRecebimentosnomevendedor: TStringField
      FieldName = 'nomevendedor'
      Required = True
      Size = 40
    end
    object qryComissoesRecebimentosdatavencto: TDateField
      Alignment = taCenter
      FieldName = 'datavencto'
      Required = True
      EditMask = '99/99/9999;1; '
    end
    object qryComissoesRecebimentosdatapagto: TDateField
      Alignment = taCenter
      FieldName = 'datapagto'
      EditMask = '99/99/9999;1; '
    end
    object qryComissoesRecebimentosvalorpagto: TFloatField
      FieldName = 'valorpagto'
      DisplayFormat = '0.00'
    end
    object qryComissoesRecebimentosperccomissao: TFloatField
      FieldName = 'perccomissao'
      DisplayFormat = '0.00'
    end
    object qryComissoesRecebimentoscontrato: TStringField
      FieldName = 'contrato'
      Required = True
    end
    object qryComissoesRecebimentosnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 60
    end
    object qryComissoesRecebimentoslicitacao: TIntegerField
      FieldName = 'licitacao'
    end
    object qryComissoesRecebimentosnrproposta: TStringField
      FieldName = 'nrproposta'
      Size = 100
    end
    object qryComissoesRecebimentosobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 500
    end
    object qryComissoesRecebimentosnotasfiscais: TMemoField
      FieldName = 'notasfiscais'
      BlobType = ftMemo
    end
    object qryComissoesRecebimentosvalorcomissao: TFloatField
      FieldName = 'valorcomissao'
      DisplayFormat = '0.00'
    end
  end
  object dsrComissoesRecebimentos: TtecDataSource
    DataSet = qryComissoesRecebimentos
    Left = 104
    Top = 40
  end
  object frxDBDatasetComissoesRecebimentos: TfrxDBDataset
    UserName = 'frxDBDComissoesRecebimentos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'filialvenda=filialvenda'
      'nomefilialvenda=nomefilialvenda'
      'vendedor=vendedor'
      'nomevendedor=nomevendedor'
      'datavencto=datavencto'
      'datapagto=datapagto'
      'valorpagto=valorpagto'
      'perccomissao=perccomissao'
      'contrato=contrato'
      'nomecliente=nomecliente'
      'licitacao=licitacao'
      'nrproposta=nrproposta'
      'observacoes=observacoes'
      'notasfiscais=notasfiscais'
      'valorcomissao=valorcomissao')
    OpenDataSource = False
    DataSet = qryComissoesRecebimentos
    Left = 112
    Top = 160
  end
  object frxReportComissoesRecebimentos: TfrxReport
    Version = '4.0.11'
    DataSet = frxDBDatasetComissoesRecebimentos_
    DataSetName = 'frxDBDComissoesRecebimentos'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45167.557598344900000000
    ReportOptions.LastChange = 45205.391228136580000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' vZebrar, vZebrar2 : boolean;'
      ''
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar then'
      '  begin'
      '    if <CordoZebrado> <> null then'
      '      mmoZebrado.color := <CordoZebrado>;'
      '    vZebrar := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado.color := clwhite;'
      '    vZebrar := true;'
      '  end;'
      ''
      'end;'
      ''
      'procedure GroupFooter3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if vZebrar2 then'
      '  begin'
      '    if <CordoZebrado> <> null then'
      '      mmoZebrado2.color := <CordoZebrado>;'
      '    vZebrar2 := false;'
      '  end'
      '  else'
      '  begin'
      '    mmoZebrado2.color := clwhite;'
      '    vZebrar2 := true;'
      '  end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReportComissoesRecebimentosGetValue
    Left = 216
    Top = 112
    Datasets = <
      item
        DataSet = frxDBDatasetComissoesRecebimentos
        DataSetName = 'frxDBDComissoesRecebimentos'
      end>
    Variables = <
      item
        Name = ' Relatorio'
        Value = Null
      end
      item
        Name = 'ENDERECO_BAIRRO'
        Value = Null
      end
      item
        Name = 'RAZAOFILIALBASE'
        Value = Null
      end
      item
        Name = 'CEP_CIDADE_UF'
        Value = Null
      end
      item
        Name = 'TITULO'
        Value = #39'COMISS'#195'O DE VENDEDORES POR RECEBIMENTOS'#39
      end
      item
        Name = 'SUBTITULO'
        Value = 
          #39' VENDEDORES: u.codigo =  '#39#39'1005'#39#39'   - RECEBIMENTOS ENTRE: 01/09' +
          '/2023 E 30/09/2023'#39
      end
      item
        Name = 'OUTRAS'
        Value = #39'FILIAIS: 1,2,3,4,5,6,7,8,9,10 '#39
      end
      item
        Name = 'DATA'
        Value = Null
      end
      item
        Name = 'CordoZebrado'
        Value = Null
      end
      item
        Name = 'AgruparGrupoFilial'
        Value = 'False'
      end
      item
        Name = 'AgruparFilial'
        Value = 'True'
      end
      item
        Name = 'AgruparFornecedor'
        Value = Null
      end
      item
        Name = 'AgruparLocalizacao'
        Value = Null
      end
      item
        Name = 'AgruparClasseProduto'
        Value = Null
      end
      item
        Name = 'AgruparGrupoProduto'
        Value = Null
      end
      item
        Name = 'DATASITUACAO'
        Value = #39'28/02/2021'#39
      end
      item
        Name = 'QuebrarPaginaporCliente'
        Value = 'False'
      end
      item
        Name = 'Pagina1'
        Value = Null
      end
      item
        Name = 'Pagina2'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 1065.827460000000000000
        object Memo6: TfrxMemoView
          Left = 986.457330000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo4: TfrxMemoView
          Left = 937.323440000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 937.323440000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 986.457330000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmoTitulo: TfrxMemoView
          ShiftMode = smDontShift
          Left = 427.086890000000000000
          Top = 3.779530000000000000
          Width = 498.897960000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TITULO]')
          ParentFont = False
        end
        object fmvRua_T: TfrxMemoView
          ShiftMode = smDontShift
          Left = 124.724490000000000000
          Top = 3.779530000000000000
          Width = 294.803340000000000000
          Height = 11.338590000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]'
            '[ENDERECO_BAIRRO]'
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo71: TfrxMemoView
          Left = 427.086890000000000000
          Top = 26.456710000000000000
          Width = 498.897960000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          ShiftMode = smDontShift
          Left = 192.756030000000000000
          Top = 52.913420000000000000
          Width = 264.567100000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CLIENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          ShiftMode = smDontShift
          Left = 457.323130000000000000
          Top = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'N. PROPOSTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          ShiftMode = smDontShift
          Left = 548.031850000000000000
          Top = 52.913420000000000000
          Width = 309.921460000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'OBSERVA'#195#8225#195#8226'ES')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          ShiftMode = smDontShift
          Left = 857.953310000000000000
          Top = 52.913420000000000000
          Width = 64.252010000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VL RECEB.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Left = 922.205320000000000000
          Top = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '% COMIS.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          ShiftMode = smDontShift
          Left = 971.339210000000000000
          Top = 52.913420000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VL COMISS'#195#402'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          ShiftMode = smDontShift
          Left = 136.063080000000000000
          Top = 52.913420000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'CONTRATO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          ShiftMode = smDontShift
          Left = 68.031540000000000000
          Top = 52.913420000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VENCIMENTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          ShiftMode = smDontShift
          Top = 52.913420000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'PAGAMENTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object GroupHeaderFilial: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 1065.827460000000000000
        Condition = 
          'IIF(<AgruparFilial>,<frxDBDComissoesRecebimentos."filialvenda">,' +
          #39#39')'
        StartNewPage = True
        object Memo16: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          DataSet = dtmRelatorioEstoque.frxDBEstoque
          DataSetName = 'frxDBEstoque'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'FILIAL: [frxDBDComissoesRecebimentos."filialvenda"] - [frxDBDCom' +
              'issoesRecebimentos."nomefilialvenda"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 238.110390000000000000
        Width = 1065.827460000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDatasetComissoesRecebimentos
        DataSetName = 'frxDBDComissoesRecebimentos'
        RowCount = 0
        Stretched = True
        object mmoZebrado: TfrxMemoView
          Align = baClient
          Width = 1065.827460000000000000
          Height = 18.897650000000000000
          Color = clBtnFace
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Style = 'Style1'
        end
        object Memo28: TfrxMemoView
          Left = 68.031540000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataField = 'datavencto'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."datavencto"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 136.063080000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'contrato'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."contrato"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 192.756030000000000000
          Top = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'nomecliente'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."nomecliente"]')
          ParentFont = False
          WordBreak = True
        end
        object Memo36: TfrxMemoView
          Left = 457.323130000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DataField = 'nrproposta'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."nrproposta"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 548.031850000000000000
          Top = 3.779530000000000000
          Width = 309.921460000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'observacoes'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."observacoes"]')
          ParentFont = False
          WordBreak = True
        end
        object Memo34: TfrxMemoView
          Left = 857.953310000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'valorpagto'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."valorpagto"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 922.205320000000000000
          Top = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."perccomissao"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 971.339210000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."valorcomissao"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."datapagto"]')
          ParentFont = False
        end
      end
      object GroupHeaderVendedor: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 1065.827460000000000000
        Condition = 'frxDBDComissoesRecebimentos."vendedor"'
        object Memo27: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          DataSet = dtmRelatorioEstoque.frxDBEstoque
          DataSetName = 'frxDBEstoque'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'VENDEDOR: [frxDBDComissoesRecebimentos."vendedor"] - [frxDBDComi' +
              'ssoesRecebimentos."nomevendedor"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 1065.827460000000000000
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 619.842920000000000000
          Height = 18.897650000000000000
          DataSet = dtmRelatorioEstoque.frxDBEstoque
          DataSetName = 'frxDBEstoque'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL VENDEDOR: [frxDBDComissoesRecebimentos."vendedor"] - [frxD' +
              'BDComissoesRecebimentos."nomevendedor"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 971.339210000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBDComissoesRecebimentos."valorcomissao">,MasterData1,1' +
              ')]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 325.039580000000000000
        Width = 1065.827460000000000000
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 619.842920000000000000
          Height = 18.897650000000000000
          DataSet = dtmRelatorioEstoque.frxDBEstoque
          DataSetName = 'frxDBEstoque'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL FILIAL: [frxDBDComissoesRecebimentos."filialvenda"] - [frx' +
              'DBDComissoesRecebimentos."nomefilialvenda"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 971.339210000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBDComissoesRecebimentos."valorcomissao">,MasterData1,1' +
              ')]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 408.189240000000000000
        Width = 1065.827460000000000000
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[formatdatetime('#39'dd/mm/yyyy'#39', <date>)] [formatdatetime('#39'hh:mm'#39', ' +
              '<time>)] ['#39'TecSoft'#39']')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader2: TfrxPageHeader
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 1065.827460000000000000
        object Memo8: TfrxMemoView
          Left = 680.315400000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          Left = 631.181510000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#129'G.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 631.181510000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'DATA:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 680.315400000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          ShiftMode = smDontShift
          Left = 385.512060000000000000
          Top = 3.779530000000000000
          Width = 238.110390000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'RESUMO [TITULO]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          ShiftMode = smDontShift
          Left = 124.724490000000000000
          Top = 3.779530000000000000
          Width = 257.008040000000000000
          Height = 11.338590000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RAZAOFILIALBASE]'
            '[ENDERECO_BAIRRO]'
            '[CEP_CIDADE_UF]')
          ParentFont = False
        end
        object fpvLogo2: TfrxPictureView
          Top = 7.559060000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Picture.Data = {
            07544269746D617016110000424D161100000000000036000000280000004800
            0000140000000100180000000000E0100000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFCFCFCCECDCDFFFFFFE3E3E3CFCFD0FFFFFFF1F1F1CDCDCD
            FAFAFADDDDDDFFFFFFE4E3E3FFFFFFE4E4E4DBDCDCFFFFFFECECECFBFBFBFCFC
            FCCECECDF9F9F9FFFFFFB5B5B58D8D8E9E9E9DF8F8F8F4F4F4FAFAFAD0D0D0D3
            D3D4FEFEFEFFFFFFFFFFFFD7D7D8DBDADAFDFDFDF2F2F2DDDDDDFEFEFEE9E9E9
            FFFFFFFEFEFECFCFD0CFCFCFFAFAFAF0F0F1FAFAFADADADACECECEEEEEEEFFFF
            FFE7E7E7ECECECFEFEFED0D0D1E9E9E9F1F1F1FBFBFBE1E1E1FBFBFBF4F4F4FA
            FAFACFCFCFD4D4D5FFFFFFCECECECECECEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
            A9A8A8D2D2D2DCDCDC999999DFDFDFF7F7F7585859F1F1F1FDFDFD3C3A3AFFFF
            FF545453ECECEC969696C7C7C7B2B2B2999A9AEBEBEB424140EDEDED414141FA
            FAF9585757E7E7E7868686D9D9D9C0C0C06F6F6FDDDDDD696969F9F9F9FFFFFF
            929394D0D0D0E7E7E7EFEFEFB3B3B23E3E3FF9F9F97B7B7AFFFFFFFFFFFFE0E0
            E0C7C7C68C8C8CAFAEAEDFDFDFECECECD8D7D73F3F3FFEFEFE4C4D4EF9F9F946
            4646DFDFDFF1F1F1A8A7A7E7E7E7484747DEDEDEBCBCBC545352E1E1E15A5A5A
            FFFFFFE0E0E0D3D3D37E7D7EFFFFFFFFFFFFFFFFFFFFFFFFABABABE2E2E1DADA
            DA7A7A79B9B9B9F6F6F668686AFEFEFEFFFFFF3E3D3DFEFEFE565658E8E8E8B0
            B0AFD8D8D8A5A5A4999A9AEBEBEB403F3EFCFCFB464646F8F8F8616161F2F2F2
            868686D9D9D9C0C0C0F3F3F3B3B3B3484949FAFAFAFFFFFF8E8F90AAAAA9C9C9
            C8EFEFEFB7B7B73E4043F1F1F1848485FFFFFFF9F9F94D4D4DC5C5C5F6F6F6B1
            B0B0DFDFDF4B4B4DC3C3C3E4E4E4FDFDFD555656FEFEFE40403FB9B9B9E1E1E1
            A8A8A8E6E6E64B4A4ADADADAC0C1C2F2F2F2B3B3B33F3F3FFFFFFF404040C4C4
            C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7474749C9B9AFFFFFFE2E2E2AFAFB0FE
            FEFEF0F0F0AEAEADF5F6F6C0BFBEB3B3B2FCFCFCFFFFFFD7D7D8C6C6C6FFFFFF
            989999EAEBEBFCFCFCAFAFAFF6F6F6FFFFFFEDEDEDB0B0AFE1E1E0F0F0F0E7E7
            E7D9D9D9AFAEAEDCDDDDFFFFFFFFFFFFFFFFFFC9C9C9C2C2C2FCFCFCB0B0AFB7
            B7B7B7B6B5FCFCFCFFFFFFFFFFFFD6D7D7AEAEADE7E7E5E0E0E0F2F2F2F2F2F2
            B0AFAFC2C2C2E6E6E63B3A3ADDDEDEFFFFFFB6B6B6DDDDDDE9E9E9B0AFAFB7B7
            B7BEBEBEFFFFFFD1D1D1AFAEAEE0E0E0FFFFFFDADADAAFAEAEE1E1E1FFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEAF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FAFAF9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F3DDDAB6ECE9C4ECE9C4FD
            FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFECDCDCEB2B2B1ADAEB0BABCBDFFFFFFFFFFFFFFFFFFF8F8F9CACB
            CCB3B4B4ADAEB0ADAEB0ADAEB0C6C7C8FFFFFFFFFFFFFFFFFFFEFEFED1D2D3B7
            B7B7B6B7B8FFFFFFFFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFF
            EAE7BFE3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E3DFA6E5E1AEECE9C5FCFC
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDECEBC6E4E0ABECE9C3FDFCF9FF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFCE6E3B1E6E3B1EDEAC7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F6E6E8E7BAE6E3B1E6E3B1FFFFFFFFFFFFF3F3F41B1E231619
            20171A20171A203F4045FFFFFFFDFDFD8183850F1218161920171A20171A2017
            1A20171A205C5D61FFFFFFFFFFFF9FA0A10F1218161920171A20313337FFFFFF
            FFFFFFFCFCF6ACA205ADA400ADA400F6F5E5FFFFFFFFFFFFC2BA43ADA400ADA4
            00ADA400ADA400ADA400ADA400ADA400ADA400ADA400ABA104F9F8EFFFFFFFFF
            FFFFFFFEFCCDC869ACA104ADA400ADA400ADA400ACA103C8C156FEFEFBFFFFFF
            FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFFFFFFFC1B944ACA3
            00ADA400ADA400ADA400FFFFFFFFFFFF838586171A20181B2111151B3C3E4160
            6265FFFFFF71737616191F181B210F13193034383D3F443D40443D4044797A7B
            FFFFFFBEBFC113161C181B2114181D1C20244D4F4CEEECCBEEECCBEDEAC7BCB5
            36BCB635BCB635E5E2B0E8E6BBE8E6BBC8C45ABDB63FBDB63FBDB63FBDB63FBD
            B63FBDB63FBDB640BBB438ADA400ADA400B9AF26FFFFFFFEFEFDBCB334ADA400
            ADA400ABA101AEA404ABA101ADA400ADA400B7AE26FEFEFAFFFFFFFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFF4F1DCACA300ADA400ADA400B0A608B1
            A811FFFFFFFFFFFF35383C181B2111151AE8E8E8FFFFFFFFFFFFF7F7F70E1217
            181B211C1F24F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD1F2227181B
            2115181EB6B7B9FFFFFFF2EFD4ACA300ADA400AFA409FEFDFAFFFFFFFFFFFFB1
            A810ADA400ADA400E5E2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0A611ADA400AEA504FDFDF8D3CD78ACA300ADA400DCD791FFFFFFFFFF
            FFFFFFFFDFDC9EACA202ADA400CAC35BFFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFD4D07BADA400ADA400D3CD77FFFFFFFFFFFFFFFFFFFFFFFF
            282A2C181B2112151BF0F1F1FFFFFFFFFFFFB6B7B8181B21181B212F32368081
            857F80857F80857F80857F8085A6A7A8E6E6E613161C181B2124272CFFFFFFFF
            FFFFF2EFD4ACA300ADA400B0A709FEFDFAFFFFFFFFFFFFB1A810ADA400ADA400
            E5E2AFFFFFFFFFFFFFFEFEFEFDFDFBFBFAF3FBFAF3F9F9F0E9E6BCADA403ADA4
            00B0A707FEFDF9ACA202ADA400CDC767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
            CF7BADA400ABA100FFFFFFFAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFF
            CEC763ADA400ADA400E4E1ABFFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFF9A9C9E181B21181B21181B21181B21181B21181B2118
            1B21181B215D5E62DBDCDC11141A181B21494B4EFFFFFFFFFFFFF3F2DBB9B02A
            B9B02BBAB230D7D7D7D7D7D7D7D7D7BDB53EBEB53BBEB53BEBE8BEFFFFFFECE9
            C5ADA307ACA200ADA400ADA400ADA400ADA400ADA400ADA400CCC661FFFFFFAB
            A100ADA400EEECC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5E5ACA300ADA400
            FBFAF2FAFAEFABA100ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFF
            FFFFABABAB181B21181B21171A2014171C14171C14171C14171C14171C5C5E62
            E2E3E313161C181B21373A3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A
            1F13161B13161BE7E8EAFFFFFFFFFFFFFFFFFFFFFFFEA99E02ADA400ADA400B1
            A610B3A918B3A919B3A91ABBB32EE5E2AFFFFFFFFFFFFFABA100ADA400E5E1AD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBCAADA400ABA000FFFFFEFAFAEFABA1
            00ADA400C2BA45FFFFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFF
            FFFFFFFFFFFFFFFF292C31181B2112161BF1F1F2FFFFFFFFFFFFDFDFDF14171D
            181B213C3E42F1F1F2F0F0F1F0F0F1F0F0F1F0F0F1F5F5F5F8F8F8171A1F181B
            210C0F15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7171A1F181B21181B21E7
            E8E9FFFFFFFFFFFFFFFFFFF3F1D7ADA400ADA400B8B023FEFEFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AA15ADA400B8B023FEFEFBFFFFFFFFFF
            FFFFFFFFFFFFFFBCB330ADA400AFA405FFFFFFFAFAEFABA100ADA400C2BA45FF
            FFFFFFFFFFFFFFFFCEC762ADA400ADA400E7E4B5FFFFFFFFFFFFEEEEEEE8E8E8
            272A2F181B2113171CDFDFDFE8E8E8ECECECFFFFFF111319181B21171A20ADAE
            B0E2E2E3E8E8E8E8E8E8E8E8E8EFEFEFFFFFFF4D4F52181B21181B2147494ECF
            D0D1E3E3E4E4E4E5E4E4E5DEDFDF27292D272B2F272B2FDADADAE6E7E7E6E7E7
            F5F5F5F5F3E0ADA400ADA400B0A70FF1EFD4F2F0D6F2F0D6F1F0D4F1F0D4F1F0
            D4F7F5E5FFFFFFF1EFD3ACA202ADA400AEA503DED999EDEAC5E1DEA1B0A70AAD
            A400ACA300E8E5B7F1EFD4EEEDCCACA200ADA400BFB73BF1EFD4F1EFD4FAF9EE
            CEC762ADA400ADA400DDD996F1EFD4F1EFD4595B5E15181E181B21181B21181B
            2115181E15181E3D3E43FFFFFFC7C7C90E1117181B2115191E15181E15181E15
            181E15181E5B5C5FFFFFFFF0F0F10A0E13181B21181B2115181E15181E15181E
            15181E16191EFAFAFAFFFFFFFFFFFF25292D15181E15181E9D9EA0FFFFFFABA0
            00ADA400ADA400ACA300ACA300ACA300ACA300ACA300ACA300CAC55CFFFFFFFF
            FFFFE4E1ADABA200ADA400ADA400ACA300ADA400ADA400ABA200DEDA99D2CD73
            ACA300ACA300ADA400ADA400ADA400ACA300ACA300E0DD9ECEC762ADA400ADA4
            00ADA400ACA300ACA3005A5D6015181D181B21181B21181B2116191E15181D3E
            4044FFFFFFFFFFFFE0E0E1494C4F212429171A1F15181D15181D15181D5C5F62
            FFFFFFFFFFFFF0F1F16B6D70282C301B1E2215181D15181D15181D161A1FF9F9
            F9FFFFFFFFFFFF272B2F181B21181B219E9FA2FFFFFFF9F9EDBEB83DAFA60BAD
            A403ADA403ADA403ADA403ADA403ADA403CBC55EFFFFFFFFFFFFFFFFFFFAF9EF
            CDC865B5AB1BAEA406B3AA18CBC562F9F7E9FFFFFFD2CD75AFA605AFA605ADA4
            00ADA400ADA400AFA605AFA605E0DCA0CEC762ADA400ADA400AEA502AFA605AF
            A605FDFDFDFCFCFC292C31181B2112161BF0F0F0FCFCFCFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFF2A
            2C2F15191E15191EA0A0A0FFFFFFFFFFFFFFFFFFFEFEFDFEFEFCFEFEFCFEFEFC
            FEFEFCFEFEFCFEFEFCFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFBF3ABA100ADA400BEB639FE
            FEFDFEFEFDFFFFFECEC762ADA400ADA400E6E3B3FEFEFDFEFEFDFFFFFFFFFFFF
            292C31181B2112161BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDF8AAA000ADA400ADA400C4BC4BC7C152ECE9C1
            CEC762ADA400ADA400E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF292C31181B211216
            1BF1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBFB740ACA200ADA400ADA400ADA400E2DEA3CEC762ADA400ADA4
            00E7E4B5FFFFFFFFFFFFFFFFFFFFFFFF67696B5A5C60585A5EF5F5F5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FCE6E3B1CBC55DC5C34EC5C34EEAE7BEDDD893C5C34EC5C34EEEECCAFFFFFFFF
            FFFF}
        end
        object Memo14: TfrxMemoView
          Left = 385.512060000000000000
          Top = 26.456710000000000000
          Width = 238.110390000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUBTITULO]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          ShiftMode = smDontShift
          Top = 56.692950000000000000
          Width = 668.976810000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VENDEDOR')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          ShiftMode = smDontShift
          Left = 668.976810000000000000
          Top = 56.692950000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'VL COMISS'#195#402'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Visible = False
        Width = 1065.827460000000000000
        Condition = 
          'IIF(<AgruparFilial>,<frxDBDComissoesRecebimentos."filialvenda">,' +
          #39#39')'
        StartNewPage = True
        object Memo24: TfrxMemoView
          Left = -0.000000000000001049
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          DataSet = dtmRelatorioEstoque.frxDBEstoque
          DataSetName = 'frxDBEstoque'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'FILIAL: [frxDBDComissoesRecebimentos."filialvenda"] - [frxDBDCom' +
              'issoesRecebimentos."nomefilialvenda"]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 238.110390000000000000
        Visible = False
        Width = 1065.827460000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDatasetComissoesRecebimentos
        DataSetName = 'frxDBDComissoesRecebimentos'
        RowCount = 0
        Stretched = True
        object Memo25: TfrxMemoView
          Left = -0.000000000000001049
          Width = 737.008350000000000000
          Height = 15.118120000000000000
          Color = clBtnFace
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Style = 'Style1'
        end
        object Memo44: TfrxMemoView
          Left = -0.000000000000001049
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataField = 'datavencto'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."datavencto"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 68.031540000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'contrato'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."contrato"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 124.724490000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'nomecliente'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."nomecliente"]')
          ParentFont = False
          WordBreak = True
        end
        object Memo47: TfrxMemoView
          Left = 298.582870000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'nrproposta'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."nrproposta"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 370.393940000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'observacoes'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."observacoes"]')
          ParentFont = False
          WordBreak = True
        end
        object Memo49: TfrxMemoView
          Left = 555.590910000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'valorpagto'
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."valorpagto"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 619.842920000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."perccomissao"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 668.976810000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDComissoesRecebimentos."valorcomissao"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Visible = False
        Width = 1065.827460000000000000
        Condition = 'frxDBDComissoesRecebimentos."vendedor"'
        object Memo52: TfrxMemoView
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          DataSet = dtmRelatorioEstoque.frxDBEstoque
          DataSetName = 'frxDBEstoque'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'VENDEDOR: [frxDBDComissoesRecebimentos."vendedor"] - [frxDBDComi' +
              'ssoesRecebimentos."nomevendedor"]')
          ParentFont = False
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 15.118120000000000000
        Top = 279.685220000000000000
        Width = 1065.827460000000000000
        OnBeforePrint = 'GroupFooter3OnBeforePrint'
        Stretched = True
        object mmoZebrado2: TfrxMemoView
          Align = baClient
          Width = 1065.827460000000000000
          Height = 15.118120000000000000
          Color = clBtnFace
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Style = 'Style1'
        end
        object Memo53: TfrxMemoView
          ShiftMode = smDontShift
          Width = 619.842920000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoque
          DataSetName = 'frxDBEstoque'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frxDBDComissoesRecebimentos."vendedor"] - [frxDBDComissoesReceb' +
              'imentos."nomevendedor"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 668.976810000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBDComissoesRecebimentos."valorcomissao">,MasterData2,1' +
              ')]')
          ParentFont = False
        end
      end
      object GroupFooter4: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 1065.827460000000000000
        Stretched = True
        object Memo55: TfrxMemoView
          ShiftMode = smDontShift
          Top = 3.779530000000000000
          Width = 619.842920000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = dtmRelatorioEstoque.frxDBEstoque
          DataSetName = 'frxDBEstoque'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              'TOTAL FILIAL: [frxDBDComissoesRecebimentos."filialvenda"] - [frx' +
              'DBDComissoesRecebimentos."nomefilialvenda"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 668.976810000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDatasetComissoesRecebimentos
          DataSetName = 'frxDBDComissoesRecebimentos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<frxDBDComissoesRecebimentos."valorcomissao">,MasterData2,1' +
              ')]')
          ParentFont = False
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 400.630180000000000000
        Width = 1065.827460000000000000
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[formatdatetime('#39'dd/mm/yyyy'#39', <date>)] [formatdatetime('#39'hh:mm'#39', ' +
              '<time>)] ['#39'TecSoft'#39']')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetComissoesRecebimentos_: TfrxDBDataset
    UserName = 'frxDBDComissoesRecebimentos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'filialvenda=filialvenda'
      'nomefilialvenda=nomefilialvenda'
      'vendedor=vendedor'
      'nomevendedor=nomevendedor'
      'datavencto=datavencto'
      'datapagto=datapagto'
      'valorpagto=valorpagto'
      'perccomissao=perccomissao'
      'contrato=contrato'
      'nomecliente=nomecliente'
      'licitacao=licitacao'
      'nrproposta=nrproposta'
      'observacoes=observacoes'
      'notasfiscais=notasfiscais'
      'valorcomissao=valorcomissao')
    OpenDataSource = False
    DataSet = qryComissoesRecebimentos
    Left = 112
    Top = 208
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Left = 472
    Top = 312
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 360
    Top = 288
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 472
    Top = 168
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 472
    Top = 112
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    ShowProgress = True
    Left = 472
    Top = 24
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    Left = 384
    Top = 24
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    ShowProgress = True
    Left = 472
    Top = 216
  end
  object frxGIFExport1: TfrxGIFExport
    UseFileCache = True
    ShowProgress = True
    Left = 472
    Top = 64
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    Left = 464
    Top = 264
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    Separator = ';'
    OEMCodepage = False
    Left = 368
    Top = 232
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    Left = 376
    Top = 176
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 352
    Top = 344
  end
  object frxODSExport1: TfrxODSExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 376
    Top = 72
  end
  object frxODTExport1: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 376
    Top = 128
  end
end
