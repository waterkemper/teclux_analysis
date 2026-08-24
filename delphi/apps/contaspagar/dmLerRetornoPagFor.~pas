unit dmLerRetornoPagFor;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, dmtecsoft, ACBrPagFor, ACBrPagForConversao, Variants, ACBrUtil,
  forms, Dialogs, biblio, ctconstantes, AdvGrid, windows, DBAdvGrid,
  dmContasPagar, clparametrossistema, ZTransact, ZPgSqlTr, cptransact, clusuario;

type
  tGerandoConsulta = (NaoGerando, viaParametros, MultiplosArquivos, UnicoArquico, PendenciasdeGravacao);

type
  TdtmLerRetornoPagFor = class(TdtmBasico)
    dsrretorno_pagfor_r1: TtecDataSource;
    qryretorno_pagfor_r1: TtecQuery;
    dsrretorno_pagfor_r3_segG: TtecDataSource;
    qryretorno_pagfor_r3_segG: TtecQuery;
    dsrretorno_pagfor_r3_segH: TtecDataSource;
    qryretorno_pagfor_r3_segH: TtecQuery;
    dsrretorno_pagfor_trailer_tipo_5: TtecDataSource;
    qryretorno_pagfor_trailer_tipo_5: TtecQuery;
    dsrDuplicatas: TtecDataSource;
    qryDuplicatas: TtecQuery;
    qryDuplicatasdocumentopag: TIntegerField;           
    qryDuplicatasnumero: TIntegerField;
    qryDuplicatascomplemento: TStringField;
    qryDuplicatasfornecedor: TIntegerField;
    qryDuplicatastipofornecedor: TStringField;
    qryDuplicatasnomefornecedor: TStringField;
    qryDuplicatasdatavencto: TDateField;
    qryDuplicatasvalorvencto: TFloatField;
    qryDuplicatasdatapagto: TDateField;
    qryDuplicatasvalorpagto: TFloatField;
    qryretorno_pagfor_r1registro0: TLargeintField;
    qryretorno_pagfor_r1cod_do_banco: TStringField;
    qryretorno_pagfor_r1lote_de_serv: TStringField;
    qryretorno_pagfor_r1tp_de_registro: TStringField;
    qryretorno_pagfor_r1tp_da_op: TStringField;
    qryretorno_pagfor_r1tp_de_serv: TStringField;
    qryretorno_pagfor_r1forma_lancto: TStringField;
    qryretorno_pagfor_r1nro_da_ver_do_lote: TStringField;
    qryretorno_pagfor_r1tp_de_inso_da_emp: TStringField;
    qryretorno_pagfor_r1nro_de_insc_da_emp: TStringField;
    qryretorno_pagfor_r1cd_do_conv_no_banco: TStringField;
    qryretorno_pagfor_r1ag_mant_da_conta: TStringField;
    qryretorno_pagfor_r1dg_ver_da_ag: TStringField;
    qryretorno_pagfor_r1nr_da_conta_cor: TStringField;
    qryretorno_pagfor_r1dg_ver_da_conta: TStringField;
    qryretorno_pagfor_r1dg_ver_da_ag_e_cta: TStringField;
    qryretorno_pagfor_r1nm_da_emp: TStringField;
    qryretorno_pagfor_r1endereco: TStringField;
    qryretorno_pagfor_r1numero: TStringField;
    qryretorno_pagfor_r1complemento: TStringField;
    qryretorno_pagfor_r1cidade: TStringField;
    qryretorno_pagfor_r1cep: TStringField;
    qryretorno_pagfor_r1uf: TStringField;
    qryretorno_pagfor_r1oc_retorno: TStringField;
    qryretorno_pagfor_r1tp_de_serv_descricao: TStringField;
    dsrretorno_pagfor_r0: TtecDataSource;
    qryretorno_pagfor_r0: TtecQuery;
    dsrretorno_pagfor_r3_segA: TtecDataSource;
    qryretorno_pagfor_r3_segA: TtecQuery;
    dsrretorno_pagfor_r3_segB: TtecDataSource;
    qryretorno_pagfor_r3_segB: TtecQuery;
    dsrretorno_pagfor_r3_segJ: TtecDataSource;
    qryretorno_pagfor_r3_segJ: TtecQuery;
    dsrRetorno_pagfor_r3_segN: TtecDataSource;
    qryRetorno_pagfor_r3_segN: TtecQuery;
    qryretorno_pagfor_trailer_tipo_9: TtecQuery;
    dsrretorno_pagfor_trailer_tipo_9: TtecDataSource;
    dsrRetorno_pagfor_r3_segO: TtecDataSource;
    qryRetorno_pagfor_r3_segO: TtecQuery;
    dsrRetorno_pagfor_r3_segW: TtecDataSource;
    qryRetorno_pagfor_r3_segW: TtecQuery;
    qryRetorno_pagfor_r3_segWregistro0: TLargeintField;
    qryRetorno_pagfor_r3_segWcod_do_banco: TStringField;
    qryRetorno_pagfor_r3_segWlote_de_serv: TStringField;
    qryRetorno_pagfor_r3_segWtp_de_registro: TStringField;
    qryRetorno_pagfor_r3_segWnr_seq_reg_lote: TStringField;
    qryRetorno_pagfor_r3_segWsegmento: TStringField;
    qryRetorno_pagfor_r3_segWnr_seq_reg_compl: TStringField;
    qryRetorno_pagfor_r3_segWinf_1_e_2: TStringField;
    qryRetorno_pagfor_r3_segWinf_compl_1: TStringField;
    qryRetorno_pagfor_r3_segWinf_compl_2: TStringField;
    qryRetorno_pagfor_r3_segWinf_compl_trib: TStringField;
    qryRetorno_pagfor_r3_segWoc_retorno: TStringField;
    dsrRetorno_pagfor_r3_segZ: TtecDataSource;
    qryRetorno_pagfor_r3_segZ: TtecQuery;
    qryRetorno_pagfor_r3_segZregistro0: TLargeintField;
    qryRetorno_pagfor_r3_segZcod_do_banco: TStringField;
    qryRetorno_pagfor_r3_segZlote_de_serv: TStringField;
    qryRetorno_pagfor_r3_segZtp_de_registro: TStringField;
    qryRetorno_pagfor_r3_segZnr_seq_reg_lote: TStringField;
    qryRetorno_pagfor_r3_segZsegmento: TStringField;
    qryRetorno_pagfor_r3_segZaut_pagto: TStringField;
    qryRetorno_pagfor_r3_segZprot_pagto: TStringField;
    qryRetorno_pagfor_r3_segZoc_retorno: TStringField;
    qryretorno_pagfor_r0_proximocodigo: TtecQuery;
    qryretorno_pagfor_r0_proximocodigocodigo: TIntegerField;
    dsrretorno_pagfor_r0_Text: TtecDataSource;
    qryretorno_pagfor_r0_Text: TtecQuery;
    LargeintField1: TLargeintField;
    qryretorno_pagfor_r0_Textconteudoarquivo: TMemoField;
    qryretorno_pagfor_r3_segGregistro0: TLargeintField;
    qryretorno_pagfor_r3_segGcod_do_banco: TStringField;
    qryretorno_pagfor_r3_segGlote_de_serv: TStringField;
    qryretorno_pagfor_r3_segGtp_de_registro: TStringField;
    qryretorno_pagfor_r3_segGnr_seq_reg_lote: TStringField;
    qryretorno_pagfor_r3_segGsegmento: TStringField;
    qryretorno_pagfor_r3_segGcd_de_mov_rem: TStringField;
    qryretorno_pagfor_r3_segGcod_de_barras: TStringField;
    qryretorno_pagfor_r3_segGtp_de_insc_ced: TStringField;
    qryretorno_pagfor_r3_segGnr_insc_ced: TStringField;
    qryretorno_pagfor_r3_segGnome_do_cedente: TStringField;
    qryretorno_pagfor_r3_segGdt_vencto: TDateField;
    qryretorno_pagfor_r3_segGvlr_nominal: TFloatField;
    qryretorno_pagfor_r3_segGqt_moeda: TFloatField;
    qryretorno_pagfor_r3_segGcd_da_moeda: TStringField;
    qryretorno_pagfor_r3_segGnr_doc_cob: TStringField;
    qryretorno_pagfor_r3_segGag_enc_cob: TStringField;
    qryretorno_pagfor_r3_segGdg_ver_ag: TStringField;
    qryretorno_pagfor_r3_segGpr_cobradora: TStringField;
    qryretorno_pagfor_r3_segGcd_carteira: TStringField;
    qryretorno_pagfor_r3_segGesp_titulo: TStringField;
    qryretorno_pagfor_r3_segGdt_emissao: TDateField;
    qryretorno_pagfor_r3_segGjr_mora_dia: TFloatField;
    qryretorno_pagfor_r3_segGcd_desconto: TStringField;
    qryretorno_pagfor_r3_segGdt_desconto: TDateField;
    qryretorno_pagfor_r3_segGvlr_per_desc: TFloatField;
    qryretorno_pagfor_r3_segGcd_protesto: TStringField;
    qryretorno_pagfor_r3_segGnr_dias_protesto: TStringField;
    qryretorno_pagfor_r3_segGdt_lim_pago_tit: TDateField;
    qryretorno_pagfor_r3_segGtp_de_titulo: TStringField;
    qryretorno_pagfor_r3_segGcd_de_mov_rem_descricao: TStringField;
    qryretorno_pagfor_r3_segGcd_da_moeda_descricao: TStringField;
    qryretorno_pagfor_r3_segGesp_titulo_descricao: TStringField;
    qryretorno_pagfor_r3_segGcd_desconto_descricao: TStringField;
    qryretorno_pagfor_r3_segGcd_protesto_descricao: TStringField;
    qryretorno_pagfor_r3_segGtp_de_titulo_descricao: TStringField;
    qryretorno_pagfor_r3_segHregistro0: TLargeintField;
    qryretorno_pagfor_r3_segHcod_do_banco: TStringField;
    qryretorno_pagfor_r3_segHlote_de_serv: TStringField;
    qryretorno_pagfor_r3_segHtp_de_registro: TStringField;
    qryretorno_pagfor_r3_segHnr_seq_reg_lote: TStringField;
    qryretorno_pagfor_r3_segHsegmento: TStringField;
    qryretorno_pagfor_r3_segHcd_de_mov_rem: TStringField;
    qryretorno_pagfor_r3_segHtp_de_insc_sac: TStringField;
    qryretorno_pagfor_r3_segHnr_insc_sac: TStringField;
    qryretorno_pagfor_r3_segHnome_do_sacador: TStringField;
    qryretorno_pagfor_r3_segHcd_desconto2: TStringField;
    qryretorno_pagfor_r3_segHdt_desconto2: TDateField;
    qryretorno_pagfor_r3_segHvlr_per_desc2: TFloatField;
    qryretorno_pagfor_r3_segHcd_desconto3: TStringField;
    qryretorno_pagfor_r3_segHdt_desconto3: TDateField;
    qryretorno_pagfor_r3_segHvlr_per_desc3: TFloatField;
    qryretorno_pagfor_r3_segHcd_da_multa: TStringField;
    qryretorno_pagfor_r3_segHdt_in_vig_multa: TDateField;
    qryretorno_pagfor_r3_segHvlr_apl_multa: TFloatField;
    qryretorno_pagfor_r3_segHvlr_abatimento: TFloatField;
    qryretorno_pagfor_r3_segHmensagem1: TStringField;
    qryretorno_pagfor_r3_segHmensagem2: TStringField;
    qryretorno_pagfor_r3_segHcd_de_mov_rem_descricao: TStringField;
    qryretorno_pagfor_r3_segHcd_desconto2_descricao: TStringField;
    qryretorno_pagfor_r3_segHcd_desconto3_descricao: TStringField;
    qryretorno_pagfor_r3_segHcd_da_multa_descricao: TStringField;
    qryretorno_pagfor_r0codigo: TLargeintField;
    qryretorno_pagfor_r0nomearquivo: TStringField;
    qryretorno_pagfor_r0datahora: TDateTimeField;
    qryretorno_pagfor_r0cod_do_banco: TStringField;
    qryretorno_pagfor_r0lote_de_serv: TStringField;
    qryretorno_pagfor_r0tp_de_registro: TStringField;
    qryretorno_pagfor_r0tp_de_inso_da_emp: TStringField;
    qryretorno_pagfor_r0nro_de_insc_da_emp: TStringField;
    qryretorno_pagfor_r0cd_do_conv_no_banco: TStringField;
    qryretorno_pagfor_r0ag_mant_da_conta: TStringField;
    qryretorno_pagfor_r0dg_ver_da_ag: TStringField;
    qryretorno_pagfor_r0nr_da_conta_cor: TStringField;
    qryretorno_pagfor_r0dg_ver_da_conta: TStringField;
    qryretorno_pagfor_r0dg_ver_da_ag_e_cta: TStringField;
    qryretorno_pagfor_r0nm_da_emp: TStringField;
    qryretorno_pagfor_r0nm_do_banco: TStringField;
    qryretorno_pagfor_r0cd_rem_ret: TStringField;
    qryretorno_pagfor_r0dt_geracao: TDateField;
    qryretorno_pagfor_r0nr_seq: TStringField;
    qryretorno_pagfor_r0nr_ver_layout: TStringField;
    qryretorno_pagfor_r3_segBregistro0: TLargeintField;
    qryretorno_pagfor_r3_segBcod_do_banco: TStringField;
    qryretorno_pagfor_r3_segBlote_de_serv: TStringField;
    qryretorno_pagfor_r3_segBtp_de_registro: TStringField;
    qryretorno_pagfor_r3_segBnr_seq_reg_lote: TStringField;
    qryretorno_pagfor_r3_segBsegmento: TStringField;
    qryretorno_pagfor_r3_segBtp_de_inso_fav: TStringField;
    qryretorno_pagfor_r3_segBcnpj_cpf_fav: TStringField;
    qryretorno_pagfor_r3_segBlogradouro_fav: TStringField;
    qryretorno_pagfor_r3_segBnr_local_fav: TStringField;
    qryretorno_pagfor_r3_segBcompl_fav: TStringField;
    qryretorno_pagfor_r3_segBbairro_fav: TStringField;
    qryretorno_pagfor_r3_segBcidade_fav: TStringField;
    qryretorno_pagfor_r3_segBcep_fav: TStringField;
    qryretorno_pagfor_r3_segBestado_fav: TStringField;
    qryretorno_pagfor_r3_segBdata_vencto: TDateField;
    qryretorno_pagfor_r3_segBvlr_doc: TFloatField;
    qryretorno_pagfor_r3_segBvlr_abat: TFloatField;
    qryretorno_pagfor_r3_segBvlr_desconto: TFloatField;
    qryretorno_pagfor_r3_segBvlr_mora: TFloatField;
    qryretorno_pagfor_r3_segBvlr_multa: TFloatField;
    qryretorno_pagfor_r3_segBcod_hist_cred: TStringField;
    qryretorno_pagfor_r3_segBoc_retorno: TStringField;
    dsrretorno_pagfor_r3_segJ52: TtecDataSource;
    qryretorno_pagfor_r3_segJ52: TtecQuery;
    qryretorno_pagfor_r3_segJ52registro0: TLargeintField;
    qryretorno_pagfor_r3_segJ52cod_do_banco: TStringField;
    qryretorno_pagfor_r3_segJ52lote_de_serv: TStringField;
    qryretorno_pagfor_r3_segJ52tp_de_registro: TStringField;
    qryretorno_pagfor_r3_segJ52nr_seq_reg_lote: TStringField;
    qryretorno_pagfor_r3_segJ52segmento: TStringField;
    qryretorno_pagfor_r3_segJ52cd_mov_rem: TStringField;
    qryretorno_pagfor_r3_segJ52id_reg_opc: TStringField;
    qryretorno_pagfor_r3_segJ52tpinsc_sacado: TStringField;
    qryretorno_pagfor_r3_segJ52cnpj_cpf_sacado: TStringField;
    qryretorno_pagfor_r3_segJ52nm_sacado: TStringField;
    qryretorno_pagfor_r3_segJ52tpinsc_cedente: TStringField;
    qryretorno_pagfor_r3_segJ52cnpj_cpf_cedente: TStringField;
    qryretorno_pagfor_r3_segJ52nm_cedente: TStringField;
    qryretorno_pagfor_r3_segJ52tpinsc_sacador: TStringField;
    qryretorno_pagfor_r3_segJ52cnpj_cpf_sacador: TStringField;
    qryretorno_pagfor_r3_segJ52nm_sacador: TStringField;
    qryretorno_pagfor_trailer_tipo_9registro0: TLargeintField;
    qryretorno_pagfor_trailer_tipo_9cod_do_banco: TStringField;
    qryretorno_pagfor_trailer_tipo_9lote_de_serv: TStringField;
    qryretorno_pagfor_trailer_tipo_9tp_de_registro: TStringField;
    qryretorno_pagfor_trailer_tipo_9qt_de_lotes: TIntegerField;
    qryretorno_pagfor_trailer_tipo_9qt_reg: TIntegerField;
    qryretorno_pagfor_trailer_tipo_5registro0: TLargeintField;
    qryretorno_pagfor_trailer_tipo_5cod_do_banco: TStringField;
    qryretorno_pagfor_trailer_tipo_5lote_de_serv: TStringField;
    qryretorno_pagfor_trailer_tipo_5tp_de_registro: TStringField;
    qryretorno_pagfor_trailer_tipo_5qt_reg: TIntegerField;
    qryretorno_pagfor_trailer_tipo_5soma_valores: TFloatField;
    qryretorno_pagfor_trailer_tipo_5soma_qt_moedas: TFloatField;
    qryretorno_pagfor_trailer_tipo_5nr_aviso_debito: TStringField;
    qryretorno_pagfor_trailer_tipo_5oc_retorno: TStringField;
    qryretorno_pagfor_r3_segAregistro0: TLargeintField;
    qryretorno_pagfor_r3_segAcod_do_banco: TStringField;
    qryretorno_pagfor_r3_segAlote_de_serv: TStringField;
    qryretorno_pagfor_r3_segAtp_de_registro: TStringField;
    qryretorno_pagfor_r3_segAnr_seq_reg_lote: TStringField;
    qryretorno_pagfor_r3_segAsegmento: TStringField;
    qryretorno_pagfor_r3_segAtipo_de_movimento: TStringField;
    qryretorno_pagfor_r3_segAcd_ins_movto: TStringField;
    qryretorno_pagfor_r3_segAcd_cam_comp: TStringField;
    qryretorno_pagfor_r3_segAcod_banco_fav: TStringField;
    qryretorno_pagfor_r3_segAcod_ag_fav: TStringField;
    qryretorno_pagfor_r3_segAdg_ver_ag_fav: TStringField;
    qryretorno_pagfor_r3_segAnr_da_conta_cor_fav: TStringField;
    qryretorno_pagfor_r3_segAdg_ver_da_conta_fav: TStringField;
    qryretorno_pagfor_r3_segAdg_ver_da_ag_e_cta_fav: TStringField;
    qryretorno_pagfor_r3_segAnm_fav: TStringField;
    qryretorno_pagfor_r3_segAnr_doc_cliente: TStringField;
    qryretorno_pagfor_r3_segAdata_pagto: TDateField;
    qryretorno_pagfor_r3_segAtp_moeda: TStringField;
    qryretorno_pagfor_r3_segAqtdade_moeda: TStringField;
    qryretorno_pagfor_r3_segAvlr_pagto: TFloatField;
    qryretorno_pagfor_r3_segAnro_docto_banco: TStringField;
    qryretorno_pagfor_r3_segAdt_real_pagto: TDateField;
    qryretorno_pagfor_r3_segAvlr_real_pagto: TFloatField;
    qryretorno_pagfor_r3_segAoutras_informacoes: TStringField;
    qryretorno_pagfor_r3_segAfinalidade: TStringField;
    qryretorno_pagfor_r3_segAem_aviso_fav: TStringField;
    qryretorno_pagfor_r3_segAoc_retorno: TStringField;
    qryretorno_pagfor_r3_segJregistro0: TLargeintField;
    qryretorno_pagfor_r3_segJcod_do_banco: TStringField;
    qryretorno_pagfor_r3_segJlote_de_serv: TStringField;
    qryretorno_pagfor_r3_segJtp_de_registro: TStringField;
    qryretorno_pagfor_r3_segJnr_seq_reg_lote: TStringField;
    qryretorno_pagfor_r3_segJsegmento: TStringField;
    qryretorno_pagfor_r3_segJtipo_de_movimento: TStringField;
    qryretorno_pagfor_r3_segJcd_ins_movto: TStringField;
    qryretorno_pagfor_r3_segJcod_de_barras: TStringField;
    qryretorno_pagfor_r3_segJnome_do_cedente: TStringField;
    qryretorno_pagfor_r3_segJdt_vencto: TDateField;
    qryretorno_pagfor_r3_segJvlr_nominal: TFloatField;
    qryretorno_pagfor_r3_segJvlr_desconto: TFloatField;
    qryretorno_pagfor_r3_segJvlr_multajuros: TFloatField;
    qryretorno_pagfor_r3_segJdata_pagto: TDateField;
    qryretorno_pagfor_r3_segJvlr_pagto: TFloatField;
    qryretorno_pagfor_r3_segJqt_moeda: TFloatField;
    qryretorno_pagfor_r3_segJnr_doc_cliente: TStringField;
    qryretorno_pagfor_r3_segJnro_docto_banco: TStringField;
    qryretorno_pagfor_r3_segJcd_da_moeda: TStringField;
    qryretorno_pagfor_r3_segJoc_retorno: TStringField;
    qryRetorno_pagfor_r3_segNregistro0: TLargeintField;
    qryRetorno_pagfor_r3_segNcod_do_banco: TStringField;
    qryRetorno_pagfor_r3_segNlote_de_serv: TStringField;
    qryRetorno_pagfor_r3_segNtp_de_registro: TStringField;
    qryRetorno_pagfor_r3_segNnr_seq_reg_lote: TStringField;
    qryRetorno_pagfor_r3_segNsegmento: TStringField;
    qryRetorno_pagfor_r3_segNtipo_de_movimento: TStringField;
    qryRetorno_pagfor_r3_segNcd_ins_movto: TStringField;
    qryRetorno_pagfor_r3_segNnr_doc_cliente: TStringField;
    qryRetorno_pagfor_r3_segNnro_docto_banco: TStringField;
    qryRetorno_pagfor_r3_segNnm_contribuinte: TStringField;
    qryRetorno_pagfor_r3_segNdata_pagto: TDateField;
    qryRetorno_pagfor_r3_segNvlr_pagto: TFloatField;
    qryRetorno_pagfor_r3_segNinf_compl: TStringField;
    qryRetorno_pagfor_r3_segNoc_retorno: TStringField;
    qryRetorno_pagfor_r3_segOregistro0: TLargeintField;
    qryRetorno_pagfor_r3_segOcod_do_banco: TStringField;
    qryRetorno_pagfor_r3_segOlote_de_serv: TStringField;
    qryRetorno_pagfor_r3_segOtp_de_registro: TStringField;
    qryRetorno_pagfor_r3_segOnr_seq_reg_lote: TStringField;
    qryRetorno_pagfor_r3_segOsegmento: TStringField;
    qryRetorno_pagfor_r3_segOtipo_de_movimento: TStringField;
    qryRetorno_pagfor_r3_segOcd_ins_movto: TStringField;
    qryRetorno_pagfor_r3_segOcd_barras: TStringField;
    qryRetorno_pagfor_r3_segOnmconcess_orgaopub: TStringField;
    qryRetorno_pagfor_r3_segOdt_vencto: TDateField;
    qryRetorno_pagfor_r3_segOdata_pagto: TDateField;
    qryRetorno_pagfor_r3_segOvlr_pagto: TFloatField;
    qryRetorno_pagfor_r3_segOnr_doc_cliente: TStringField;
    qryRetorno_pagfor_r3_segOnro_docto_banco: TStringField;
    qryRetorno_pagfor_r3_segOoc_retorno: TStringField;
    qryRetorno_pagfor_r3_segN1: TtecQuery;
    dsrRetorno_pagfor_r3_segN1: TtecDataSource;
    dsrRetorno_pagfor_r3_segN2: TtecDataSource;
    qryRetorno_pagfor_r3_segN2: TtecQuery;
    dsrRetorno_pagfor_r3_segN3: TtecDataSource;
    qryRetorno_pagfor_r3_segN3: TtecQuery;
    dsrRetorno_pagfor_r3_segN4: TtecDataSource;
    qryRetorno_pagfor_r3_segN4: TtecQuery;
    qryRetorno_pagfor_r3_segN1registro0: TLargeintField;
    qryRetorno_pagfor_r3_segN1cod_do_banco: TStringField;
    qryRetorno_pagfor_r3_segN1lote_de_serv: TStringField;
    qryRetorno_pagfor_r3_segN1tp_de_registro: TStringField;
    qryRetorno_pagfor_r3_segN1nr_seq_reg_lote: TStringField;
    qryRetorno_pagfor_r3_segN1cd_receita_trib: TStringField;
    qryRetorno_pagfor_r3_segN1tp_id_contrib: TStringField;
    qryRetorno_pagfor_r3_segN1id_contrib: TStringField;
    qryRetorno_pagfor_r3_segN1cd_id_trib: TStringField;
    qryRetorno_pagfor_r3_segN1competencia: TStringField;
    qryRetorno_pagfor_r3_segN1vlr_prev_pg_inss: TFloatField;
    qryRetorno_pagfor_r3_segN1vlr_out_ent: TFloatField;
    qryRetorno_pagfor_r3_segN1at_monetaria: TFloatField;
    qryRetorno_pagfor_r3_segN2registro0: TLargeintField;
    qryRetorno_pagfor_r3_segN2cod_do_banco: TStringField;
    qryRetorno_pagfor_r3_segN2lote_de_serv: TStringField;
    qryRetorno_pagfor_r3_segN2tp_de_registro: TStringField;
    qryRetorno_pagfor_r3_segN2nr_seq_reg_lote: TStringField;
    qryRetorno_pagfor_r3_segN2cd_receita_trib: TStringField;
    qryRetorno_pagfor_r3_segN2tp_id_contrib: TStringField;
    qryRetorno_pagfor_r3_segN2id_contrib: TStringField;
    qryRetorno_pagfor_r3_segN2cd_id_trib: TStringField;
    qryRetorno_pagfor_r3_segN2nr_ref: TStringField;
    qryRetorno_pagfor_r3_segN2vlr_principal: TFloatField;
    qryRetorno_pagfor_r3_segN2vlr_multa: TFloatField;
    qryRetorno_pagfor_r3_segN2vlr_juros: TFloatField;
    qryRetorno_pagfor_r3_segN2dt_vencto: TDateField;
    qryRetorno_pagfor_r3_segN3registro0: TLargeintField;
    qryRetorno_pagfor_r3_segN3cod_do_banco: TStringField;
    qryRetorno_pagfor_r3_segN3lote_de_serv: TStringField;
    qryRetorno_pagfor_r3_segN3tp_de_registro: TStringField;
    qryRetorno_pagfor_r3_segN3nr_seq_reg_lote: TStringField;
    qryRetorno_pagfor_r3_segN3cd_receita_trib: TStringField;
    qryRetorno_pagfor_r3_segN3tp_id_contrib: TStringField;
    qryRetorno_pagfor_r3_segN3id_contrib: TStringField;
    qryRetorno_pagfor_r3_segN3cd_id_trib: TStringField;
    qryRetorno_pagfor_r3_segN3vlr_rec_bruta_acum: TFloatField;
    qryRetorno_pagfor_r3_segN3perc_rec_bruta_acum: TFloatField;
    qryRetorno_pagfor_r3_segN3vlr_principal: TFloatField;
    qryRetorno_pagfor_r3_segN3vlr_multa: TFloatField;
    qryRetorno_pagfor_r3_segN3vlr_juros: TFloatField;
    qryRetorno_pagfor_r3_segN4registro0: TLargeintField;
    qryRetorno_pagfor_r3_segN4cod_do_banco: TStringField;
    qryRetorno_pagfor_r3_segN4lote_de_serv: TStringField;
    qryRetorno_pagfor_r3_segN4tp_de_registro: TStringField;
    qryRetorno_pagfor_r3_segN4nr_seq_reg_lote: TStringField;
    qryRetorno_pagfor_r3_segN4cd_receita_trib: TStringField;
    qryRetorno_pagfor_r3_segN4tp_id_contrib: TStringField;
    qryRetorno_pagfor_r3_segN4id_contrib: TStringField;
    qryRetorno_pagfor_r3_segN4cd_id_trib: TStringField;
    qryRetorno_pagfor_r3_segN4dt_vencto: TDateField;
    qryRetorno_pagfor_r3_segN4insest_cdmun_nrodecl: TStringField;
    qryRetorno_pagfor_r3_segN4divativ_nretiq: TStringField;
    qryRetorno_pagfor_r3_segN4per_ref: TStringField;
    qryRetorno_pagfor_r3_segN4nrparcela: TStringField;
    qryRetorno_pagfor_r3_segN4vlr_receita: TFloatField;
    qryRetorno_pagfor_r3_segN4vlr_juros: TFloatField;
    qryRetorno_pagfor_r3_segN4vlr_multa: TFloatField;
    qryRetorno_pagfor_r3_segN2per_apuracao: TDateField;
    qryRetorno_pagfor_r3_segN3per_apuracao: TDateField;
    qryretorno_pagfor_r0hr_geracao: TTimeField;
    qryretorno_pagfor_r3_segBhora_env_ted: TTimeField;
    dsrretorno_pagfor_r3: TtecDataSource;
    qryretorno_pagfor_r3: TtecQuery;
    qryretorno_pagfor_r3registro0: TLargeintField;
    qryretorno_pagfor_r3cod_do_banco: TStringField;
    qryretorno_pagfor_r3lote_de_serv: TStringField;
    qryretorno_pagfor_r3tp_de_registro: TStringField;
    qryretorno_pagfor_r3nr_seq_reg_lote: TStringField;
    qryretorno_pagfor_r3segmento: TStringField;
    qryretorno_pagfor_r3tipo_de_movimento: TStringField;
    qryretorno_pagfor_r3desc_tipo_movto: TStringField;
    qryretorno_pagfor_r3cd_ins_movto: TStringField;
    qryretorno_pagfor_r3desc_ins_movto: TStringField;
    qryretorno_pagfor_r3identif_nome: TStringField;
    qryretorno_pagfor_r3identif_doc: TStringField;
    qryretorno_pagfor_r3cod_de_barras: TStringField;
    qryretorno_pagfor_r3dt_vencto: TDateField;
    qryretorno_pagfor_r3vlr_vencto: TFloatField;
    qryretorno_pagfor_r3dt_pagto: TDateField;
    qryretorno_pagfor_r3vlr_desconto: TFloatField;
    qryretorno_pagfor_r3vlr_multajuros: TFloatField;
    qryretorno_pagfor_r3vlr_pagto: TFloatField;
    qryContas: TtecQuery;
    qryContasBanco: TIntegerField;
    qryContasAgencia: TIntegerField;
    qryContasConta: TIntegerField;
    qryContasDigito: TStringField;
    qryContasTitular: TStringField;
    qryContasSigla: TStringField;
    qryContasNome: TStringField;
    qryContasModeloCheque: TIntegerField;
    qryContasbancoreferencia: TStringField;
    qryContasconvenio: TLargeintField;
    qryContasvariacao_carteira: TStringField;
    qryContasformatacao_convenio: TStringField;
    qryContasformatacao_nosso_numero: TStringField;
    qryContasvalor_isencao_taxa: TFloatField;
    qryContasagenciareferencia: TIntegerField;
    qryContascnpj_agencia_referencia: TStringField;
    qryContascedente_nome: TStringField;
    qryContascodigo_singular: TLargeintField;
    qryContastiporecebimento: TIntegerField;
    qryContasfilial: TIntegerField;
    dsrContas: TtecDataSource;
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryFiliaisinscricaoestadual: TStringField;
    qryFiliaiscnpj: TStringField;
    dsrFiliais: TtecDataSource;
    ACBrPagFor: TACBrPagFor;
    qryretorno_pagfor_r3_segmentos: TtecQuery;
    qryretorno_pagfor_r3_segmentos_proximo: TtecQuery;
    qryretorno_pagfor_r3_segmentos_proximocodigo: TIntegerField;
    qryretorno_pagfor_r3_segmentospagfor: TLargeintField;
    qryretorno_pagfor_r3_segmentosregistro0: TLargeintField;
    qryretorno_pagfor_r3_segmentoscod_do_banco: TStringField;
    qryretorno_pagfor_r3_segmentoslote_de_serv: TStringField;
    qryretorno_pagfor_r3_segmentosnr_seq_reg_lote: TStringField;
    qryretorno_pagfor_r3_segmentossegmento: TStringField;
    qryretorno_pagfor_r3pagfor: TLargeintField;
    qryretorno_pagfor_r3tp_de_serv: TStringField;
    qryretorno_pagfor_r3desc_tp_de_serv: TStringField;
    qryretorno_pagfor_r3forma_lancto: TStringField;
    qryretorno_pagfor_r3desc_forma_lancto: TStringField;
    qryretorno_pagfor_r3oc_retorno: TStringField;
    qryretorno_pagfor_r3desc_oc_retorno: TStringField;
    qryretorno_pagfor_r3_segAdesc_tipo_de_movimento: TStringField;
    qryretorno_pagfor_r3_segAdesc_cd_ins_movto: TStringField;
    qryretorno_pagfor_r3_segAdesc_cd_cam_comp: TStringField;
    qryretorno_pagfor_r3_segAdesc_em_aviso_fav: TStringField;
    qryretorno_pagfor_r3_segAdesc_oc_retorno: TStringField;
    qryretorno_pagfor_r3_segBdesc_cod_hist_cred: TStringField;
    qryretorno_pagfor_r3_segBdesc_oc_retorno: TStringField;
    qryretorno_pagfor_r3_segJdesc_tipo_de_movimento: TStringField;
    qryretorno_pagfor_r3_segJdesc_cd_ins_movto: TStringField;
    qryretorno_pagfor_r3_segJdesc_cd_da_moeda: TStringField;
    qryretorno_pagfor_r3_segJdesc_oc_retorno: TStringField;
    qryRetorno_pagfor_r3_segNdesc_tipo_de_movimento: TStringField;
    qryRetorno_pagfor_r3_segNdesc_cd_ins_movto: TStringField;
    qryRetorno_pagfor_r3_segNdesc_oc_retorno: TStringField;
    qryRetorno_pagfor_r3_segOdesc_tipo_de_movimento: TStringField;
    qryRetorno_pagfor_r3_segOdesc_cd_ins_movto: TStringField;
    qryRetorno_pagfor_r3_segOdesc_oc_retorno: TStringField;
    qryRetorno_pagfor_r3_segWdesc_oc_retorno: TStringField;
    qryRetorno_pagfor_r3_segZdesc_oc_retorno: TStringField;
    qryDuplicatasconciliar: TBooleanField;
    qryDuplicataspagfor: TIntegerField;
    qryretorno_pagfor_r3totalconciliado: TFloatField;
    qryretorno_pagfor_r3SaldoConciliar: TCurrencyField;
    qryDuplicatasvalordesconto: TFloatField;
    qryDuplicatasjuros: TFloatField;
    qryDuplicatasmulta: TFloatField;
    qryDuplicatasmultajuros: TFloatField;
    qryretorno_pagfor_r3_segApagfor: TLargeintField;
    qryretorno_pagfor_r3_segGpagfor: TLargeintField;
    qryretorno_pagfor_r3_segJpagfor: TLargeintField;
    qryRetorno_pagfor_r3_segNpagfor: TLargeintField;
    qryRetorno_pagfor_r3_segOpagfor: TLargeintField;
    qryDuplicatascontapagto: TIntegerField;
    qryretorno_pagfor_r3nr_da_conta_cor: TStringField;
    qryretorno_pagfor_r3contacontabil: TIntegerField;
    qryDuplicatasAux_: TtecQuery;
    qryDuplicatasAux_documentopag: TIntegerField;
    qryDuplicatasAux_numero: TIntegerField;
    qryDuplicatasAux_pagfor: TIntegerField;
    qryDuplicatasfilialpagto: TIntegerField;
    qryDuplicatasusuario: TIntegerField;
    qryretorno_pagfor_r3_G: TtecQuery;
    qryretorno_pagfor_r3_Gregistro0: TLargeintField;
    qryDuplicatas_PagFor: TtecQuery;
    qryretorno_pagfor_r3_segGnr_da_conta_cor: TStringField;
    qryretorno_pagfor_r3_segGtotalconciliado: TFloatField;
    qryDuplicatascontacredito: TIntegerField;
    qryDuplicatastipopagamento: TIntegerField;
    qryDuplicatasobservacao: TStringField;
    qryDuplicatasevento: TIntegerField;
    qryretorno_pagfor_r3_segGSaldoConciliar: TCurrencyField;
    qryDuplicatas_PagForSegG: TtecQuery;
    qryDuplicatas_PagForSegGdocumentopag: TIntegerField;
    qryDuplicatas_PagForSegGnumero: TIntegerField;
    qryDuplicatas_PagForSegGdatavencto: TDateField;
    qryDuplicatas_PagForSegGpagfor: TIntegerField;
    qryDuplicatas_PagForSegGoperacao: TStringField;
    qryDuplicatas_PagForSegGvalorvencto: TFloatField;
    qryDuplicatas_PagForSegGvalordesconto: TFloatField;
    qryDuplicatas_PagForSegGobservacao: TStringField;
    qryDuplicatas_PagForSegGdatapagto: TDateField;
    qryDuplicatas_PagForSegGvalorpagto: TFloatField;
    qryDuplicatas_PagForSegGcontapagto: TIntegerField;
    qryDuplicatas_PagForSegGevento: TIntegerField;
    qryDuplicatas_PagForSegGcontacredito: TIntegerField;
    qryDuplicatas_PagForSegGfilialpagto: TIntegerField;
    qryDuplicatas_PagForSegGusuario: TIntegerField;
    qryDuplicatas_PagForSegGtipopagamento: TIntegerField;
    qryDuplicatas_PagFordocumentopag: TIntegerField;
    qryDuplicatas_PagFornumero: TIntegerField;
    qryDuplicatas_PagFordatavencto: TDateField;
    qryDuplicatas_PagForvalorvencto: TFloatField;
    qryDuplicatas_PagForvalordesconto: TFloatField;
    qryDuplicatas_PagForobservacao: TStringField;
    qryDuplicatas_PagFordatapagto: TDateField;
    qryDuplicatas_PagForvalorpagto: TFloatField;
    qryDuplicatas_PagForcontapagto: TIntegerField;
    qryDuplicatas_PagForevento: TIntegerField;
    qryDuplicatas_PagForcontacredito: TIntegerField;
    qryDuplicatas_PagForfilialpagto: TIntegerField;
    qryDuplicatas_PagForusuario: TIntegerField;
    qryDuplicatas_PagFortipopagamento: TIntegerField;
    qryDuplicatas_PagForpagfor: TIntegerField;
    qryDuplicatas_PagForoperacao: TStringField;
    qryAtualizacoes_Identif_Dupl_Pendentes: TtecQuery;
    qryDuplicatas_PagForSegGpagforg_duplicata: TIntegerField;
    qryDuplicatas_PagForpagfor_duplicata: TIntegerField;
    qryAtualizacoes_Identif_Dupl_Pendentescancelamento_da_identificacao: TLargeintField;
    qryAtualizacoes_Identif_Dupl_Pendentesidentificacao: TLargeintField;
    qryAtualizacoes_Identif_Dupl_Pendentesagg_identificacao: TMemoField;
    qryAtualizacoes_Identif_Dupl_Pendentescancelamento_do_pagamento: TLargeintField;
    qryAtualizacoes_Identif_Dupl_Pendentespagamento: TLargeintField;
    qryAtualizacoes_Identif_Dupl_Pendentesagg_pagamento: TMemoField;
    qryAtualizar_Identificacoes_Pendentes: TtecQuery;
    qryretorno_pagfor_r3filial: TIntegerField;
    qryAtualizar_Dupl_Pendentes: TtecQuery;
    qryDuplicatasAux_pagforg: TIntegerField;
    qryDuplicatas_PagFordatapgto_duplicata: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryretorno_pagfor_r0AfterOpen(DataSet: TDataSet);
    procedure qryretorno_pagfor_r3AfterScroll(DataSet: TDataSet);
    procedure qryDuplicatasconciliarChange(Sender: TField);
    procedure qryDuplicatasAfterPost(DataSet: TDataSet);
    procedure qryretorno_pagfor_r3CalcFields(DataSet: TDataSet);
    procedure qryretorno_pagfor_r3AfterOpen(DataSet: TDataSet);
    procedure qryDuplicatasAfterOpen(DataSet: TDataSet);
    procedure qryretorno_pagfor_r3_segAAfterOpen(DataSet: TDataSet);
    procedure qryretorno_pagfor_r3_segGAfterOpen(DataSet: TDataSet);
    procedure qryretorno_pagfor_r3_segJAfterOpen(DataSet: TDataSet);
    procedure qryRetorno_pagfor_r3_segNAfterOpen(DataSet: TDataSet);
    procedure qryRetorno_pagfor_r3_segOAfterOpen(DataSet: TDataSet);
    procedure qryretorno_pagfor_r3_segGAfterScroll(DataSet: TDataSet);
    procedure qryretorno_pagfor_r3_segGCalcFields(DataSet: TDataSet);
  protected
    Usuario: TtecUsuarios;
  private
    v_DocumentoPag, v_Numero : integer;
    fGerandoConsulta: tGerandoConsulta;
    fDiasAcima: integer;
    fDiasAbaixo: integer;
    fPercentualValorAbaixo: Currency;
    fPercentualValorAcima: Currency;
    fLimitePercentualAtivo: Boolean;
    fFiltrarPorNome: Boolean;
    fdtmContasPagar: TdtmContasPagar;
    fSegmentoG: Boolean;
    fRegistrosPendentesdeGravacao: boolean;
    { Private declarations }

    procedure AbrirTabelasRetorno(ListaLotes, ListaLotes_SegG: String);
    procedure IncluirSegmento(Nr_Seq_Reg_Lote: Integer; Segmento: String);
    procedure SetGerandoConsulta(const Value: tGerandoConsulta);
    function getdtmContasPagar: TdtmContasPagar;
    procedure SetSegmentoG(const Value: Boolean);
    function Conciliar(pConciliar: Boolean): Boolean;

  public
    { Public declarations }

    ModoIntermitente : Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;


    function LerArquivo(Arquivo : String): Boolean;
    procedure AbrirDetalhes;
    procedure FecharDetalhes;
    procedure HabilitarControles(Habilitar: Boolean);
    function VerificarInformacoesdoArquivo(NomeArquivo: String): boolean;
    property GerandoConsulta: tGerandoConsulta read fGerandoConsulta write SetGerandoConsulta;
    procedure AbrirConsultaRetorno(DataInicial, DataFinal: String);
//  procedure PosicionarPagamentoSegmento;
//  procedure PosicionarSegmentoPagamento;
//  procedure PosicionarSegGPagamento;

    property DiasAbaixo: integer read fDiasAbaixo write fDiasAbaixo;
    property DiasAcima: integer read fDiasAcima write fDiasAcima;

    property PercentualValorAbaixo: Currency read fPercentualValorAbaixo write fPercentualValorAbaixo;
    property PercentualValorAcima: Currency read fPercentualValorAcima write fPercentualValorAcima;
    property LimitePercentualAtivo: Boolean read fLimitePercentualAtivo write fLimitePercentualAtivo;

    property FiltrarPorNome: Boolean read fFiltrarPorNome write fFiltrarPorNome;

    procedure GuardarPosicaoDuplicatas;
    procedure RestaurarPosicaoDuplicatas;

//  procedure PosicionarPagFor(Grid: TDBAdvGrid; pagfor: String);
    procedure PosicionarPagFor_(Tabela: TTecQuery;
                                CampoPesquisaTabela: String;
                                ConteudoCampoPesquisaTabela: String;

                                Grid: TDBAdvGrid;
                                CampoPesquisaGrid: String;
                                ConteudoCampoPesquisaGrid: String);

    property dtmContasPagar: TdtmContasPagar read getdtmContasPagar write fdtmContasPagar;
    property SegmentoG: Boolean read fSegmentoG write SetSegmentoG;
    property RegistrosPendentesdeGravacao: boolean read fRegistrosPendentesdeGravacao write fRegistrosPendentesdeGravacao;

    procedure VerificarRegistrosPendentesdeGravacao;

    function SalvarRetornoPagFor: Boolean;





  end;

{
var
  dtmLerRetornoPagFor: TdtmLerRetornoPagFor;
  }

implementation

uses ACBrPagForClass, fmLerRetornoPagFor;

{$R *.dfm}

procedure TdtmLerRetornoPagFor.AbrirConsultaRetorno(DataInicial, DataFinal: String);
var
  vLista, vListaSegG: String;
begin
  case gerandoconsulta of

    viaParametros:
    begin
      if (datainicial <> '') and (datafinal <> '') then
        qryretorno_pagfor_r3.MacroByName('SQL').asString :=
          'cast(r0.datahora as date) between :datainicial and :datafinal'
      else
      if (datainicial <> '') and (datafinal = '') then
      qryretorno_pagfor_r3.MacroByName('SQL').asString :=
        'cast(r0.datahora as date) >= :datainicial'
      else
      if (datainicial = '') and (datafinal <> '') then
      qryretorno_pagfor_r3.MacroByName('SQL').asString :=
        'cast(r0.datahora as date) >= :datainicial';
    end;

    MultiplosArquivos:
    begin
      qryretorno_pagfor_r3.MacroByName('SQL').asString :=
        'cast(r0.datahora as date) between :datainicial and :datafinal';
    end;

    UnicoArquico:
    begin
      qryretorno_pagfor_r3.MacroByName('SQL').asString := 'r0.codigo = '+
        qryretorno_pagfor_r0codigo.asString;
    end;

    PendenciasdeGravacao:
    begin
      qryretorno_pagfor_r3.MacroByName('SQL').asString := 'segmentos.pagfor in ('+qryAtualizacoes_Identif_Dupl_Pendentesagg_pagamento.asString+')';
      qryretorno_pagfor_r3_G.MacroByName('SQL').asString := 'segmentos.pagfor in ('+qryAtualizacoes_Identif_Dupl_Pendentesagg_identificacao.asString+')';
    end;
  end;

  if GerandoConsulta <> PendenciasdeGravacao then
  begin
    if datainicial<>'' then
      qryretorno_pagfor_r3.parambyname('datainicial').AsDate :=strtodate(DataInicial)
    else
      qryretorno_pagfor_r3.parambyname('datainicial').asString := '';

    if DataFinal<>'' then
      qryretorno_pagfor_r3.parambyname('datafinal').AsDate :=strtodate(DataFinal)
    else
      qryretorno_pagfor_r3.parambyname('datafinal').asString := '';

    qryretorno_pagfor_r3_G.params := qryretorno_pagfor_r3.params;
    qryretorno_pagfor_r3_G.macros := qryretorno_pagfor_r3.macros;
  end;

  qryretorno_pagfor_r3.close;
  qryretorno_pagfor_r3.open;

  qryretorno_pagfor_r3_G.close;
  qryretorno_pagfor_r3_G.open;


  vLista := RetornarLista(qryretorno_pagfor_r3, qryretorno_pagfor_r3registro0, nil, true);
  vListaSegG := RetornarLista(qryretorno_pagfor_r3_G, qryretorno_pagfor_r3_Gregistro0, nil, true);


  if vlista = '' then
    vLista := '0';

  if vlistaSegG = '' then
    vListaSegG := '0';


  AbrirTabelasRetorno(vLista, vListaSegG);

end;

procedure TdtmLerRetornoPagFor.AbrirDetalhes;
begin

  if SegmentoG then {AdvTabSheetSegG}
  begin
    qryretorno_pagfor_r0.MasterSource := dsrretorno_pagfor_r3_segG;
    qryretorno_pagfor_r0_Text.MasterSource := dsrretorno_pagfor_r3_segG;

    qryretorno_pagfor_trailer_tipo_9.MasterSource := dsrretorno_pagfor_r3_segG;
    qryretorno_pagfor_r1.MasterSource := dsrretorno_pagfor_r3_segG;
    qryretorno_pagfor_trailer_tipo_5.MasterSource := dsrretorno_pagfor_r3_segG;

    qryretorno_pagfor_r3_segB.MasterSource := dsrretorno_pagfor_r3_segG;
    qryretorno_pagfor_r3_segH.MasterSource := dsrretorno_pagfor_r3_segG;
    qryretorno_pagfor_r3_segJ52.MasterSource := dsrretorno_pagfor_r3_segG;
    qryretorno_pagfor_r3_segW.MasterSource := dsrretorno_pagfor_r3_segG;
    qryretorno_pagfor_r3_segZ.MasterSource := dsrretorno_pagfor_r3_segG;
  end
  else
  if qryretorno_pagfor_r3segmento.asString = 'A' then {AdvTabSheetSegA}
  begin
    qryretorno_pagfor_r0.MasterSource := dsrretorno_pagfor_r3_segA;
    qryretorno_pagfor_r0_Text.MasterSource := dsrretorno_pagfor_r3_segA;

    qryretorno_pagfor_trailer_tipo_9.MasterSource := dsrretorno_pagfor_r3_segA;
    qryretorno_pagfor_r1.MasterSource := dsrretorno_pagfor_r3_segA;
    qryretorno_pagfor_trailer_tipo_5.MasterSource := dsrretorno_pagfor_r3_segA;

    qryretorno_pagfor_r3_segB.MasterSource := dsrretorno_pagfor_r3_segA;
    qryretorno_pagfor_r3_segH.MasterSource := dsrretorno_pagfor_r3_segA;
    qryretorno_pagfor_r3_segJ52.MasterSource := dsrretorno_pagfor_r3_segA;
    qryretorno_pagfor_r3_segW.MasterSource := dsrretorno_pagfor_r3_segA;
    qryretorno_pagfor_r3_segZ.MasterSource := dsrretorno_pagfor_r3_segA;
  end
  else
  if qryretorno_pagfor_r3segmento.asString = 'J' then {AdvTabSheetSegJ}
  begin
    qryretorno_pagfor_r0.MasterSource := dsrretorno_pagfor_r3_segJ;
    qryretorno_pagfor_r0_Text.MasterSource := dsrretorno_pagfor_r3_segJ;

    qryretorno_pagfor_r0_Text.MasterSource := dsrretorno_pagfor_r3_segJ;

    qryretorno_pagfor_trailer_tipo_9.MasterSource := dsrretorno_pagfor_r3_segJ;
    qryretorno_pagfor_r1.MasterSource := dsrretorno_pagfor_r3_segJ;
    qryretorno_pagfor_trailer_tipo_5.MasterSource := dsrretorno_pagfor_r3_segJ;

    qryretorno_pagfor_r3_segB.MasterSource := dsrretorno_pagfor_r3_segJ;
    qryretorno_pagfor_r3_segH.MasterSource := dsrretorno_pagfor_r3_segJ;
    qryretorno_pagfor_r3_segJ52.MasterSource := dsrretorno_pagfor_r3_segJ;

    qryretorno_pagfor_r3_segW.MasterSource := dsrretorno_pagfor_r3_segJ;
    qryretorno_pagfor_r3_segZ.MasterSource := dsrretorno_pagfor_r3_segJ;
  end
  else
  if qryretorno_pagfor_r3segmento.asString = 'N' then {AdvTabSheetSegN}
  begin
    qryretorno_pagfor_r0.MasterSource := dsrretorno_pagfor_r3_segN;
    qryretorno_pagfor_r0_Text.MasterSource := dsrretorno_pagfor_r3_segN;

    qryretorno_pagfor_trailer_tipo_9.MasterSource := dsrretorno_pagfor_r3_segN;
    qryretorno_pagfor_r1.MasterSource := dsrretorno_pagfor_r3_segN;
    qryretorno_pagfor_trailer_tipo_5.MasterSource := dsrretorno_pagfor_r3_segN;

    qryretorno_pagfor_r3_segB.MasterSource := dsrretorno_pagfor_r3_segN;
    qryretorno_pagfor_r3_segH.MasterSource := dsrretorno_pagfor_r3_segN;
    qryretorno_pagfor_r3_segJ52.MasterSource := dsrretorno_pagfor_r3_segN;
    qryretorno_pagfor_r3_segW.MasterSource := dsrretorno_pagfor_r3_segN;
    qryretorno_pagfor_r3_segZ.MasterSource := dsrretorno_pagfor_r3_segN;
  end
  else
  if qryretorno_pagfor_r3segmento.asString = 'O' then {AdvTabSheetSegO}
  begin
    qryretorno_pagfor_r0.MasterSource := dsrretorno_pagfor_r3_segO;
    qryretorno_pagfor_r0_Text.MasterSource := dsrretorno_pagfor_r3_segO;

    qryretorno_pagfor_trailer_tipo_9.MasterSource := dsrretorno_pagfor_r3_segO;
    qryretorno_pagfor_r1.MasterSource := dsrretorno_pagfor_r3_segO;
    qryretorno_pagfor_trailer_tipo_5.MasterSource := dsrretorno_pagfor_r3_segO;

    qryretorno_pagfor_r3_segB.MasterSource := dsrretorno_pagfor_r3_segO;
    qryretorno_pagfor_r3_segH.MasterSource := dsrretorno_pagfor_r3_segO;
    qryretorno_pagfor_r3_segJ52.MasterSource := dsrretorno_pagfor_r3_segO;
    qryretorno_pagfor_r3_segW.MasterSource := dsrretorno_pagfor_r3_segO;
    qryretorno_pagfor_r3_segZ.MasterSource := dsrretorno_pagfor_r3_segO;
  end;
end;

procedure TdtmLerRetornoPagFor.AbrirTabelasRetorno(ListaLotes, ListaLotes_SegG: String);
var
  vLista: String;
begin
  vLista := '';

  if (ListaLotes <> '') and (ListaLotes_SegG <> '') then
    vLista := ListaLotes +  ', ' + ListaLotes_SegG
  else
  if (ListaLotes <> '') and (ListaLotes_SegG = '') then
    vLista := ListaLotes
  else
  if (ListaLotes = '') and (ListaLotes_SegG <> '') then
    vLista := ListaLotes_SegG;


  qryretorno_pagfor_r0.macrobyname('SQL').asString := 'r0.codigo in ('+ vLista +')';
  qryretorno_pagfor_r1.macrobyname('SQL').asString := 'r1.registro0 in ('+ vLista +')';

  qryretorno_pagfor_r3_segmentos.macrobyname('SQL').asString := 'seg.registro0 in ('+ vLista +')';

  qryretorno_pagfor_r3_segA.macrobyname('SQL').asString := 'segA.registro0 in ('+ ListaLotes +')';
  qryretorno_pagfor_r3_segB.macrobyname('SQL').asString := 'segB.registro0 in ('+ ListaLotes +')';
  qryretorno_pagfor_r3_segG.macrobyname('SQL').asString := 'segG.registro0 in ('+ ListaLotes_SegG +')';
  qryretorno_pagfor_r3_segH.macrobyname('SQL').asString := 'segH.registro0 in ('+ ListaLotes_SegG +')';
  qryretorno_pagfor_r3_segJ.macrobyname('SQL').asString := 'segJ.registro0 in ('+ ListaLotes +')';
  qryretorno_pagfor_r3_segJ52.macrobyname('SQL').asString := 'segJ52.registro0 in ('+ ListaLotes +')';
  qryRetorno_pagfor_r3_segN.macrobyname('SQL').asString := 'segN.registro0 in ('+ ListaLotes +')';
  qryRetorno_pagfor_r3_segN1.macrobyname('SQL').asString := 'segN1.registro0 in ('+ ListaLotes +')';
  qryRetorno_pagfor_r3_segN2.macrobyname('SQL').asString := 'segN2.registro0 in ('+ ListaLotes +')';
  qryRetorno_pagfor_r3_segN3.macrobyname('SQL').asString := 'segN3.registro0 in ('+ ListaLotes +')';
  qryRetorno_pagfor_r3_segN4.macrobyname('SQL').asString := 'segN4.registro0 in ('+ ListaLotes +')';
  qryRetorno_pagfor_r3_segO.macrobyname('SQL').asString := 'segO.registro0 in ('+ ListaLotes +')';
  qryRetorno_pagfor_r3_segW.macrobyname('SQL').asString := 'segW.registro0 in ('+ ListaLotes +')';
  qryretorno_pagfor_r3_segZ.macrobyname('SQL').asString := 'segZ.registro0 in ('+ ListaLotes +')';
  qryretorno_pagfor_trailer_tipo_5.macrobyname('SQL').asString := 'r5.registro0 in ('+ vLista +')';
  qryretorno_pagfor_trailer_tipo_9.macrobyname('SQL').asString := 'r9.registro0 in ('+ vLista +')';

  qryretorno_pagfor_r0.close;
  qryretorno_pagfor_r1.close;
  qryretorno_pagfor_r3_segA.close;
  qryretorno_pagfor_r3_segB.close;
  qryretorno_pagfor_r3_segG.close;
  qryretorno_pagfor_r3_segH.close;
  qryretorno_pagfor_r3_segJ.close;
  qryretorno_pagfor_r3_segJ52.close;
  qryRetorno_pagfor_r3_segN.close;
  qryRetorno_pagfor_r3_segN1.close;
  qryRetorno_pagfor_r3_segN2.close;
  qryRetorno_pagfor_r3_segN3.close;
  qryRetorno_pagfor_r3_segN4.close;
  qryRetorno_pagfor_r3_segO.close;
  qryRetorno_pagfor_r3_segW.close;
  qryretorno_pagfor_r3_segZ.close;
  qryretorno_pagfor_trailer_tipo_5.close;
  qryretorno_pagfor_trailer_tipo_9.close;

  qryretorno_pagfor_r0.open;
  qryretorno_pagfor_r1.open;
  qryretorno_pagfor_r3_segA.open;
  qryretorno_pagfor_r3_segB.open;
  qryretorno_pagfor_r3_segG.open;
  qryretorno_pagfor_r3_segH.open;
  qryretorno_pagfor_r3_segJ.open;
  qryretorno_pagfor_r3_segJ52.open;
  qryRetorno_pagfor_r3_segN.open;
  qryRetorno_pagfor_r3_segN1.open;
  qryRetorno_pagfor_r3_segN2.open;
  qryRetorno_pagfor_r3_segN3.open;
  qryRetorno_pagfor_r3_segN4.open;
  qryRetorno_pagfor_r3_segO.open;
  qryRetorno_pagfor_r3_segW.open;
  qryretorno_pagfor_r3_segZ.open;
  qryretorno_pagfor_trailer_tipo_5.open;
  qryretorno_pagfor_trailer_tipo_9.open;




end;

procedure TdtmLerRetornoPagFor.DataModuleCreate(Sender: TObject);
begin
  inherited;
  RemoveDataModule(Self);
end;

procedure TdtmLerRetornoPagFor.FecharDetalhes;
begin

  qryretorno_pagfor_r0.MasterSource := nil;
  qryretorno_pagfor_r0_Text.MasterSource := nil;
  qryretorno_pagfor_trailer_tipo_9.MasterSource := nil;
  qryretorno_pagfor_r1.MasterSource := nil;
  qryretorno_pagfor_trailer_tipo_5.MasterSource := nil;

  qryretorno_pagfor_r3_segB.MasterSource := nil;
  qryretorno_pagfor_r3_segH.MasterSource := nil;
  qryretorno_pagfor_r3_segJ52.MasterSource := nil;
  qryretorno_pagfor_r3_segZ.MasterSource := nil;
  qryretorno_pagfor_r3_segW.MasterSource := nil;


end;

procedure TdtmLerRetornoPagFor.HabilitarControles(Habilitar: Boolean);
begin
  if habilitar then
  begin
    qryretorno_pagfor_r0.enablecontrols;
    qryretorno_pagfor_r0_Text.enablecontrols;
    qryretorno_pagfor_r1.enablecontrols;
    qryretorno_pagfor_r3_segA.enablecontrols;
    qryretorno_pagfor_r3_segB.enablecontrols;
    qryretorno_pagfor_r3_segG.enablecontrols;
    qryretorno_pagfor_r3_segH.enablecontrols;
    qryretorno_pagfor_r3_segJ.enablecontrols;
    qryretorno_pagfor_r3_segJ52.enablecontrols;
    qryRetorno_pagfor_r3_segN.enablecontrols;
    qryRetorno_pagfor_r3_segN1.enablecontrols;
    qryRetorno_pagfor_r3_segN2.enablecontrols;
    qryRetorno_pagfor_r3_segN3.enablecontrols;
    qryRetorno_pagfor_r3_segN4.enablecontrols;
    qryRetorno_pagfor_r3_segO.enablecontrols;
    qryRetorno_pagfor_r3_segW.enablecontrols;
    qryRetorno_pagfor_r3_segZ.enablecontrols;
    qryretorno_pagfor_trailer_tipo_5.enablecontrols;
    qryretorno_pagfor_trailer_tipo_9.enablecontrols;

  end
  else
  begin
    qryretorno_pagfor_r0.disablecontrols;
    qryretorno_pagfor_r0_Text.disablecontrols;
    qryretorno_pagfor_r1.disablecontrols;
    qryretorno_pagfor_r3_segA.disablecontrols;
    qryretorno_pagfor_r3_segB.disablecontrols;
    qryretorno_pagfor_r3_segG.disablecontrols;
    qryretorno_pagfor_r3_segH.disablecontrols;
    qryretorno_pagfor_r3_segJ.disablecontrols;
    qryretorno_pagfor_r3_segJ52.disablecontrols;
    qryRetorno_pagfor_r3_segN.disablecontrols;
    qryRetorno_pagfor_r3_segN1.disablecontrols;
    qryRetorno_pagfor_r3_segN2.disablecontrols;
    qryRetorno_pagfor_r3_segN3.disablecontrols;
    qryRetorno_pagfor_r3_segN4.disablecontrols;
    qryRetorno_pagfor_r3_segO.disablecontrols;
    qryRetorno_pagfor_r3_segW.disablecontrols;
    qryRetorno_pagfor_r3_segZ.disablecontrols;
    qryretorno_pagfor_trailer_tipo_5.disablecontrols;
    qryretorno_pagfor_trailer_tipo_9.disablecontrols;
  
  end;
end;

procedure TdtmLerRetornoPagFor.IncluirSegmento(Nr_Seq_Reg_Lote: Integer;
  Segmento: String);
begin
  qryretorno_pagfor_r3_segmentos_proximo.close;
  qryretorno_pagfor_r3_segmentos_proximo.open;

  qryretorno_pagfor_r3_segmentos.append;
  qryretorno_pagfor_r3_segmentospagfor.asString :=  qryretorno_pagfor_r3_segmentos_proximoCodigo.asString;
  qryretorno_pagfor_r3_segmentosregistro0.asString := qryretorno_pagfor_r0codigo.asString;

  qryretorno_pagfor_r3_segmentoscod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
  qryretorno_pagfor_r3_segmentoslote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
  qryretorno_pagfor_r3_segmentosnr_seq_reg_lote.asInteger := Nr_Seq_Reg_Lote;
  qryretorno_pagfor_r3_segmentossegmento.asString := Segmento;

  qryretorno_pagfor_r3_segmentos.post;


end;

function TdtmLerRetornoPagFor.LerArquivo(Arquivo: String): Boolean;
var
  i, j, k, l : integer;
begin

  qrycontas.close;
  FecharDetalhes;
  ACBrPagFor.Limpar;
  result := ACBrPagFor.LerTXT(Arquivo);

  if result then
  begin
    with ACBrPagFor.Arquivos.Items[0].PagFor.Registro0 do
    begin

      if Empresa.ContaCorrente.Conta.Numero<>0 then
      begin
        qrycontas.parambyname('conta').asInteger := Empresa.ContaCorrente.Conta.Numero;
        qrycontas.open;
      end (*
      else
      if (Cedente.CodigoCedente <> '') and
         (Banco.TipoCobranca = cobSicred) then {Sicredi não tem informação da conta, porém vi que o codigocedente é a conta}
      begin
        qrycontas.close;
        qrycontas.parambyname('conta').asString := Cedente.CodigoCedente;
        qrycontas.open;
      end*);

      qryFiliais.close;
      qryfiliais.parambyname('codigo').asinteger := qryContasfilial.asinteger;
      qryFiliais.open;

      if qrycontas.recordcount = 0 then
      begin
        result := false;
        MensagemAviso(format('A conta %d existente no arquivo selecionado não esta cadastrada!', [Empresa.ContaCorrente.Conta.Numero]));
        exit;
      end;

      if qryFiliais.recordcount = 0 then
      begin
        result := false;
        MensagemAviso(format('Nenhuma filial esta vinculada a conta %d existente no arquivo selecionado!', [Empresa.ContaCorrente.Conta.Numero]));
        exit;
      end;
    end;
  end;

  try
    HabilitarControles(false);
    try
      for i:=0 to ACBrPagFor.Arquivos.Count-1 do      {TACBrPagFor(ACBrPagFor).Arquivos.last}
      begin

        qryretorno_pagfor_r0.MacroByName('SQL').asString :=
            ' r0.cod_do_banco = :cod_do_banco and        '+
            ' r0.nr_da_conta_cor = :nr_da_conta_cor and  '+
            ' r0.nr_seq = :nr_seq                       ';

        RefazConsultaPorNome(qryretorno_pagfor_r0,
         ['cod_do_banco', 'nr_da_conta_cor', 'nr_seq'],

         [BancoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Geral.Banco),
          inttostr(ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.ContaCorrente.Conta.Numero),
          inttostr(ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Arquivo.Sequencia)]);

        AbrirTabelasRetorno(IntToStr(qryretorno_pagfor_r0codigo.asinteger),
                            IntToStr(qryretorno_pagfor_r0codigo.asinteger));

        if qryretorno_pagfor_r0.isempty then
        begin

          qryretorno_pagfor_r0_proximocodigo.close;
          qryretorno_pagfor_r0_proximocodigo.open;

          {HEADER ARQUIVO}

          qryretorno_pagfor_r0.append;
          qryretorno_pagfor_r0codigo.asString := qryretorno_pagfor_r0_proximocodigocodigo.asString;
          qryretorno_pagfor_r0nomearquivo.asString := Arquivo;
      //      qryretorno_pagfor_r0conteudoarquivo
          qryretorno_pagfor_r0datahora.AsDateTime := DataHoraServidor;

          qryretorno_pagfor_r0cod_do_banco.asString := BancoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Geral.Banco);
          qryretorno_pagfor_r0lote_de_serv.asString := '0000';
          qryretorno_pagfor_r0tp_de_registro.asString := '0';
          qryretorno_pagfor_r0tp_de_inso_da_emp.asString := TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.Inscricao.Tipo);
          qryretorno_pagfor_r0nro_de_insc_da_emp.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.Inscricao.Numero;
          qryretorno_pagfor_r0cd_do_conv_no_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.Convenio;
          qryretorno_pagfor_r0ag_mant_da_conta.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.ContaCorrente.Agencia.Codigo;
          qryretorno_pagfor_r0dg_ver_da_ag.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.ContaCorrente.Agencia.DV;
          qryretorno_pagfor_r0nr_da_conta_cor.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.ContaCorrente.Conta.Numero;
          qryretorno_pagfor_r0dg_ver_da_conta.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.ContaCorrente.Conta.DV;
          qryretorno_pagfor_r0dg_ver_da_ag_e_cta.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.ContaCorrente.DV;
          qryretorno_pagfor_r0nm_da_emp.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Empresa.Nome;
          qryretorno_pagfor_r0nm_do_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.NomeBanco;
          qryretorno_pagfor_r0cd_rem_ret.asString := TpArquivoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Arquivo.Codigo);
          qryretorno_pagfor_r0dt_geracao.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Arquivo.DataGeracao;
          qryretorno_pagfor_r0hr_geracao.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Arquivo.HoraGeracao;
          qryretorno_pagfor_r0nr_seq.asinteger := ACBrPagFor.Arquivos.Items[i].PagFor.Registro0.Arquivo.Sequencia;
      //      qryretorno_pagfor_r0nr_ver_layout.asString :=

          qryretorno_pagfor_r0.post;

          {TRAILER HEADER ARQUIVO}
          qryretorno_pagfor_trailer_tipo_9.Append;

          qryretorno_pagfor_trailer_tipo_9registro0.asString := qryretorno_pagfor_r0codigo.asString;
          qryretorno_pagfor_trailer_tipo_9cod_do_banco.asString := qryretorno_pagfor_r0cod_do_banco.asString;
          qryretorno_pagfor_trailer_tipo_9lote_de_serv.asString := '9999';
          qryretorno_pagfor_trailer_tipo_9tp_de_registro.asString := '9';
          qryretorno_pagfor_trailer_tipo_9qt_de_lotes.asinteger := ACBrPagFor.Arquivos.Items[i].PagFor.Registro9.Totais.QtdeLotes;
          qryretorno_pagfor_trailer_tipo_9qt_reg.asinteger := ACBrPagFor.Arquivos.Items[i].PagFor.Registro9.Totais.QtdeRegistros;

          qryretorno_pagfor_trailer_tipo_9.post;


          for j:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Count-1 do
          begin

            { LOTE }
            qryretorno_pagfor_r1.append;
            qryretorno_pagfor_r1registro0.asString := qryretorno_pagfor_r0codigo.asString;
            qryretorno_pagfor_r1cod_do_banco.asString := qryretorno_pagfor_r0cod_do_banco.asString;
            qryretorno_pagfor_r1lote_de_serv.asInteger := j+1; { ? }
            qryretorno_pagfor_r1tp_de_registro.asString := '1';
            qryretorno_pagfor_r1tp_da_op.asString := TpOperacaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Servico.Operacao);
            qryretorno_pagfor_r1tp_de_serv.asString := TpServicoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Servico.TipoServico);
            qryretorno_pagfor_r1forma_lancto.asString := FmLancamentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Servico.FormaLancamento);

      //      qryretorno_pagfor_r1nro_da_ver_do_lote: TStringField;
            qryretorno_pagfor_r1tp_de_inso_da_emp.asString := TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Empresa.Inscricao.Tipo);
            qryretorno_pagfor_r1nro_de_insc_da_emp.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Empresa.Inscricao.Numero;
            qryretorno_pagfor_r1cd_do_conv_no_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Empresa.Convenio;
            qryretorno_pagfor_r1ag_mant_da_conta.asinteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Empresa.ContaCorrente.Agencia.Codigo;

            qryretorno_pagfor_r1dg_ver_da_ag.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Empresa.ContaCorrente.Agencia.DV;
            qryretorno_pagfor_r1nr_da_conta_cor.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Empresa.ContaCorrente.Conta.Numero;

            qryretorno_pagfor_r1dg_ver_da_conta.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Empresa.ContaCorrente.Conta.DV;
            qryretorno_pagfor_r1dg_ver_da_ag_e_cta.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Empresa.ContaCorrente.DV;

            qryretorno_pagfor_r1nm_da_emp.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Empresa.Nome;

            qryretorno_pagfor_r1endereco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Endereco.Logradouro;
            qryretorno_pagfor_r1numero.asinteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Endereco.Numero;
            qryretorno_pagfor_r1complemento.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Endereco.Complemento;
            qryretorno_pagfor_r1cidade.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Endereco.Cidade;
            qryretorno_pagfor_r1cep.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Endereco.CEP;
            qryretorno_pagfor_r1uf.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro1.Endereco.Estado;
      //      qryretorno_pagfor_r1oc_retorno: TStringField;
      //      qryretorno_pagfor_r1tp_de_serv_descricao: TStringField;
            qryretorno_pagfor_r1.post;

            { TRAILER LOTE }
            qryretorno_pagfor_trailer_tipo_5.append;

            qryretorno_pagfor_trailer_tipo_5registro0.asString := qryretorno_pagfor_r0codigo.asString;
            qryretorno_pagfor_trailer_tipo_5cod_do_banco.asString := qryretorno_pagfor_r0cod_do_banco.asString;
            qryretorno_pagfor_trailer_tipo_5lote_de_serv.asinteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
            qryretorno_pagfor_trailer_tipo_5tp_de_registro.asString := qryretorno_pagfor_r1tp_de_registro.asString;

            qryretorno_pagfor_trailer_tipo_5qt_reg.AsInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro5.QtdadeRegistrosLote;
            qryretorno_pagfor_trailer_tipo_5soma_valores.AsFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro5.Valor;
            qryretorno_pagfor_trailer_tipo_5soma_qt_moedas.AsFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].Registro5.QtdeMoeda;
    //        qryretorno_pagfor_trailer_tipo_5nr_aviso_debito: TStringField;
    //        qryretorno_pagfor_trailer_tipo_5oc_retorno: TStringField;

            qryretorno_pagfor_trailer_tipo_5.post;

            {SEGMENTO A}
            for k:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Count-1 do
            begin

              IncluirSegmento(k+1, 'A');

              qryretorno_pagfor_r3_segA.append;

              qryretorno_pagfor_r3_segAregistro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryretorno_pagfor_r3_segAcod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryretorno_pagfor_r3_segAlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryretorno_pagfor_r3_segAtp_de_registro.asString := '3';
              qryretorno_pagfor_r3_segAnr_seq_reg_lote.asInteger := k+1;

              qryretorno_pagfor_r3_segAsegmento.asString := 'A';
              qryretorno_pagfor_r3_segAtipo_de_movimento.asString := TpMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].TipoMovimento);
              qryretorno_pagfor_r3_segAcd_ins_movto.asString := InMovimentotoStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].CodMovimento);

              qryretorno_pagfor_r3_segAcd_cam_comp.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Favorecido.Camara;
              qryretorno_pagfor_r3_segAcod_banco_fav.asString := BancotoStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Favorecido.Banco);
              qryretorno_pagfor_r3_segAcod_ag_fav.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Favorecido.ContaCorrente.Agencia.Codigo;
              qryretorno_pagfor_r3_segAdg_ver_ag_fav.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Favorecido.ContaCorrente.Agencia.DV;

              qryretorno_pagfor_r3_segAnr_da_conta_cor_fav.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Favorecido.ContaCorrente.Conta.Numero;
              qryretorno_pagfor_r3_segAdg_ver_da_conta_fav.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Favorecido.ContaCorrente.Conta.DV;

              qryretorno_pagfor_r3_segAdg_ver_da_ag_e_cta_fav.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Favorecido.ContaCorrente.DV;

              qryretorno_pagfor_r3_segAnm_fav.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Favorecido.Nome;
              qryretorno_pagfor_r3_segAnr_doc_cliente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Credito.SeuNumero;

              qryretorno_pagfor_r3_segAdata_pagto.asdateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Credito.DataPagamento;

    //          qryretorno_pagfor_r3_segAtp_moeda.asString :=
    //          qryretorno_pagfor_r3_segAqtdade_moeda.asString :=

              qryretorno_pagfor_r3_segAvlr_pagto.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Credito.ValorPagamento;
              qryretorno_pagfor_r3_segAnro_docto_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Credito.NossoNumero;
              qryretorno_pagfor_r3_segAdt_real_pagto.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Credito.DataReal;
              qryretorno_pagfor_r3_segAvlr_real_pagto.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Credito.ValorReal;
              qryretorno_pagfor_r3_segAoutras_informacoes.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Informacao2;
              qryretorno_pagfor_r3_segAfinalidade.asString :=  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].CodigoDOC;
              qryretorno_pagfor_r3_segAem_aviso_fav.asinteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].Aviso;
              qryretorno_pagfor_r3_segAoc_retorno.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.items[k].CodOcorrencia;
              qryretorno_pagfor_r3_segA.post;

              {SEGMENTO Z DENTRO DO A}
              for l:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoZ.Count-1 do
              begin

                qryRetorno_pagfor_r3_segZ.append;
                qryRetorno_pagfor_r3_segZregistro0.asString := qryretorno_pagfor_r0codigo.asString;
                qryRetorno_pagfor_r3_segZcod_do_banco.asString := qryretorno_pagfor_r3_segAcod_do_banco.asString;
                qryRetorno_pagfor_r3_segZlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
                qryRetorno_pagfor_r3_segZtp_de_registro.asString := '3';
                qryRetorno_pagfor_r3_segZnr_seq_reg_lote.asinteger := qryretorno_pagfor_r3_segAnr_seq_reg_lote.asInteger;

                qryRetorno_pagfor_r3_segZsegmento.asString := 'Z';
                qryRetorno_pagfor_r3_segZaut_pagto.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoZ.Items[l].Autenticacao;
                qryRetorno_pagfor_r3_segZprot_pagto.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoZ.Items[l].SeuNumero;
                qryRetorno_pagfor_r3_segZ.post;

              end;

              {SEGMENTO B DENTRO DO A}
              for l:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Count-1 do
              begin

                qryretorno_pagfor_r3_segB.append;

                qryRetorno_pagfor_r3_segBregistro0.asString := qryretorno_pagfor_r0codigo.asString;
                qryRetorno_pagfor_r3_segBcod_do_banco.asString := qryretorno_pagfor_r3_segAcod_do_banco.asString;
                qryRetorno_pagfor_r3_segBlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
                qryRetorno_pagfor_r3_segBtp_de_registro.asString := '3';
                qryRetorno_pagfor_r3_segBnr_seq_reg_lote.asinteger := qryretorno_pagfor_r3_segAnr_seq_reg_lote.asInteger;

                qryRetorno_pagfor_r3_segBsegmento.asString := 'B';

                qryretorno_pagfor_r3_segBtp_de_inso_fav.asString :=
                  TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Inscricao.Tipo);

                qryretorno_pagfor_r3_segBcnpj_cpf_fav.AsString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Inscricao.Numero;

                qryretorno_pagfor_r3_segBlogradouro_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Endereco.Logradouro;

                qryretorno_pagfor_r3_segBnr_local_fav.asInteger :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Endereco.Numero;

                qryretorno_pagfor_r3_segBcompl_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Endereco.Complemento;

                qryretorno_pagfor_r3_segBbairro_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Endereco.Bairro;

                qryretorno_pagfor_r3_segBcidade_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Endereco.Cidade;

                qryretorno_pagfor_r3_segBcep_fav.asinteger :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Endereco.CEP;

                qryretorno_pagfor_r3_segBestado_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Endereco.Estado;

                qryretorno_pagfor_r3_segBdata_vencto.asDateTime :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].DataVencimento;

                qryretorno_pagfor_r3_segBvlr_doc.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Valor;

                qryretorno_pagfor_r3_segBvlr_abat.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Abatimento;

                qryretorno_pagfor_r3_segBvlr_desconto.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Desconto;

                qryretorno_pagfor_r3_segBvlr_mora.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Mora;

                qryretorno_pagfor_r3_segBvlr_multa.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].Multa;

                qryretorno_pagfor_r3_segBhora_env_ted.asDatetime :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].hora_env_ted;

                qryretorno_pagfor_r3_segBcod_hist_cred.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].cod_hist_cred;

                qryretorno_pagfor_r3_segBoc_retorno.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoA.Items[k].SegmentoB.Items[l].CodOcorrencia;

                qryRetorno_pagfor_r3_segB.post;
              end;
            end;


            {SEGMENTO G}
            for k:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.Count-1 do
            begin
              IncluirSegmento(k+1, 'G');

              qryretorno_pagfor_r3_segG.append;

              qryretorno_pagfor_r3_segGregistro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryretorno_pagfor_r3_segGcod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryretorno_pagfor_r3_segGlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryretorno_pagfor_r3_segGtp_de_registro.asString := '3';
              qryretorno_pagfor_r3_segGnr_seq_reg_lote.asInteger := k+1;

              qryretorno_pagfor_r3_segGsegmento.asString := 'G';

              qryretorno_pagfor_r3_segGcd_de_mov_rem.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].cd_de_mov_rem;

              qryretorno_pagfor_r3_segGcod_de_barras.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].CodigoBarras;
              qryretorno_pagfor_r3_segGtp_de_insc_ced.asString := TpInscricaotoStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].Cedente.Inscricao.Tipo);
              qryretorno_pagfor_r3_segGnr_insc_ced.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].Cedente.Inscricao.Numero;

              qryretorno_pagfor_r3_segGnome_do_cedente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].Cedente.Nome;
              qryretorno_pagfor_r3_segGdt_vencto.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].Vencimento;
              qryretorno_pagfor_r3_segGvlr_nominal.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].ValorTitulo;
              qryretorno_pagfor_r3_segGqt_moeda.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].QtdeMoeda;
              qryretorno_pagfor_r3_segGcd_da_moeda.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].CodigoMoeda;
              qryretorno_pagfor_r3_segGnr_doc_cob.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].NumeroDocumento;
              qryretorno_pagfor_r3_segGag_enc_cob.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].AgenciaCobradora;
              qryretorno_pagfor_r3_segGdg_ver_ag.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].DVCobradora;
              qryretorno_pagfor_r3_segGpr_cobradora.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].Praca ;
              qryretorno_pagfor_r3_segGcd_carteira.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].Carteira;
              qryretorno_pagfor_r3_segGesp_titulo.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].EspecieTitulo;
              qryretorno_pagfor_r3_segGdt_emissao.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].DataEmissao;
              qryretorno_pagfor_r3_segGjr_mora_dia.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].JurosMora;
              qryretorno_pagfor_r3_segGcd_desconto.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].Desconto1.Codigo;
              qryretorno_pagfor_r3_segGdt_desconto.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].Desconto1.Data;
              qryretorno_pagfor_r3_segGvlr_per_desc.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].Desconto1.Valor;
              qryretorno_pagfor_r3_segGcd_protesto.asinteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].CodigoProtesto;
              qryretorno_pagfor_r3_segGnr_dias_protesto.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].PrazoProtesto;
              qryretorno_pagfor_r3_segGdt_lim_pago_tit.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].DataLimite;
              qryretorno_pagfor_r3_segGtp_de_titulo.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].tp_de_titulo;
              qryretorno_pagfor_r3_segG.post;

              {SEGMENTO H DENTRO DO G}
              for l:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.Items[k].SegmentoH.Count-1 do
              begin

                qryRetorno_pagfor_r3_segH.append;
                qryretorno_pagfor_r3_segHregistro0.asString := qryretorno_pagfor_r0codigo.asString;
                qryretorno_pagfor_r3_segHcod_do_banco.asString := qryretorno_pagfor_r3_segGcod_do_banco.asString;
                qryRetorno_pagfor_r3_segHlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
                qryretorno_pagfor_r3_segHtp_de_registro.asString := '3';
                qryRetorno_pagfor_r3_segHnr_seq_reg_lote.asinteger := qryretorno_pagfor_r3_segGnr_seq_reg_lote.asInteger;

                qryRetorno_pagfor_r3_segHsegmento.asString := 'H';

                qryretorno_pagfor_r3_segHcd_de_mov_rem.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].cd_de_mov_rem;
                qryretorno_pagfor_r3_segHtp_de_insc_sac.asString := TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Avalista.Inscricao.Tipo);

                qryretorno_pagfor_r3_segHnr_insc_sac.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Avalista.Inscricao.Numero;
                qryretorno_pagfor_r3_segHnome_do_sacador.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Avalista.Nome;

                qryretorno_pagfor_r3_segHcd_desconto2.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Desconto2.Codigo;
                qryretorno_pagfor_r3_segHdt_desconto2.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Desconto2.Data;
                qryretorno_pagfor_r3_segHvlr_per_desc2.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Desconto2.Valor;

                qryretorno_pagfor_r3_segHcd_desconto3.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Desconto3.Codigo;
                qryretorno_pagfor_r3_segHdt_desconto3.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Desconto3.Data;
                qryretorno_pagfor_r3_segHvlr_per_desc3.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Desconto3.Valor;

                qryretorno_pagfor_r3_segHcd_da_multa.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Multa.Codigo;
                qryretorno_pagfor_r3_segHdt_in_vig_multa.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Multa.Data;
                qryretorno_pagfor_r3_segHvlr_apl_multa.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Multa.Valor;
                qryretorno_pagfor_r3_segHvlr_abatimento.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoG.items[k].SegmentoH.items[l].Abatimento;

                qryRetorno_pagfor_r3_segH.post;

              end;
            end;



            {SEGMENTO J}
            for k:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Count-1 do
            begin
              IncluirSegmento(k+1, 'J');
              qryretorno_pagfor_r3_segJ.append;

              qryretorno_pagfor_r3_segJregistro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryretorno_pagfor_r3_segJcod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryretorno_pagfor_r3_segJlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryretorno_pagfor_r3_segJtp_de_registro.asString := '3';
              qryretorno_pagfor_r3_segJnr_seq_reg_lote.asInteger := k+1;

              qryretorno_pagfor_r3_segJsegmento.asString := 'J';
              qryretorno_pagfor_r3_segJtipo_de_movimento.asString := TpMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].TipoMovimento);
              qryretorno_pagfor_r3_segJcd_ins_movto.asString := InMovimentotoStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].CodMovimento);

              qryretorno_pagfor_r3_segJcod_de_barras.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].CodigoBarras;
              qryretorno_pagfor_r3_segJnome_do_cedente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].NomeCedente;
              qryretorno_pagfor_r3_segJdt_vencto.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].DataVencimento;
              qryretorno_pagfor_r3_segJvlr_nominal.asCurrency := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].ValorTitulo;
              qryretorno_pagfor_r3_segJvlr_desconto.asCurrency := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].Desconto;
              qryretorno_pagfor_r3_segJvlr_multajuros.asCurrency := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].Acrescimo;
              qryretorno_pagfor_r3_segJdata_pagto.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].DataPagamento;
              qryretorno_pagfor_r3_segJvlr_pagto.asCurrency := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].ValorPagamento;
              qryretorno_pagfor_r3_segJqt_moeda.asCurrency := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].QtdeMoeda;
              qryretorno_pagfor_r3_segJnr_doc_cliente.asstring := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].ReferenciaSacado;
              qryretorno_pagfor_r3_segJnro_docto_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].NossoNumero;
    //          qryretorno_pagfor_r3_segJcd_da_moeda: TStringField;
              qryretorno_pagfor_r3_segJoc_retorno.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.items[k].CodOcorrencia;
              qryretorno_pagfor_r3_segJ.post;

              {SEGMENTO Z DENTRO DO J}
              for l:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoZ.Count-1 do
              begin

                qryRetorno_pagfor_r3_segZ.append;
                qryRetorno_pagfor_r3_segZregistro0.asString := qryretorno_pagfor_r0codigo.asString;
                qryRetorno_pagfor_r3_segZcod_do_banco.asString := qryretorno_pagfor_r3_segJcod_do_banco.asString;
                qryRetorno_pagfor_r3_segZlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
                qryRetorno_pagfor_r3_segZtp_de_registro.asString := '3';
                qryRetorno_pagfor_r3_segZnr_seq_reg_lote.asinteger := qryretorno_pagfor_r3_segJnr_seq_reg_lote.asInteger;

                qryRetorno_pagfor_r3_segZsegmento.asString := 'Z';
                qryRetorno_pagfor_r3_segZaut_pagto.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoZ.Items[l].Autenticacao;
                qryRetorno_pagfor_r3_segZprot_pagto.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoZ.Items[l].SeuNumero;
                qryRetorno_pagfor_r3_segZ.post;

              end;

              {SEGMENTO J52 DENTRO DO J}
              for l:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Count-1 do
              begin

                qryRetorno_pagfor_r3_segJ52.append;
                qryRetorno_pagfor_r3_segJ52registro0.asString := qryretorno_pagfor_r0codigo.asString;
                qryRetorno_pagfor_r3_segJ52cod_do_banco.asString := qryretorno_pagfor_r3_segJcod_do_banco.asString;
                qryRetorno_pagfor_r3_segJ52lote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
                qryRetorno_pagfor_r3_segJ52tp_de_registro.asString := '3';
                qryRetorno_pagfor_r3_segJ52nr_seq_reg_lote.asinteger := qryretorno_pagfor_r3_segJnr_seq_reg_lote.asInteger;

                qryRetorno_pagfor_r3_segJ52segmento.asString := 'J';
                qryretorno_pagfor_r3_segJ52cd_mov_rem.asString := '00';
                qryretorno_pagfor_r3_segJ52id_reg_opc.asString := '52';

                qryretorno_pagfor_r3_segJ52tpinsc_sacado.asString := TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Items[l].Pagador.Inscricao.Tipo);
                qryretorno_pagfor_r3_segJ52cnpj_cpf_sacado.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Items[l].Pagador.Inscricao.Numero;
                qryretorno_pagfor_r3_segJ52nm_sacado.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Items[l].Pagador.Nome;

                qryretorno_pagfor_r3_segJ52tpinsc_cedente.asString := TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Items[l].Beneficiario.Inscricao.Tipo);
                qryretorno_pagfor_r3_segJ52cnpj_cpf_cedente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Items[l].Beneficiario.Inscricao.Numero;
                qryretorno_pagfor_r3_segJ52nm_cedente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Items[l].Beneficiario.Nome;

                qryretorno_pagfor_r3_segJ52tpinsc_sacador.asString := TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Items[l].SacadorAvalista.Inscricao.Tipo);
                qryretorno_pagfor_r3_segJ52cnpj_cpf_sacador.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Items[l].SacadorAvalista.Inscricao.Numero;
                qryretorno_pagfor_r3_segJ52nm_sacador.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoJ52.Items[l].SacadorAvalista.Nome;

                qryRetorno_pagfor_r3_segJ52.post;
              end;

              {SEGMENTO B DENTRO DO J}
              for l:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Count-1 do
              begin

                qryretorno_pagfor_r3_segB.append;

                qryRetorno_pagfor_r3_segBregistro0.asString := qryretorno_pagfor_r0codigo.asString;
                qryRetorno_pagfor_r3_segBcod_do_banco.asString := qryretorno_pagfor_r3_segJcod_do_banco.asString;
                qryRetorno_pagfor_r3_segBlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
                qryRetorno_pagfor_r3_segBtp_de_registro.asString := '3';
                qryRetorno_pagfor_r3_segBnr_seq_reg_lote.asinteger := qryretorno_pagfor_r3_segJnr_seq_reg_lote.asInteger;

                qryRetorno_pagfor_r3_segBsegmento.asString := 'B';

                qryretorno_pagfor_r3_segBtp_de_inso_fav.asString :=
                  TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Inscricao.Tipo);

                qryretorno_pagfor_r3_segBcnpj_cpf_fav.AsString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Inscricao.Numero;

                qryretorno_pagfor_r3_segBlogradouro_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Endereco.Logradouro;

                qryretorno_pagfor_r3_segBnr_local_fav.asInteger :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Endereco.Numero;

                qryretorno_pagfor_r3_segBcompl_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Endereco.Complemento;

                qryretorno_pagfor_r3_segBbairro_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Endereco.Bairro;

                qryretorno_pagfor_r3_segBcidade_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Endereco.Cidade;

                qryretorno_pagfor_r3_segBcep_fav.asinteger :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Endereco.CEP;

                qryretorno_pagfor_r3_segBestado_fav.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Endereco.Estado;

                qryretorno_pagfor_r3_segBdata_vencto.asDateTime :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].DataVencimento;

                qryretorno_pagfor_r3_segBvlr_doc.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Valor;

                qryretorno_pagfor_r3_segBvlr_abat.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Abatimento;

                qryretorno_pagfor_r3_segBvlr_desconto.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Desconto;

                qryretorno_pagfor_r3_segBvlr_mora.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Mora;

                qryretorno_pagfor_r3_segBvlr_multa.asFloat :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].Multa;

                qryretorno_pagfor_r3_segBhora_env_ted.asDatetime :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].hora_env_ted;

                qryretorno_pagfor_r3_segBcod_hist_cred.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].cod_hist_cred;

                qryretorno_pagfor_r3_segBoc_retorno.asString :=
                  ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoJ.Items[k].SegmentoB.Items[l].CodOcorrencia;

                qryRetorno_pagfor_r3_segB.post;
              end;
            end;

            {SEGMENTO N, N1}
            for k:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.Count-1 do
            begin
              IncluirSegmento(k+1, 'N');

              qryRetorno_pagfor_r3_segN.append;

              qryRetorno_pagfor_r3_segNregistro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryRetorno_pagfor_r3_segNcod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryRetorno_pagfor_r3_segNlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryRetorno_pagfor_r3_segNtp_de_registro.asString := '3';
              qryRetorno_pagfor_r3_segNnr_seq_reg_lote.asInteger := k+1;
              qryRetorno_pagfor_r3_segNsegmento.asString := 'N';

              qryRetorno_pagfor_r3_segNtipo_de_movimento.asString := TpMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].SegmentoN.TipoMovimento);
              qryRetorno_pagfor_r3_segNcd_ins_movto.asString := InMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].SegmentoN.CodMovimento);

              qryRetorno_pagfor_r3_segNnr_doc_cliente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].SegmentoN.SeuNumero;
              qryRetorno_pagfor_r3_segNnro_docto_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].SegmentoN.NossoNumero;
              qryRetorno_pagfor_r3_segNnm_contribuinte.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].SegmentoN.NomeContribuinte;
              qryRetorno_pagfor_r3_segNdata_pagto.AsDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].SegmentoN.DataPagamento;
              qryRetorno_pagfor_r3_segNvlr_pagto.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].SegmentoN.ValorPagamento;
    //          qryRetorno_pagfor_r3_segNinf_compl: TStringField;
              qryRetorno_pagfor_r3_segNoc_retorno.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].SegmentoN.CodOcorrencia;
              {SEGMENTO Z DENTRO DO O}
              qryRetorno_pagfor_r3_segN.post;

              qryRetorno_pagfor_r3_segN1.append;
              qryRetorno_pagfor_r3_segN1registro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryRetorno_pagfor_r3_segN1cod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryRetorno_pagfor_r3_segN1lote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryRetorno_pagfor_r3_segN1tp_de_registro.asString := '3';
              qryRetorno_pagfor_r3_segN1nr_seq_reg_lote.asInteger := k+1;

              qryRetorno_pagfor_r3_segN1cd_receita_trib.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].Receita;
              qryRetorno_pagfor_r3_segN1tp_id_contrib.asString :=  TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].TipoContribuinte);
              qryRetorno_pagfor_r3_segN1id_contrib.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].idContribuinte;
              qryRetorno_pagfor_r3_segN1cd_id_trib.asString := '17';
              qryRetorno_pagfor_r3_segN1competencia.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].MesAnoCompetencia;
              qryRetorno_pagfor_r3_segN1vlr_prev_pg_inss.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].ValorTributo;
              qryRetorno_pagfor_r3_segN1vlr_out_ent.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].ValorOutrasEntidades;
              qryRetorno_pagfor_r3_segN1at_monetaria.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN1.items[k].AtualizacaoMonetaria;
              qryRetorno_pagfor_r3_segN1.post;

            end;

            {SEGMENTO N, N2}
            for k:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.Count-1 do
            begin
              IncluirSegmento(k+1, 'N');
              qryRetorno_pagfor_r3_segN.append;

              qryRetorno_pagfor_r3_segNregistro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryRetorno_pagfor_r3_segNcod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryRetorno_pagfor_r3_segNlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryRetorno_pagfor_r3_segNtp_de_registro.asString := '3';
              qryRetorno_pagfor_r3_segNnr_seq_reg_lote.asInteger := k+1;
              qryRetorno_pagfor_r3_segNsegmento.asString := 'N';

              qryRetorno_pagfor_r3_segNtipo_de_movimento.asString := TpMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].SegmentoN.TipoMovimento);
              qryRetorno_pagfor_r3_segNcd_ins_movto.asString := InMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].SegmentoN.CodMovimento);

              qryRetorno_pagfor_r3_segNnr_doc_cliente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].SegmentoN.SeuNumero;
              qryRetorno_pagfor_r3_segNnro_docto_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].SegmentoN.NossoNumero;
              qryRetorno_pagfor_r3_segNnm_contribuinte.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].SegmentoN.NomeContribuinte;
              qryRetorno_pagfor_r3_segNdata_pagto.AsDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].SegmentoN.DataPagamento;
              qryRetorno_pagfor_r3_segNvlr_pagto.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].SegmentoN.ValorPagamento;
    //          qryRetorno_pagfor_r3_segNinf_compl: TStringField;
              qryRetorno_pagfor_r3_segNoc_retorno.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].SegmentoN.CodOcorrencia;
              {SEGMENTO Z DENTRO DO O}
              qryRetorno_pagfor_r3_segN.post;

              qryRetorno_pagfor_r3_segN2.append;
              qryRetorno_pagfor_r3_segN2registro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryRetorno_pagfor_r3_segN2cod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryRetorno_pagfor_r3_segN2lote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryRetorno_pagfor_r3_segN2tp_de_registro.asString := '3';
              qryRetorno_pagfor_r3_segN2nr_seq_reg_lote.asInteger := k+1;
              qryRetorno_pagfor_r3_segN2cd_receita_trib.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].Receita;

              qryRetorno_pagfor_r3_segN2tp_id_contrib.asString :=  TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].TipoContribuinte);
              qryRetorno_pagfor_r3_segN2id_contrib.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].idContribuinte;
              qryRetorno_pagfor_r3_segN2cd_id_trib.asString := '16';
              qryRetorno_pagfor_r3_segN2per_apuracao.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].Periodo;
              qryRetorno_pagfor_r3_segN2nr_ref.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].Referencia;
              qryRetorno_pagfor_r3_segN2vlr_principal.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].ValorPrincipal;
              qryRetorno_pagfor_r3_segN2vlr_multa.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].Multa;
              qryRetorno_pagfor_r3_segN2vlr_juros.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].Juros;
              qryRetorno_pagfor_r3_segN2dt_vencto.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN2.items[k].DataVencimento;
              qryRetorno_pagfor_r3_segN2.post;

            end;


            {SEGMENTO N, N3}
            for k:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.Count-1 do
            begin
              IncluirSegmento(k+1, 'N');
              qryRetorno_pagfor_r3_segN.append;

              qryRetorno_pagfor_r3_segNregistro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryRetorno_pagfor_r3_segNcod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryRetorno_pagfor_r3_segNlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryRetorno_pagfor_r3_segNtp_de_registro.asString := '3';
              qryRetorno_pagfor_r3_segNnr_seq_reg_lote.asInteger := k+1;
              qryRetorno_pagfor_r3_segNsegmento.asString := 'N';

              qryRetorno_pagfor_r3_segNtipo_de_movimento.asString := TpMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].SegmentoN.TipoMovimento);
              qryRetorno_pagfor_r3_segNcd_ins_movto.asString := InMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].SegmentoN.CodMovimento);

              qryRetorno_pagfor_r3_segNnr_doc_cliente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].SegmentoN.SeuNumero;
              qryRetorno_pagfor_r3_segNnro_docto_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].SegmentoN.NossoNumero;
              qryRetorno_pagfor_r3_segNnm_contribuinte.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].SegmentoN.NomeContribuinte;
              qryRetorno_pagfor_r3_segNdata_pagto.AsDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].SegmentoN.DataPagamento;
              qryRetorno_pagfor_r3_segNvlr_pagto.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].SegmentoN.ValorPagamento;
    //          qryRetorno_pagfor_r3_segNinf_compl: TStringField;
              qryRetorno_pagfor_r3_segNoc_retorno.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].SegmentoN.CodOcorrencia;
              {SEGMENTO Z DENTRO DO O}
              qryRetorno_pagfor_r3_segN.post;

              qryRetorno_pagfor_r3_segN3.append;
              qryRetorno_pagfor_r3_segN3registro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryRetorno_pagfor_r3_segN3cod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryRetorno_pagfor_r3_segN3lote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryRetorno_pagfor_r3_segN3tp_de_registro.asString := '3';
              qryRetorno_pagfor_r3_segN3nr_seq_reg_lote.asInteger := k+1;
              qryRetorno_pagfor_r3_segN3cd_receita_trib.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].Receita;

              qryRetorno_pagfor_r3_segN3tp_id_contrib.asString :=  TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].TipoContribuinte);
              qryRetorno_pagfor_r3_segN3id_contrib.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].idContribuinte;
              qryRetorno_pagfor_r3_segN3cd_id_trib.asString := '16';
              qryRetorno_pagfor_r3_segN3per_apuracao.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].Periodo;

              qryRetorno_pagfor_r3_segN3vlr_rec_bruta_acum.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].ReceitaBruta;
              qryRetorno_pagfor_r3_segN3perc_rec_bruta_acum.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].Percentual;
              qryRetorno_pagfor_r3_segN3vlr_principal.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].ValorPrincipal;
              qryRetorno_pagfor_r3_segN3vlr_multa.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].Multa;
              qryRetorno_pagfor_r3_segN3vlr_juros.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN3.items[k].Juros;

              qryRetorno_pagfor_r3_segN3.post;

            end;


            {SEGMENTO N, N4}
            for k:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.Count-1 do
            begin
              IncluirSegmento(k+1, 'N');
              qryRetorno_pagfor_r3_segN.append;

              qryRetorno_pagfor_r3_segNregistro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryRetorno_pagfor_r3_segNcod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryRetorno_pagfor_r3_segNlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryRetorno_pagfor_r3_segNtp_de_registro.asString := '3';
              qryRetorno_pagfor_r3_segNnr_seq_reg_lote.asInteger := k+1;
              qryRetorno_pagfor_r3_segNsegmento.asString := 'N';

              qryRetorno_pagfor_r3_segNtipo_de_movimento.asString := TpMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].SegmentoN.TipoMovimento);
              qryRetorno_pagfor_r3_segNcd_ins_movto.asString := InMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].SegmentoN.CodMovimento);

              qryRetorno_pagfor_r3_segNnr_doc_cliente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].SegmentoN.SeuNumero;
              qryRetorno_pagfor_r3_segNnro_docto_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].SegmentoN.NossoNumero;
              qryRetorno_pagfor_r3_segNnm_contribuinte.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].SegmentoN.NomeContribuinte;
              qryRetorno_pagfor_r3_segNdata_pagto.AsDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].SegmentoN.DataPagamento;
              qryRetorno_pagfor_r3_segNvlr_pagto.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].SegmentoN.ValorPagamento;
    //          qryRetorno_pagfor_r3_segNinf_compl: TStringField;
              qryRetorno_pagfor_r3_segNoc_retorno.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].SegmentoN.CodOcorrencia;
              {SEGMENTO Z DENTRO DO O}
              qryRetorno_pagfor_r3_segN.post;

              qryRetorno_pagfor_r3_segN4.append;
              qryRetorno_pagfor_r3_segN4registro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryRetorno_pagfor_r3_segN4cod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryRetorno_pagfor_r3_segN4lote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryRetorno_pagfor_r3_segN4tp_de_registro.asString := '3';
              qryRetorno_pagfor_r3_segN4nr_seq_reg_lote.asInteger := k+1;
              qryRetorno_pagfor_r3_segN4cd_receita_trib.asInteger := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].Receita;

              qryRetorno_pagfor_r3_segN4tp_id_contrib.asString :=  TpInscricaoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].TipoContribuinte);
              qryRetorno_pagfor_r3_segN4id_contrib.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].idContribuinte;
              qryRetorno_pagfor_r3_segN4cd_id_trib.asString := '22';

              qryRetorno_pagfor_r3_segN4dt_vencto.AsDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].DataVencimento;
              qryRetorno_pagfor_r3_segN4insest_cdmun_nrodecl.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].InscEst;
              qryRetorno_pagfor_r3_segN4divativ_nretiq.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].NumEtiqueta;
              qryRetorno_pagfor_r3_segN4per_ref.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].Referencia;
              qryRetorno_pagfor_r3_segN4nrparcela.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].NumParcela;
              qryRetorno_pagfor_r3_segN4vlr_receita.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].ValorReceita;
              qryRetorno_pagfor_r3_segN4vlr_juros.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].Juros;
              qryRetorno_pagfor_r3_segN4vlr_multa.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoN4.items[k].Multa;

              qryRetorno_pagfor_r3_segN4.post;
            end;

            {SEGMENTO O}
            for k:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.Count-1 do
            begin
              IncluirSegmento(k+1, 'O');
              qryRetorno_pagfor_r3_segO.append;

              qryRetorno_pagfor_r3_segOregistro0.asString := qryretorno_pagfor_r0codigo.asString;
              qryRetorno_pagfor_r3_segOcod_do_banco.asString := qryretorno_pagfor_r1cod_do_banco.asString;
              qryRetorno_pagfor_r3_segOlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
              qryRetorno_pagfor_r3_segOtp_de_registro.asString := '3';
              qryRetorno_pagfor_r3_segOnr_seq_reg_lote.asInteger := k+1;
              qryRetorno_pagfor_r3_segOsegmento.asString := 'O';

              qryRetorno_pagfor_r3_segOtipo_de_movimento.asString := TpMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].TipoMovimento);
              qryRetorno_pagfor_r3_segOcd_ins_movto.asString := InMovimentoToStr(ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].CodMovimento);
              qryRetorno_pagfor_r3_segOcd_barras.asSTring := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].CodigoBarras;

              qryRetorno_pagfor_r3_segOnmconcess_orgaopub.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].NomeConcessionaria;
              qryRetorno_pagfor_r3_segOdt_vencto.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].DataVencimento;
              qryRetorno_pagfor_r3_segOdata_pagto.asDateTime := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].DataPagamento;
              qryRetorno_pagfor_r3_segOvlr_pagto.asFloat := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].ValorPagamento;
              qryRetorno_pagfor_r3_segOnr_doc_cliente.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].SeuNumero;
              qryRetorno_pagfor_r3_segOnro_docto_banco.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].NossoNumero;
              qryRetorno_pagfor_r3_segOoc_retorno.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.items[k].CodOcorrencia;

              {SEGMENTO Z DENTRO DO O}
              qryRetorno_pagfor_r3_segO.post;

              for l:=0 to ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.Items[k].SegmentoZ.Count-1 do
              begin

                qryRetorno_pagfor_r3_segZ.append;
                qryRetorno_pagfor_r3_segZregistro0.asString := qryretorno_pagfor_r0codigo.asString;
                qryRetorno_pagfor_r3_segZcod_do_banco.asString := qryretorno_pagfor_r3_segOcod_do_banco.asString;
                qryRetorno_pagfor_r3_segZlote_de_serv.asInteger := qryretorno_pagfor_r1lote_de_serv.asInteger;
                qryRetorno_pagfor_r3_segZtp_de_registro.asString := '3';
                qryRetorno_pagfor_r3_segZnr_seq_reg_lote.asinteger := qryRetorno_pagfor_r3_segOnr_seq_reg_lote.asInteger;

                qryRetorno_pagfor_r3_segZsegmento.asString := 'Z';

                qryRetorno_pagfor_r3_segZaut_pagto.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.Items[k].SegmentoZ.Items[l].Autenticacao;
                qryRetorno_pagfor_r3_segZprot_pagto.asString := ACBrPagFor.Arquivos.Items[i].PagFor.Lote.Items[j].SegmentoO.Items[k].SegmentoZ.Items[l].SeuNumero;
                qryRetorno_pagfor_r3_segZ.post;

              end;

            end;

          end;
        end;
      end;
    except
      on E: Exception do ShowMessage(E.Message);
    end;

  finally
    HabilitarControles(true);
  end;

  if result then
    result := perpetrar(
               [qryretorno_pagfor_r0, qryretorno_pagfor_r1,
                qryretorno_pagfor_r3_segmentos,
                qryretorno_pagfor_r3_segA, qryretorno_pagfor_r3_segB,
                qryretorno_pagfor_r3_segG, qryretorno_pagfor_r3_segH,
                qryretorno_pagfor_r3_segJ, qryretorno_pagfor_r3_segJ52,
                qryRetorno_pagfor_r3_segN, qryRetorno_pagfor_r3_segN1,
                qryRetorno_pagfor_r3_segN2, qryRetorno_pagfor_r3_segN3,
                qryRetorno_pagfor_r3_segN4, qryRetorno_pagfor_r3_segO,
                qryRetorno_pagfor_r3_segW, qryRetorno_pagfor_r3_segZ,
                qryretorno_pagfor_trailer_tipo_5,
                qryretorno_pagfor_trailer_tipo_9]);

  if result then
  begin

    qryretorno_pagfor_r0_Text.MacroByName('SQL').asString := ' r0.codigo = '+qryretorno_pagfor_r0codigo.asString;
    qryretorno_pagfor_r0_Text.close;
    qryretorno_pagfor_r0_Text.open;
    qryretorno_pagfor_r0_Text.edit;

    qryretorno_pagfor_r0_Textconteudoarquivo.loadfromfile(Arquivo);
    qryretorno_pagfor_r0_Text.post;
    result := perpetrar([qryretorno_pagfor_r0_Text]);
  end;

end;


procedure TdtmLerRetornoPagFor.qryretorno_pagfor_r0AfterOpen(
  DataSet: TDataSet);
begin
  inherited;
{
  RefazConsultaPorNome(qryretorno_pagfor_r1, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);
    RefazConsultaPorNome(qryretorno_pagfor_r3_segA, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);

    RefazConsultaPorNome(qryretorno_pagfor_r3_segG, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);
      RefazConsultaPorNome(qryretorno_pagfor_r3_segH, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);

    RefazConsultaPorNome(qryretorno_pagfor_r3_segJ, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);

    RefazConsultaPorNome(qryRetorno_pagfor_r3_segN, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);
    RefazConsultaPorNome(qryRetorno_pagfor_r3_segN1, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);
    RefazConsultaPorNome(qryRetorno_pagfor_r3_segN2, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);
    RefazConsultaPorNome(qryRetorno_pagfor_r3_segN3, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);
    RefazConsultaPorNome(qryRetorno_pagfor_r3_segN4, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);


    RefazConsultaPorNome(qryRetorno_pagfor_r3_segO, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);
    RefazConsultaPorNome(qryRetorno_pagfor_r3_segW, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);

    RefazConsultaPorNome(qryretorno_pagfor_r3_segB,
       ['registro0'],
       [qryretorno_pagfor_r0codigo.asLargeInt]);

    RefazConsultaPorNome(qryretorno_pagfor_r3_segJ52,
       ['registro0'],
       [qryretorno_pagfor_r0codigo.asLargeInt]);

    RefazConsultaPorNome(qryretorno_pagfor_r3_segZ,
       ['registro0'],
       [qryretorno_pagfor_r0codigo.asLargeInt]);

  RefazConsultaPorNome(qryretorno_pagfor_trailer_tipo_5, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);
  RefazConsultaPorNome(qryretorno_pagfor_trailer_tipo_9, ['registro0'], [qryretorno_pagfor_r0codigo.asLargeInt]);
}
end;

function TdtmLerRetornoPagFor.VerificarInformacoesdoArquivo(
  NomeArquivo: String): boolean;
var
  vDir : String;
  SNomeArquivo: TStringList;
  vTipo_da_Operacao: String;

begin
   result := True;
   SNomeArquivo := TStringList.Create;
   SNomeArquivo.LoadFromFile(NomeArquivo);

   if SNomeArquivo.Count < 1 then
   begin
      result := false;
      raise exception.Create(ACBrStr('O Arquivo de Retorno:'+sLineBreak+
                                     NomeArquivo + sLineBreak+
                                     'está vazio.'+sLineBreak+
                                     ' Não há dados para processar'));
   end;

   if (Length(SNomeArquivo.Strings[0])<>240) then
   begin
      result := false;
      raise exception.Create(ACBrStr('O Arquivo de Retorno:'+sLineBreak+
                                     NomeArquivo + sLineBreak+
                                     'está fora do padrão CNAB240.'+sLineBreak+
                                     ' Não há dados para processar'));
   end;

   if result then
   begin

         vTipo_da_Operacao := copy(SNomeArquivo.Strings[1], 9, 1);
         if vTipo_da_Operacao = 'T' then
         begin
           result := false;
           exit;
         end;

   end;

   if result then
     result := LerArquivo(NomeArquivo);

end;

procedure TdtmLerRetornoPagFor.qryretorno_pagfor_r3AfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if not SegmentoG then
    if GerandoConsulta = naoGerando then
    begin

      qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString := 'false';
      qryDuplicatas.ParambyName('pagfor').asInteger := qryretorno_pagfor_r3pagfor.asInteger;
      qryDuplicatas.ParambyName('pagforG').Value := null; {qryretorno_pagfor_r3pagfor.asInteger;}
      qryDuplicatas.ParambyName('SegmentoG').asBoolean := False;

      qryDuplicatas.ParambyName('Segmento_TotalmenteConciliado').asBoolean := (qryretorno_pagfor_r3SaldoConciliar.asCurrency = 0);
      qryDuplicatas.ParambyName('SegmentoG_TotalmenteConciliado').asBoolean := false {(qryretorno_pagfor_r3_segGSaldoConciliar.asCurrency = 0)};


      if not qryretorno_pagfor_r3.isempty then
      begin
        qryDuplicatas.paramByName('datainicial').asDateTime := qryretorno_pagfor_r3dt_vencto.asDateTime;
        qryDuplicatas.paramByName('datafinal').asDateTime := qryretorno_pagfor_r3dt_vencto.asDateTime;
        qryDuplicatas.paramByName('valor').asFloat := qryretorno_pagfor_r3vlr_vencto.asFloat;

        qryDuplicatas.paramByName('DiasAbaixo').asInteger := DiasAbaixo;
        qryDuplicatas.paramByName('DiasAcima').asInteger := DiasAcima;
        qryDuplicatas.paramByName('PercentualValorAbaixo').asCurrency := PercentualValorAbaixo;
        qryDuplicatas.paramByName('PercentualValorAcima').asCurrency := PercentualValorAcima;


      //  if qryConciliacaostatus.asString <> 'FECHADA' then
        begin
          qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString :=
           ' coalesce(dp_pgf.pagfor,d.pagfor) = :pagfor or ( '+
           '  d.datavencto between cast(:datainicial as date) - :DiasAbaixo and cast(:datafinal as date) + :DiasAcima ';

          if LimitePercentualAtivo then
            qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString :=
              qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString +
             ' and d.valorvencto between (:valor - ((:valor * :PercentualValorAbaixo)/100)) and (:valor + ((:valor * :PercentualValorAcima)/100))';

          if FiltrarPorNome then
            qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString :=
              qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString +
             ' and vf.nome = '+QuotedStr(trim(qryretorno_pagfor_r3identif_nome.asString));

          qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString :=
            qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString +
           ' ) ';
             

        end;
      end;

      qryDuplicatas.close;
      qryDuplicatas.open;



    end;


end;

procedure TdtmLerRetornoPagFor.GuardarPosicaoDuplicatas;
begin
  v_DocumentoPag := qryDuplicatasdocumentopag.asInteger;
  v_Numero := qryDuplicatasNumero.asInteger;
end;

procedure TdtmLerRetornoPagFor.RestaurarPosicaoDuplicatas;
begin
  qryDuplicatas.locate('documentopag;numero',
    VarArrayOf([v_DocumentoPag,v_Numero]),[]);
end;

procedure TdtmLerRetornoPagFor.qryDuplicatasconciliarChange(
  Sender: TField);
begin
  inherited;
  Conciliar(Tfield(Sender).value);
end;

procedure TdtmLerRetornoPagFor.qryDuplicatasAfterPost(DataSet: TDataSet);
begin
  inherited;

  TfrmLerRetornoPagFor(Self.owner).CalcularTotaisDuplicatas;
  RegistrosPendentesdeGravacao := true;
end;

procedure TdtmLerRetornoPagFor.SetGerandoConsulta(
  const Value: tGerandoConsulta);
begin
  fGerandoConsulta := Value;

  if GerandoConsulta = naoGerando then
    qryretorno_pagfor_r3AfterScroll(nil);

end;

procedure TdtmLerRetornoPagFor.qryretorno_pagfor_r3CalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryretorno_pagfor_r3SaldoConciliar.asCurrency :=
    qryretorno_pagfor_r3vlr_pagto.asCurrency - qryretorno_pagfor_r3totalconciliado.asCurrency;
end;

procedure TdtmLerRetornoPagFor.qryretorno_pagfor_r3AfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfrmLerRetornoPagFor(Self.owner).CalcularTotaisretorno_pagfor_r3;
end;

procedure TdtmLerRetornoPagFor.qryDuplicatasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TfrmLerRetornoPagFor(Self.owner).CalcularTotaisDuplicatas;
end;

procedure TdtmLerRetornoPagFor.qryretorno_pagfor_r3_segAAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfrmLerRetornoPagFor(Self.owner).CalcularTotaissegA;
end;

procedure TdtmLerRetornoPagFor.qryretorno_pagfor_r3_segGAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfrmLerRetornoPagFor(Self.owner).CalcularTotaissegG;
end;

procedure TdtmLerRetornoPagFor.qryretorno_pagfor_r3_segJAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfrmLerRetornoPagFor(Self.owner).CalcularTotaissegJ;
end;

procedure TdtmLerRetornoPagFor.qryRetorno_pagfor_r3_segNAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfrmLerRetornoPagFor(Self.owner).CalcularTotaissegN;
end;

procedure TdtmLerRetornoPagFor.qryRetorno_pagfor_r3_segOAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfrmLerRetornoPagFor(Self.owner).CalcularTotaissegO;
end;

constructor TdtmLerRetornoPagFor.Create(AOwner: TComponent);
begin

  inherited;

  qryretorno_pagfor_r3.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_r3_G.macrobyname('SQL').asString := 'false';
  
  qryretorno_pagfor_r0.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_r1.macrobyname('SQL').asString := 'false';

  qryretorno_pagfor_r3_segmentos.macrobyname('SQL').asString := 'false';

  qryretorno_pagfor_r3_segA.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_r3_segB.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_r3_segG.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_r3_segH.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_r3_segJ.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_r3_segJ52.macrobyname('SQL').asString := 'false';
  qryRetorno_pagfor_r3_segN.macrobyname('SQL').asString := 'false';
  qryRetorno_pagfor_r3_segN1.macrobyname('SQL').asString := 'false';
  qryRetorno_pagfor_r3_segN2.macrobyname('SQL').asString := 'false';
  qryRetorno_pagfor_r3_segN3.macrobyname('SQL').asString := 'false';
  qryRetorno_pagfor_r3_segN4.macrobyname('SQL').asString := 'false';
  qryRetorno_pagfor_r3_segO.macrobyname('SQL').asString := 'false';
  qryRetorno_pagfor_r3_segW.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_r3_segZ.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_trailer_tipo_5.macrobyname('SQL').asString := 'false';
  qryretorno_pagfor_trailer_tipo_9.macrobyname('SQL').asString := 'false';

  qryretorno_pagfor_r3.tag := ctTabelas;
  qryretorno_pagfor_r0.tag := ctTabelas;
  qryretorno_pagfor_r1.tag := ctTabelas;

  qryretorno_pagfor_r3_segmentos.tag := ctTabelas;

  qryretorno_pagfor_r3_segA.tag := ctTabelas;
  qryretorno_pagfor_r3_segB.tag := ctTabelas;
  qryretorno_pagfor_r3_segG.tag := ctTabelas;
  qryretorno_pagfor_r3_segH.tag := ctTabelas;
  qryretorno_pagfor_r3_segJ.tag := ctTabelas;
  qryretorno_pagfor_r3_segJ52.tag := ctTabelas;
  qryRetorno_pagfor_r3_segN.tag := ctTabelas;
  qryRetorno_pagfor_r3_segN1.tag := ctTabelas;
  qryRetorno_pagfor_r3_segN2.tag := ctTabelas;
  qryRetorno_pagfor_r3_segN3.tag := ctTabelas;
  qryRetorno_pagfor_r3_segN4.tag := ctTabelas;
  qryRetorno_pagfor_r3_segO.tag := ctTabelas;
  qryRetorno_pagfor_r3_segW.tag := ctTabelas;
  qryretorno_pagfor_r3_segZ.tag := ctTabelas;
  qryretorno_pagfor_trailer_tipo_5.tag := ctTabelas;
  qryretorno_pagfor_trailer_tipo_9.tag := ctTabelas;


  ACBrPagFor.Configuracoes.Arquivos.PathSalvar := ExtractFileDir(application.ExeName) + 'Saidas';
  

end;

function TdtmLerRetornoPagFor.getdtmContasPagar: TdtmContasPagar;
begin
  if not assigned(fdtmContasPagar) then
    fdtmContasPagar := TdtmContasPagar.Create(self);

  Result := fdtmContasPagar;
end;

destructor TdtmLerRetornoPagFor.Destroy;
begin
  if assigned(fdtmContasPagar) then
    freeandnil(fdtmContasPagar);
    
  inherited;
end;

procedure TdtmLerRetornoPagFor.PosicionarPagFor_(
  Tabela: TTecQuery;
  CampoPesquisaTabela: String;
  ConteudoCampoPesquisaTabela: String;

  Grid: TDBAdvGrid;
  CampoPesquisaGrid: String;
  ConteudoCampoPesquisaGrid: String);

var
  SearchCell:TPoint;
begin
  SearchCell.X := Grid.ColumnByFieldName[CampoPesquisaGrid].index;
  SearchCell.Y := 0;
  SearchCell := Grid.Find(SearchCell, ConteudoCampoPesquisaGrid ,[fnMatchFull]);
  grid.Row := SearchCell.Y;

  if Tabela <> nil then
    Tabela.locate(CampoPesquisaTabela, ConteudoCampoPesquisaTabela, []);

end;

procedure TdtmLerRetornoPagFor.qryretorno_pagfor_r3_segGAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if SegmentoG then
    if GerandoConsulta = naoGerando then
    begin
      qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString := 'false';
      qryDuplicatas.ParambyName('pagfor').asInteger := qryretorno_pagfor_r3_segGpagfor.asInteger;
      qryDuplicatas.ParambyName('pagforG').asInteger := qryretorno_pagfor_r3_segGpagfor.asInteger;

      qryDuplicatas.ParambyName('SegmentoG').asBoolean := true;
      qryDuplicatas.ParambyName('Segmento_TotalmenteConciliado').asBoolean := false;
      qryDuplicatas.ParambyName('SegmentoG_TotalmenteConciliado').asBoolean := (qryretorno_pagfor_r3_segGSaldoConciliar.asCurrency = 0);



      if not qryretorno_pagfor_r3_segG.isempty then
      begin
        qryDuplicatas.paramByName('datainicial').asDateTime := qryretorno_pagfor_r3_segGdt_vencto.asDateTime;
        qryDuplicatas.paramByName('datafinal').asDateTime := qryretorno_pagfor_r3_segGdt_vencto.asDateTime;
        qryDuplicatas.paramByName('valor').asFloat := qryretorno_pagfor_r3_segGvlr_nominal.asFloat;

        qryDuplicatas.paramByName('DiasAbaixo').asInteger := DiasAbaixo;
        qryDuplicatas.paramByName('DiasAcima').asInteger := DiasAcima;
        qryDuplicatas.paramByName('PercentualValorAbaixo').asCurrency := PercentualValorAbaixo;
        qryDuplicatas.paramByName('PercentualValorAcima').asCurrency := PercentualValorAcima;


      //  if qryConciliacaostatus.asString <> 'FECHADA' then
        begin
          qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString :=
           ' coalesce(dp_pgf_g.pagfor,d.pagforG) = :pagforG or ( '+
           ' d.datavencto between cast(:datainicial as date) - :DiasAbaixo and cast(:datafinal as date) + :DiasAcima ';

          if LimitePercentualAtivo then
            qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString :=
              qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString +
             ' and d.valorvencto between (:valor - ((:valor * :PercentualValorAbaixo)/100)) and (:valor + ((:valor * :PercentualValorAcima)/100))';

          if FiltrarPorNome then
            qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString :=
              qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString +
             ' and vf.nome = '+QuotedStr(trim(qryretorno_pagfor_r3_segGnome_do_cedente.asString));

          qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString :=
            qryDuplicatas.MacrobyName('CondicaoBuscaAproximada').asString +
           ' ) ';

        end;
      end;

      qryDuplicatas.close;
      qryDuplicatas.open;
    end;
end;

procedure TdtmLerRetornoPagFor.SetSegmentoG(const Value: Boolean);
begin
  if fSegmentoG <> Value then
  begin
    fSegmentoG := Value;
    if fSegmentoG then
      qryretorno_pagfor_r3_segGAfterScroll(qryretorno_pagfor_r3_segG)
    else
      qryretorno_pagfor_r3AfterScroll(qryretorno_pagfor_r3);
  end
  else
    fSegmentoG := Value;
end;

function TdtmLerRetornoPagFor.Conciliar(pConciliar: Boolean): Boolean;
var
  vMensagem : String;
  v_ValorVencto, v_ValorDesconto, v_ValorPagto, v_SaldoConciliar, v_TotalConciliado : currency;

begin
  Result := true;

  if pConciliar then
  begin
    if SegmentoG then
    begin
      v_ValorVencto := qryDuplicatasvalorvencto.asCurrency;
      v_TotalConciliado := qryretorno_pagfor_r3_segGtotalconciliado.asCurrency + v_ValorVencto;
      v_SaldoConciliar := qryretorno_pagfor_r3_segGSaldoConciliar.asCurrency - v_ValorVencto;


      if 0 > v_SaldoConciliar then
      begin
        Result := false;
        MensagemAviso(format('Os valores estão fora do limite a conciliar'+chr(13)+
                           'Valor a conciliar: %f '+chr(13)+
                           'Valor conciliado: %f '+chr(13)+
                           'Diferença : %f',
                [qryretorno_pagfor_r3_segGvlr_nominal.AsCurrency,
                  v_TotalConciliado, v_SaldoConciliar]));

        qryDuplicatasconciliar.OnChange := nil;
        qryDuplicatasconciliar.asBoolean := false;
        qryDuplicatasconciliar.OnChange := qryDuplicatasconciliarChange;
        exit;
      end;

      RefazConsultaPorNome(qryDuplicatas_PagForSegG,
         ['documentopag', 'datavencto', 'numero'],
         [qryDuplicatasdocumentopag.asInteger,
          qryDuplicatasdatavencto.asDateTime,
          qryDuplicatasnumero.asinteger]);

      if (qryDuplicatas_PagForSegG.recordcount=1) and not qryDuplicatas_PagForSegGpagforg_duplicata.isnull then
        qryDuplicatas_PagForsegG.delete
      else
      begin
        qryDuplicatas_PagForsegG.edit;

        qryDuplicatas_PagForsegGdocumentopag.asInteger := qryDuplicatasdocumentopag.asInteger;
        qryDuplicatas_PagForsegGnumero.asInteger := qryDuplicatasnumero.asInteger;
        qryDuplicatas_PagForsegGdatavencto.asDateTime := qryDuplicatasdatavencto.asDateTime;
        qryDuplicatas_PagForSegGpagfor.asinteger := qryretorno_pagfor_r3_segGpagfor.asinteger;
        qryDuplicatas_PagForSegGobservacao.asString := qryDuplicatasobservacao.asString;

        qryDuplicatas_PagForSegGoperacao.asString := 'Conciliar';

        qryDuplicatas_PagForsegG.post;
      end;

      result := perpetrar([qryDuplicatas_PagForsegG]);

      if result then
      begin
        TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.Cells[
           TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.ColumnByFieldName['totalconciliado'].index,
           TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.row] :=
           CurrtoStr(v_TotalConciliado);

        TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.Cells[
           TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.ColumnByFieldName['SaldoConciliar'].index,
           TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.row] :=
           CurrToStr(v_SaldoConciliar);

        qryretorno_pagfor_r3_segG.edit;
        qryretorno_pagfor_r3_segGtotalconciliado.asCurrency := v_TotalConciliado;
        qryretorno_pagfor_r3_segGSaldoConciliar.asCurrency := v_SaldoConciliar;
        qryretorno_pagfor_r3_segG.post;

        {
        GuardarPosicaoDuplicatas;
        qryretorno_pagfor_r3_segGAfterScroll(qryretorno_pagfor_r3_segG);
        RestaurarPosicaoDuplicatas;
        qryDuplicatas.edit;
        }

        TfrmLerRetornoPagFor(self.owner).CalcularTotaissegG;



      end;
    end
    else
    begin
     {
      v_ValorDesconto := RatearValores(qryretorno_pagfor_r3vlr_desconto.AsCurrency,
                                       qryretorno_pagfor_r3vlr_vencto.AsCurrency,
                                       qryDuplicatasvalorvencto.asCurrency);

      v_ValorPagto := RatearValores(qryretorno_pagfor_r3vlr_pagto.AsCurrency,
                                    qryretorno_pagfor_r3vlr_vencto.AsCurrency,
                                    qryDuplicatasvalorvencto.asCurrency);


      v_ValorDesconto := RatearValores(qryretorno_pagfor_r3vlr_desconto.AsCurrency,
                                       qryretorno_pagfor_r3vlr_vencto.AsCurrency,
                                       qryDuplicatasvalorvencto.asCurrency);
     }

      v_ValorPagto := RatearValores(qryretorno_pagfor_r3vlr_pagto.AsCurrency,
                                    (qryretorno_pagfor_r3vlr_vencto.AsCurrency -
                                     qryretorno_pagfor_r3vlr_desconto.AsCurrency),
                                    qryDuplicatasvalorvencto.asCurrency);

      v_TotalConciliado := qryretorno_pagfor_r3totalconciliado.asCurrency + v_ValorPagto;
      v_SaldoConciliar := qryretorno_pagfor_r3SaldoConciliar.asCurrency - v_ValorPagto;


      if 0 > v_SaldoConciliar then
      begin
        Result := false;
        MensagemAviso(format('Os valores estão fora do limite a conciliar'+chr(13)+
                           'Valor a conciliar: %f '+chr(13)+
                           'Valor conciliado: %f '+chr(13)+
                           'Diferença : %f',
                [qryretorno_pagfor_r3vlr_pagto.AsCurrency,
                  v_TotalConciliado, v_SaldoConciliar]));
        qryDuplicatasconciliar.OnChange := nil;
        qryDuplicatasconciliar.asBoolean := false;
        qryDuplicatasconciliar.OnChange := qryDuplicatasconciliarChange;
        exit;
      end;

      vMensagem := '';
      if ((v_ValorPagto <> qryDuplicatasvalorpagto.asCurrency) and (qryDuplicatasvalorpagto.asCurrency<>0))  then
        vMensagem := 'Valor do pagamento existente: '+formatfloat('###,##0.00', qryDuplicatasvalorpagto.asCurrency) + chr(13) +
                     'Valor do pagamento retornado: '+formatfloat('###,##0.00', v_ValorPagto);


      if ((qryretorno_pagfor_r3dt_pagto.AsDateTime <> qryDuplicatasdatapagto.AsDateTime) and not qryDuplicatasdatapagto.isnull) then
        vMensagem := vMensagem + chr(13) +
                     'Data do pagamento existente: '+FormatDateTime('dd/MM/YYYY', qryDuplicatasdatapagto.AsDateTime) + chr(13) +
                     'Data do pagamento retornada: '+FormatDateTime('dd/MM/YYYY', qryretorno_pagfor_r3dt_pagto.AsDateTime);

      if ((qryretorno_pagfor_r3nr_da_conta_cor.AsInteger <> qryDuplicatascontapagto.AsInteger) and not qryDuplicatascontapagto.isnull) then
        vMensagem := vMensagem + chr(13) +
                     'Conta do pagamento existente: '+qryDuplicatascontapagto.AsString + chr(13) +
                     'Conta do pagamento retornada: '+qryretorno_pagfor_r3nr_da_conta_cor.AsString;

      if ((qryDuplicatasfilialpagto.asinteger <> qryretorno_pagfor_r3filial.asinteger) and not qryDuplicatasfilialpagto.isnull) then
        vMensagem := vMensagem + chr(13) +
                     'Filial do pagamento existente: '+qryDuplicatasfilialpagto.asString + chr(13) +
                     'Filial do pagamento atual    : '+inttostr(qryretorno_pagfor_r3filial.asinteger);

      if ((qryDuplicatascontacredito.asinteger <> qryretorno_pagfor_r3contacontabil.asinteger) and not qryDuplicatascontacredito.isnull) then
        vMensagem := vMensagem + chr(13) +
                     'Conta Plano contábil existente: '+qryDuplicatascontacredito.asString + chr(13) +
                     'Conta Plano contábil atual    : '+qryretorno_pagfor_r3contacontabil.asString;

      if ((qryDuplicatastipopagamento.asInteger <> parsistema.TipoPagamentoAutenticacoes) and not qryDuplicatastipopagamento.isnull) then
        vMensagem := vMensagem + chr(13) +
                     'Tipo de Pagto existente: '+qryDuplicatastipopagamento.asString + chr(13) +
                     'Tipo de Pagto atual    : '+inttostr(parsistema.TipoPagamentoAutenticacoes);

      if vMensagem<>'' then
      begin
        vMensagem := 'Existem diferenças nos dados já quitados em relação ao retorno do banco. '+chr(13)+
                     vMensagem+chr(13)+
                     'Prosseguir com os novos dados?';

        result := MensagemConfirmacao(vMensagem) = smbOK;

        if not result then
        begin
          qryDuplicatasconciliar.OnChange := nil;
          qryDuplicatasconciliar.asBoolean := false;
          qryDuplicatasconciliar.OnChange := qryDuplicatasconciliarChange;
          exit;
        end;
      end;

      RefazConsultaPorNome(qryDuplicatas_PagFor,
       ['Todas','documentopag', 'datavencto', 'numero'],
       [False,
        qryDuplicatasdocumentopag.asInteger,
        qryDuplicatasdatavencto.asDateTime,
        qryDuplicatasnumero.asinteger]);

      if (qryDuplicatas_PagFor.recordcount=1) and not qryDuplicatas_PagForpagfor_duplicata.isnull then
        qryDuplicatas_PagFor.delete
      else
      begin

        qryDuplicatas_PagFor.edit;

        qryDuplicatas_PagFordocumentopag.asInteger := qryDuplicatasdocumentopag.asInteger;
        qryDuplicatas_PagFornumero.asInteger := qryDuplicatasnumero.asInteger;
        qryDuplicatas_PagFordatavencto.asDateTime := qryDuplicatasdatavencto.asDateTime;

  //      qryDuplicatas_PagForvalorvencto.asCurrency := qryDuplicatasvalorvencto.asCurrency;
  //      qryDuplicatas_PagForvalordesconto.asCurrency := v_ValorDesconto;
  //      qryDuplicatas_PagForobservacao.asString := qryDuplicatasobservacao.asString;
  //      qryDuplicatas_PagForevento.asInteger := qryDuplicatasevento.asInteger;

        qryDuplicatas_PagFordatapagto.asDateTime := qryretorno_pagfor_r3dt_pagto.AsDateTime;
        qryDuplicatas_PagForvalorpagto.asCurrency := v_ValorPagto;
        qryDuplicatas_PagForcontapagto.asinteger := qryretorno_pagfor_r3nr_da_conta_cor.AsInteger;

        qryDuplicatas_PagForfilialpagto.asinteger := qryretorno_pagfor_r3filial.asinteger;  { O melhor seria a filial da conta corrente!! }

        if qryretorno_pagfor_r3contacontabil.asinteger <> 0 then
          qryDuplicatas_PagForcontacredito.asinteger := qryretorno_pagfor_r3contacontabil.asinteger
        else
          qryDuplicatas_PagForcontacredito.clear;

        qryDuplicatas_PagFortipopagamento.asInteger := parsistema.TipoPagamentoAutenticacoes; {??}
        qryDuplicatas_PagForusuario.asinteger :=  codigousuario;
        qryDuplicatas_PagForpagfor.asInteger := qryretorno_pagfor_r3pagfor.asInteger;
        qryDuplicatas_PagForobservacao.asString := qryDuplicatasobservacao.asString;
        qryDuplicatas_PagForoperacao.asString := 'Conciliar';

        qryDuplicatas_PagFor.post;
      end;

      result := perpetrar([qryDuplicatas_PagFor]);


      if result then
      begin
        TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.Cells[
           TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.ColumnByFieldName['totalconciliado'].index,
           TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.row] :=
           CurrtoStr(v_TotalConciliado);

        TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.Cells[
           TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.ColumnByFieldName['SaldoConciliar'].index,
           TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.row] :=
           CurrToStr(v_SaldoConciliar);

        qryretorno_pagfor_r3.edit;
        qryretorno_pagfor_r3totalconciliado.asCurrency := v_TotalConciliado;
        qryretorno_pagfor_r3SaldoConciliar.asCurrency := v_SaldoConciliar;
        qryretorno_pagfor_r3.post;

        GuardarPosicaoDuplicatas;
        qryretorno_pagfor_r3AfterScroll(qryretorno_pagfor_r3);
        RestaurarPosicaoDuplicatas;
        qryDuplicatas.edit;

        TfrmLerRetornoPagFor(self.owner).CalcularTotaisretorno_pagfor_r3;

      end;

    end;
  end
  else
  begin
  { Desconciliar }

    if SegmentoG then
    begin
      v_ValorVencto := qryDuplicatasvalorvencto.asCurrency;
      v_TotalConciliado := qryretorno_pagfor_r3_segGtotalconciliado.asCurrency - v_ValorVencto;
      v_SaldoConciliar := qryretorno_pagfor_r3_segGSaldoConciliar.asCurrency + v_ValorVencto;

      RefazConsultaPorNome(qryDuplicatas_PagForSegG,
         ['documentopag', 'datavencto', 'numero'],
         [qryDuplicatasdocumentopag.asInteger,
          qryDuplicatasdatavencto.asDateTime,
          qryDuplicatasnumero.asinteger]);


      if (qryDuplicatas_PagForSegG.RecordCount=1) and qryDuplicatas_PagForSegGpagforg_duplicata.isnull then
        qryDuplicatas_PagForSegG.delete
      else
      begin
        qryDuplicatas_PagForSegG.edit;
        qryDuplicatas_PagForSegGdocumentopag.asInteger := qryDuplicatasdocumentopag.asInteger;
        qryDuplicatas_PagForSegGnumero.asInteger := qryDuplicatasnumero.asInteger;
        qryDuplicatas_PagForSegGdatavencto.asDateTime := qryDuplicatasdatavencto.asDateTime;
        qryDuplicatas_PagForSegGpagfor.asInteger := qryretorno_pagfor_r3_segGpagfor.asinteger;
        qryDuplicatas_PagForSegGobservacao.asString := qryDuplicatasobservacao.asString;
        qryDuplicatas_PagForSegGOperacao.asString := 'Desconciliar';
        qryDuplicatas_PagForSegG.post;
      end;

      result := perpetrar([qryDuplicatas_PagForSegG]);

      if result then
      begin
        TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.Cells[
           TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.ColumnByFieldName['totalconciliado'].index,
           TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.row] :=
           CurrtoStr(v_TotalConciliado);

        TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.Cells[
           TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.ColumnByFieldName['SaldoConciliar'].index,
           TfrmLerRetornoPagFor(self.owner).DBAdvGridSegG.row] :=
           CurrToStr(v_SaldoConciliar);

        qryretorno_pagfor_r3_segG.edit;
        qryretorno_pagfor_r3_segGtotalconciliado.asCurrency := v_TotalConciliado;
        qryretorno_pagfor_r3_segGSaldoConciliar.asCurrency := v_SaldoConciliar;
        qryretorno_pagfor_r3_segG.post;

      {
        GuardarPosicaoDuplicatas;
        qryretorno_pagfor_r3_segGAfterScroll(qryretorno_pagfor_r3_segG);
        RestaurarPosicaoDuplicatas;
        qryDuplicatas.edit;
        }

        TfrmLerRetornoPagFor(self.owner).CalcularTotaissegG;



      end;

    end
    else
    begin
             {
      v_ValorDesconto := RatearValores(qryretorno_pagfor_r3vlr_desconto.AsCurrency,
                                       qryretorno_pagfor_r3vlr_vencto.AsCurrency,
                                       qryDuplicatasvalorvencto.asCurrency);

      v_ValorPagto := RatearValores(qryretorno_pagfor_r3vlr_pagto.AsCurrency,
                                    qryretorno_pagfor_r3vlr_vencto.AsCurrency,
                                    qryDuplicatasvalorvencto.asCurrency);
             }

      v_ValorPagto := RatearValores(qryretorno_pagfor_r3vlr_pagto.AsCurrency,
                                    (qryretorno_pagfor_r3vlr_vencto.AsCurrency -
                                     qryretorno_pagfor_r3vlr_desconto.AsCurrency),
                                    qryDuplicatasvalorvencto.asCurrency);

      v_TotalConciliado := qryretorno_pagfor_r3totalconciliado.asCurrency - v_ValorPagto;
      v_SaldoConciliar := qryretorno_pagfor_r3SaldoConciliar.asCurrency + v_ValorPagto;

      RefazConsultaPorNome(qryDuplicatas_PagFor,
       ['Todas','documentopag', 'datavencto', 'numero'],
       [False, qryDuplicatasdocumentopag.asInteger,
        qryDuplicatasdatavencto.asDateTime,
        qryDuplicatasnumero.asinteger]);

      if (qryDuplicatas_PagFor.RecordCount=1) and qryDuplicatas_PagForpagfor_duplicata.isnull then
        qryDuplicatas_PagFor.delete
      else
      begin

        qryDuplicatas_PagFor.edit;

        qryDuplicatas_PagFordocumentopag.asInteger := qryDuplicatasdocumentopag.asInteger;
        qryDuplicatas_PagFornumero.asInteger := qryDuplicatasnumero.asInteger;
        qryDuplicatas_PagFordatavencto.asDateTime := qryDuplicatasdatavencto.asDateTime;

//      qryDuplicatas_PagForvalorvencto.asCurrency := qryDuplicatasvalorvencto.asCurrency;
//      qryDuplicatas_PagForvalordesconto.asCurrency := v_ValorDesconto;
//      qryDuplicatas_PagForobservacao.asString := qryDuplicatasobservacao.asString;
//      qryDuplicatas_PagForevento.asInteger := qryDuplicatasevento.asInteger;



        qryDuplicatas_PagFordatapagto.asDateTime := qryretorno_pagfor_r3dt_pagto.AsDateTime;
        qryDuplicatas_PagForvalorpagto.asCurrency := v_ValorPagto;
        qryDuplicatas_PagForcontapagto.asinteger := qryretorno_pagfor_r3nr_da_conta_cor.AsInteger;
        qryDuplicatas_PagForfilialpagto.asinteger := qryretorno_pagfor_r3filial.asinteger;

        if qryretorno_pagfor_r3contacontabil.asinteger <> 0 then
          qryDuplicatas_PagForcontacredito.asinteger := qryretorno_pagfor_r3contacontabil.asinteger;
        qryDuplicatas_PagFortipopagamento.asInteger := parsistema.TipoPagamentoAutenticacoes;


        qryDuplicatas_PagForusuario.asinteger :=  codigousuario;

        qryDuplicatas_PagForpagfor.asinteger := qryretorno_pagfor_r3pagfor.asInteger;
        qryDuplicatas_PagForobservacao.asString := qryDuplicatasobservacao.asString;
        qryDuplicatas_PagForoperacao.asString := 'Desconciliar';

        qryDuplicatas_PagFor.post;
      end;

      result := perpetrar([qryDuplicatas_PagFor]);

      if result then
      begin
        TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.Cells[
           TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.ColumnByFieldName['totalconciliado'].index,
           TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.row] :=
           CurrtoStr(v_TotalConciliado);

        TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.Cells[
           TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.ColumnByFieldName['SaldoConciliar'].index,
           TfrmLerRetornoPagFor(self.owner).DBAdvGridretorno_pagfor_r3.row] :=
           CurrToStr(v_SaldoConciliar);

        qryretorno_pagfor_r3.edit;
        qryretorno_pagfor_r3totalconciliado.asCurrency := v_TotalConciliado;
        qryretorno_pagfor_r3SaldoConciliar.asCurrency := v_SaldoConciliar;
        qryretorno_pagfor_r3.post;

        GuardarPosicaoDuplicatas;
        qryretorno_pagfor_r3AfterScroll(qryretorno_pagfor_r3);
        RestaurarPosicaoDuplicatas;
        qryDuplicatas.edit;

        TfrmLerRetornoPagFor(self.owner).CalcularTotaisretorno_pagfor_r3;

      end;

    end;
  end;
end;

procedure TdtmLerRetornoPagFor.qryretorno_pagfor_r3_segGCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryretorno_pagfor_r3_segGSaldoConciliar.asCurrency :=
    qryretorno_pagfor_r3_segGvlr_nominal.asCurrency - qryretorno_pagfor_r3_segGtotalconciliado.asCurrency;

end;

procedure TdtmLerRetornoPagFor.VerificarRegistrosPendentesdeGravacao;
begin
  qryAtualizacoes_Identif_Dupl_Pendentes.close;
  qryAtualizacoes_Identif_Dupl_Pendentes.open;

  RegistrosPendentesdeGravacao :=
    (qryAtualizacoes_Identif_Dupl_Pendentescancelamento_da_identificacao.asinteger <> 0) or
    (qryAtualizacoes_Identif_Dupl_Pendentesidentificacao.asinteger <> 0) or
    (qryAtualizacoes_Identif_Dupl_Pendentescancelamento_do_pagamento.asinteger <> 0) or
    (qryAtualizacoes_Identif_Dupl_Pendentespagamento.asinteger <> 0);


  {Enquanto não houver uma confirmação não poderá gerar ou consulta novos registros }

  if RegistrosPendentesdeGravacao then
  begin

    GerandoConsulta := PendenciasdeGravacao;
    AbrirConsultaRetorno('','');
    GerandoConsulta := NaoGerando;

    MensagemAviso(format(
                  'Existem Pagamentos ou identificações de duplicatas pendentes para gravação.'+chr(13)+
                  'Cancelamento de duplicatas identificadas: %x '+chr(13)+
                  'Confirmação  de duplicatas identificadas: %x '+chr(13)+
                  'Cancelamento de pagamento de duplicatas: %x '+chr(13)+
                  'Confirmação  de pagamento de duplicatas: %x ',
                  [qryAtualizacoes_Identif_Dupl_Pendentescancelamento_da_identificacao.asinteger,
                   qryAtualizacoes_Identif_Dupl_Pendentesidentificacao.asinteger,
                   qryAtualizacoes_Identif_Dupl_Pendentescancelamento_do_pagamento.asinteger,
                   qryAtualizacoes_Identif_Dupl_Pendentespagamento.asinteger]));
  end;
end;

function TdtmLerRetornoPagFor.SalvarRetornoPagFor: Boolean;
var
  duplicatasSelecionadas: TtecDuplicatasSelecionadas;

  function DesQuitarDuplicatas: Boolean;
  begin
    duplicatasSelecionadas := nil;
    SetLength(duplicatasSelecionadas, 1);
    duplicatasSelecionadas[0].DocumentoPag := qryDuplicatas_PagForDocumentoPag.AsInteger;
    duplicatasSelecionadas[0].DataVencto := qryDuplicatas_PagForDataVencto.Asdatetime;
    duplicatasSelecionadas[0].Numero := qryDuplicatas_PagForNumero.asinteger;

    Result := dtmContasPagar.DesQuitarDuplicatas(
                              qryDuplicatas_PagFordocumentopag.AsInteger,
                              qryDuplicatas_PagFornumero.AsInteger,
                              qryDuplicatas_PagFordatavencto.AsDateTime,
                              duplicatasSelecionadas);

    if result then
    begin
      RefazConsultaPorNome(qryDuplicatasAux_,['documentopag','datavencto', 'numero'],
         [qryDuplicatas_PagFordocumentopag.AsInteger,
          qryDuplicatas_PagFordatavencto.asDateTime,
          qryDuplicatas_PagFornumero.asinteger]);

      if not qryDuplicatasAux_pagfor.isnull then
      begin
        qryDuplicatasAux_.edit;
        qryDuplicatasAux_pagfor.clear;
        qryDuplicatasAux_.post;
        result := perpetrar([qryduplicatasAux_]);
      end;
    end;

  end;

begin
  try
    result := true;

    if not assigned(Usuario) then
      Usuario := TtecUsuarios.Create(dtmTecSoft.Database);


    if UsuarioLogin.Pagamento
    then Usuario:= ObterAutorizacao(taSENHA)
    else Usuario:= ObterAutorizacao(taLOGIN, ctAUTORIZACAOPAGAMENTO, ctAUTORIZADO);

    if Assigned(Usuario) and Usuario.Pagamento then
    begin
      qryAtualizacoes_Identif_Dupl_Pendentes.close;
      qryAtualizacoes_Identif_Dupl_Pendentes.open;

      if (qryAtualizacoes_Identif_Dupl_Pendentescancelamento_da_identificacao.asinteger<>0) or
         (qryAtualizacoes_Identif_Dupl_Pendentesidentificacao.asInteger<>0) then
      begin
        qryAtualizar_Identificacoes_Pendentes.execsql;  {Somente setar o pagforG }
        qryAtualizar_Identificacoes_Pendentes.transaction.commit;
      end;

      if (qryAtualizacoes_Identif_Dupl_Pendentescancelamento_do_pagamento.asinteger<>0) or
         (qryAtualizacoes_Identif_Dupl_Pendentespagamento.asinteger<>0) then
      begin
        {Abrir Tabela com as quitações já realizadas porém não confirmadas (ou seja não pressionou F5 para gravar)}
        try


          qryAtualizar_Dupl_Pendentes.execsql; {Somente setar o pagfor quando já estiver paga}
          qryAtualizar_Dupl_Pendentes.transaction.commit;
          {Fazer a quitação/Desquitação pelo código do restante dos dados}
          RefazConsultaPorNome(qryDuplicatas_PagFor,
           ['Todas'], [True]);

          qryDuplicatas_PagFor.first;
          while not qryDuplicatas_PagFor.eof do
          begin
            if qryDuplicatas_PagForoperacao.asString = 'Conciliar' then
            begin
              if not qryDuplicatas_PagFordatapgto_duplicata.isnull then
                Result := DesQuitarDuplicatas;

              if Result then
                Result := dtmContasPagar.QuitarDuplicatas(
                              qryDuplicatas_PagFordocumentopag.AsInteger,
                              qryDuplicatas_PagFornumero.AsInteger,
                              qryDuplicatas_PagForfilialpagto.AsInteger,
                              qryDuplicatas_PagFortipopagamento.asInteger,
                              qryDuplicatas_PagForcontapagto.asInteger,
                              qryDuplicatas_PagForcontacredito.asinteger,
                              '',
                              qryDuplicatas_PagForobservacao.asstring,
                              qryDuplicatas_PagFordatavencto.AsDateTime,
                              qryDuplicatas_PagFordatapagto.AsDateTime,
                              qryDuplicatas_PagForvalorpagto.AsCurrency,
                              qryDuplicatas_PagForvalordesconto.asCurrency, {não utilizado, não utilizamos compo desconto, o valor é aplicado ao valorpagto}
                              false,
                              '',
                              '');
            end
            else
            if qryDuplicatas_PagForoperacao.asString = 'Desconciliar' then
              result := DesQuitarDuplicatas;


            if not result then
              break;

            qryDuplicatas_PagFor.next;
          end;

          if result then
          begin {Visto que agora estão iguais, chama novamente o update para atualizar o pagfor}

            qryAtualizar_Dupl_Pendentes.execsql; {Somente setar o pagfor quando já estiver paga}
            qryAtualizar_Dupl_Pendentes.transaction.commit;
          end;


        finally
          if not result then
            MensagemAviso('Houve um problema no momento da confirmação da conciliação.');

          RefazConsultaPorNome(qryDuplicatas_PagFor, ['Todas'], [False]);
        end;
      end;

    end;

  finally
    RegistrosPendentesdeGravacao := false;
  end;

end;

end.
