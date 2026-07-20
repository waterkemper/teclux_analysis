inherited dtmQuadrosDIME: TdtmQuadrosDIME
  OldCreateOrder = False
  Left = 473
  Top = 139
  Height = 674
  Width = 1104
  object dsrQuadrosDIME: TtecDataSource
    DataSet = qryQuadrosDIME
    OnDataChange = dsrQuadrosDIMEDataChange
    Left = 136
    Top = 16
  end
  object qryProcuraFilial: TtecQuery
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
      'SELECT Codigo,'
      '       Razao,'
      '       InscricaoEstadual,'
      '       Regime'
      ''
      'FROM filiais'
      ''
      'WHERE Codigo = :Codigo'
      '')
    RequestLive = False
    Active = True
    Left = 642
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryProcuraFilialCodigo: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
    object qryProcuraFilialRazao: TStringField
      FieldName = 'Razao'
      Size = 40
    end
    object qryProcuraFilialRegime: TIntegerField
      FieldName = 'Regime'
      DisplayFormat = '0'
    end
    object qryProcuraFilialInscricaoEstadual: TStringField
      FieldName = 'InscricaoEstadual'
    end
  end
  object dsrProcuraFilial: TtecDataSource
    DataSet = qryProcuraFilial
    Left = 674
    Top = 21
  end
  object qryConsultaFiliais: TtecQuery
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
      'SELECT Codigo,'
      '       Razao'
      ''
      'FROM Filiais'
      ''
      'ORDER BY UPPER(TO_ASCII(Razao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 790
    Top = 4
    object qryConsultaFiliaisRazao: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'Razao'
      Size = 40
    end
    object qryConsultaFiliaiscodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      DisplayFormat = '0'
    end
  end
  object qryConsultaQuadrosDIME: TtecQuery
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
      'SELECT Filial,'
      '      (SELECT Razao'
      '          FROM Filiais'
      '          WHERE Codigo = Filial) AS Razao,'
      '       Periodo'
      ''
      'FROM QuadrosDIME'
      ''
      
        'ORDER BY SUBSTR(Periodo,4,4) DESC, SUBSTR(Periodo,1,2) DESC, Fil' +
        'ial;'
      ''
      '')
    RequestLive = False
    Left = 496
    Top = 8
    object qryConsultaQuadrosDIMEFilial: TIntegerField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = 'Filial'
    end
    object qryConsultaQuadrosDIMEPeriodo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Per'#237'odo'
      DisplayWidth = 9
      FieldName = 'Periodo'
      Size = 7
    end
    object qryConsultaQuadrosDIMERazao: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 50
      FieldName = 'Razao'
      Size = 50
    end
  end
  object qryQuadrosDIME: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterScroll = qryQuadrosDIMEAfterScroll
    OnCalcFields = qryQuadrosDIMECalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'SELECT Filial,'
      '       Periodo,'
      '       q00_040_TipoDeDeclaracao,'
      '       q00_050_regimedeapuracao,'
      '       q00_060_PorteDaEmpresa,'
      '       q00_070_apuracaoconsolidada,'
      '       q00_080_apuracaocentralizada,'
      '       q00_090_transfcreditosnoperiodo,'
      '       q00_100_temcreditospresumidos,'
      '       q00_110_temcreditosporincentfiscais,'
      '       q00_120_movimentos,'
      '       q00_130_substitutotributario,'
      '       q00_140_temescritacontabil,'
      '       q00_150_qttrabalhadoresnaativ,'
      ''
      '    /*q04_010_debitopelassaidas,  CALCULADO */'
      '       q04_020_debdifaliqativperm,'
      '       q04_030_debdifaliqmatusoons,'
      '       q04_040_debmaqeqimpativperm,'
      '       q04_050_estornocredito,'
      '       q04_060_outrosestornos,'
      '       q04_070_Outrosdebitos,'
      ''
      
        '      saldocredormesant,          /* q05_010 ou q06_080 ou q07_0' +
        '50  conforme o regime */'
      ''
      '   /*q05_010_saldocredormesant, CALCULADO */'
      '   /*q05_020_credpelasentradas, CALCULADO */'
      '      q05_030_credativpermanente,'
      '      q05_040_creddifaliqmatusocons,'
      '      q05_050_credICMSretsubstrib,'
      '      q05_060_estdebtransfcredacum,'
      '      q05_070_outrosestdeb,'
      '   /* q05_080_totcredpresumidos, = 44_990 */'
      '   /* q05_090_totcredincentfiscais, CALCULADO */'
      '      q05_100_credrelopimport,'
      '      q05_110_credrelaqatacouunfed,'
      '      q05_120_credresptributaria,'
      '      q05_130_outpagtosocasfatogerador,'
      '   /*q05_140_credregimeespecial, 44_999 origem = 90 */ '
      '      q05_150_restituicaodeicms,'
      '      q05_160_outroscreditos,'
      ''
      '      q06_010_Rectribestab,'
      '      q06_020_Rectribestabcent,'
      '   /*q06_030_TotrectributApdeb CALCULADO */'
      '      q06_040_ImpdevcalcsobTotrectribut,'
      '      q06_050_Credregpagamento,'
      '   /*q06_060_Credpresumidopermitido, = 44_990 */'
      '      q06_070_CredrelaquisatacoutrasUF,'
      '   /*q06_080_Saldocredormesant, CALCULADO */'
      ''
      '      q07_010_Debvalorentradas,'
      '      q07_020_Debsobdifentsaidas,'
      '      q07_030_CredrelaqatoutUF,'
      '    /*q07_040_CredpresECFaut, = 44_990 */'
      '   /*q07_050_Saldocredormesant,  CALCULADO */'
      ''
      '   /*q08_010_Debapnomes, CALCULADO */'
      '      q08_020_Debacumateomesantnosemestre,'
      '   /*q08_030_Credapnomes, CALCULADO */'
      '      q08_040_Credacumateomesantnosemestre,'
      '      q08_050_Somaparcestateomesnosemestre, '
      ''
      '      q09_011_Compldebmudancaregimeap,'
      '      q09_051_Complcredmudancaregimeap,'
      '      q09_052_Crepagtoindevidoperanterior,'
      '      q09_075_CreInformadonoDCIP,'
      '      q09_090_Imposto1decendio,'
      '      q09_100_Imposto2decendio,'
      '      q09_105_antecipliqcombgasosos,'
      '      q09_160_Saldocredorcredrelexport,'
      '      q09_170_Saldocredorcredrelsaidisent,'
      '      q09_180_Saldocredorcredrelsaidif,'
      '      q09_190_Saldocredordeoutroscreditos,'
      
        '      q09_998_SaldoCredPerSeguinte,                   /* GRAVACA' +
        'O */'
      '     /* q09_998_SaldoCredPerSeguinte_calculado, CALCULADO */'
      ''
      '      q10_010_Debrelopimportacao,'
      '      q10_020_DebrelaqatacdeoutrasUF,'
      '      q10_030_Debporesptribut,'
      '      q10_040_Outrosdebocasfatgerador,'
      '      q10_050_Outrosdebeventuais,'
      ''
      '      q11_010_Valordosprodutos,'
      '      q11_020_ValordoIPI,'
      '      q11_030_Despesasacessorias,'
      '      q11_040_BasedecalculodoICMSproprio,'
      '      q11_050_ICMSproprio,'
      '      q11_060_BasecalcICMSsubsttributaria,'
      '      q11_065_Debocafatger,'
      ''
      '      q11_070_Impretporsubsttributaria,'
      '      q11_073_Debocfatgerapuracaomensal,'
      '      q11_075_Slddevrecestcons,'
      ''
      '    /*q11_080_Totaldedebitos, CALCULADO */'
      '      q11_090_Saldocredperantsubsttribut,'
      '      q11_100_Devmercedesfazimentodevenda,'
      '      q11_105_CreditosdeclaradosnaDCIP,'
      ''
      '      q11_110_RessarcimentoICMSsubsttribut,'
      '      q11_120_Outroscreditos,'
      '      q11_125_Sldcredrecestcons,'
      '   /*q11_130_TotalcrediAjustesapdecendial, CALCULADO */'
      '      q11_140_Imposto1decendio,'
      '      q11_150_Imposto2decendio,'
      '      q11_155_antecipliqcombgasosos,'
      '      /*q11_160_Totalajustesapdecendial, CALCULADO */'
      ''
      '      q11_170_Saldodevedor,'
      '      q11_180_Slddevtrestcons,'
      '      q11_999_Imparecolhersobresubsttribut,'
      ''
      '      q11_190_SaldoCredor,'
      '      q11_200_Sldcredtrestcons,'
      '      q11_998_Saldocredorparaomesseguinte,'
      ''
      '      q41_010_PercCredreltotaq3ultmeses,'
      '      q41_017_ProdutosExportadosMes,'
      '      q41_018_ProdutosSaidaIsentaMes,'
      '      q41_019_ProdutosSaidaDiferidaMes,'
      '      q41_020_prodexpmes,'
      '      q41_030_prodsaidaisentaounaotrib,'
      '      q41_040_prodcomsaidadiferidanomes,'
      '      /* q41_120_Credgerexpocormes, q41_010 * q41_020 */'
      
        '      /* q41_130_Credgersaidasisentasocormes, q41_010 * q41_030 ' +
        '*/'
      '      /* q41_140_Credgersaidasdifocormes, q41_010 * q41_040 */'
      '      q41_160_Saldocredtransfmesantrelexpo,'
      '      q41_170_Salcredtranmesantrelsaiisent,'
      '      q41_180_Salcredtranmesantrelsaidifer,'
      '      q41_190_Salcredmesantreloutcredntran,'
      ''
      '      q41_217_CreditoTransferivelExportacao,   '
      '      q41_218_CreditoTransferivelSaidaIsenta,'
      '      q41_219_CreditoTransferivelSaidaDiferida,'
      ''
      '      /*q41_220_Esdebtrcredrelexportacoes, 44_999 origem = 11 */'
      
        '      /*q41_230_Estdebtrcredrelsaidasisentas, 44_999 origem = 12' +
        ' */'
      
        '      /*q41_240_Estdebportransfcredrelsaidif, 44_999 origem = 13' +
        ' */'
      
        '      /*q41_960_Saldocredoracumuladorelexp,  (q41_120+q41_160+q4' +
        '1_220) - q42_010 */'
      
        '      /*q41_970_Saldocredacumrelsaidasisenta,  (q41_130+q41_170+' +
        'q41_230) - q42_020 */'
      
        '      /*q41_980_Saldocredacumrelativoasaidas,  (q41_140+q41_180+' +
        'q41_240) - q42_030 */'
      ''
      '      q42_010_Debtranscredacumrelexport,'
      '      q42_020_Debtranscredacumrelsaidasis,'
      '      q42_030_debtranscredacumrelsaidasdif,'
      '      q42_040_Debtransbensatpermoutestabel,'
      '      q42_070_Outrosdebtranscreditos,'
      ' '
      '      /*q43_010_credtransfcredacum, = 44_999 origem = 1 */'
      '      q43_020_credtransfativopermestabemp,'
      '      q43_050_outroscredtransfcred,'
      ''
      '      q44_010_Totalpagosmesempregados,'
      '      q44_020_MediaValpagosempregadosexant,'
      '   /*q44_030_Incrementoverificado, CALCULADO */'
      '      q44_040_Credpresumidoincgeremprego,'
      '      q44_050_Credpresestababatedoraves5,'
      '      q44_060_Credpresestababatedoraves4,'
      '      q44_070_Credpresestababatedoraves3,'
      '      q44_080_Credpresestababatsuinos6,'
      '      q44_090_Credpresestababatsuinos5,'
      '      q44_100_Credpresestababatsuinos4,'
      '      q44_120_Credpresaqecf,'
      '      q44_130_contribaoFUNDOSOCIAL,'
      '      q44_131_CredcontribFUNDOSOCIAL,'
      '     /* q44_140_AplicFUNCULTURAL, = 44_999 origem = 2 */'
      '     /* q44_150_AplicFUNTURISMO, = 44_999 origem = 3 */'
      '     /* q44_160_AplicFUNDESPORTE, = 44_999 origem = 4 */'
      '      q44_190_Outroscredpresumidos,'
      '   /*q44_990_Totaldecreditospresumidos, CALCULADO */'
      ''
      '      q45_010_saldodevmesantesdedincent,'
      '      q45_020_credporincentfisc,'
      '      q45_030_valordorecibo,'
      '      q45_040_credporincentfiscpercvlrrec,'
      '      q45_050_outroscredincentfiscais,'
      ''
      '      q51_010_PrestServsujaoISS,'
      '      q51_020_25transfrecebprecovendavarej,'
      '      q51_030_IPIrelaqmatprimasmerc,'
      '      q51_040_ParICMSretSubstTributaria,'
      '      q51_050_SubsConcorgaosgovfedestoumun,'
      '   /*q51_980_Totalvalexcluidosentradas, CALCULADO */'
      '      q51_060_PrestervicosvsujeitaaoISS,'
      '      q51_070_25TransfEfetaPrecoVendaVarej,'
      '      q51_080_IPIincidentesaidademerc,'
      '      q51_090_ParceladoICMSretporSubstTrib,'
      '   /*q51_990_Totaldosvaloresexcdassaidas CALCULADO */'
      ''
      '      q80_010_EstoqueInicioExercicio,'
      '      q80_020_EstoqueFimExercicio,'
      '      q80_030_ReceitaBrutaVendasServicos,'
      ''
      '      q81_023_Circulante,'
      '      q81_024_Disponibilidades,'
      '      q81_025_Contasareceberdocirculante,'
      '      q81_026_Estoquedemercemateriaprima,'
      '      q81_027_Outrosestoques,'
      '      q81_028_Outrascontasdoativcirculante,'
      '      q81_029_Realizavelalongoprazo,'
      '      q81_030_Contasareceberdorealizavel,'
      '      q81_031_Outrascontasdorealizavel,'
      '      q81_032_Permanente,'
      '      q81_033_Investimentos,'
      '      q81_034_Imobilizado_liquido,'
      '      q81_035_Diferido,'
      '   /*q81_990_Totalgeraldoativo CALCULADO */'
      ''
      '     q82_037_Circulante,'
      '     q82_038_Fornecedores,'
      '     q82_039_Emprestimosefinanciamentos,'
      '     q82_040_Outrascontasdopassivocirc,'
      '     q82_041_Exigivelalongoprazo,'
      '     q82_042_Resultadosdeexfuturos,'
      '     q82_269_PassivoaDescoberto,'
      '     q82_043_Patrimonioliquido,'
      '     q82_044_Capitalsocial,'
      '     q82_045_Outrascontasdopatrimonioliq,'
      '     q82_279_outrascontasdopatrimonioliqvalneg,'
      '  /*q82_990_Totalgeraldopassivo, CALCULADO */'
      ''
      '     q83_047_Receitabrutavendasservicos,'
      '     q83_048_Devabatimentoseimpostos,'
      '     q83_049_Receitaliquidavendasservicos,'
      '     q83_050_Custodamercadoriavendida,'
      '     q83_051_Lucrobruto,'
      '     q83_331_prejuizobruto,'
      '     q83_333_OutrasRecOper,'
      '     q83_052_Despesasoperacionais,'
      '     q83_053_Lucroprejuizooperacional,'
      '     q83_341_prejuizooperacional,'
      '     q83_054_Receitasnaooperacionais,'
      '     q83_055_Despesasnaooperacionais,'
      '     q83_056_Saldodacontacorrecaomonet,'
      '     q83_057_ResultadoantesdoIR,'
      '     q83_351_resultadoNegantesdoir,'
      '     q83_058_ProvisaoparaoIR,'
      '     q83_059_ResultadoaposoIR,'
      '     q83_060_Participacoesecontribuicoes,'
      '     q83_398_prejuizodoexercicio,'
      '     q83_061_Lucroouprejuizo,'
      ''
      '     q84_062_Prolabore,'
      '     q84_063_Comissoessalariosordenados,'
      '     q84_064_Combustiveiselubrificantes,'
      '     q84_065_Encargossociais,'
      '     q84_066_Tributosfederais,'
      '     q84_067_Tributosestaduais,'
      '     q84_068_Tributosmunicipais,'
      '     q84_069_Aguaetelefone,'
      '     q84_070_Energiaeletrica,'
      '     q84_071_Alugueis,'
      '     q84_072_Servicosprofissionais,'
      '     q84_073_Seguros,'
      '     q84_074_Fretesecarretos,'
      '     q84_075_Despesasfinanceiras,'
      '     q84_076_Outrasdespesas,'
      '   /*q84_990_Total CALCULADO */'
      ''
      '     q90_010_EstoqueInicioExercicio,'
      '     q90_020_EstoqueFimExercicio,'
      '     q90_030_ReceitaBrutaVendasServicos,'
      ''
      '     q91_023_Circulante,'
      '     q91_024_Disponibilidades              ,'
      '     q91_025_Contasareceberdocirculante    ,'
      '     q91_026_Estoquedemercemateriaprima    ,'
      '     q91_027_Outrosestoques                ,'
      '     q91_028_Outrascontasdoativcirculante  ,'
      '     q91_029_Realizavelalongoprazo         ,'
      '     q91_030_Contasareceberdorealizavel    ,'
      '     q91_031_Outrascontasdorealizavel      ,'
      '     q91_032_Permanente                    ,'
      '     q91_033_Investimentos                 ,'
      '     q91_034_Imobilizado_liquido           ,'
      '     q91_035_Diferido                      ,'
      '  /*q91_990_Totalgeraldoativo             , CALCULADO */'
      ''
      ''
      '     q92_037_Circulante                    ,'
      '     q92_038_Fornecedores                  ,'
      '     q92_039_Emprestimosefinanciamentos    ,'
      '     q92_040_Outrascontasdopassivocirc     ,'
      '     q92_041_Exigivelalongoprazo           ,'
      '     q92_042_Resultadosdeexfuturos         ,'
      '     q92_269_PassivoaDescoberto,'
      '     q92_043_Patrimonioliquido             ,'
      '     q92_044_Capitalsocial                 ,'
      '     q92_045_Outrascontasdopatrimonioliq   ,'
      '     q92_279_Outrascontasdopatrimonioliqvalneg,'
      '  /*q92_990_Totalgeraldopassivo           ,  CALCULADO */'
      ''
      '     q93_047_Receitabrutavendasservicos,'
      '     q93_048_Devabatimentoseimpostos,'
      '     q93_049_Receitaliquidavendasservicos,'
      '     q93_050_Custodamercadoriavendida,'
      '     q93_051_Lucrobruto,'
      '     q93_331_prejuizobruto,'
      '     q93_333_OutrasRecOper,'
      '     q93_052_Despesasoperacionais,'
      '     q93_053_Lucroprejuizooperacional,'
      '     q93_341_prejuizooperacional,'
      '     q93_054_Receitasnaooperacionais,'
      '     q93_055_Despesasnaooperacionais,'
      '     q93_056_Saldodacontacorrecaomonet,'
      '     q93_057_ResultadoantesdoIR,'
      '     q93_351_resultadoNegantesdoir,'
      '     q93_058_ProvisaoparaoIR,'
      '     q93_059_ResultadoaposoIR,'
      '     q93_060_Participacoesecontribuicoes,'
      '     q93_398_prejuizodoexercicio,'
      '     q93_061_Lucroouprejuizo,'
      '  '
      '     q94_062_Prolabore                     ,'
      '     q94_063_Comissoessalariosordenados    ,'
      '     q94_064_Combustiveiselubrificantes    ,'
      '     q94_065_Encargossociais               ,'
      '     q94_066_Tributosfederais              ,'
      '     q94_067_Tributosestaduais             ,'
      '     q94_068_Tributosmunicipais            ,'
      '     q94_069_Aguaetelefone                 ,'
      '     q94_070_Energiaeletrica               ,'
      '     q94_071_Alugueis                      ,'
      '     q94_072_Servicosprofissionais         ,'
      '     q94_073_Seguros                       ,'
      '     q94_074_Fretesecarretos               ,'
      '     q94_075_Despesasfinanceiras           ,'
      '     q94_076_Outrasdespesas                ,'
      '  /*q94_990_Total                         CALCULADO */'
      '     observacao'
      '     '
      'FROM quadrosdime'
      ''
      'WHERE Filial  = :Filial AND'
      '      Periodo = :Periodo')
    RequestLive = True
    Left = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryQuadrosDIMEFilial: TIntegerField
      DisplayLabel = 'Quadro 00 - Filial'
      FieldName = 'Filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEPeriodo: TStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'Periodo'
      Required = True
      Size = 7
    end
    object qryQuadrosDIMEq00_040_TipoDeDeclaracao: TIntegerField
      DisplayLabel = 'Quadro 00 - Tipo de declara'#231#227'o'
      FieldName = 'q00_040_TipoDeDeclaracao'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_050_regimedeapuracao: TIntegerField
      DisplayLabel = 'Quadro 00 - Regime de apura'#231#227'o'
      FieldName = 'q00_050_regimedeapuracao'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_060_portedaempresa: TIntegerField
      DisplayLabel = 'Quadro 00 - Porte da empresa'
      FieldName = 'q00_060_portedaempresa'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_070_apuracaoconsolidada: TIntegerField
      DisplayLabel = 'Quadro 00 - Apura'#231#227'o consolidada'
      FieldName = 'q00_070_apuracaoconsolidada'
      Required = True
      OnChange = qryQuadrosDIMEq00_070_apuracaoconsolidadaChange
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_080_apuracaocentralizada: TIntegerField
      DisplayLabel = 'Quadro 00 - Apura'#231#227'o centralizada'
      FieldName = 'q00_080_apuracaocentralizada'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_090_transfcreditosnoperiodo: TIntegerField
      DisplayLabel = 'Quadro 00 - Transfer'#234'ncia de cr'#233'ditos no per'#237'odo'
      FieldName = 'q00_090_transfcreditosnoperiodo'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_100_temcreditospresumidos: TIntegerField
      DisplayLabel = 'Quadro 00 - Tem cr'#233'ditos presumidos'
      FieldName = 'q00_100_temcreditospresumidos'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_110_temcreditosporincentfiscais: TIntegerField
      DisplayLabel = 'Quadro 00 - Tem cr'#233'ditos por incentivos fiscais'
      FieldName = 'q00_110_temcreditosporincentfiscais'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_120_movimentos: TIntegerField
      DisplayLabel = 'Quadro 00 - Movimentos'
      FieldName = 'q00_120_movimentos'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_130_substitutotributario: TIntegerField
      DisplayLabel = 'Quadro 00 - Substituto tribut'#225'rio'
      FieldName = 'q00_130_substitutotributario'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_140_temescritacontabil: TIntegerField
      DisplayLabel = 'Quadro 00 - Tem escrita cont'#225'bil'
      FieldName = 'q00_140_temescritacontabil'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEq00_150_qttrabalhadoresnaativ: TIntegerField
      DisplayLabel = 'Quadro 00 - Trabalhadores na atividade'
      FieldName = 'q00_150_qttrabalhadoresnaativ'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEq04_010_debitopelassaidas: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q04_010_debitopelassaidas'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq04_020_debdifaliqativperm: TFloatField
      FieldName = 'q04_020_debdifaliqativperm'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq04_030_debdifaliqmatusoons: TFloatField
      FieldName = 'q04_030_debdifaliqmatusoons'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq04_040_debmaqeqimpativperm: TFloatField
      FieldName = 'q04_040_debmaqeqimpativperm'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq04_050_estornocredito: TFloatField
      FieldName = 'q04_050_estornocredito'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq04_060_outrosestornos: TFloatField
      FieldName = 'q04_060_outrosestornos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq04_070_outrosdebitos: TFloatField
      FieldName = 'q04_070_outrosdebitos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq04_990_subtotaldebitos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q04_990_subtotaldebitos'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEsaldocredormesant: TFloatField
      FieldName = 'saldocredormesant'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq05_020_creditopelasentradas: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q05_020_creditopelasentradas'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq05_030_credativpermanente: TFloatField
      FieldName = 'q05_030_credativpermanente'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_040_creddifaliqmatusocons: TFloatField
      FieldName = 'q05_040_creddifaliqmatusocons'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_050_credicmsretsubstrib: TFloatField
      FieldName = 'q05_050_credicmsretsubstrib'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_060_estdebtransfcredacum: TFloatField
      FieldName = 'q05_060_estdebtransfcredacum'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_070_outrosestdeb: TFloatField
      FieldName = 'q05_070_outrosestdeb'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_100_credrelopimport: TFloatField
      FieldName = 'q05_100_credrelopimport'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_110_credrelaqatacouunfed: TFloatField
      FieldName = 'q05_110_credrelaqatacouunfed'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_120_credresptributaria: TFloatField
      FieldName = 'q05_120_credresptributaria'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_130_outpagtosocasfatogerador: TFloatField
      FieldName = 'q05_130_outpagtosocasfatogerador'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_140_credregimeespecial: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q05_140_credregimeespecial'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq05_150_restituicaodeicms: TFloatField
      FieldName = 'q05_150_restituicaodeicms'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_160_outroscreditos: TFloatField
      FieldName = 'q05_160_outroscreditos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq05_990_subtotalcreditos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q05_990_subtotalcreditos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq06_010_rectribestab: TFloatField
      FieldName = 'q06_010_rectribestab'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq06_020_rectribestabcent: TFloatField
      FieldName = 'q06_020_rectribestabcent'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq06_030_TotrectributApdeb: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q06_030_TotrectributApdeb'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq06_040_impdevcalcsobtotrectribut: TFloatField
      FieldName = 'q06_040_impdevcalcsobtotrectribut'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq06_050_credregpagamento: TFloatField
      FieldName = 'q06_050_credregpagamento'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq06_070_credrelaquisatacoutrasuf: TFloatField
      FieldName = 'q06_070_credrelaquisatacoutrasuf'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq06_990_subtotalcreditos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q06_990_subtotalcreditos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq07_010_debvalorentradas: TFloatField
      FieldName = 'q07_010_debvalorentradas'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq07_020_debsobdifentsaidas: TFloatField
      FieldName = 'q07_020_debsobdifentsaidas'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq07_980_subtotaldebitos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q07_980_subtotaldebitos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq07_030_credrelaqatoutuf: TFloatField
      FieldName = 'q07_030_credrelaqatoutuf'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq07_990_subtotalcreditos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q07_990_subtotalcreditos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq08_010_Debapnomes: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q08_010_Debapnomes'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq08_020_debacumateomesantnosemestre: TFloatField
      FieldName = 'q08_020_debacumateomesantnosemestre'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq08_980_totdebacumsemestre: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q08_980_totdebacumsemestre'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq08_030_credapnomes: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q08_030_credapnomes'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq08_040_credacumateomesantnosemestre: TFloatField
      FieldName = 'q08_040_credacumateomesantnosemestre'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq08_050_somaparcestateomesnosemestre: TFloatField
      FieldName = 'q08_050_somaparcestateomesnosemestre'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq08_990_totcredacumsemestre: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q08_990_totcredacumsemestre'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_010_subtotaldebitos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_010_subtotaldebitos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_011_compldebmudancaregimeap: TFloatField
      FieldName = 'q09_011_compldebmudancaregimeap'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq09_020_saldodevrecestabcons: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_020_saldodevrecestabcons'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_030_credtransoutcontrib: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_030_credtransoutcontrib'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_040_totaldebitos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_040_totaldebitos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_050_subtotalcreditos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_050_subtotalcreditos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_051_complcredmudancaregimeap: TFloatField
      FieldName = 'q09_051_complcredmudancaregimeap'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq09_052_crepagtoindevidoperanterior: TFloatField
      FieldName = 'q09_052_crepagtoindevidoperanterior'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq09_060_SaldoCredRecEstaCons: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_060_SaldoCredRecEstaCons'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_070_CredRecebTransfOutContrib: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_070_CredRecebTransfOutContrib'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_080_TotalCreditos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_080_TotalCreditos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_075_creinformadonodcip: TFloatField
      FieldName = 'q09_075_creinformadonodcip'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq09_090_imposto1decendio: TFloatField
      FieldName = 'q09_090_imposto1decendio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq09_100_imposto2decendio: TFloatField
      FieldName = 'q09_100_imposto2decendio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq09_110_TotalAjustesApDecendial: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_110_TotalAjustesApDecendial'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_120_SaldoDevedor: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_120_SaldoDevedor'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_999_ImpostoaRecolher: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_999_ImpostoaRecolher'
      OnChange = qryQuadrosDIMEq09_999_ImpostoaRecolherChange
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_130_SaldoDevTransfEstabConsolidador: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_130_SaldoDevTransfEstabConsolidador'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_140_SaldoCredor: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_140_SaldoCredor'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_150_SaldoCredTransfEstabConsolidador: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_150_SaldoCredTransfEstabConsolidador'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_998_saldocredperseguinte: TFloatField
      FieldName = 'q09_998_saldocredperseguinte'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq09_998_SaldoCredPerSeguinte_calculado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q09_998_SaldoCredPerSeguinte_calculado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_160_saldocredorcredrelexport: TFloatField
      FieldName = 'q09_160_saldocredorcredrelexport'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq09_170_saldocredorcredrelsaidisent: TFloatField
      FieldName = 'q09_170_saldocredorcredrelsaidisent'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq09_180_saldocredorcredrelsaidif: TFloatField
      FieldName = 'q09_180_saldocredorcredrelsaidif'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq09_190_saldocredordeoutroscreditos: TFloatField
      FieldName = 'q09_190_saldocredordeoutroscreditos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq10_010_debrelopimportacao: TFloatField
      FieldName = 'q10_010_debrelopimportacao'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq10_020_debrelaqatacdeoutrasuf: TFloatField
      FieldName = 'q10_020_debrelaqatacdeoutrasuf'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq10_030_debporesptribut: TFloatField
      FieldName = 'q10_030_debporesptribut'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq10_040_outrosdebocasfatgerador: TFloatField
      FieldName = 'q10_040_outrosdebocasfatgerador'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq10_050_outrosdebeventuais: TFloatField
      FieldName = 'q10_050_outrosdebeventuais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq10_990_TotalDebitos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q10_990_TotalDebitos'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq11_010_valordosprodutos: TFloatField
      FieldName = 'q11_010_valordosprodutos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_020_valordoipi: TFloatField
      FieldName = 'q11_020_valordoipi'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_030_despesasacessorias: TFloatField
      FieldName = 'q11_030_despesasacessorias'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_040_basedecalculodoicmsproprio: TFloatField
      FieldName = 'q11_040_basedecalculodoicmsproprio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_050_icmsproprio: TFloatField
      FieldName = 'q11_050_icmsproprio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_060_basecalcicmssubsttributaria: TFloatField
      FieldName = 'q11_060_basecalcicmssubsttributaria'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_065_Debocafatger: TFloatField
      FieldName = 'q11_065_Debocafatger'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_070_impretporsubsttributaria: TFloatField
      FieldName = 'q11_070_impretporsubsttributaria'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_073_Debocfatgerapuracaomensal: TFloatField
      FieldName = 'q11_073_Debocfatgerapuracaomensal'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_075_Slddevrecestcons: TFloatField
      FieldName = 'q11_075_Slddevrecestcons'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_080_totaldedebitos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q11_080_totaldedebitos'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq11_090_saldocredperantsubsttribut: TFloatField
      FieldName = 'q11_090_saldocredperantsubsttribut'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_105_creditosdeclaradosnadcip: TFloatField
      FieldName = 'q11_105_creditosdeclaradosnadcip'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_100_devmercedesfazimentodevenda: TFloatField
      FieldName = 'q11_100_devmercedesfazimentodevenda'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_110_ressarcimentoicmssubsttribut: TFloatField
      FieldName = 'q11_110_ressarcimentoicmssubsttribut'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_120_outroscreditos: TFloatField
      FieldName = 'q11_120_outroscreditos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_125_Sldcredrecestcons: TFloatField
      FieldName = 'q11_125_Sldcredrecestcons'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_130_totalcrediajustesapdecendial: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q11_130_totalcrediajustesapdecendial'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq11_140_imposto1decendio: TFloatField
      FieldName = 'q11_140_imposto1decendio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_150_imposto2decendio: TFloatField
      FieldName = 'q11_150_imposto2decendio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq11_155_antecipliqcombgasosos: TFloatField
      FieldName = 'q11_155_antecipliqcombgasosos'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_170_saldodevedor: TFloatField
      FieldName = 'q11_170_saldodevedor'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_180_Slddevtrestcons: TFloatField
      FieldName = 'q11_180_Slddevtrestcons'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_190_saldocredor: TFloatField
      FieldName = 'q11_190_saldocredor'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_200_Sldcredtrestcons: TFloatField
      FieldName = 'q11_200_Sldcredtrestcons'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq11_998_saldocredorparaomesseguinte: TFloatField
      FieldName = 'q11_998_saldocredorparaomesseguinte'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq41_010_perccredreltotaq3ultmeses: TFloatField
      FieldName = 'q41_010_perccredreltotaq3ultmeses'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq41_017_ProdutosExportadosMes: TFloatField
      FieldName = 'q41_017_ProdutosExportadosMes'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq41_018_ProdutosSaidaIsentaMes: TFloatField
      FieldName = 'q41_018_ProdutosSaidaIsentaMes'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq41_019_ProdutosSaidaDiferidaMes: TFloatField
      FieldName = 'q41_019_ProdutosSaidaDiferidaMes'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq41_020_prodexpmes: TFloatField
      FieldName = 'q41_020_prodexpmes'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq41_030_prodsaidaisentaounaotrib: TFloatField
      FieldName = 'q41_030_prodsaidaisentaounaotrib'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq41_040_prodcomsaidadiferidanomes: TFloatField
      FieldName = 'q41_040_prodcomsaidadiferidanomes'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq41_120_credgerexpocormes: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q41_120_credgerexpocormes'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq41_130_credgersaidasisentasocormes: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q41_130_credgersaidasisentasocormes'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq41_140_credgersaidasdifocormes: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q41_140_credgersaidasdifocormes'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq41_160_saldocredtransfmesantrelexpo: TFloatField
      FieldName = 'q41_160_saldocredtransfmesantrelexpo'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq41_170_salcredtranmesantrelsaiisent: TFloatField
      FieldName = 'q41_170_salcredtranmesantrelsaiisent'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq41_180_salcredtranmesantrelsaidifer: TFloatField
      FieldName = 'q41_180_salcredtranmesantrelsaidifer'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq41_190_salcredmesantreloutcredntran: TFloatField
      FieldName = 'q41_190_salcredmesantreloutcredntran'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq41_217_CreditoTransferivelExportacao: TFloatField
      FieldName = 'q41_217_CreditoTransferivelExportacao'
    end
    object qryQuadrosDIMEq41_218_CreditoTransferivelSaidaIsenta: TFloatField
      FieldName = 'q41_218_CreditoTransferivelSaidaIsenta'
    end
    object qryQuadrosDIMEq41_219_CreditoTransferivelSaidaDiferida: TFloatField
      FieldName = 'q41_219_CreditoTransferivelSaidaDiferida'
    end
    object qryQuadrosDIMEq41_220_esdebtrcredrelexportacoes: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q41_220_esdebtrcredrelexportacoes'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq41_230_estdebtrcredrelsaidasisentas: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q41_230_estdebtrcredrelsaidasisentas'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq41_240_estdebportransfcredrelsaidif: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q41_240_estdebportransfcredrelsaidif'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq41_960_saldocredoracumuladorelexp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q41_960_saldocredoracumuladorelexp'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq41_970_saldocredacumrelsaidasisenta: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q41_970_saldocredacumrelsaidasisenta'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq41_980_saldocredacumrelativoasaidas: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q41_980_saldocredacumrelativoasaidas'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq42_010_debtranscredacumrelexport: TFloatField
      FieldName = 'q42_010_debtranscredacumrelexport'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq42_020_debtranscredacumrelsaidasis: TFloatField
      FieldName = 'q42_020_debtranscredacumrelsaidasis'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq42_030_debtranscredacumrelsaidasdif: TFloatField
      FieldName = 'q42_030_debtranscredacumrelsaidasdif'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq42_040_debtransbensatpermoutestabel: TFloatField
      FieldName = 'q42_040_debtransbensatpermoutestabel'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq42_070_outrosdebtranscreditos: TFloatField
      FieldName = 'q42_070_outrosdebtranscreditos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq42_990_totdebtranscredacum: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q42_990_totdebtranscredacum'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq43_010_credtransfcredacum: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q43_010_credtransfcredacum'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq43_020_credtransfativopermestabemp: TFloatField
      FieldName = 'q43_020_credtransfativopermestabemp'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq43_050_outroscredtransfcred: TFloatField
      FieldName = 'q43_050_outroscredtransfcred'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq43_990_totalcredtransfcred: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q43_990_totalcredtransfcred'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq44_010_totalpagosmesempregados: TFloatField
      FieldName = 'q44_010_totalpagosmesempregados'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_020_mediavalpagosempregadosexant: TFloatField
      FieldName = 'q44_020_mediavalpagosempregadosexant'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_030_incrementoverificado: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q44_030_incrementoverificado'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq44_040_credpresumidoincgeremprego: TFloatField
      FieldName = 'q44_040_credpresumidoincgeremprego'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_050_credpresestababatedoraves5: TFloatField
      FieldName = 'q44_050_credpresestababatedoraves5'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_060_credpresestababatedoraves4: TFloatField
      FieldName = 'q44_060_credpresestababatedoraves4'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_070_credpresestababatedoraves3: TFloatField
      FieldName = 'q44_070_credpresestababatedoraves3'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_080_credpresestababatsuinos6: TFloatField
      FieldName = 'q44_080_credpresestababatsuinos6'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_090_credpresestababatsuinos5: TFloatField
      FieldName = 'q44_090_credpresestababatsuinos5'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_100_credpresestababatsuinos4: TFloatField
      FieldName = 'q44_100_credpresestababatsuinos4'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_120_credpresaqecf: TFloatField
      FieldName = 'q44_120_credpresaqecf'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq44_130_contribaofundosocial: TFloatField
      FieldName = 'q44_130_contribaofundosocial'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq44_131_credcontribfundosocial: TFloatField
      FieldName = 'q44_131_credcontribfundosocial'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq44_140_aplicfuncultural: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q44_140_aplicfuncultural'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq44_150_aplicfunturismo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q44_150_aplicfunturismo'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq44_160_aplicfundesporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q44_160_aplicfundesporte'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq44_190_outroscredpresumidos: TFloatField
      FieldName = 'q44_190_outroscredpresumidos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq44_990_totaldecreditospresumidos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q44_990_totaldecreditospresumidos'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq45_010_saldodevmesantesdedincent: TFloatField
      FieldName = 'q45_010_saldodevmesantesdedincent'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq45_020_credporincentfisc: TFloatField
      FieldName = 'q45_020_credporincentfisc'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq45_030_valordorecibo: TFloatField
      FieldName = 'q45_030_valordorecibo'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq45_040_credporincentfiscpercvlrrec: TFloatField
      FieldName = 'q45_040_credporincentfiscpercvlrrec'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq45_050_outroscredincentfiscais: TFloatField
      FieldName = 'q45_050_outroscredincentfiscais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq45_990_totalcredincentfisc: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q45_990_totalcredincentfisc'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq51_010_prestservsujaoiss: TFloatField
      FieldName = 'q51_010_prestservsujaoiss'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq51_020_25transfrecebprecovendavarej: TFloatField
      FieldName = 'q51_020_25transfrecebprecovendavarej'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq51_030_ipirelaqmatprimasmerc: TFloatField
      FieldName = 'q51_030_ipirelaqmatprimasmerc'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq51_040_paricmsretsubsttributaria: TFloatField
      FieldName = 'q51_040_paricmsretsubsttributaria'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq51_050_subsconcorgaosgovfedestoumun: TFloatField
      FieldName = 'q51_050_subsconcorgaosgovfedestoumun'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq51_980_totalvalexcluidosentradas: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q51_980_totalvalexcluidosentradas'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq51_060_prestervicosvsujeitaaoiss: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q51_060_prestervicosvsujeitaaoiss'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq51_070_25transfefetaprecovendavarej: TFloatField
      FieldName = 'q51_070_25transfefetaprecovendavarej'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq51_080_ipiincidentesaidademerc: TFloatField
      FieldName = 'q51_080_ipiincidentesaidademerc'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq51_090_parceladoicmsretporsubsttrib: TFloatField
      FieldName = 'q51_090_parceladoicmsretporsubsttrib'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq51_990_totaldosvaloresexcdassaidas: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q51_990_totaldosvaloresexcdassaidas'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq80_010_estoqueinicioexercicio: TFloatField
      FieldName = 'q80_010_estoqueinicioexercicio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq80_020_estoquefimexercicio: TFloatField
      FieldName = 'q80_020_estoquefimexercicio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq80_030_receitabrutavendasservicos: TFloatField
      FieldName = 'q80_030_receitabrutavendasservicos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_023_circulante: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q81_023_circulante'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq81_024_disponibilidades: TFloatField
      FieldName = 'q81_024_disponibilidades'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_025_contasareceberdocirculante: TFloatField
      FieldName = 'q81_025_contasareceberdocirculante'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_026_estoquedemercemateriaprima: TFloatField
      FieldName = 'q81_026_estoquedemercemateriaprima'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_027_outrosestoques: TFloatField
      FieldName = 'q81_027_outrosestoques'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_028_outrascontasdoativcirculante: TFloatField
      FieldName = 'q81_028_outrascontasdoativcirculante'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_029_realizavelalongoprazo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q81_029_realizavelalongoprazo'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq81_030_contasareceberdorealizavel: TFloatField
      FieldName = 'q81_030_contasareceberdorealizavel'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_031_outrascontasdorealizavel: TFloatField
      FieldName = 'q81_031_outrascontasdorealizavel'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_032_permanente: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q81_032_permanente'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq81_033_investimentos: TFloatField
      FieldName = 'q81_033_investimentos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_034_imobilizado_liquido: TFloatField
      FieldName = 'q81_034_imobilizado_liquido'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_035_diferido: TFloatField
      FieldName = 'q81_035_diferido'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq81_990_totalgeraldoativo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q81_990_totalgeraldoativo'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq82_037_circulante: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q82_037_circulante'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq82_038_fornecedores: TFloatField
      FieldName = 'q82_038_fornecedores'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq82_039_emprestimosefinanciamentos: TFloatField
      FieldName = 'q82_039_emprestimosefinanciamentos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq82_040_outrascontasdopassivocirc: TFloatField
      FieldName = 'q82_040_outrascontasdopassivocirc'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq82_041_exigivelalongoprazo: TFloatField
      FieldName = 'q82_041_exigivelalongoprazo'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq82_042_resultadosdeexfuturos: TFloatField
      FieldName = 'q82_042_resultadosdeexfuturos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq82_043_patrimonioliquido: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q82_043_patrimonioliquido'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq82_044_capitalsocial: TFloatField
      FieldName = 'q82_044_capitalsocial'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq82_045_outrascontasdopatrimonioliq: TFloatField
      FieldName = 'q82_045_outrascontasdopatrimonioliq'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq82_279_outrascontasdopatrimonioliqvalneg: TFloatField
      FieldName = 'q82_279_outrascontasdopatrimonioliqvalneg'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq82_990_totalgeraldopassivo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q82_990_totalgeraldopassivo'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq83_047_receitabrutavendasservicos: TFloatField
      FieldName = 'q83_047_receitabrutavendasservicos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq83_048_devabatimentoseimpostos: TFloatField
      FieldName = 'q83_048_devabatimentoseimpostos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq83_049_receitaliquidavendasservicos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_049_receitaliquidavendasservicos'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq83_050_custodamercadoriavendida: TFloatField
      FieldName = 'q83_050_custodamercadoriavendida'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq83_051_lucrobruto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_051_lucrobruto'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq83_052_despesasoperacionais: TFloatField
      FieldName = 'q83_052_despesasoperacionais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq83_053_lucroprejuizooperacional: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_053_lucroprejuizooperacional'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq83_341_prejuizooperacional: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_341_prejuizooperacional'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq83_054_receitasnaooperacionais: TFloatField
      FieldName = 'q83_054_receitasnaooperacionais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq83_055_despesasnaooperacionais: TFloatField
      FieldName = 'q83_055_despesasnaooperacionais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq83_056_saldodacontacorrecaomonet: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_056_saldodacontacorrecaomonet'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq83_057_resultadoantesdoir: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_057_resultadoantesdoir'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq83_351_resultadonegantesdoir: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_351_resultadonegantesdoir'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq83_058_provisaoparaoir: TFloatField
      FieldName = 'q83_058_provisaoparaoir'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq83_059_resultadoaposoir: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_059_resultadoaposoir'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq83_060_participacoesecontribuicoes: TFloatField
      FieldName = 'q83_060_participacoesecontribuicoes'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq83_061_lucroouprejuizo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_061_lucroouprejuizo'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq83_331_prejuizobruto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_331_prejuizobruto'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq83_333_outrasrecoper: TFloatField
      FieldName = 'q83_333_outrasrecoper'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq83_398_prejuizodoexercicio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q83_398_prejuizodoexercicio'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq84_062_prolabore: TFloatField
      FieldName = 'q84_062_prolabore'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_063_comissoessalariosordenados: TFloatField
      FieldName = 'q84_063_comissoessalariosordenados'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_064_combustiveiselubrificantes: TFloatField
      FieldName = 'q84_064_combustiveiselubrificantes'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_065_encargossociais: TFloatField
      FieldName = 'q84_065_encargossociais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_066_tributosfederais: TFloatField
      FieldName = 'q84_066_tributosfederais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_067_tributosestaduais: TFloatField
      FieldName = 'q84_067_tributosestaduais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_068_tributosmunicipais: TFloatField
      FieldName = 'q84_068_tributosmunicipais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_069_aguaetelefone: TFloatField
      FieldName = 'q84_069_aguaetelefone'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_070_energiaeletrica: TFloatField
      FieldName = 'q84_070_energiaeletrica'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_071_alugueis: TFloatField
      FieldName = 'q84_071_alugueis'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_072_servicosprofissionais: TFloatField
      FieldName = 'q84_072_servicosprofissionais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_073_seguros: TFloatField
      FieldName = 'q84_073_seguros'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_074_fretesecarretos: TFloatField
      FieldName = 'q84_074_fretesecarretos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_075_despesasfinanceiras: TFloatField
      FieldName = 'q84_075_despesasfinanceiras'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_076_outrasdespesas: TFloatField
      FieldName = 'q84_076_outrasdespesas'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq84_990_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q84_990_total'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq90_010_estoqueinicioexercicio: TFloatField
      FieldName = 'q90_010_estoqueinicioexercicio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq90_020_estoquefimexercicio: TFloatField
      FieldName = 'q90_020_estoquefimexercicio'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq90_030_receitabrutavendasservicos: TFloatField
      FieldName = 'q90_030_receitabrutavendasservicos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_023_circulante: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q91_023_circulante'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq91_024_disponibilidades: TFloatField
      FieldName = 'q91_024_disponibilidades'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_025_contasareceberdocirculante: TFloatField
      FieldName = 'q91_025_contasareceberdocirculante'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_026_estoquedemercemateriaprima: TFloatField
      FieldName = 'q91_026_estoquedemercemateriaprima'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_027_outrosestoques: TFloatField
      FieldName = 'q91_027_outrosestoques'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_028_outrascontasdoativcirculante: TFloatField
      FieldName = 'q91_028_outrascontasdoativcirculante'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_029_realizavelalongoprazo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q91_029_realizavelalongoprazo'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq91_030_contasareceberdorealizavel: TFloatField
      FieldName = 'q91_030_contasareceberdorealizavel'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_031_outrascontasdorealizavel: TFloatField
      FieldName = 'q91_031_outrascontasdorealizavel'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_032_permanente: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q91_032_permanente'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq91_033_investimentos: TFloatField
      FieldName = 'q91_033_investimentos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_034_imobilizado_liquido: TFloatField
      FieldName = 'q91_034_imobilizado_liquido'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_035_diferido: TFloatField
      FieldName = 'q91_035_diferido'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq91_990_totalgeraldoativo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q91_990_totalgeraldoativo'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq92_037_circulante: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q92_037_circulante'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq92_038_fornecedores: TFloatField
      FieldName = 'q92_038_fornecedores'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq92_039_emprestimosefinanciamentos: TFloatField
      FieldName = 'q92_039_emprestimosefinanciamentos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq92_040_outrascontasdopassivocirc: TFloatField
      FieldName = 'q92_040_outrascontasdopassivocirc'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq92_041_exigivelalongoprazo: TFloatField
      FieldName = 'q92_041_exigivelalongoprazo'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq92_042_resultadosdeexfuturos: TFloatField
      FieldName = 'q92_042_resultadosdeexfuturos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq92_043_patrimonioliquido: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q92_043_patrimonioliquido'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq92_044_capitalsocial: TFloatField
      FieldName = 'q92_044_capitalsocial'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq92_045_outrascontasdopatrimonioliq: TFloatField
      FieldName = 'q92_045_outrascontasdopatrimonioliq'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq92_990_totalgeraldopassivo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q92_990_totalgeraldopassivo'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq93_047_receitabrutavendasservicos: TFloatField
      FieldName = 'q93_047_receitabrutavendasservicos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq93_048_devabatimentoseimpostos: TFloatField
      FieldName = 'q93_048_devabatimentoseimpostos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq93_049_receitaliquidavendasservicos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_049_receitaliquidavendasservicos'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq93_050_custodamercadoriavendida: TFloatField
      FieldName = 'q93_050_custodamercadoriavendida'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq93_051_lucrobruto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_051_lucrobruto'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq93_052_despesasoperacionais: TFloatField
      FieldName = 'q93_052_despesasoperacionais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq93_053_lucroprejuizooperacional: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_053_lucroprejuizooperacional'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq93_054_receitasnaooperacionais: TFloatField
      FieldName = 'q93_054_receitasnaooperacionais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq93_055_despesasnaooperacionais: TFloatField
      FieldName = 'q93_055_despesasnaooperacionais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq93_056_saldodacontacorrecaomonet: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_056_saldodacontacorrecaomonet'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq93_057_resultadoantesdoir: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_057_resultadoantesdoir'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq93_058_provisaoparaoir: TFloatField
      FieldName = 'q93_058_provisaoparaoir'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq93_059_resultadoaposoir: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_059_resultadoaposoir'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq93_060_participacoesecontribuicoes: TFloatField
      FieldName = 'q93_060_participacoesecontribuicoes'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq93_061_lucroouprejuizo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_061_lucroouprejuizo'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq94_062_prolabore: TFloatField
      FieldName = 'q94_062_prolabore'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_063_comissoessalariosordenados: TFloatField
      FieldName = 'q94_063_comissoessalariosordenados'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_064_combustiveiselubrificantes: TFloatField
      FieldName = 'q94_064_combustiveiselubrificantes'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_065_encargossociais: TFloatField
      FieldName = 'q94_065_encargossociais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_066_tributosfederais: TFloatField
      FieldName = 'q94_066_tributosfederais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_067_tributosestaduais: TFloatField
      FieldName = 'q94_067_tributosestaduais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_068_tributosmunicipais: TFloatField
      FieldName = 'q94_068_tributosmunicipais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_069_aguaetelefone: TFloatField
      FieldName = 'q94_069_aguaetelefone'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_070_energiaeletrica: TFloatField
      FieldName = 'q94_070_energiaeletrica'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_071_alugueis: TFloatField
      FieldName = 'q94_071_alugueis'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_072_servicosprofissionais: TFloatField
      FieldName = 'q94_072_servicosprofissionais'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_073_seguros: TFloatField
      FieldName = 'q94_073_seguros'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_074_fretesecarretos: TFloatField
      FieldName = 'q94_074_fretesecarretos'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_075_despesasfinanceiras: TFloatField
      FieldName = 'q94_075_despesasfinanceiras'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_076_outrasdespesas: TFloatField
      FieldName = 'q94_076_outrasdespesas'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryQuadrosDIMEq94_990_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q94_990_total'
      DisplayFormat = '0.00'
      currency = True
      Calculated = True
    end
    object qryQuadrosDIMEq82_269_passivoadescoberto: TFloatField
      FieldName = 'q82_269_passivoadescoberto'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq92_269_passivoadescoberto: TFloatField
      FieldName = 'q92_269_passivoadescoberto'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq92_279_outrascontasdopatrimonioliqvalneg: TFloatField
      FieldName = 'q92_279_outrascontasdopatrimonioliqvalneg'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq93_331_prejuizobruto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_331_prejuizobruto'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq93_333_outrasrecoper: TFloatField
      FieldName = 'q93_333_outrasrecoper'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEq93_341_prejuizooperacional: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_341_prejuizooperacional'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq93_351_resultadonegantesdoir: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_351_resultadonegantesdoir'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq93_398_prejuizodoexercicio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q93_398_prejuizodoexercicio'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq09_105_antecipliqcombgasosos: TFloatField
      FieldName = 'q09_105_antecipliqcombgasosos'
      DisplayFormat = '0.00'
    end
    object qryQuadrosDIMEobservacao: TStringField
      FieldName = 'observacao'
      Size = 200
    end
    object qryQuadrosDIMEq11_170_saldodevedor_calculado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q11_170_saldodevedor_calculado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq11_190_saldocredor_calculado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q11_190_saldocredor_calculado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq11_200_Sldcredtrestcons_calculado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q11_200_Sldcredtrestcons_calculado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq11_180_Slddevtrestcons_calculado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q11_180_Slddevtrestcons_calculado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq11_998_saldocredorparaomesseguinte_calculado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q11_998_saldocredorparaomesseguinte_calculado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq11_999_imparecolhersobresubsttribut_calculado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'q11_999_imparecolhersobresubsttribut_calculado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq11_160_totalajustesapdecendial: TFloatField
      FieldKind = fkCalculated
      FieldName = 'q11_160_totalajustesapdecendial'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qryQuadrosDIMEq11_999_imparecolhersobresubsttribut: TFloatField
      FieldName = 'q11_999_imparecolhersobresubsttribut'
      DisplayFormat = '0.00'
    end
  end
  object qryNotasEntradasCalculos: TtecQuery
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
      'SELECT'
      ' cnp.codigofiscal,'
      ' cf.descricao,'
      ' sum(cnp.base+cnp.isentas+cnp.outras) as valornota,'
      ' sum(cnp.base) as base,'
      ' sum(cnp.valor) as valor,'
      ' sum(cnp.isentas) as isentas,'
      ' sum(cnp.outras) as outras,'
      ' /*'
      ' sum(cnp.icmsbasecalculost) as icmsbasecalculost,'
      ' sum(cnp.icmsvalorst) as icmsvalorst,'
      ' sum(cnp.vcredicmssn) as vcredicmssn'
      ' */'
      ''
      ' 0.00 as icmsbasecalculost,'
      ' 0.00 as icmsvalorst,'
      ' 0.00 as vcredicmssn'
      ''
      'FROM (notaspag np'
      '      join (calculosnotaspag cnp'
      '            join CodigosFiscais cf'
      '            on cnp.codigofiscal=cf.codigo)'
      '      on np.codigo = cnp.codigonota)'
      'Where np.filial = :filial'
      '    and np.situacao = '#39'N'#39
      '    and cnp.tipo='#39'M'#39
      '    and cnp.codigofiscal between 1001 and 3948'
      '    and (to_char(np.data, '#39'mm/yyyy'#39') = :MesAno)'
      'group by cnp.codigofiscal, descricao'
      
        'order by cnp.codigofiscal, UPPER(TO_ASCII(cf.descricao,'#39'LATIN1'#39')' +
        ')')
    RequestLive = False
    Left = 104
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAno'
        ParamType = ptUnknown
      end>
    object qryNotasEntradasCalculoscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '#,##0'
    end
    object qryNotasEntradasCalculosdescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object qryNotasEntradasCalculosvalornota: TFloatField
      FieldName = 'valornota'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasCalculosbase: TFloatField
      FieldName = 'base'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasCalculosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasCalculosisentas: TFloatField
      FieldName = 'isentas'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasCalculosoutras: TFloatField
      FieldName = 'outras'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasCalculosicmsbasecalculost: TFloatField
      FieldName = 'icmsbasecalculost'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasCalculosicmsvalorst: TFloatField
      FieldName = 'icmsvalorst'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasCalculosvcredicmssn: TFloatField
      FieldName = 'vcredicmssn'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrNotasEntradasCalculos: TtecDataSource
    DataSet = qryNotasEntradasCalculos
    Left = 136
    Top = 80
  end
  object qryNotasSaidasCalculos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryNotasSaidasCalculosBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'FiltroIncluirNFCopiaECF'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select codigofiscal,'
      '       descricao,'
      '       sum(valortotal) as valortotal,'
      '       sum(base) as base,'
      '       sum(valor) as valor,'
      '       sum(isentas) as isentas,'
      '       sum(outras) as outras,'
      '       sum(icmsbasecalculost) as icmsbasecalculost,'
      '       sum(icmsvalorst) as icmsvalorst'
      'from'
      '('
      ' ('
      '    select cdf.codigofiscal,'
      '           cf.descricao,'
      '           sum(cdf.base) as base,'
      '           sum(cdf.valor) as valor,'
      '           sum(cdf.isentas) as isentas,'
      '           sum(cdf.outras) as outras,'
      '           sum(cdf.icmsbasecalculost) as icmsbasecalculost,'
      '           sum(cdf.icmsvalorst) as icmsvalorst,'
      ''
      '           sum(case when df.situacao='#39'N'#39' then'
      '                     base+isentas+outras -'
      
        '                     coalesce((select sum(cdf2.base+cdf2.isentas' +
        '+cdf2.outras)'
      
        '                               from calculosdadosfiscais_(df.num' +
        'ero) cdf2'
      '                '#9' '#9'       where cdf2.dadofiscal = df.numero'
      '                '#9#9#9'     and cdf2.tipo='#39'S'#39
      '                                 ),0) else 0 end) as valortotal'
      '    FROM'
      '    ('
      '     SELECT cdf.dadofiscal,'
      
        '            case When df.CodigoFiscal in (5929,6929) then cast(5' +
        '929 as integer) else cdf.codigofiscal end as codigofiscal,'
      
        '            sum(case When df.CodigoFiscal in (5929,6929) then 0 ' +
        'else (case When df.situacao='#39'N'#39' then cdf.base else 0 end) end) a' +
        's base,'
      
        '            sum(case When df.CodigoFiscal in (5929,6929) then 0 ' +
        'else (case When df.situacao='#39'N'#39' then cdf.valor else 0 end) end) ' +
        'as valor,'
      
        '            sum(case When df.CodigoFiscal in (5929,6929) then 0 ' +
        'else (case When df.situacao='#39'N'#39' then cdf.isentas else 0 end) end' +
        ') as isentas,'
      '            sum(case When df.situacao='#39'N'#39' then'
      '             (case When df.CodigoFiscal in (5929,6929) then'
      '                (cdf.base+cdf.isentas+cdf.outras)'
      '              else cdf.outras end) else 0 end) as outras,'#9
      
        #9#9#9'sum(case When df.CodigoFiscal in (5929,6929) then 0 else (cas' +
        'e When df.situacao='#39'N'#39' then cdf.icmsbasecalculost else 0 end) en' +
        'd) as icmsbasecalculost,  '
      
        #9#9#9'sum(case When df.CodigoFiscal in (5929,6929) then 0 else (cas' +
        'e When df.situacao='#39'N'#39' then cdf.icmsvalorst else 0 end) end) as ' +
        'icmsvalorst'
      #9#9#9#9#9#9'  '
      '     FROM dadosfiscais df'
      '          join notas n'
      '          on df.numero = n.dadofiscal'
      
        '          join (select * from calculosdadosfiscais_(:MesAno)) cd' +
        'f'
      '          on df.numero=cdf.dadofiscal'
      '     Where df.filialemissao = :filial'
      '       and cdf.tipo='#39'M'#39
      '       and (to_char(df.data, '#39'mm/yyyy'#39') = :MesAno)'
      '       and cdf.codigofiscal not in (5933,6933,7933)'
      '       and cdf.codigofiscal between 5001 and 7999'
      '       and df.situacao='#39'N'#39
      
        '       and (n.filial,n.serie) in (select sf.filial, sf.valor fro' +
        'm seriesfiliais sf where sf.ativa)'
      '       and not coalesce(df.notavinculada,false)'
      ''
      '       %FiltroIncluirNFCopiaECF'
      ''
      
        '     group by cdf.dadofiscal, df.codigofiscal,cdf.codigofiscal, ' +
        'df.situacao'
      '    ) as cdf'
      '         join dadosfiscais df'
      '         on cdf.dadofiscal = df.numero'
      ''
      '         join CodigosFiscais cf'
      '         on cdf.codigofiscal=cf.codigo'
      ''
      '    group by cdf.codigofiscal,df.situacao, cf.descricao'
      
        '    order by cdf.codigofiscal, UPPER(TO_ASCII(cf.descricao,'#39'LATI' +
        'N1'#39'))'
      ' )'
      ' union all'
      ' ('
      '    select cdf.codigofiscal,'
      '           cf.descricao,'
      '           0.00 as base,'
      '           0.00 as valor,'
      '           0.00 as isentas,'
      '           sum(cdf.outras) as outras,'
      #9#9'   '
      #9#9'   0.00 as icmsbasecalculost,'
      '           0.00 as icmsvalorst,'
      #9#9'   '#9'   '
      '           sum(case when df.situacao='#39'N'#39' then'
      
        '              coalesce((select sum(cdf2.base+cdf2.isentas+cdf2.o' +
        'utras)'
      
        '                        from calculosdadosfiscais_(df.numero) cd' +
        'f2'
      '          '#9'          where cdf2.dadofiscal = df.numero'
      '          '#9#9'   and cdf2.tipo='#39'S'#39'),0) else 0 end) as valortotal'
      '    from'
      '    ('
      '     SELECT n.dadofiscal,'
      
        '            cast(substring(cast(cdf.codigofiscal as varchar),1,1' +
        ')||'#39'933'#39' as integer) as codigofiscal,'
      '            sum(case When df.situacao='#39'N'#39' then'
      '                          cdf.base+cdf.isentas-cdf.outras'
      '                else 0 end) as outras'
      ''
      '     FROM ((dadosfiscais df'
      '            join notas n'
      '            on df.numero = n.dadofiscal)'
      ''
      
        '            join (select * from calculosdadosfiscais_(:MesAno)) ' +
        'cdf'
      '            on df.numero=cdf.dadofiscal)'
      ''
      '     Where df.filialemissao = :filial'
      '       and cdf.tipo='#39'S'#39
      '       and (to_char(df.data, '#39'mm/yyyy'#39') = :MesAno)'
      '       and df.situacao='#39'N'#39
      
        '       and (n.filial,n.serie) in (select sf.filial, sf.valor fro' +
        'm seriesfiliais sf where sf.ativa)'
      '       and not coalesce(df.notavinculada,false)'
      '     group by n.dadofiscal,cdf.codigofiscal,df.situacao'
      '     order by n.dadofiscal'
      '    ) as cdf join dadosfiscais df on df.numero = cdf.dadofiscal'
      
        '             join CodigosFiscais cf on cdf.codigofiscal=cf.codig' +
        'o'
      ''
      '    group by cdf.codigofiscal, cf.descricao'
      
        '    order by cdf.codigofiscal, UPPER(TO_ASCII(cf.descricao,'#39'LATI' +
        'N1'#39'))'
      ' )'
      ' union all'
      ' ('
      '  '
      '    select cdf.codigofiscal,'
      '           cf.descricao,'
      '           sum(cdf.base) as base,'
      '           sum(cdf.valor) as valor,'
      '           sum(cdf.isentas) as isentas,'
      '           sum(cdf.outras) as outras,'
      #9#9'   sum(cdf.icmsbasecalculost) as icmsbasecalculost,'
      #9#9'   sum(cdf.icmsvalorst) as icmsvalorst,'#9#9'   '
      '           sum(cdf.base+cdf.isentas+cdf.outras) as valortotal'
      '    from'
      '    ('
      #9'( '
      #9'select cast(5102 as integer) as codigofiscal,'
      #9#9'   rzd.valoracumulado as base,'#9#9
      #9#9'   (rzd.valoracumulado * rzd.aliquota)/100 as valor,'#9
      '           0.00 as isentas,'
      #9#9'   0.00 as outras,'
      #9#9'   0.00 as icmsbasecalculost,'
      #9#9'   0.00 as icmsvalorst'
      ''
      #9'from reducoesz rz'
      #9#9' join reducoeszdetalhes rzd'
      #9#9' on rz.filial = rzd.filial'
      #9#9' and rz.numerousuario = rzd.numerousuario'
      #9#9' and rz.cro = rzd.cro'
      #9#9' and rz.numerofabricacao = rzd.numerofabricacao'
      #9#9' and rz.datamovimento = rzd.datamovimento'
      ''
      #9'where (to_char(rz.datamovimento, '#39'mm/yyyy'#39') = :MesAno)'
      #9'  and coalesce(rzd.aliquota,0)<>0'
      #9'  and rzd.tipototalizadorparcial  not in ('#39'F1'#39', '#39'N1'#39', '#39'I1'#39')'
      #9'  and rz.filial = :filial'
      #9')'
      '    union all'
      #9'( '
      #9'select cast(5405 as integer) as codigofiscal,'
      #9#9'   0.00 as base,'#9#9
      #9#9'   0.00 as valor,'#9
      
        #9#9'   case when rzd.tipototalizadorparcial='#39'I1'#39' then rzd.valoracu' +
        'mulado else 0.00 end as isentas,'
      
        #9#9'   case when rzd.tipototalizadorparcial in ('#39'N1'#39','#39'F1'#39') then rz' +
        'd.valoracumulado else 0.00 end as outras,'
      #9#9'   0.00 as icmsbasecalculost,'
      #9#9'   0.00 as icmsvalorst'
      '  '#9#9'  '
      #9'from reducoesz rz'
      #9#9' join reducoeszdetalhes rzd'
      #9#9' on rz.filial = rzd.filial'
      #9#9' and rz.numerousuario = rzd.numerousuario'
      #9#9' and rz.cro = rzd.cro'
      #9#9' and rz.numerofabricacao = rzd.numerofabricacao'
      #9#9' and rz.datamovimento = rzd.datamovimento'
      ''
      #9'where (to_char(rz.datamovimento, '#39'mm/yyyy'#39') = :MesAno)'
      #9'  and rzd.tipototalizadorparcial in ('#39'F1'#39', '#39'N1'#39', '#39'I1'#39')'
      #9'  and rz.filial = :filial'
      #9')'
      
        '    ) as cdf join CodigosFiscais cf on cdf.codigofiscal=cf.codig' +
        'o'
      '    group by cdf.codigofiscal, cf.descricao'
      
        '    order by cdf.codigofiscal, UPPER(TO_ASCII(cf.descricao,'#39'LATI' +
        'N1'#39'))'
      ' )'
      ') as saidas'
      'group by codigofiscal, descricao'
      'order by codigofiscal, UPPER(TO_ASCII(descricao,'#39'LATIN1'#39'))')
    RequestLive = False
    Left = 104
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MesAno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end>
    object qryNotasSaidasCalculoscodigofiscal: TIntegerField
      FieldName = 'codigofiscal'
      DisplayFormat = '0'
    end
    object qryNotasSaidasCalculosdescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object qryNotasSaidasCalculosvalortotal: TFloatField
      FieldName = 'valortotal'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasCalculosbase: TFloatField
      FieldName = 'base'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasCalculosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasCalculosisentas: TFloatField
      FieldName = 'isentas'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasCalculosoutras: TFloatField
      FieldName = 'outras'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasCalculosicmsbasecalculost: TFloatField
      FieldName = 'icmsbasecalculost'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasCalculosicmsvalorst: TFloatField
      FieldName = 'icmsvalorst'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrNotasSaidasCalculos: TtecDataSource
    DataSet = qryNotasSaidasCalculos
    Left = 136
    Top = 208
  end
  object qryQuadrosDIMEAnterior: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    OnCalcFields = qryQuadrosDIMECalcFields
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo,'
      '          q00_040_tipodedeclaracao,'
      '          q00_050_regimedeapuracao,'
      '          q00_060_portedaempresa,'
      '          q00_070_apuracaoconsolidada,'
      '          q00_080_apuracaocentralizada,'
      '          q00_090_transfcreditosnoperiodo,'
      '          q00_100_temcreditospresumidos,'
      '          q00_110_temcreditosporincentfiscais,'
      '          q00_120_movimentos,'
      '          q00_130_substitutotributario,'
      '          q00_140_temescritacontabil,'
      '          q00_150_qttrabalhadoresnaativ,'
      '          q09_998_SaldoCredPerSeguinte,'
      '          q09_160_saldocredorcredrelexport,'
      '          q09_170_saldocredorcredrelsaidisent,'
      '          q09_180_saldocredorcredrelsaidif,'
      '          q09_190_saldocredordeoutroscreditos,'
      '          q11_998_Saldocredorparaomesseguinte'
      'from quadrosdime'
      'where filial = :filial and'
      '          periodo =:periodoanterior')
    RequestLive = True
    Left = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodoanterior'
        ParamType = ptUnknown
      end>
    object qryQuadrosDIMEAnteriorfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryQuadrosDIMEAnteriorperiodo: TStringField
      FieldName = 'periodo'
      Required = True
      Size = 7
    end
    object qryQuadrosDIMEAnteriorq09_998_saldocredperseguinte: TFloatField
      FieldName = 'q09_998_saldocredperseguinte'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq11_998_saldocredorparaomesseguinte: TFloatField
      FieldName = 'q11_998_saldocredorparaomesseguinte'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_040_tipodedeclaracao: TIntegerField
      FieldName = 'q00_040_tipodedeclaracao'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_050_regimedeapuracao: TIntegerField
      FieldName = 'q00_050_regimedeapuracao'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_060_portedaempresa: TIntegerField
      FieldName = 'q00_060_portedaempresa'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_070_apuracaoconsolidada: TIntegerField
      FieldName = 'q00_070_apuracaoconsolidada'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_080_apuracaocentralizada: TIntegerField
      FieldName = 'q00_080_apuracaocentralizada'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_090_transfcreditosnoperiodo: TIntegerField
      FieldName = 'q00_090_transfcreditosnoperiodo'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_100_temcreditospresumidos: TIntegerField
      FieldName = 'q00_100_temcreditospresumidos'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_110_temcreditosporincentfiscais: TIntegerField
      FieldName = 'q00_110_temcreditosporincentfiscais'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_120_movimentos: TIntegerField
      FieldName = 'q00_120_movimentos'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_130_substitutotributario: TIntegerField
      FieldName = 'q00_130_substitutotributario'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_140_temescritacontabil: TIntegerField
      FieldName = 'q00_140_temescritacontabil'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq00_150_qttrabalhadoresnaativ: TIntegerField
      FieldName = 'q00_150_qttrabalhadoresnaativ'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq09_160_saldocredorcredrelexport: TFloatField
      FieldName = 'q09_160_saldocredorcredrelexport'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq09_170_saldocredorcredrelsaidisent: TFloatField
      FieldName = 'q09_170_saldocredorcredrelsaidisent'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq09_180_saldocredorcredrelsaidif: TFloatField
      FieldName = 'q09_180_saldocredorcredrelsaidif'
      DisplayFormat = '###,###,##0.00'
    end
    object qryQuadrosDIMEAnteriorq09_190_saldocredordeoutroscreditos: TFloatField
      FieldName = 'q09_190_saldocredordeoutroscreditos'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrQuadrosDIMEAnterior: TtecDataSource
    DataSet = qryQuadrosDIMEAnterior
    Left = 328
    Top = 16
  end
  object qryq46_RegimeEspecial: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryq46_RegimeEspecialAfterPost
    AfterDelete = qryq46_RegimeEspecialAfterPost
    OnNewRecord = qryq46_RegimeEspecialNewRecord
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo, '
      '         regime,'
      '         valor,'
      '         origem'
      'from q46_regimeespecial'
      'where filial = :filial and'
      '           periodo = :periodo'
      'order by regime')
    RequestLive = True
    Left = 312
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryq46_RegimeEspecialregime: TStringField
      FieldName = 'regime'
      Required = True
      EditMask = '999999999999999;0;_'
      Size = 15
    end
    object qryq46_RegimeEspecialvalor: TFloatField
      DisplayLabel = 'Quadro 46 - Valor'
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryq46_RegimeEspecialfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryq46_RegimeEspecialperiodo: TStringField
      FieldName = 'periodo'
      Size = 7
    end
    object qryq46_RegimeEspecialorigem: TIntegerField
      DisplayLabel = 'Quadro 46 - origem'
      FieldName = 'origem'
      Required = True
      DisplayFormat = '0'
    end
  end
  object dsrq46_RegimeEspecial: TtecDataSource
    DataSet = qryq46_RegimeEspecial
    OnDataChange = dsrq46_RegimeEspecialDataChange
    Left = 344
    Top = 464
  end
  object qryq12_discrpagtos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryq12_discrpagtosAfterPost
    AfterDelete = qryq12_discrpagtosAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo,'
      '          origem  ,'
      '          codigoreceita,'
      '          classevencto ,'
      '          datavencto    ,'
      '         valor              ,'
      '          numeroacordo'
      'from q12_discrpagtos'
      'where filial = :filial and'
      '           periodo = :periodo'
      'order by origem,codigoreceita,classevencto,datavencto')
    RequestLive = True
    Left = 112
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryq12_discrpagtosorigem: TIntegerField
      DisplayLabel = 'Quadro 12 - Origem'
      FieldName = 'origem'
      Required = True
    end
    object qryq12_discrpagtoscodigoreceita: TIntegerField
      DisplayLabel = 'Quadro 12 - C'#243'digo da Receita'
      FieldName = 'codigoreceita'
      Required = True
    end
    object qryq12_discrpagtosclassevencto: TIntegerField
      DisplayLabel = 'Quadro 12 - Classe de Vencimento'
      FieldName = 'classevencto'
      Required = True
    end
    object qryq12_discrpagtosdatavencto: TDateField
      DisplayLabel = 'Quadro 12 - Data de Vencimento'
      FieldName = 'datavencto'
    end
    object qryq12_discrpagtosvalor: TFloatField
      DisplayLabel = 'Quadro 12 - Valor'
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq12_discrpagtosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryq12_discrpagtosperiodo: TStringField
      FieldName = 'periodo'
      Size = 7
    end
    object qryq12_discrpagtosnumeroacordo: TStringField
      FieldName = 'numeroacordo'
      Size = 15
    end
  end
  object dsrq12_discrpagtos: TtecDataSource
    DataSet = qryq12_discrpagtos
    Left = 144
    Top = 464
  end
  object qryq47_compraexproagrop: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryq47_compraexproagropAfterPost
    AfterDelete = qryq47_compraexproagropAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo,  '
      '         codmunicipio,'
      '          valor'
      'from q47_compraexproagrop'
      'where filial = :filial and'
      '           periodo = :periodo'
      'order by codmunicipio')
    RequestLive = True
    Left = 504
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryq47_compraexproagropcodmunicipio: TIntegerField
      DisplayLabel = 'Quadro 47 - C'#243'digo do munic'#237'pio'
      FieldName = 'codmunicipio'
      Required = True
    end
    object qryq47_compraexproagropvalor: TFloatField
      DisplayLabel = 'Quadro 47 - Valor'
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq47_compraexproagropfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryq47_compraexproagropperiodo: TStringField
      FieldName = 'periodo'
      Size = 7
    end
  end
  object dsrq47_compraexproagrop: TtecDataSource
    DataSet = qryq47_compraexproagrop
    Left = 536
    Top = 464
  end
  object qryq48_recprestservfornenereletrica: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryq48_recprestservfornenereletricaAfterPost
    AfterDelete = qryq48_recprestservfornenereletricaAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo,  '
      '         codmunicipio,'
      '          valor'
      'from q48_recprestservfornenereletrica'
      'where filial = :filial and'
      '           periodo = :periodo'
      'order by codmunicipio')
    RequestLive = True
    Left = 720
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryq48_recprestservfornenereletricafilial: TIntegerField
      FieldName = 'filial'
    end
    object qryq48_recprestservfornenereletricaperiodo: TStringField
      FieldName = 'periodo'
      Size = 7
    end
    object qryq48_recprestservfornenereletricacodmunicipio: TIntegerField
      DisplayLabel = 'Quadro 48 - C'#243'digo do munic'#237'pio'
      FieldName = 'codmunicipio'
      Required = True
    end
    object qryq48_recprestservfornenereletricavalor: TFloatField
      DisplayLabel = 'Quadro 48 - Valor'
      FieldName = 'valor'
      Required = True
    end
  end
  object dsrq48_recprestservfornenereletrica: TtecDataSource
    DataSet = qryq48_recprestservfornenereletrica
    Left = 752
    Top = 464
  end
  object qryq49_entmercbensaqservicos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryq49_entmercbensaqservicosAfterPost
    AfterDelete = qryq49_entmercbensaqservicosAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo,          '
      '          estado,'
      '          valorcontabil,'
      '          basedecalculo,'
      '          outras,'
      '          icmsretidosubstrib1,'
      '          icmsretidosubstrib2'
      'from q49_entmercbensaqservicos'
      'where filial = :filial and'
      '           periodo = :periodo'
      'order by estado')
    RequestLive = True
    Left = 296
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryq49_entmercbensaqservicosfilial: TIntegerField
      FieldName = 'filial'
    end
    object qryq49_entmercbensaqservicosperiodo: TStringField
      FieldName = 'periodo'
      Size = 7
    end
    object qryq49_entmercbensaqservicosestado: TStringField
      DisplayLabel = 'Quadro 49 - Unidade de federe'#231#227'o'
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryq49_entmercbensaqservicosvalorcontabil: TFloatField
      DisplayLabel = 'Quadro 49 - Valor cont'#225'bil'
      FieldName = 'valorcontabil'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq49_entmercbensaqservicosbasedecalculo: TFloatField
      DisplayLabel = 'Quadro 49 - Base de c'#225'lculo'
      FieldName = 'basedecalculo'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq49_entmercbensaqservicosoutras: TFloatField
      DisplayLabel = 'Quadro 49 - Outras'
      FieldName = 'outras'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq49_entmercbensaqservicosicmsretidosubstrib1: TFloatField
      DisplayLabel = 'Quadro 49 - ICMS retido - petr'#243'leo, combust'#237'veis...'
      FieldName = 'icmsretidosubstrib1'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq49_entmercbensaqservicosicmsretidosubstrib2: TFloatField
      DisplayLabel = 'Quadro 49 - ICMS retido - outras'
      FieldName = 'icmsretidosubstrib2'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrq49_entmercbensaqservicos: TtecDataSource
    DataSet = qryq49_entmercbensaqservicos
    Left = 328
    Top = 144
  end
  object qryq50_saimercforneletrservicos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryq50_saimercforneletrservicosAfterPost
    AfterDelete = qryq50_saimercforneletrservicosAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo,          '
      '          estado,'
      '          valorcontabil_naocontrib,'
      '          valorcontabil_contrib,'
      '          basedecalculo_naocontrib,'
      '          basedecalculo_contrib,'
      '          outras,'
      '          icmsretidosubstrib'
      'from q50_saimercforneletrservicos'
      'where filial = :filial and'
      '           periodo = :periodo'
      'order by estado')
    RequestLive = True
    Left = 302
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryq50_saimercforneletrservicosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
    end
    object qryq50_saimercforneletrservicosperiodo: TStringField
      FieldName = 'periodo'
      Required = True
      Size = 7
    end
    object qryq50_saimercforneletrservicosestado: TStringField
      DisplayLabel = 'Quadro 50 - Unidade de federa'#231#227'o'
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryq50_saimercforneletrservicosvalorcontabil_naocontrib: TFloatField
      DisplayLabel = 'Quadro 50 - Valor cont'#225'bil - n'#227'o contrib.'
      FieldName = 'valorcontabil_naocontrib'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq50_saimercforneletrservicosvalorcontabil_contrib: TFloatField
      DisplayLabel = 'Quadro 50 - Valor cont'#225'bil - contribuiente'
      FieldName = 'valorcontabil_contrib'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq50_saimercforneletrservicosbasedecalculo_naocontrib: TFloatField
      DisplayLabel = 'Quadro 50 - Base de c'#225'lculo - n'#227'o contrib.'
      FieldName = 'basedecalculo_naocontrib'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq50_saimercforneletrservicosbasedecalculo_contrib: TFloatField
      DisplayLabel = 'Quadro 50 - Base de c'#225'lculo - contribuinte'
      FieldName = 'basedecalculo_contrib'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq50_saimercforneletrservicosoutras: TFloatField
      DisplayLabel = 'Quadro 50 - Outras'
      FieldName = 'outras'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq50_saimercforneletrservicosicmsretidosubstrib: TFloatField
      DisplayLabel = 'Quadro 50 - ICMS retido subst. trib.'
      FieldName = 'icmsretidosubstrib'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrq50_saimercforneletrservicos: TtecDataSource
    DataSet = qryq50_saimercforneletrservicos
    Left = 342
    Top = 272
  end
  object qryNotasEntradasTotalUF: TtecQuery
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
      'select np.estado,'
      '       sum(np.valornota) as valorcontabil,'
      '       sum(entradas.base) as basedecalculo,'
      '       sum(entradas.isentas+entradas.outras) as outras,'
      '       cast(0 as numeric) as icmsretidosubstrib1,'
      '       cast(0 as numeric) as icmsretidosubstrib2'
      'from'
      '('
      '  SELECT'
      '   cnp.codigonota,'
      '   sum(cnp.base) as base,'
      '   sum(cnp.valor) as valor,'
      '   sum(cnp.isentas) as isentas,'
      '   sum(cnp.outras) as outras'
      
        '  FROM (notaspag np join calculosnotaspag cnp on np.codigo = cnp' +
        '.codigonota)'
      '  Where np.filial = :filial'
      '      and np.situacao = '#39'N'#39
      '      and cnp.tipo='#39'M'#39
      '      and cnp.codigofiscal between 1001 and 3948'
      '      and (to_char(np.data, '#39'mm/yyyy'#39') = :MesAno)'
      '  group by codigonota'
      '  order by codigonota'
      
        ') as entradas JOIN notaspag  np on np.codigo = entradas.codigono' +
        'ta'
      'group by np.estado'
      'order by np.estado'
      ''
      ''
      '')
    RequestLive = False
    Left = 104
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAno'
        ParamType = ptUnknown
      end>
    object qryNotasEntradasTotalUFestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryNotasEntradasTotalUFvalorcontabil: TFloatField
      FieldName = 'valorcontabil'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasTotalUFbasedecalculo: TFloatField
      FieldName = 'basedecalculo'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasTotalUFoutras: TFloatField
      FieldName = 'outras'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasTotalUFicmsretidosubstrib1: TFloatField
      FieldName = 'icmsretidosubstrib1'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasEntradasTotalUFicmsretidosubstrib2: TFloatField
      FieldName = 'icmsretidosubstrib2'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrNotasEntradasTotalUF: TtecDataSource
    DataSet = qryNotasEntradasTotalUF
    Left = 136
    Top = 144
  end
  object qryNotasSaidasTotalUF: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = False
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    BeforeOpen = qryNotasSaidasTotalUFBeforeOpen
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <
      item
        DataType = ftUnknown
        Name = 'FiltroIncluirNFCopiaECF'
        ParamType = ptUnknown
      end>
    Sql.Strings = (
      ';'
      'select  estadocfo,'
      
        '        sum(valorcontabil_naocontrib) as valorcontabil_naocontri' +
        'b,'
      #9'cast(0 as numeric) as valorcontabil_contrib,'
      #9'sum(base_naocontrib) as base_naocontrib,'
      #9'cast(0 as numeric) as base_contrib,'
      '        sum(outras) as outras,'
      #9'cast(0 as numeric) as icmsretsubstrib'
      'from'
      '('
      '  ('
      '  select df.estadocfo,'
      '         sum(case when df.situacao='#39'N'#39' then'
      '         (cdf.base+cdf.isentas+cdf.outras) - '
      
        '          coalesce((select sum(cdf2.base+cdf2.isentas+cdf2.outra' +
        's)'
      '                    from calculosdadosfiscais_(df.numero) cdf2'
      '  '#9'            where cdf2.dadofiscal = df.numero'
      
        '  '#9'              and cdf2.tipo='#39'S'#39'),0) else 0 end) as valorconta' +
        'bil_naocontrib,'
      '         sum(cdf.base) as base_naocontrib,'
      '         sum(cdf.isentas+cdf.outras) as outras'
      '  from'
      '    ('
      '     SELECT n.dadofiscal,'
      
        '            sum(case When df.CodigoFiscal in (5929,6929) then 0 ' +
        'else (case When df.situacao='#39'N'#39' then cdf.base else 0 end) end) a' +
        's base,'
      
        '            sum(case When df.CodigoFiscal in (5929,6929) then 0 ' +
        'else (case When df.situacao='#39'N'#39' then cdf.isentas else 0 end) end' +
        ') as isentas,'
      '            sum(case When df.situacao='#39'N'#39' then'
      '                 (case When df.CodigoFiscal in (5929,6929) then'
      '                           (cdf.base+cdf.isentas+cdf.outras)'
      '                       else cdf.outras end)'
      '                     else 0 end) as outras'
      '     FROM ((dadosfiscais df'
      '            join notas n'
      '            on df.numero = n.dadofiscal)'
      ''
      
        '            join (select * from calculosdadosfiscais_(:MesAno)) ' +
        'cdf'
      '            on df.numero=cdf.dadofiscal)'
      ''
      '     Where df.filialemissao = :filial'
      '       and cdf.tipo='#39'M'#39
      '       and (to_char(df.data, '#39'mm/yyyy'#39') = :MesAno)'
      '       and cdf.codigofiscal not in (5933,6933,7933)'
      '       and cdf.codigofiscal between 5001 and 7999'
      '       and df.situacao = '#39'N'#39
      
        '       and (n.filial,n.serie) in (select sf.filial, sf.valor fro' +
        'm seriesfiliais sf where sf.ativa)'
      '       and not coalesce(df.notavinculada,false)'
      ''
      '              %FiltroIncluirNFCopiaECF'
      ''
      ''
      '     group by n.dadofiscal,df.codigofiscal,df.situacao'
      '     order by n.dadofiscal'
      '    ) as cdf join dadosfiscais df on df.numero = cdf.dadofiscal'
      '    group by df.estadocfo'
      '    order by df.estadocfo'
      '  )'
      '  union all'
      '  ('
      '    select df.estadocfo,'
      '           sum(case when df.situacao='#39'N'#39' then'
      
        '               coalesce((select sum(cdf2.base+cdf2.isentas+cdf2.' +
        'outras)'
      
        '                         from calculosdadosfiscais_(df.numero) c' +
        'df2'
      '    '#9'  '#9'         where cdf2.dadofiscal = df.numero'
      
        '    '#9#9#9'   and cdf2.tipo='#39'S'#39'),0) else 0 end) as valorcontabil_nao' +
        'contrib,'
      '           sum(cdf.base) as base_naocontrib,'
      '           sum(cdf.isentas+cdf.outras) as outras'
      '    from'
      '    ('
      '     SELECT n.dadofiscal,'
      '            0.00 as base,'
      '            0.00 as isentas,'
      '            sum(case When df.situacao='#39'N'#39' then'
      '                          cdf.base+cdf.isentas-cdf.outras'
      '                     else 0 end) as outras'
      
        '      FROM ((dadosfiscais df join notas n on df.numero = n.dadof' +
        'iscal)'
      
        '                             join (select * from calculosdadosfi' +
        'scais_(:MesAno)) cdf on df.numero=cdf.dadofiscal)'
      '      Where df.filialemissao = :filial'
      '        and cdf.tipo='#39'S'#39
      '        and (to_char(df.data, '#39'mm/yyyy'#39') = :MesAno)'
      '        and df.situacao = '#39'N'#39
      
        '        and (n.filial,n.serie) in (select sf.filial, sf.valor fr' +
        'om seriesfiliais sf where sf.ativa)'
      '        and not coalesce(df.notavinculada,false)'
      ''
      '      group by n.dadofiscal,df.codigofiscal,df.situacao'
      '      order by n.dadofiscal'
      '    ) as cdf join dadosfiscais df on df.numero = cdf.dadofiscal'
      '    group by df.estadocfo'
      '    order by df.estadocfo'
      '  )'
      '  union all'
      '  ('
      '    select cast(:EstadoFilialBase as varchar(2)) as estadocfo,'
      
        #9'       sum(cdf.base+cdf.isentas+cdf.outras) as valorcontabil_na' +
        'ocontrib,'
      '           sum(cdf.base) as base_naocontrib,'
      '           sum(cdf.isentas+cdf.outras) as outras'
      '    from'
      '    ('
      #9'( '
      #9'select cast(5102 as integer) as codigofiscal,'
      #9#9'   rzd.valoracumulado as base,'#9#9
      #9#9'   (rzd.valoracumulado * rzd.aliquota)/100 as valor,'#9
      '           0.00 as isentas,'
      #9#9'   0.00 as outras,'
      #9#9'   0.00 as icmsbasecalculost,'
      #9#9'   0.00 as icmsvalorst'
      ''
      #9'from reducoesz rz'
      #9#9' join reducoeszdetalhes rzd'
      #9#9' on rz.filial = rzd.filial'
      #9#9' and rz.numerousuario = rzd.numerousuario'
      #9#9' and rz.cro = rzd.cro'
      #9#9' and rz.numerofabricacao = rzd.numerofabricacao'
      #9#9' and rz.datamovimento = rzd.datamovimento'
      ''
      #9'where (to_char(rz.datamovimento, '#39'mm/yyyy'#39') = :MesAno)'
      #9'  and coalesce(rzd.aliquota,0)<>0'
      #9'  and rzd.tipototalizadorparcial  not in ('#39'F1'#39', '#39'N1'#39', '#39'I1'#39')'
      #9'  and rz.filial = :filial'
      #9')'
      '    union all'
      #9'( '
      #9'select cast(5405 as integer) as codigofiscal,'
      #9#9'   0.00 as base,'#9#9
      #9#9'   0.00 as valor,'#9
      
        #9#9'   case when rzd.tipototalizadorparcial='#39'I1'#39' then rzd.valoracu' +
        'mulado else 0.00 end as isentas,'
      
        #9#9'   case when rzd.tipototalizadorparcial in ('#39'N1'#39','#39'F1'#39') then rz' +
        'd.valoracumulado else 0.00 end as outras,'
      #9#9'   0.00 as icmsbasecalculost,'
      #9#9'   0.00 as icmsvalorst'
      '  '#9#9'  '
      #9'from reducoesz rz'
      #9#9' join reducoeszdetalhes rzd'
      #9#9' on rz.filial = rzd.filial'
      #9#9' and rz.numerousuario = rzd.numerousuario'
      #9#9' and rz.cro = rzd.cro'
      #9#9' and rz.numerofabricacao = rzd.numerofabricacao'
      #9#9' and rz.datamovimento = rzd.datamovimento'
      ''
      #9'where (to_char(rz.datamovimento, '#39'mm/yyyy'#39') = :MesAno)'
      #9'  and rzd.tipototalizadorparcial in ('#39'F1'#39', '#39'N1'#39', '#39'I1'#39')'
      #9'  and rz.filial = :filial'
      #9')'
      '    ) as cdf '
      '  )'
      ') as saidas'
      'group by estadocfo'
      'order by estadocfo')
    RequestLive = False
    Left = 104
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MesAno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EstadoFilialBase'
        ParamType = ptUnknown
      end>
    object qryNotasSaidasTotalUFestadocfo: TStringField
      FieldName = 'estadocfo'
      Size = 50
    end
    object qryNotasSaidasTotalUFvalorcontabil_naocontrib: TFloatField
      FieldName = 'valorcontabil_naocontrib'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasTotalUFvalorcontabil_contrib: TFloatField
      FieldName = 'valorcontabil_contrib'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasTotalUFbase_naocontrib: TFloatField
      FieldName = 'base_naocontrib'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasTotalUFbase_contrib: TFloatField
      FieldName = 'base_contrib'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasTotalUFoutras: TFloatField
      FieldName = 'outras'
      DisplayFormat = '###,###,##0.00'
    end
    object qryNotasSaidasTotalUFicmsretsubstrib: TFloatField
      FieldName = 'icmsretsubstrib'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrNotasSaidasTotalUF: TtecDataSource
    DataSet = qryNotasSaidasTotalUF
    Left = 136
    Top = 272
  end
  object qryq01_NotasEntradasCalculos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryq01_NotasEntradasCalculosAfterPost
    AfterDelete = qryq01_NotasEntradasCalculosAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo,          '
      '          codigofiscal,'
      
        '          (select descricao from codigosfiscais where codigo = c' +
        'odigofiscal) as descricao,'
      '          valornota,'
      '          base,'
      '          valor,'
      '          isentas,'
      '          outras,'
      #9#9#9#9'  icmsbasecalculost,'
      #9#9#9#9'  icmsvalorst,'
      #9#9#9#9'  vcredicmssn'#9#9#9
      ''
      'from q01_notasentradascalculos'
      'where filial = :filial'
      '  and periodo = :periodo'
      'order by codigofiscal')
    RequestLive = True
    Left = 296
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryq01_NotasEntradasCalculosfilial: TIntegerField
      FieldName = 'filial'
      Required = True
      DisplayFormat = '0'
    end
    object qryq01_NotasEntradasCalculosperiodo: TStringField
      FieldName = 'periodo'
      Required = True
      Size = 7
    end
    object qryq01_NotasEntradasCalculoscodigofiscal: TIntegerField
      DisplayLabel = 'Quadro 01 - C'#243'digo Fiscal'
      FieldName = 'codigofiscal'
      Required = True
      DisplayFormat = '#,##0'
    end
    object qryq01_NotasEntradasCalculosdescricao: TStringField
      DisplayLabel = 'Quadro 01 - Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 50
    end
    object qryq01_NotasEntradasCalculosvalornota: TFloatField
      DisplayLabel = 'Quadro 01 - Valor Nota'
      FieldName = 'valornota'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq01_NotasEntradasCalculosbase: TFloatField
      DisplayLabel = 'Quadro 01 - Base'
      FieldName = 'base'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq01_NotasEntradasCalculosvalor: TFloatField
      DisplayLabel = 'Quadro 01 - Valor'
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq01_NotasEntradasCalculosisentas: TFloatField
      DisplayLabel = 'Quadro 01 - Isentas'
      FieldName = 'isentas'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq01_NotasEntradasCalculosoutras: TFloatField
      DisplayLabel = 'Quadro 01 - Outras'
      FieldName = 'outras'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq01_NotasEntradasCalculosicmsbasecalculost: TFloatField
      FieldName = 'icmsbasecalculost'
      DisplayFormat = '###,###,##0.00'
    end
    object qryq01_NotasEntradasCalculosicmsvalorst: TFloatField
      FieldName = 'icmsvalorst'
      DisplayFormat = '###,###,##0.00'
    end
    object qryq01_NotasEntradasCalculosvcredicmssn: TFloatField
      FieldName = 'vcredicmssn'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrq01_NotasEntradasCalculos: TtecDataSource
    DataSet = qryq01_NotasEntradasCalculos
    Left = 328
    Top = 80
  end
  object qryq02_NotasSaidasCalculos: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryq02_NotasSaidasCalculosAfterPost
    AfterDelete = qryq02_NotasSaidasCalculosAfterPost
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo,          '
      '          codigofiscal,'
      
        '          (select descricao from codigosfiscais where codigo = c' +
        'odigofiscal) as descricao,'
      '          valornota,'
      '          base,'
      '          valor,'
      '          isentas,'
      '          outras,'
      '          icmsbasecalculost,'
      '          icmsvalorst'
      'from q02_notassaidascalculos'
      'where filial = :filial and'
      '           periodo = :periodo'
      'order by codigofiscal')
    RequestLive = True
    Left = 304
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryq02_NotasSaidasCalculosfilial: TIntegerField
      FieldName = 'filial'
      DisplayFormat = '0'
    end
    object qryq02_NotasSaidasCalculosperiodo: TStringField
      FieldName = 'periodo'
      Size = 7
    end
    object qryq02_NotasSaidasCalculoscodigofiscal: TIntegerField
      DisplayLabel = 'Quadro 02 - C'#243'digo Fiscal'
      FieldName = 'codigofiscal'
      Required = True
      DisplayFormat = '#,##0'
    end
    object qryq02_NotasSaidasCalculosdescricao: TStringField
      DisplayLabel = 'Quadro 02 - Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 50
    end
    object qryq02_NotasSaidasCalculosvalornota: TFloatField
      DisplayLabel = 'Quadro 02 - Valor Nota'
      FieldName = 'valornota'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq02_NotasSaidasCalculosbase: TFloatField
      DisplayLabel = 'Quadro 02 - Base'
      FieldName = 'base'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq02_NotasSaidasCalculosvalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq02_NotasSaidasCalculosisentas: TFloatField
      FieldName = 'isentas'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq02_NotasSaidasCalculosoutras: TFloatField
      DisplayLabel = 'Quadro 02 - Outras'
      FieldName = 'outras'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryq02_NotasSaidasCalculosicmsbasecalculost: TFloatField
      FieldName = 'icmsbasecalculost'
      DisplayFormat = '###,###,##0.00'
    end
    object qryq02_NotasSaidasCalculosicmsvalorst: TFloatField
      FieldName = 'icmsvalorst'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrq02_NotasSaidasCalculos: TtecDataSource
    DataSet = qryq02_NotasSaidasCalculos
    Left = 336
    Top = 208
  end
  object qryNotasSaidasCalculos_Estimativa: TtecQuery
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
      '('
      ' SELECT'
      
        '  sum(case When df.CodigoFiscal in (5929,6929) or cdf.tipo='#39'S'#39' t' +
        'hen 0 else (case When df.situacao='#39'N'#39' then cdf.valor else 0 end)' +
        ' end) as valor'
      
        ' FROM ((dadosfiscais df join notas n on df.numero = n.dadofiscal' +
        ')'
      
        '                                   join (select * from calculosd' +
        'adosfiscais_(:MesAno)) cdf on df.numero=cdf.dadofiscal)'
      ' Where df.filialemissao = :filial'
      '   and cdf.tipo='#39'M'#39
      '   and df.situacao = '#39'N'#39
      '   and not coalesce(df.notavinculada,false)'
      '   and cdf.codigofiscal between 5001 and 7999'
      
        '   and (n.filial,n.serie) in (select sf.filial, sf.valor from se' +
        'riesfiliais sf where sf.ativa)'
      
        '   and (to_char(df.data, '#39'mm/yyyy'#39') between (:MesAnoInicial) and' +
        ' (:MesAnoFinal))'
      ')'
      ' union'
      '('
      ''
      '  select sum((rzd.valoracumulado * rzd.aliquota)/100) as valor'
      '  from reducoesz rz'
      '     join reducoeszdetalhes rzd'
      '     on rz.filial = rzd.filial'
      '     and rz.numerousuario = rzd.numerousuario'
      '     and rz.cro = rzd.cro'
      '     and rz.numerofabricacao = rzd.numerofabricacao'
      '     and rz.datamovimento = rzd.datamovimento'
      ''
      
        '  where (to_char(rz.datamovimento, '#39'mm/yyyy'#39') between (:MesAnoIn' +
        'icial) and (:MesAnoFinal))'
      '    and coalesce(rzd.aliquota,0)<>0'
      '    and rzd.tipototalizadorparcial  not in ('#39'F1'#39', '#39'N1'#39', '#39'I1'#39')'
      '    and rz.filial = :filial'
      ')')
    RequestLive = False
    Left = 104
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MesAno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAnoInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAnoFinal'
        ParamType = ptUnknown
      end>
    object qryNotasSaidasCalculos_Estimativavalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrNotasSaidasCalculos_Estimativa: TtecDataSource
    DataSet = qryNotasSaidasCalculos_Estimativa
    Left = 168
    Top = 320
  end
  object qryq02_NotasSaidasCalculos_Estimativa: TtecQuery
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
      'select sum(valor) as valor'
      'from  q02_notassaidascalculos'
      'where filial = :filial and'
      '           periodo between (:MesAnoInicial) and (:MesAnoFinal)')
    RequestLive = False
    Left = 304
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAnoInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAnoFinal'
        ParamType = ptUnknown
      end>
    object qryq02_NotasSaidasCalculos_Estimativavalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrq02_NotasSaidasCalculos_Estimativa: TtecDataSource
    DataSet = qryq02_NotasSaidasCalculos_Estimativa
    Left = 336
    Top = 336
  end
  object qryNotasEntradasCalculos_Estimativa: TtecQuery
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
      '  SELECT'
      '   sum(cnp.valor) as valor'
      
        '  FROM (notaspag np join calculosnotaspag cnp on np.codigo = cnp' +
        '.codigonota)'
      '  Where np.filial = :filial '
      '        and np.situacao = '#39'N'#39
      '        and cnp.tipo='#39'M'#39
      '        and cnp.codigofiscal between 1001 and 3948'
      
        '        and (to_char(np.data, '#39'mm/yyyy'#39') between :MesAnoInicial ' +
        'and :MesAnoFinal)')
    RequestLive = False
    Left = 104
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAnoInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAnoFinal'
        ParamType = ptUnknown
      end>
    object qryNotasEntradasCalculos_Estimativavalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrNotasEntradasCalculos_Estimativa: TtecDataSource
    DataSet = qryNotasEntradasCalculos_Estimativa
    Left = 136
    Top = 400
  end
  object qryq01_NotasEntradasCalculos_Estimativa: TtecQuery
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
      'select sum(valor) as valor'
      'from  q01_notasentradascalculos'
      'where filial = :filial and'
      '           periodo between (:MesAnoInicial) and (:MesAnoFinal)')
    RequestLive = False
    Left = 304
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAnoInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAnoFinal'
        ParamType = ptUnknown
      end>
    object qryq01_NotasEntradasCalculos_Estimativavalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsrq01_NotasEntradasCalculos_Estimativa: TtecDataSource
    DataSet = qryq01_NotasEntradasCalculos_Estimativa
    Left = 336
    Top = 400
  end
  object qryRecolhimentoDime: TtecQuery
    Tag = -1
    Database = dtmTecSoft.dbaTecSoft
    Transaction = dtmTecSoft.tstTecSoft
    CachedUpdates = True
    ShowRecordTypes = [ztModified, ztInserted, ztUnmodified]
    Options = [doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    AfterPost = qryRecolhimentoDimeAfterPost
    AfterDelete = qryRecolhimentoDimeAfterDelete
    ExtraOptions = [poTextAsMemo, poOidAsBlob]
    Macros = <>
    Sql.Strings = (
      'select filial,'
      '          periodo,          '
      '          numeroguia,'
      '          dataguia,'
      '          valorguia,'
      '          orgaoguia'
      'from recolhimentodime'
      'where filial = :filial and'
      '           periodo = :periodo'
      'order by numeroguia')
    RequestLive = True
    Left = 496
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptUnknown
      end>
    object qryRecolhimentoDimefilial: TIntegerField
      FieldName = 'filial'
    end
    object qryRecolhimentoDimeperiodo: TStringField
      FieldName = 'periodo'
      Size = 7
    end
    object qryRecolhimentoDimenumeroguia: TStringField
      DisplayLabel = 'N'#250'mero da Guia'
      FieldName = 'numeroguia'
      Size = 10
    end
    object qryRecolhimentoDimedataguia: TDateField
      DisplayLabel = 'Data'
      FieldName = 'dataguia'
    end
    object qryRecolhimentoDimevalorguia: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valorguia'
      DisplayFormat = '###,###,##0.00'
    end
    object qryRecolhimentoDimeorgaoguia: TStringField
      DisplayLabel = #211'rg'#227'o'
      FieldName = 'orgaoguia'
    end
  end
  object dsrRecolhimentoDime: TtecDataSource
    DataSet = qryRecolhimentoDime
    Left = 528
    Top = 80
  end
  object qryMovTransfSaldoConsolidado: TtecQuery
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
      'select'
      
        '       sum(case when dime.credito is null and dime.debito is nul' +
        'l then'
      '         notas.credito'
      '       else dime.credito end) as credito,'
      
        '       sum(case when dime.credito is null and dime.debito is nul' +
        'l then'
      '         notas.debito'
      '       else dime.debito end) as debito'
      'from'
      '('
      'select f.codigo as filial,'
      '       entradas.credito,'
      '       saidas.debito'
      ' from ((filiais f left join'
      '                          ('
      '                           select  q02.filial,'
      '                                   q02.valor as credito'
      #9#9'           from q02_notassaidascalculos q02'
      #9#9#9'   where q02.codigofiscal = 5602'
      #9#9#9'     and q02.filial in (select codigo'
      '                                                from filiais'
      
        '                                                where filialcons' +
        'olidadoradime = :Filial)'
      '                             and q02.periodo = :MesAno'
      
        '                          ) as entradas on entradas.filial = f.c' +
        'odigo)'
      '                 left join'
      #9#9'          ('
      '                           select  q02.filial,'
      '                                   q02.valor as debito'
      #9#9'           from q02_notassaidascalculos q02'
      #9#9#9'   where q02.codigofiscal = 5605'
      #9#9#9'     and q02.filial in (select codigo'
      '                                                from filiais'
      
        '                                                where filialcons' +
        'olidadoradime = :Filial)'
      '                             and q02.periodo = :MesAno'
      
        '                          ) as saidas on saidas.filial = f.codig' +
        'o)'
      '  where f.filialconsolidadoradime = :Filial'
      ') as dime left join'
      '('
      'select f.codigo as filial,'
      '       case when entradas.valorcredito > saidas.valordebito then'
      '          entradas.valorcredito - saidas.valordebito'
      '       end as credito,'
      '       case when entradas.valorcredito < saidas.valordebito then'
      '          saidas.valordebito - entradas.valorcredito'
      '       end as debito'
      ' from ((filiais f left join'
      '                          ('
      '                           select  np.filial,'
      
        '                                   sum(cnp.valor) as valorcredit' +
        'o'
      
        '                           FROM (notaspag np join calculosnotasp' +
        'ag cnp on np.codigo = cnp.codigonota)'
      '                           Where np.filial in (select codigo'
      '                                               from filiais'
      
        '                                               where filialconso' +
        'lidadoradime = :Filial)'
      '                             and cnp.tipo='#39'M'#39
      '                             and np.situacao='#39'N'#39
      
        '                             and (to_char(np.data, '#39'mm/yyyy'#39') = ' +
        ':MesAno)'
      '                           group by np.filial'
      
        '                          ) as entradas on entradas.filial = f.c' +
        'odigo)'
      '                 left join'
      #9#9'         ('
      #9#9#9'  select filial,'
      '       '#9#9#9'  sum(valor) as valordebito'
      #9#9#9'  from'
      '                          ('
      '                           ('
      '                            SELECT df.filialemissao as filial,'
      
        '                                   sum(case When cdf.CodigoFisca' +
        'l=5929 then 0 else'
      
        #9#9#9'                (case When df.situacao='#39'N'#39' then cdf.valor els' +
        'e 0 end) end) as valor'
      
        '                            FROM ((dadosfiscais df join notas n ' +
        'on df.numero = n.dadofiscal)'
      
        '                                                   join (select ' +
        '* from calculosdadosfiscais_(:MesAno)) cdf on df.numero=cdf.dado' +
        'fiscal)'
      
        '                            Where df.filialemissao in (select co' +
        'digo from filiais where filialconsolidadoradime =  :Filial)'
      '                              and cdf.tipo='#39'M'#39
      
        '                              and (to_char(df.data, '#39'mm/yyyy'#39') =' +
        ' :MesAno)'
      '                              and df.situacao = '#39'N'#39
      
        '                              and (n.filial,n.serie) in (select ' +
        'sf.filial, sf.valor from seriesfiliais sf where sf.ativa)'
      '                            group by df.filialemissao'
      '                           )'
      '                          union all'
      '                           ('
      ''
      '                            select rzd.filial,'
      
        '                                   sum((rzd.valoracumulado * rzd' +
        '.aliquota)/100) as valor'
      ''
      '                            from reducoesz rz'
      '                               join reducoeszdetalhes rzd'
      '                               on rz.filial = rzd.filial'
      
        '                               and rz.numerousuario = rzd.numero' +
        'usuario'
      '                               and rz.cro = rzd.cro'
      
        '                               and rz.numerofabricacao = rzd.num' +
        'erofabricacao'
      
        '                               and rz.datamovimento = rzd.datamo' +
        'vimento'
      ''
      
        '                            where (to_char(rz.datamovimento, '#39'mm' +
        '/yyyy'#39') = :MesAno)'
      '                              and coalesce(rzd.aliquota,0)<>0'
      
        '                              and rzd.tipototalizadorparcial  no' +
        't in ('#39'F1'#39', '#39'N1'#39', '#39'I1'#39')'
      
        '                              and rz.filial in (select codigo fr' +
        'om filiais where filialconsolidadoradime =  :Filial)'
      '                            group by rzd.filial'
      ''
      '                            )'
      '                           ) as saidas'
      #9#9#9'   group by filial'
      
        '                          ) as saidas on saidas.filial = f.codig' +
        'o)'
      '  where f.filialconsolidadoradime = :Filial'
      '  ) as notas on dime.filial = notas.filial')
    RequestLive = False
    Left = 528
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAno'
        ParamType = ptUnknown
      end>
    object qryMovTransfSaldoConsolidadocredito: TFloatField
      FieldName = 'credito'
      DisplayFormat = '###,###,##0.00'
    end
    object qryMovTransfSaldoConsolidadodebito: TFloatField
      FieldName = 'debito'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object qryMovTransfSaldoConsolidadoSubsTrib: TtecQuery
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
      'select sum(q11_180_Slddevtrestcons) as q11_180_Slddevtrestcons,'
      '       sum(q11_200_Sldcredtrestcons) as q11_200_Sldcredtrestcons'
      'from quadrosdime'
      'where filial in (select codigo'
      '                 from filiais'
      '                 where filialconsolidadoradime = :Filial)'
      '  and periodo = :MesAno'
      '')
    RequestLive = False
    Left = 528
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MesAno'
        ParamType = ptUnknown
      end>
    object qryMovTransfSaldoConsolidadoSubsTribq11_180_Slddevtrestcons: TFloatField
      FieldName = 'q11_180_Slddevtrestcons'
      DisplayFormat = '###,###,##0.00'
    end
    object qryMovTransfSaldoConsolidadoSubsTribq11_200_Sldcredtrestcons: TFloatField
      FieldName = 'q11_200_Sldcredtrestcons'
      DisplayFormat = '###,###,##0.00'
    end
  end
end
