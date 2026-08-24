unit dmControleESNF;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, ZQuery, ZPgSqlQuery, cpquery, biblio,
  dmtecsoft, fr_dset, fr_dbset, fr_class, fmpreviewpadrao, ctconstantes, frx2xto30,
  frxClass;

type
  TdtmControleESNF = class(TDtmBasico)
    qryConserto_OrigemCliente_AgrupamentoCliente: TtecQuery;
    frpConserto_OrigemCliente_AgrupamentoCliente: TfrReport;
    fdsConserto_OrigemCliente_AgrupamentoCliente: TfrDBDataSet;
    qryConserto_OrigemCliente_AgrupamentoFornecedor: TtecQuery;
    frpConserto_OrigemCliente_AgrupamentoFornecedor: TfrReport;
    fdsConserto_OrigemCliente_AgrupamentoFornecedor: TfrDBDataSet;
    VerSaldos_qryConserto_OrigemCliente_AgrupamentoCliente: TtecQuery;
    NaoVerSaldos_qryConserto_OrigemCliente_AgrupamentoCliente: TtecQuery;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresa: TtecQuery;
    frpConserto_OrigemEmpresa_AgrupamentoEmpresa: TfrReport;
    fdsConserto_OrigemEmpresa_AgrupamentoEmpresa: TfrDBDataSet;
    VerSaldos_qryConserto_OrigemEmpresa_AgrupamentoEmpresa: TtecQuery;
    NaoVerSaldos_qryConserto_OrigemEmpresa_AgrupamentoEmpresa: TtecQuery;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresafilialemissao: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresanomefilial: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresadata: TDateField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresadatahoraemissao: TDateTimeField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresafornecedor: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresatipofornecedor: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresanomefornecedor: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresaemitente: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresatipoemitente: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresaserie: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresanumero: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresaproduto: TLargeintField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresaprodutovisual: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresanumeroproduto: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresadadofiscal: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresanumeroprodutotabela: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresadescricaoproduto: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresaquantidade: TFloatField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresaenviadoaofabricante_5915: TFloatField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresarecebidodofabricante_1916: TFloatField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresaoperacao: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresacodigofiscal: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresasaldoempresa: TFloatField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresalocalizacao: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresasaldo_a_devolver_para_o_cliente: TBooleanField;
    qryConserto_OrigemEmpresa_AgrupamentoEmpresasaldo_retornado_do_conserto: TBooleanField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedor: TtecQuery;
    frpConserto_OrigemEmpresa_AgrupamentoFornecedor: TfrReport;
    fdsConserto_OrigemEmpresa_AgrupamentoFornecedor: TfrDBDataSet;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorfilialemissao: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedornomefilial: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedordata: TDateField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedordatahoraemissao: TDateTimeField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorfornecedor: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedortipofornecedor: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedornomefornecedor: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorlocalizacao: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedoremitente: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedortipoemitente: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorserie: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedornumero: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorproduto: TLargeintField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorprodutovisual: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedornumeroproduto: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedordadofiscal: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedornumeroprodutotabela: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedordescricaoproduto: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorquantidade: TFloatField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorenviadoaofabricante_5915: TFloatField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorrecebidodofabricante_1916: TFloatField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedoroperacao: TStringField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorcodigofiscal: TIntegerField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorsaldoempresa: TFloatField;
    qryConserto_OrigemEmpresa_AgrupamentoFornecedorsaldo_a_devolver_para_o_cliente: TBooleanField;
    VerSaldos_qryConserto_OrigemCliente_AgrupamentoFornecedor: TtecQuery;
    NaoVerSaldos_qryConserto_OrigemCliente_AgrupamentoFornecedor: TtecQuery;
    qryConserto_OrigemCliente_AgrupamentoClientecliente: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoClientetipocliente: TStringField;
    qryConserto_OrigemCliente_AgrupamentoClientenomecliente: TStringField;
    qryConserto_OrigemCliente_AgrupamentoClientedata: TDateField;
    qryConserto_OrigemCliente_AgrupamentoClientedatahoraemissao: TDateTimeField;
    qryConserto_OrigemCliente_AgrupamentoClientefornecedor: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoClientetipofornecedor: TStringField;
    qryConserto_OrigemCliente_AgrupamentoClientelocalizacao: TStringField;
    qryConserto_OrigemCliente_AgrupamentoClienteemitente: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoClientetipoemitente: TStringField;
    qryConserto_OrigemCliente_AgrupamentoClienteserie: TStringField;
    qryConserto_OrigemCliente_AgrupamentoClientenumero: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoClienteproduto: TLargeintField;
    qryConserto_OrigemCliente_AgrupamentoClienteprodutovisual: TStringField;
    qryConserto_OrigemCliente_AgrupamentoClientenumeroproduto: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoClientecodigonotaoriginal: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoClientenumeroprodutooriginal: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoClientedescricaoproduto: TStringField;
    qryConserto_OrigemCliente_AgrupamentoClientequantidade: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoClienterecebidodocliente_1915: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoClientedevolvidoparaoclientecomconserto_5916: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoClientedevolvidoparaoclientesemconserto_5916: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoClienteenviadoaofabricante_5915: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoClienterecebidodofabricante_1916: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoClienteoperacao: TStringField;
    qryConserto_OrigemCliente_AgrupamentoClientecodigofiscal: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoClientesaldocliente: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoClientesaldoempresa: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoClientesaldoconsertodisponivel: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoClientesaldo_a_devolver_para_o_cliente: TBooleanField;
    qryConserto_OrigemCliente_AgrupamentoClientesaldo_disponivel_na_empresa: TBooleanField;
    qryConserto_OrigemCliente_AgrupamentoClientesaldo_retornado_do_conserto: TBooleanField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorcliente: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoFornecedortipocliente: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedornomecliente: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorseriecliente: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedornumeronotacliente: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoFornecedordata: TDateField;
    qryConserto_OrigemCliente_AgrupamentoFornecedordatahoraemissao: TDateTimeField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorfornecedor: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoFornecedortipofornecedor: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedornomefornecedor: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedoremitente: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoFornecedortipoemitente: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorserie: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedornumero: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorproduto: TLargeintField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorprodutovisual: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedornumeroproduto: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorcodigonotaoriginal: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoFornecedornumeroprodutooriginal: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoFornecedordescricaoproduto: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorquantidade: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorenviadoaofabricante_5915: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorrecebidodofabricante_1916: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoFornecedoroperacao: TStringField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorcodigofiscal: TIntegerField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorsaldofornecedor: TFloatField;
    qryConserto_OrigemCliente_AgrupamentoFornecedorsaldo_a_devolver_para_o_cliente: TBooleanField;
    NaoVerSaldos_qryConserto_OrigemEmpresa_AgrupamentoFornecedor: TtecQuery;
    VerSaldos_qryConserto_OrigemEmpresa_AgrupamentoFornecedor: TtecQuery;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedor: TtecQuery;
    frpDemons_OrigemFornecedor_AgrupamentoFornecedor: TfrReport;
    fdsDemons_OrigemFornecedor_AgrupamentoFornecedor: TfrDBDataSet;
    NaoVerSaldos_qryDemons_OrigemFornecedor_AgrupamentoFornecedor: TtecQuery;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorcliente: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedortipocliente: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedornomecliente: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedordata: TDateField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedordatahoraemissao: TDateTimeField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorfornecedor: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedortipofornecedor: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorlocalizacao: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedoremitente: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedortipoemitente: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorserie: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedornumero: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorproduto: TLargeintField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorprodutovisual: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedornumeroproduto: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorcodigonotaoriginal: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedornumeroprodutooriginal: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedordescricaoproduto: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorquantidade: TFloatField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorrecebidodofornecedor_1912: TFloatField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedordevolvidoparaofornecedor_5913: TFloatField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedoroperacao: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorcodigofiscal: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorsaldofornecedor: TFloatField;
    qryDemons_OrigemFornecedor_AgrupamentoFornecedorsaldo_a_devolver_para_o_cliente: TBooleanField;
    VerSaldos_qryDemons_OrigemFornecedor_AgrupamentoFornecedor: TtecQuery;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresa: TtecQuery;
    frpDemons_OrigemFornecedor_AgrupamentoEmpresa: TfrReport;
    fdsDemons_OrigemFornecedor_AgrupamentoEmpresa: TfrDBDataSet;
    NaoVerSaldos_qryDemons_OrigemFornecedor_AgrupamentoEmpresa: TtecQuery;
    VerSaldos_qryDemons_OrigemFornecedor_AgrupamentoEmpresa: TtecQuery;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresacliente: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresatipocliente: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresanomecliente: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresadata: TDateField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresadatahoraemissao: TDateTimeField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresafornecedor: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresatipofornecedor: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresafilial: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresanomefilial: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresaemitente: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresatipoemitente: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresaserie: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresanumero: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresaproduto: TLargeintField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresaprodutovisual: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresanumeroproduto: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresacodigonotaoriginal: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresanumeroprodutooriginal: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresadescricaoproduto: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresaquantidade: TFloatField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresarecebidodofornecedor_1912: TFloatField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresadevolvidoparaofornecedor_5913: TFloatField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresaoperacao: TStringField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresacodigofiscal: TIntegerField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresasaldofornecedor: TFloatField;
    qryDemons_OrigemFornecedor_AgrupamentoEmpresasaldo_a_devolver_para_o_cliente: TBooleanField;
    qryDemons_OrigemEmpresa_AgrupamentoCliente: TtecQuery;
    frpDemons_OrigemEmpresa_AgrupamentoCliente: TfrReport;
    fdsDemons_OrigemEmpresa_AgrupamentoCliente: TfrDBDataSet;
    NaoVerSaldos_qryDemons_OrigemEmpresa_AgrupamentoCliente: TtecQuery;
    VerSaldos_qryDemons_OrigemEmpresa_AgrupamentoCliente: TtecQuery;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresa: TtecQuery;
    frpDemons_OrigemEmpresa_AgrupamentoEmpresa: TfrReport;
    fdsDemons_OrigemEmpresa_AgrupamentoEmpresa: TfrDBDataSet;
    NaoVerSaldos_qryDemons_OrigemEmpresa_AgrupamentoEmpresa: TtecQuery;
    VerSaldos_qryDemons_OrigemEmpresa_AgrupamentoEmpresa: TtecQuery;
    qryDemons_OrigemEmpresa_AgrupamentoClientecliente: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoClientetipocliente: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoClientenomecliente: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoClientedata: TDateField;
    qryDemons_OrigemEmpresa_AgrupamentoClientedatahoraemissao: TDateTimeField;
    qryDemons_OrigemEmpresa_AgrupamentoClientelocalizacao: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoClienteemitente: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoClientetipoemitente: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoClienteserie: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoClientenumero: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoClienteproduto: TLargeintField;
    qryDemons_OrigemEmpresa_AgrupamentoClienteprodutovisual: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoClientenumeroproduto: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoClientedadofiscal: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoClientenumeroprodutotabela: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoClientedescricaoproduto: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoClientequantidade: TFloatField;
    qryDemons_OrigemEmpresa_AgrupamentoClienteenviadocliente_5912: TFloatField;
    qryDemons_OrigemEmpresa_AgrupamentoClienterecebidoretornodemonstracao_1913: TFloatField;
    qryDemons_OrigemEmpresa_AgrupamentoClienteoperacao: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoClientesaldoempresa: TFloatField;
    qryDemons_OrigemEmpresa_AgrupamentoClientesaldo_a_devolver_para_o_cliente: TBooleanField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresacliente: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresatipocliente: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresanomecliente: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresafilial: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresanomefilial: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresadata: TDateField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresadatahoraemissao: TDateTimeField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresalocalizacao: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresaemitente: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresatipoemitente: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresaserie: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresanumero: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresaproduto: TLargeintField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresaprodutovisual: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresanumeroproduto: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresadadofiscal: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresanumeroprodutotabela: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresadescricaoproduto: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresaquantidade: TFloatField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresaenviadocliente_5912: TFloatField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresarecebidoretornodemonstracao_1913: TFloatField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresaoperacao: TStringField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresasaldoempresa: TFloatField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresasaldo_a_devolver_para_o_cliente: TBooleanField;
    qryDemons_OrigemEmpresa_AgrupamentoClientecodigofiscal: TIntegerField;
    qryDemons_OrigemEmpresa_AgrupamentoEmpresacodigofiscal: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedor: TtecQuery;
    frpTroca_OrigemEmpresa_AgrupamentoFornecedor: TfrReport;
    fdsTroca_OrigemEmpresa_AgrupamentoFornecedor: TfrDBDataSet;
    NaoVerSaldos_qryTroca_OrigemEmpresa_AgrupamentoFornecedor: TtecQuery;
    VerSaldos_qryTroca_OrigemEmpresa_AgrupamentoFornecedor: TtecQuery;
    qryTroca_OrigemEmpresa_AgrupamentoFilial: TtecQuery;
    fdsTroca_OrigemEmpresa_AgrupamentoFilial: TfrDBDataSet;
    NaoVerSaldos_qryTroca_OrigemEmpresa_AgrupamentoFilial: TtecQuery;
    VerSaldos_qryTroca_OrigemEmpresa_AgrupamentoFilial: TtecQuery;
    frpTroca_OrigemEmpresa_AgrupamentoFilial: TfrReport;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorcliente: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedortipocliente: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedornomecliente: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedordata: TDateField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedordatahoraemissao: TDateTimeField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorlocalizacao: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedoremitente: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedortipoemitente: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorserie: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedornumero: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorproduto: TLargeintField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorprodutovisual: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedornumeroproduto: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedordadofiscal: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedornumeroprodutotabela: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedordescricaoproduto: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorquantidade: TFloatField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorenviadofornecedor_5949: TFloatField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorrecebidoretornotroca_1949: TFloatField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedoroperacao: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorcodigofiscal: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorsaldoempresa: TFloatField;
    qryTroca_OrigemEmpresa_AgrupamentoFornecedorsaldo_a_devolver_para_o_cliente: TBooleanField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialcliente: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialtipocliente: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialnomecliente: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialfilialemissao: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialnomefilial: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialdata: TDateField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialdatahoraemissao: TDateTimeField;
    qryTroca_OrigemEmpresa_AgrupamentoFiliallocalizacao: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialemitente: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialtipoemitente: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialserie: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialnumero: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialproduto: TLargeintField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialprodutovisual: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialnumeroproduto: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialdadofiscal: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialnumeroprodutotabela: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialdescricaoproduto: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialquantidade: TFloatField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialrecebidoretornotroca_1949: TFloatField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialoperacao: TStringField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialcodigofiscal: TIntegerField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialsaldoempresa: TFloatField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialsaldo_a_devolver_para_o_cliente: TBooleanField;
    qryTroca_OrigemEmpresa_AgrupamentoFilialenviadofornecedor_5949: TFloatField;
    qryConsignacao_OrigemEmpresa_AgrupamentoCliente: TtecQuery;
    frpConsignacao_OrigemEmpresa_AgrupamentoCliente: TfrReport;
    fdsConsignacao_OrigemEmpresa_AgrupamentoCliente: TfrDBDataSet;
    NaoVerSaldos_qryConsignacao_OrigemEmpresa_AgrupamentoCliente: TtecQuery;
    VerSaldos_qryConsignacao_OrigemEmpresa_AgrupamentoCliente: TtecQuery;
    NaoVerSaldos_qryConsigna_OrigemFornecedor_AgrupamentoFornecedor: TtecQuery;
    VerSaldos_qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor: TtecQuery;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor: TtecQuery;
    frpConsignacao_OrigemFornecedor_AgrupamentoFornecedor: TfrReport;
    fdsConsignacao_OrigemFornecedor_AgrupamentoFornecedor: TfrDBDataSet;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorcliente: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedortipocliente: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedornomecliente: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedordata: TDateField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedordatahoraemissao: TDateTimeField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorfornecedor: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedortipofornecedor: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorlocalizacao: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedoremitente: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedortipoemitente: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorserie: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedornumero: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorproduto: TLargeintField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorprodutovisual: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedornumeroproduto: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorcodigonotaoriginal: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedornumeroprodutooriginal: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedordescricaoproduto: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorquantidade: TFloatField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorrecebidodofornecedor_1917: TFloatField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedordevolvidoparaofornecedor_5918: TFloatField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedoroperacao: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorcodigofiscal: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorsaldofornecedor: TFloatField;
    qryConsignacao_OrigemFornecedor_AgrupamentoFornecedorsaldo_a_devolver_para_o_cliente: TBooleanField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa: TtecQuery;
    frpConsignacao_OrigemFornecedor_AgrupamentoEmpresa: TfrReport;
    fdsConsignacao_OrigemFornecedor_AgrupamentoEmpresa: TfrDBDataSet;
    NaoVerSaldos_qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa: TtecQuery;
    VerSaldos_qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa: TtecQuery;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa: TtecQuery;
    frpConsignacao_OrigemEmpresa_AgrupamentoEmpresa: TfrReport;
    fdsConsignacao_OrigemEmpresa_AgrupamentoEmpresa: TfrDBDataSet;
    NaoVerSaldos_qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa: TtecQuery;
    VerSaldos_qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa: TtecQuery;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresacliente: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresatipocliente: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresanomecliente: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresadata: TDateField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresadatahoraemissao: TDateTimeField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresafornecedor: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresatipofornecedor: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresafilial: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresanomefilial: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresaemitente: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresatipoemitente: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresaserie: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresanumero: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresaproduto: TLargeintField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresaprodutovisual: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresanumeroproduto: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresacodigonotaoriginal: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresanumeroprodutooriginal: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresadescricaoproduto: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresaquantidade: TFloatField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresarecebidodofornecedor_1917: TFloatField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresadevolvidoparaofornecedor_5918: TFloatField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresaoperacao: TStringField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresacodigofiscal: TIntegerField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresasaldofornecedor: TFloatField;
    qryConsignacao_OrigemFornecedor_AgrupamentoEmpresasaldo_a_devolver_para_o_cliente: TBooleanField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientecliente: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientetipocliente: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientenomecliente: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientedata: TDateField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientedatahoraemissao: TDateTimeField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientelocalizacao: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClienteemitente: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientetipoemitente: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClienteserie: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientenumero: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClienteproduto: TLargeintField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClienteprodutovisual: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientenumeroproduto: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientedadofiscal: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientenumeroprodutotabela: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientedescricaoproduto: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientequantidade: TFloatField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClienteenviadocliente_5917: TFloatField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClienterecebidoretornoconsignacao_1918: TFloatField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClienteoperacao: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientecodigofiscal: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientesaldoempresa: TFloatField;
    qryConsignacao_OrigemEmpresa_AgrupamentoClientesaldo_a_devolver_para_o_cliente: TBooleanField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresacliente: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresatipocliente: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresanomecliente: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresafilial: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresanomefilial: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresadata: TDateField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresadatahoraemissao: TDateTimeField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresalocalizacao: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresaemitente: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresatipoemitente: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresaserie: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresanumero: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresaproduto: TLargeintField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresaprodutovisual: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresanumeroproduto: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresadadofiscal: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresanumeroprodutotabela: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresadescricaoproduto: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresaquantidade: TFloatField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresaenviadocliente_5917: TFloatField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresarecebidoretornoconsignacao_1918: TFloatField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresaoperacao: TStringField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresacodigofiscal: TIntegerField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresasaldoempresa: TFloatField;
    qryConsignacao_OrigemEmpresa_AgrupamentoEmpresasaldo_a_devolver_para_o_cliente: TBooleanField;
    frxReport1: TfrxReport;
    procedure frpConserto_OrigemCliente_AgrupamentoClienteBeforePrint(
      Memo: TStringList; View: TfrView);
    procedure frpConserto_OrigemCliente_AgrupamentoFornecedorBeforePrint(
      Memo: TStringList; View: TfrView);
    procedure frpConserto_OrigemEmpresa_AgrupamentoEmpresaBeforePrint(
      Memo: TStringList; View: TfrView);
    procedure frpConserto_OrigemEmpresa_AgrupamentoFornecedorBeforePrint(
      Memo: TStringList; View: TfrView);
  private
    { Private declarations }
  public
    { Public declarations }
    function ImprimirRelatorio(DataInicial, DataFinal: String;
                                ListaNaturezas: TtecQuery; TipoRelatorio: integer;
                                Origem: integer; Agrupamento: integer;

                                SALDO_A_DEVOLVER_PARA_O_CLIENTE,
                                SALDO_RETORNADO_DO_CONSERTO,
                                SALDO_DISPONIVEL_NA_EMPRESA : boolean
                                ): boolean;

  end;

var
  dtmControleESNF: TdtmControleESNF;

implementation

{$R *.dfm}

{ TdtmControleESNF }

function TdtmControleESNF.ImprimirRelatorio(DataInicial, DataFinal: String;
  ListaNaturezas: TtecQuery; TipoRelatorio: integer; Origem: integer; Agrupamento: integer;

  SALDO_A_DEVOLVER_PARA_O_CLIENTE,
  SALDO_RETORNADO_DO_CONSERTO,
  SALDO_DISPONIVEL_NA_EMPRESA : boolean
  ): boolean;
var
  vListadeNaturezas_EntradaParaConserto_1915,
  vListadeNaturezas_SaidaParaConserto_5915,
  vListadeNaturezas_RetornodoConserto_1916,
  vListadeNaturezas_RetornoRecebidoConsertoCliente_5916,
  vListadeNaturezas_EntradaParaDemonstracao_1912,
  vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913,
  vListadeNaturezas_SaidaDemonstracao_5912,
  vListadeNaturezas_RetornoSaidaDemonstracao_1913,
  vListadeNaturezas_SaidaTroca_5949,
  vListadeNaturezas_RetornoSaidaTroca_1949,
  vListadeNaturezas_EntradaParaConsignacao_1917,
  vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918,
  vListadeNaturezas_SaidaConsignacao_5917,
  vListadeNaturezas_RetornoSaidaConsignacao_1918 : String;

  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  vPossuiRegistro : boolean;


begin
  result := true;
  vPossuiRegistro := false;

  frVariables['RAZAOFILIALBASE']  := RazaoFilialBase;
  frVariables['ENDERECO_BAIRRO']   := RuaFilialBase+ ' - '+BairroFilialBase;
  frVariables['CEP_CIDADE_UF']:= FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase;
  frVariables['Outras']:= 'PERÍODO ENTRE '+
  FormatDateTime('dd/mm/yy', strtodate(datainicial))+
  ' E '+FormatDateTime('dd/mm/yy', strtodate(DataFinal));
  frmPreview := TfrmPreviewPadrao.create(self);


  frpConserto_OrigemCliente_AgrupamentoCliente.SaveToFile('n:\gedovar\fastreport\frpConserto_OrigemCliente_AgrupamentoCliente.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpConserto_OrigemCliente_AgrupamentoCliente.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpConserto_OrigemCliente_AgrupamentoCliente.fr3');

  frpConserto_OrigemCliente_AgrupamentoFornecedor.SaveToFR3File('n:\gedovar\fastreport\frpConserto_OrigemCliente_AgrupamentoFornecedor.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpConserto_OrigemCliente_AgrupamentoFornecedor.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpConserto_OrigemCliente_AgrupamentoFornecedor.fr3');

  frpConserto_OrigemEmpresa_AgrupamentoEmpresa.SaveToFR3File('n:\gedovar\fastreport\frpConserto_OrigemEmpresa_AgrupamentoEmpresa.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpConserto_OrigemEmpresa_AgrupamentoEmpresa.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpConserto_OrigemEmpresa_AgrupamentoEmpresa.fr3');

  frpConserto_OrigemEmpresa_AgrupamentoFornecedor.SaveToFR3File('n:\gedovar\fastreport\frpConserto_OrigemEmpresa_AgrupamentoFornecedor.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpConserto_OrigemEmpresa_AgrupamentoFornecedor.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpConserto_OrigemEmpresa_AgrupamentoFornecedor.fr3');

  frpDemons_OrigemFornecedor_AgrupamentoFornecedor.SaveToFR3File('n:\gedovar\fastreport\frpDemons_OrigemFornecedor_AgrupamentoFornecedor.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpDemons_OrigemFornecedor_AgrupamentoFornecedor.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpDemons_OrigemFornecedor_AgrupamentoFornecedor.fr3');

  frpDemons_OrigemFornecedor_AgrupamentoEmpresa.SaveToFR3File('n:\gedovar\fastreport\frpDemons_OrigemFornecedor_AgrupamentoEmpresa.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpDemons_OrigemFornecedor_AgrupamentoEmpresa.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpDemons_OrigemFornecedor_AgrupamentoEmpresa.fr3');

  frpDemons_OrigemEmpresa_AgrupamentoCliente.SaveToFR3File('n:\gedovar\fastreport\frpDemons_OrigemEmpresa_AgrupamentoCliente.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpDemons_OrigemEmpresa_AgrupamentoCliente.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpDemons_OrigemEmpresa_AgrupamentoCliente.fr3');

  frpDemons_OrigemEmpresa_AgrupamentoEmpresa.SaveToFR3File('n:\gedovar\fastreport\frpDemons_OrigemEmpresa_AgrupamentoEmpresa.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpDemons_OrigemEmpresa_AgrupamentoEmpresa.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpDemons_OrigemEmpresa_AgrupamentoEmpresa.fr3');

  frpTroca_OrigemEmpresa_AgrupamentoFornecedor.SaveToFR3File('n:\gedovar\fastreport\frpTroca_OrigemEmpresa_AgrupamentoFornecedor.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpTroca_OrigemEmpresa_AgrupamentoFornecedor.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpTroca_OrigemEmpresa_AgrupamentoFornecedor.fr3');

  frpTroca_OrigemEmpresa_AgrupamentoFilial.SaveToFR3File('n:\gedovar\fastreport\frpTroca_OrigemEmpresa_AgrupamentoFilial.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpTroca_OrigemEmpresa_AgrupamentoFilial.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpTroca_OrigemEmpresa_AgrupamentoFilial.fr3');

  frpConsignacao_OrigemFornecedor_AgrupamentoFornecedor.SaveToFR3File('n:\gedovar\fastreport\frpConsignacao_OrigemFornecedor_AgrupamentoFornecedor.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpConsignacao_OrigemFornecedor_AgrupamentoFornecedor.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpConsignacao_OrigemFornecedor_AgrupamentoFornecedor.fr3');

  frpConsignacao_OrigemFornecedor_AgrupamentoEmpresa.SaveToFR3File('n:\gedovar\fastreport\frpConsignacao_OrigemFornecedor_AgrupamentoEmpresa.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpConsignacao_OrigemFornecedor_AgrupamentoEmpresa.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpConsignacao_OrigemFornecedor_AgrupamentoEmpresa.fr3');

  frpConsignacao_OrigemEmpresa_AgrupamentoCliente.SaveToFR3File('n:\gedovar\fastreport\frpConsignacao_OrigemEmpresa_AgrupamentoCliente.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpConsignacao_OrigemEmpresa_AgrupamentoCliente.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpConsignacao_OrigemEmpresa_AgrupamentoCliente.fr3');

  frpConsignacao_OrigemEmpresa_AgrupamentoEmpresa.SaveToFR3File('n:\gedovar\fastreport\frpConsignacao_OrigemEmpresa_AgrupamentoEmpresa.frf');
  frxReport1.LoadFromFile('n:\gedovar\fastreport\frpConsignacao_OrigemEmpresa_AgrupamentoEmpresa.frf');
  frxReport1.SaveToFile('n:\gedovar\fastreport\frpConsignacao_OrigemEmpresa_AgrupamentoEmpresa.fr3');





  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    case TipoRelatorio of
    {CONSERTO}
    0: begin
         case origem of {Cliente}
         0: begin
              case Agrupamento of {Cliente}
              0: begin
                   frCompositeReport.Reports.Add(frpConserto_OrigemCliente_AgrupamentoCliente);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DO CLIENTE EM CONSERTO';
                   vListadeNaturezas_EntradaParaConserto_1915 := '';
                   vListadeNaturezas_SaidaParaConserto_5915 := '';
                   vListadeNaturezas_RetornodoConserto_1916 := '';
                   vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 915) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_EntradaParaConserto_1915 := vListadeNaturezas_EntradaParaConserto_1915 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 915) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaParaConserto_5915 := vListadeNaturezas_SaidaParaConserto_5915 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 916) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornodoConserto_1916 := vListadeNaturezas_RetornodoConserto_1916 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 916) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 := vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_EntradaParaConserto_1915<>'' then
                     delete(vListadeNaturezas_EntradaParaConserto_1915,length(vListadeNaturezas_EntradaParaConserto_1915),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de entrada de mercadoria para conserto (1915) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_SaidaParaConserto_5915<>'' then
                       delete(vListadeNaturezas_SaidaParaConserto_5915,length(vListadeNaturezas_SaidaParaConserto_5915),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de saída de mercadoria para conserto (5915) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornodoConserto_1916<>'' then
                       delete(vListadeNaturezas_RetornodoConserto_1916,length(vListadeNaturezas_RetornodoConserto_1916),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno de mercadoria para conserto (1916) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoRecebidoConsertoCliente_5916<>'' then
                       delete(vListadeNaturezas_RetornoRecebidoConsertoCliente_5916,length(vListadeNaturezas_RetornoRecebidoConsertoCliente_5916),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno recebido para conserto (5916) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE
                        and not SALDO_RETORNADO_DO_CONSERTO
                        and not SALDO_DISPONIVEL_NA_EMPRESA then
                       qryConserto_OrigemCliente_AgrupamentoCliente.Sql.Text := NaoVerSaldos_qryConserto_OrigemCliente_AgrupamentoCliente.Sql.Text
                     else
                       qryConserto_OrigemCliente_AgrupamentoCliente.Sql.Text := VerSaldos_qryConserto_OrigemCliente_AgrupamentoCliente.Sql.Text;

                     qryConserto_OrigemCliente_AgrupamentoCliente.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;
                     qryConserto_OrigemCliente_AgrupamentoCliente.ParamByName('SALDO_DISPONIVEL_NA_EMPRESA').asboolean := SALDO_DISPONIVEL_NA_EMPRESA;
                     qryConserto_OrigemCliente_AgrupamentoCliente.ParamByName('SALDO_RETORNADO_DO_CONSERTO').asboolean := SALDO_RETORNADO_DO_CONSERTO;


                     qryConserto_OrigemCliente_AgrupamentoCliente.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryConserto_OrigemCliente_AgrupamentoCliente.ParamByName('datafinal').AsDate := StrToDate(DataFinal);

                     qryConserto_OrigemCliente_AgrupamentoCliente.MacroByName('ListadeNaturezas_EntradaParaConserto_1915').AsString := vListadeNaturezas_EntradaParaConserto_1915;
                     qryConserto_OrigemCliente_AgrupamentoCliente.MacroByName('ListadeNaturezas_SaidaParaConserto_5915').AsString := vListadeNaturezas_SaidaParaConserto_5915;
                     qryConserto_OrigemCliente_AgrupamentoCliente.MacroByName('ListadeNaturezas_RetornodoConserto_1916').AsString := vListadeNaturezas_RetornodoConserto_1916;
                     qryConserto_OrigemCliente_AgrupamentoCliente.MacroByName('ListadeNaturezas_RetornoRecebidoConsertoCliente_5916').AsString := vListadeNaturezas_RetornoRecebidoConsertoCliente_5916;
                     qryConserto_OrigemCliente_AgrupamentoCliente.close;
                     qryConserto_OrigemCliente_AgrupamentoCliente.Open;
                     vPossuiRegistro := qryConserto_OrigemCliente_AgrupamentoCliente.recordcount <> 0;
                   end;

                 end;

              1: begin {Fornecedor}

                   frCompositeReport.Reports.Add(frpConserto_OrigemCliente_AgrupamentoFornecedor);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DO CLIENTE EM CONSERTO POR FORNECEDOR';
                   vListadeNaturezas_EntradaParaConserto_1915 := '';
                   vListadeNaturezas_SaidaParaConserto_5915 := '';
                   vListadeNaturezas_RetornodoConserto_1916 := '';
//                   vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 915) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_EntradaParaConserto_1915 := vListadeNaturezas_EntradaParaConserto_1915 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 915) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaParaConserto_5915 := vListadeNaturezas_SaidaParaConserto_5915 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 916) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornodoConserto_1916 := vListadeNaturezas_RetornodoConserto_1916 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

//                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 916) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
//                        vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 := vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_EntradaParaConserto_1915<>'' then
                     delete(vListadeNaturezas_EntradaParaConserto_1915,length(vListadeNaturezas_EntradaParaConserto_1915),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de entrada de mercadoria para conserto (1915) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_SaidaParaConserto_5915<>'' then
                       delete(vListadeNaturezas_SaidaParaConserto_5915,length(vListadeNaturezas_SaidaParaConserto_5915),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de saída de mercadoria para conserto (5915) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornodoConserto_1916<>'' then
                       delete(vListadeNaturezas_RetornodoConserto_1916,length(vListadeNaturezas_RetornodoConserto_1916),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno de mercadoria para conserto (1916) foi selecionada');
                     end;
                   end;
  {
                   if result then
                   begin
                     if vListadeNaturezas_RetornoRecebidoConsertoCliente_5916<>'' then
                       delete(vListadeNaturezas_RetornoRecebidoConsertoCliente_5916,length(vListadeNaturezas_RetornoRecebidoConsertoCliente_5916),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno recebido para conserto (5916) foi selecionada');
                     end;
                   end;
  }

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryConserto_OrigemCliente_AgrupamentoFornecedor.Sql.Text := NaoVerSaldos_qryConserto_OrigemCliente_AgrupamentoFornecedor.Sql.Text
                     else
                       qryConserto_OrigemCliente_AgrupamentoFornecedor.Sql.Text := VerSaldos_qryConserto_OrigemCliente_AgrupamentoFornecedor.Sql.Text;

                     qryConserto_OrigemCliente_AgrupamentoFornecedor.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryConserto_OrigemCliente_AgrupamentoFornecedor.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryConserto_OrigemCliente_AgrupamentoFornecedor.ParamByName('datafinal').AsDate := StrToDate(DataFinal);

                     qryConserto_OrigemCliente_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_EntradaParaConserto_1915').AsString := vListadeNaturezas_EntradaParaConserto_1915;
                     qryConserto_OrigemCliente_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_SaidaParaConserto_5915').AsString := vListadeNaturezas_SaidaParaConserto_5915;
                     qryConserto_OrigemCliente_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_RetornodoConserto_1916').AsString := vListadeNaturezas_RetornodoConserto_1916;
  {                   qryConserto_OrigemCliente_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_RetornoRecebidoConsertoCliente_5916').AsString := vListadeNaturezas_RetornoRecebidoConsertoCliente_5916;}
                     qryConserto_OrigemCliente_AgrupamentoFornecedor.close;
                     qryConserto_OrigemCliente_AgrupamentoFornecedor.Open;
                     vPossuiRegistro := qryConserto_OrigemCliente_AgrupamentoFornecedor.recordcount <> 0;
                   end;
                 end;
              end;

            end;

         1: begin {empresa}

              case Agrupamento of {empresa}
              0: begin
                   frCompositeReport.Reports.Add(frpConserto_OrigemEmpresa_AgrupamentoEmpresa);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DA EMPRESA EM CONSERTO';
//                   vListadeNaturezas_EntradaParaConserto_1915 := '';
                   vListadeNaturezas_SaidaParaConserto_5915 := '';
                   vListadeNaturezas_RetornodoConserto_1916 := '';
//                   vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
//                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 915) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
//                        vListadeNaturezas_EntradaParaConserto_1915 := vListadeNaturezas_EntradaParaConserto_1915 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 915) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaParaConserto_5915 := vListadeNaturezas_SaidaParaConserto_5915 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 916) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornodoConserto_1916 := vListadeNaturezas_RetornodoConserto_1916 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

//                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 916) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
//                        vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 := vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;
{
                   if vListadeNaturezas_EntradaParaConserto_1915<>'' then
                     delete(vListadeNaturezas_EntradaParaConserto_1915,length(vListadeNaturezas_EntradaParaConserto_1915),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de entrada de mercadoria para conserto (1915) foi selecionada');
                   end;
}
                   if result then
                   begin
                     if vListadeNaturezas_SaidaParaConserto_5915<>'' then
                       delete(vListadeNaturezas_SaidaParaConserto_5915,length(vListadeNaturezas_SaidaParaConserto_5915),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de saída de mercadoria para conserto (5915) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornodoConserto_1916<>'' then
                       delete(vListadeNaturezas_RetornodoConserto_1916,length(vListadeNaturezas_RetornodoConserto_1916),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno de mercadoria para conserto (1916) foi selecionada');
                     end;
                   end;
{
                   if result then
                   begin
                     if vListadeNaturezas_RetornoRecebidoConsertoCliente_5916<>'' then
                       delete(vListadeNaturezas_RetornoRecebidoConsertoCliente_5916,length(vListadeNaturezas_RetornoRecebidoConsertoCliente_5916),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno recebido para conserto (5916) foi selecionada');
                     end;
                   end;
}

                   if result then
                   begin

                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE {PARA_A_EMPRESA}
                        and not SALDO_RETORNADO_DO_CONSERTO then
                       qryConserto_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text := NaoVerSaldos_qryConserto_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text
                     else
                       qryConserto_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text := VerSaldos_qryConserto_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text;

                     qryConserto_OrigemEmpresa_AgrupamentoEmpresa.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;
                     qryConserto_OrigemEmpresa_AgrupamentoEmpresa.ParamByName('SALDO_RETORNADO_DO_CONSERTO').asboolean := SALDO_RETORNADO_DO_CONSERTO;


                     qryConserto_OrigemEmpresa_AgrupamentoEmpresa.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryConserto_OrigemEmpresa_AgrupamentoEmpresa.ParamByName('datafinal').AsDate := StrToDate(DataFinal);

  //                   qryConserto_OrigemCliente_AgrupamentoCliente.MacroByName('ListadeNaturezas_EntradaParaConserto_1915').AsString := vListadeNaturezas_EntradaParaConserto_1915;
                     qryConserto_OrigemEmpresa_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_SaidaParaConserto_5915').AsString := vListadeNaturezas_SaidaParaConserto_5915;
                     qryConserto_OrigemEmpresa_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_RetornodoConserto_1916').AsString := vListadeNaturezas_RetornodoConserto_1916;
  //                   qryConserto_OrigemCliente_AgrupamentoCliente.MacroByName('ListadeNaturezas_RetornoRecebidoConsertoCliente_5916').AsString := vListadeNaturezas_RetornoRecebidoConsertoCliente_5916;
                     qryConserto_OrigemEmpresa_AgrupamentoEmpresa.close;
                     qryConserto_OrigemEmpresa_AgrupamentoEmpresa.Open;
                     vPossuiRegistro := qryConserto_OrigemEmpresa_AgrupamentoEmpresa.recordcount <> 0;
                   end;

                 end;

              1: begin {fornecedor}

                   frCompositeReport.Reports.Add(frpConserto_OrigemEmpresa_AgrupamentoFornecedor);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DA EMPRESA EM CONSERTO POR FORNECEDOR';
//                 vListadeNaturezas_EntradaParaConserto_1915 := '';
                   vListadeNaturezas_SaidaParaConserto_5915 := '';
                   vListadeNaturezas_RetornodoConserto_1916 := '';
//                   vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
//                   if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 915) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
//                      vListadeNaturezas_EntradaParaConserto_1915 := vListadeNaturezas_EntradaParaConserto_1915 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 915) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaParaConserto_5915 := vListadeNaturezas_SaidaParaConserto_5915 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 916) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornodoConserto_1916 := vListadeNaturezas_RetornodoConserto_1916 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

//                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 916) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
//                        vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 := vListadeNaturezas_RetornoRecebidoConsertoCliente_5916 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

{
                   if vListadeNaturezas_EntradaParaConserto_1915<>'' then
                     delete(vListadeNaturezas_EntradaParaConserto_1915,length(vListadeNaturezas_EntradaParaConserto_1915),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de entrada de mercadoria para conserto (1915) foi selecionada');
                   end;
}
                   if result then
                   begin
                     if vListadeNaturezas_SaidaParaConserto_5915<>'' then
                       delete(vListadeNaturezas_SaidaParaConserto_5915,length(vListadeNaturezas_SaidaParaConserto_5915),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de saída de mercadoria para conserto (5915) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornodoConserto_1916<>'' then
                       delete(vListadeNaturezas_RetornodoConserto_1916,length(vListadeNaturezas_RetornodoConserto_1916),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno de mercadoria para conserto (1916) foi selecionada');
                     end;
                   end;
  {
                   if result then
                   begin
                     if vListadeNaturezas_RetornoRecebidoConsertoCliente_5916<>'' then
                       delete(vListadeNaturezas_RetornoRecebidoConsertoCliente_5916,length(vListadeNaturezas_RetornoRecebidoConsertoCliente_5916),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno recebido para conserto (5916) foi selecionada');
                     end;
                   end;
  }

                   if result then
                   begin

                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE  then
                       qryConserto_OrigemEmpresa_AgrupamentoFornecedor.Sql.Text := NaoVerSaldos_qryConserto_OrigemEmpresa_AgrupamentoFornecedor.Sql.Text
                     else
                       qryConserto_OrigemEmpresa_AgrupamentoFornecedor.Sql.Text := VerSaldos_qryConserto_OrigemEmpresa_AgrupamentoFornecedor.Sql.Text;

                     qryConserto_OrigemEmpresa_AgrupamentoFornecedor.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryConserto_OrigemEmpresa_AgrupamentoFornecedor.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryConserto_OrigemEmpresa_AgrupamentoFornecedor.ParamByName('datafinal').AsDate := StrToDate(DataFinal);

  //                   qryConserto_OrigemEmpresa_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_EntradaParaConserto_1915').AsString := vListadeNaturezas_EntradaParaConserto_1915;
                     qryConserto_OrigemEmpresa_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_SaidaParaConserto_5915').AsString := vListadeNaturezas_SaidaParaConserto_5915;
                     qryConserto_OrigemEmpresa_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_RetornodoConserto_1916').AsString := vListadeNaturezas_RetornodoConserto_1916;
  {                   qryConserto_OrigemEmpresa_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_RetornoRecebidoConsertoCliente_5916').AsString := vListadeNaturezas_RetornoRecebidoConsertoCliente_5916;}
                     qryConserto_OrigemEmpresa_AgrupamentoFornecedor.close;
                     qryConserto_OrigemEmpresa_AgrupamentoFornecedor.Open;
                     vPossuiRegistro := qryConserto_OrigemEmpresa_AgrupamentoFornecedor.recordcount <> 0;
                   end;
                 end;
              end;

            end;
         end;
       end;

    {DEMONSTRAÇÃO}

    1: begin
         case origem of  {fornecedor}
         0: begin
              case Agrupamento of    {fornecedor}
              0: begin
                   frCompositeReport.Reports.Add(frpDemons_OrigemFornecedor_AgrupamentoFornecedor);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DO FORNECEDOR EM DEMONSTRAÇÃO';
                   vListadeNaturezas_EntradaParaDemonstracao_1912 := '';
                   vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 912) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_EntradaParaDemonstracao_1912 := vListadeNaturezas_EntradaParaDemonstracao_1912 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 913) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913 := vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_EntradaParaDemonstracao_1912<>'' then
                     delete(vListadeNaturezas_EntradaParaDemonstracao_1912,length(vListadeNaturezas_EntradaParaDemonstracao_1912),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de entrada de mercadoria para demonstração (1912) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913<>'' then
                       delete(vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913,length(vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de saída de mercadoria para demonstração (5913) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryDemons_OrigemFornecedor_AgrupamentoFornecedor.Sql.Text := NaoVerSaldos_qryDemons_OrigemFornecedor_AgrupamentoFornecedor.Sql.Text
                     else
                       qryDemons_OrigemFornecedor_AgrupamentoFornecedor.Sql.Text := VerSaldos_qryDemons_OrigemFornecedor_AgrupamentoFornecedor.Sql.Text;

                     qryDemons_OrigemFornecedor_AgrupamentoFornecedor.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryDemons_OrigemFornecedor_AgrupamentoFornecedor.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryDemons_OrigemFornecedor_AgrupamentoFornecedor.ParamByName('datafinal').AsDate := StrToDate(DataFinal);
                     qryDemons_OrigemFornecedor_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_EntradaParaDemonstracao_1912').AsString := vListadeNaturezas_EntradaParaDemonstracao_1912;
                     qryDemons_OrigemFornecedor_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913').AsString := vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913;

                     qryDemons_OrigemFornecedor_AgrupamentoFornecedor.close;
                     qryDemons_OrigemFornecedor_AgrupamentoFornecedor.Open;
                     vPossuiRegistro := qryDemons_OrigemFornecedor_AgrupamentoFornecedor.recordcount <> 0;
                   end;
                 end;

              1: begin  {Empresa}

                   frCompositeReport.Reports.Add(frpDemons_OrigemFornecedor_AgrupamentoEmpresa);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DO FORNECEDOR EM DEMONSTRAÇÃO POR FILIAIS';
                   vListadeNaturezas_EntradaParaDemonstracao_1912 := '';
                   vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 912) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_EntradaParaDemonstracao_1912 := vListadeNaturezas_EntradaParaDemonstracao_1912 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 913) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913 := vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_EntradaParaDemonstracao_1912<>'' then
                     delete(vListadeNaturezas_EntradaParaDemonstracao_1912,length(vListadeNaturezas_EntradaParaDemonstracao_1912),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de entrada de mercadoria para demonstração (1912) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913<>'' then
                       delete(vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913,length(vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de saída de mercadoria para retorno de demonstração (5913) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryDemons_OrigemFornecedor_AgrupamentoEmpresa.Sql.Text := NaoVerSaldos_qryDemons_OrigemFornecedor_AgrupamentoEmpresa.Sql.Text
                     else
                       qryDemons_OrigemFornecedor_AgrupamentoEmpresa.Sql.Text := VerSaldos_qryDemons_OrigemFornecedor_AgrupamentoEmpresa.Sql.Text;

                     qryDemons_OrigemFornecedor_AgrupamentoEmpresa.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryDemons_OrigemFornecedor_AgrupamentoEmpresa.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryDemons_OrigemFornecedor_AgrupamentoEmpresa.ParamByName('datafinal').AsDate := StrToDate(DataFinal);

                     qryDemons_OrigemFornecedor_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_EntradaParaDemonstracao_1912').AsString := vListadeNaturezas_EntradaParaDemonstracao_1912;
                     qryDemons_OrigemFornecedor_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913').AsString := vListadeNaturezas_RetornoRecebidoDemonstracaoFornecedor_5913;
                     qryDemons_OrigemFornecedor_AgrupamentoEmpresa.close;
                     qryDemons_OrigemFornecedor_AgrupamentoEmpresa.Open;
                     vPossuiRegistro := qryDemons_OrigemFornecedor_AgrupamentoEmpresa.recordcount <> 0;
                   end;
                 end;
              end;

            end;

         1: begin  { empresa }

              case Agrupamento of
              0: begin
                   frCompositeReport.Reports.Add(frpDemons_OrigemEmpresa_AgrupamentoCliente);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DA EMPRESA EM DEMONSTRAÇÃO POR CLIENTE';
                   vListadeNaturezas_SaidaDemonstracao_5912 := '';
                   vListadeNaturezas_RetornoSaidaDemonstracao_1913 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 912) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaDemonstracao_5912 := vListadeNaturezas_SaidaDemonstracao_5912 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 913) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornoSaidaDemonstracao_1913 := vListadeNaturezas_RetornoSaidaDemonstracao_1913 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_SaidaDemonstracao_5912<>'' then
                     delete(vListadeNaturezas_SaidaDemonstracao_5912,length(vListadeNaturezas_SaidaDemonstracao_5912),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de saída de mercadoria para demonstração (5912) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoSaidaDemonstracao_1913<>'' then
                       delete(vListadeNaturezas_RetornoSaidaDemonstracao_1913,length(vListadeNaturezas_RetornoSaidaDemonstracao_1913),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de entrada de mercadoria para demonstração (1913) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryDemons_OrigemEmpresa_AgrupamentoCliente.Sql.Text := NaoVerSaldos_qryDemons_OrigemEmpresa_AgrupamentoCliente.Sql.Text
                     else
                       qryDemons_OrigemEmpresa_AgrupamentoCliente.Sql.Text := VerSaldos_qryDemons_OrigemEmpresa_AgrupamentoCliente.Sql.Text;

                     qryDemons_OrigemEmpresa_AgrupamentoCliente.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryDemons_OrigemEmpresa_AgrupamentoCliente.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryDemons_OrigemEmpresa_AgrupamentoCliente.ParamByName('datafinal').AsDate := StrToDate(DataFinal);
                     qryDemons_OrigemEmpresa_AgrupamentoCliente.MacroByName('ListadeNaturezas_SaidaDemonstracao_5912').AsString := vListadeNaturezas_SaidaDemonstracao_5912;
                     qryDemons_OrigemEmpresa_AgrupamentoCliente.MacroByName('ListadeNaturezas_RetornoSaidaDemonstracao_1913').AsString := vListadeNaturezas_RetornoSaidaDemonstracao_1913;


                     qryDemons_OrigemEmpresa_AgrupamentoCliente.close;
                     qryDemons_OrigemEmpresa_AgrupamentoCliente.Open;
                     vPossuiRegistro := qryDemons_OrigemEmpresa_AgrupamentoCliente.recordcount <> 0;
                   end;
                 end;

              1: begin  {Empresa}
                   frCompositeReport.Reports.Add(frpDemons_OrigemEmpresa_AgrupamentoEmpresa);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DA EMPRESA EM DEMONSTRAÇÃO';
                   vListadeNaturezas_SaidaDemonstracao_5912 := '';
                   vListadeNaturezas_RetornoSaidaDemonstracao_1913 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 912) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaDemonstracao_5912 := vListadeNaturezas_SaidaDemonstracao_5912 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 913) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornoSaidaDemonstracao_1913 := vListadeNaturezas_RetornoSaidaDemonstracao_1913 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_SaidaDemonstracao_5912<>'' then
                     delete(vListadeNaturezas_SaidaDemonstracao_5912,length(vListadeNaturezas_SaidaDemonstracao_5912),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de saída de mercadoria para demonstração (5912) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoSaidaDemonstracao_1913<>'' then
                       delete(vListadeNaturezas_RetornoSaidaDemonstracao_1913,length(vListadeNaturezas_RetornoSaidaDemonstracao_1913),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de entrada de mercadoria para demonstração (1913) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryDemons_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text := NaoVerSaldos_qryDemons_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text
                     else
                       qryDemons_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text := VerSaldos_qryDemons_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text;

                     qryDemons_OrigemFornecedor_AgrupamentoFornecedor.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryDemons_OrigemEmpresa_AgrupamentoEmpresa.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryDemons_OrigemEmpresa_AgrupamentoEmpresa.ParamByName('datafinal').AsDate := StrToDate(DataFinal);
                     qryDemons_OrigemEmpresa_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_SaidaDemonstracao_5912').AsString := vListadeNaturezas_SaidaDemonstracao_5912;
                     qryDemons_OrigemEmpresa_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_RetornoSaidaDemonstracao_1913').AsString := vListadeNaturezas_RetornoSaidaDemonstracao_1913;

                     qryDemons_OrigemEmpresa_AgrupamentoEmpresa.close;
                     qryDemons_OrigemEmpresa_AgrupamentoEmpresa.Open;
                     vPossuiRegistro := qryDemons_OrigemEmpresa_AgrupamentoEmpresa.recordcount <> 0;
                   end;

                 end;

              end;

            end;
         end;

       end;


    {TROCA}

    2: begin
         case origem of
         1: begin {Empresa}

              case Agrupamento of
              0: begin { fornecedor }
                   frCompositeReport.Reports.Add(frpTroca_OrigemEmpresa_AgrupamentoFornecedor);

                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DA EMPRESA EM TROCA POR FORNECEDOR';
                   vListadeNaturezas_SaidaTroca_5949 := '';
                   vListadeNaturezas_RetornoSaidaTroca_1949 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 949) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaTroca_5949 := vListadeNaturezas_SaidaTroca_5949 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 949) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornoSaidaTroca_1949 := vListadeNaturezas_RetornoSaidaTroca_1949 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_SaidaTroca_5949<>'' then
                     delete(vListadeNaturezas_SaidaTroca_5949,length(vListadeNaturezas_SaidaTroca_5949),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de saída de mercadoria para trocao (5949) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoSaidaTroca_1949<>'' then
                       delete(vListadeNaturezas_RetornoSaidaTroca_1949,length(vListadeNaturezas_RetornoSaidaTroca_1949),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno de mercadoria enviada para troca (1949) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryTroca_OrigemEmpresa_AgrupamentoFornecedor.Sql.Text := NaoVerSaldos_qryTroca_OrigemEmpresa_AgrupamentoFornecedor.Sql.Text
                     else
                       qryTroca_OrigemEmpresa_AgrupamentoFornecedor.Sql.Text := VerSaldos_qryTroca_OrigemEmpresa_AgrupamentoFornecedor.Sql.Text;

                     qryTroca_OrigemEmpresa_AgrupamentoFornecedor.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryTroca_OrigemEmpresa_AgrupamentoFornecedor.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryTroca_OrigemEmpresa_AgrupamentoFornecedor.ParamByName('datafinal').AsDate := StrToDate(DataFinal);
                     qryTroca_OrigemEmpresa_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_SaidaTroca_5949').AsString := vListadeNaturezas_SaidaTroca_5949;
                     qryTroca_OrigemEmpresa_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_RetornoSaidaTroca_1949').AsString := vListadeNaturezas_RetornoSaidaTroca_1949;

                     qryTroca_OrigemEmpresa_AgrupamentoFornecedor.close;
                     qryTroca_OrigemEmpresa_AgrupamentoFornecedor.Open;
                     vPossuiRegistro := qryTroca_OrigemEmpresa_AgrupamentoFornecedor.recordcount <> 0;
                   end;
                 end;

              1: begin
                   frCompositeReport.Reports.Add(frpTroca_OrigemEmpresa_AgrupamentoFilial);

                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DA EMPRESA EM TROCA POR FILIAL';
                   vListadeNaturezas_SaidaTroca_5949 := '';
                   vListadeNaturezas_RetornoSaidaTroca_1949 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 949) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaTroca_5949 := vListadeNaturezas_SaidaTroca_5949 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 949) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornoSaidaTroca_1949 := vListadeNaturezas_RetornoSaidaTroca_1949 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_SaidaTroca_5949<>'' then
                     delete(vListadeNaturezas_SaidaTroca_5949,length(vListadeNaturezas_SaidaTroca_5949),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de saída de mercadoria para trocao (5949) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoSaidaTroca_1949<>'' then
                       delete(vListadeNaturezas_RetornoSaidaTroca_1949,length(vListadeNaturezas_RetornoSaidaTroca_1949),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de retorno de mercadoria enviada para troca (1949) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryTroca_OrigemEmpresa_AgrupamentoFilial.Sql.Text := NaoVerSaldos_qryTroca_OrigemEmpresa_AgrupamentoFilial.Sql.Text
                     else
                       qryTroca_OrigemEmpresa_AgrupamentoFilial.Sql.Text := VerSaldos_qryTroca_OrigemEmpresa_AgrupamentoFilial.Sql.Text;

                     qryTroca_OrigemEmpresa_AgrupamentoFilial.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryTroca_OrigemEmpresa_AgrupamentoFilial.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryTroca_OrigemEmpresa_AgrupamentoFilial.ParamByName('datafinal').AsDate := StrToDate(DataFinal);
                     qryTroca_OrigemEmpresa_AgrupamentoFilial.MacroByName('ListadeNaturezas_SaidaTroca_5949').AsString := vListadeNaturezas_SaidaTroca_5949;
                     qryTroca_OrigemEmpresa_AgrupamentoFilial.MacroByName('ListadeNaturezas_RetornoSaidaTroca_1949').AsString := vListadeNaturezas_RetornoSaidaTroca_1949;

                     qryTroca_OrigemEmpresa_AgrupamentoFilial.close;
                     qryTroca_OrigemEmpresa_AgrupamentoFilial.Open;
                     vPossuiRegistro := qryTroca_OrigemEmpresa_AgrupamentoFilial.recordcount <> 0;
                   end;
                 end;
              end;
            end;
         end;
       end;


    {CONSIGNAÇÃO}

    3: begin
         case origem of  {fornecedor}
         0: begin
              case Agrupamento of    {fornecedor}
              0: begin
                   frCompositeReport.Reports.Add(frpConsignacao_OrigemFornecedor_AgrupamentoFornecedor);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DO FORNECEDOR EM CONSIGNAÇÃO';
                   vListadeNaturezas_EntradaParaConsignacao_1917 := '';
                   vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 917) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_EntradaParaConsignacao_1917 := vListadeNaturezas_EntradaParaConsignacao_1917 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 918) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918 := vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_EntradaParaConsignacao_1917<>'' then
                     delete(vListadeNaturezas_EntradaParaConsignacao_1917,length(vListadeNaturezas_EntradaParaConsignacao_1917),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de entrada de mercadoria para CONSIGNAÇÃO (1917 foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918<>'' then
                       delete(vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918,length(vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de saída de mercadoria para CONSIGNAÇÃO (5918 foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.Sql.Text := NaoVerSaldos_qryConsigna_OrigemFornecedor_AgrupamentoFornecedor.Sql.Text
                     else
                       qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.Sql.Text := VerSaldos_qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.Sql.Text;

                     qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.ParamByName('datafinal').AsDate := StrToDate(DataFinal);
                     qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_EntradaParaConsignacao_1917').AsString := vListadeNaturezas_EntradaParaConsignacao_1917;
                     qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.MacroByName('ListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918').AsString := vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918;

                     qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.close;
                     qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.Open;
                     vPossuiRegistro := qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.recordcount <> 0;
                   end;
                 end;

              1: begin  {Empresa}

                   frCompositeReport.Reports.Add(frpConsignacao_OrigemFornecedor_AgrupamentoEmpresa);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DO FORNECEDOR EM CONSIGNAÇÃO POR FILIAIS';
                   vListadeNaturezas_EntradaParaConsignacao_1917 := '';
                   vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 917) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_EntradaParaConsignacao_1917 := vListadeNaturezas_EntradaParaConsignacao_1917 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 918) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918 := vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_EntradaParaConsignacao_1917<>'' then
                     delete(vListadeNaturezas_EntradaParaConsignacao_1917,length(vListadeNaturezas_EntradaParaConsignacao_1917),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de entrada de mercadoria para CONSIGNAÇÃO (1917 foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918<>'' then
                       delete(vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918,length(vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de saída de mercadoria para retorno de CONSIGNAÇÃO (5918 foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.Sql.Text := NaoVerSaldos_qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.Sql.Text
                     else
                       qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.Sql.Text := VerSaldos_qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.Sql.Text;

                     qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.ParamByName('datafinal').AsDate := StrToDate(DataFinal);

                     qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_EntradaParaConsignacao_1917').AsString := vListadeNaturezas_EntradaParaConsignacao_1917;
                     qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918').AsString := vListadeNaturezas_RetornoRecebidoConsignacaoFornecedor_5918;
                     qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.close;
                     qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.Open;
                     vPossuiRegistro := qryConsignacao_OrigemFornecedor_AgrupamentoEmpresa.recordcount <> 0;
                   end;
                 end;
              end;

            end;

         1: begin  { empresa }

              case Agrupamento of
              0: begin
                   frCompositeReport.Reports.Add(frpConsignacao_OrigemEmpresa_AgrupamentoCliente);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DA EMPRESA EM CONSIGNAÇÃO POR CLIENTE';
                   vListadeNaturezas_SaidaConsignacao_5917 := '';
                   vListadeNaturezas_RetornoSaidaConsignacao_1918 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 917) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaConsignacao_5917 := vListadeNaturezas_SaidaConsignacao_5917 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 918) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornoSaidaConsignacao_1918 := vListadeNaturezas_RetornoSaidaConsignacao_1918 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_SaidaConsignacao_5917<>'' then
                     delete(vListadeNaturezas_SaidaConsignacao_5917,length(vListadeNaturezas_SaidaConsignacao_5917),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de saída de mercadoria para CONSIGNAÇÃO (5917) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoSaidaConsignacao_1918<>'' then
                       delete(vListadeNaturezas_RetornoSaidaConsignacao_1918,length(vListadeNaturezas_RetornoSaidaConsignacao_1918),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de entrada de mercadoria para CONSIGNAÇÃO (1918) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryConsignacao_OrigemEmpresa_AgrupamentoCliente.Sql.Text := NaoVerSaldos_qryConsignacao_OrigemEmpresa_AgrupamentoCliente.Sql.Text
                     else
                       qryConsignacao_OrigemEmpresa_AgrupamentoCliente.Sql.Text := VerSaldos_qryConsignacao_OrigemEmpresa_AgrupamentoCliente.Sql.Text;

                     qryConsignacao_OrigemEmpresa_AgrupamentoCliente.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryConsignacao_OrigemEmpresa_AgrupamentoCliente.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryConsignacao_OrigemEmpresa_AgrupamentoCliente.ParamByName('datafinal').AsDate := StrToDate(DataFinal);
                     qryConsignacao_OrigemEmpresa_AgrupamentoCliente.MacroByName('ListadeNaturezas_SaidaConsignacao_5917').AsString := vListadeNaturezas_SaidaConsignacao_5917;
                     qryConsignacao_OrigemEmpresa_AgrupamentoCliente.MacroByName('ListadeNaturezas_RetornoSaidaConsignacao_1918').AsString := vListadeNaturezas_RetornoSaidaConsignacao_1918;

                     qryConsignacao_OrigemEmpresa_AgrupamentoCliente.close;
                     qryConsignacao_OrigemEmpresa_AgrupamentoCliente.Open;
                     vPossuiRegistro := qryConsignacao_OrigemEmpresa_AgrupamentoCliente.recordcount <> 0;
                   end;
                 end;

              1: begin  {Empresa}
                   frCompositeReport.Reports.Add(frpConsignacao_OrigemEmpresa_AgrupamentoEmpresa);
                   frVariables['Titulo']:= 'SITUAÇÃO DOS PRODUTOS DA EMPRESA EM CONSIGNAÇÃO';
                   vListadeNaturezas_SaidaConsignacao_5917 := '';
                   vListadeNaturezas_RetornoSaidaConsignacao_1918 := '';

                   ListaNaturezas.DisableControls;
                   ListaNaturezas.First;
                   while not ListaNaturezas.Eof do
                   begin
                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 917) and (listanaturezas.FieldByName('tipo').AsString = 'S') then
                        vListadeNaturezas_SaidaConsignacao_5917 := vListadeNaturezas_SaidaConsignacao_5917 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     if (listanaturezas.FieldByName('codigofiscal').AsInteger mod 1000 = 918) and (listanaturezas.FieldByName('tipo').AsString = 'E') then
                        vListadeNaturezas_RetornoSaidaConsignacao_1918 := vListadeNaturezas_RetornoSaidaConsignacao_1918 + listanaturezas.FieldByName('codigonatureza').AsString + ',';

                     ListaNaturezas.Next;
                   end;
                   ListaNaturezas.EnableControls;

                   if vListadeNaturezas_SaidaConsignacao_5917<>'' then
                     delete(vListadeNaturezas_SaidaConsignacao_5917,length(vListadeNaturezas_SaidaConsignacao_5917),1)
                   else
                   begin
                     result := false;
                     mensagemerro('Nenhuma natureza de saída de mercadoria para CONSIGNAÇÃO (5917) foi selecionada');
                   end;

                   if result then
                   begin
                     if vListadeNaturezas_RetornoSaidaConsignacao_1918<>'' then
                       delete(vListadeNaturezas_RetornoSaidaConsignacao_1918,length(vListadeNaturezas_RetornoSaidaConsignacao_1918),1)
                     else
                     begin
                       result := false;
                       mensagemerro('Nenhuma natureza de entrada de mercadoria para CONSIGNAÇÃO (1918) foi selecionada');
                     end;
                   end;

                   if result then
                   begin
                     if not SALDO_A_DEVOLVER_PARA_O_CLIENTE then
                       qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text := NaoVerSaldos_qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text
                     else
                       qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text := VerSaldos_qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.Sql.Text;

                     qryConsignacao_OrigemFornecedor_AgrupamentoFornecedor.ParamByName('SALDO_A_DEVOLVER_PARA_O_CLIENTE').asboolean := SALDO_A_DEVOLVER_PARA_O_CLIENTE;

                     qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.ParamByName('datainicial').AsDate := StrToDate(DataInicial);
                     qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.ParamByName('datafinal').AsDate := StrToDate(DataFinal);
                     qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_SaidaConsignacao_5917').AsString := vListadeNaturezas_SaidaConsignacao_5917;
                     qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.MacroByName('ListadeNaturezas_RetornoSaidaConsignacao_1918').AsString := vListadeNaturezas_RetornoSaidaConsignacao_1918;
                     qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.close;
                     qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.Open;
                     vPossuiRegistro := qryConsignacao_OrigemEmpresa_AgrupamentoEmpresa.recordcount <> 0;
                   end;

                 end;

              end;

            end;
         end;

       end;

    end;


   end;

   if result then
   begin
     if vPossuiRegistro then
     begin
       frmPreview.cmbZoom.ItemIndex:= 3;
       Relatorio.Preview := frmPreview.frPreviewPadrao;
       Relatorio.ShowReport;
       frmPreview.ShowModal;
     end
     else
       MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']));
   end;

  finally
   frmPreview.Free

  end;




end;

procedure TdtmControleESNF.frpConserto_OrigemCliente_AgrupamentoClienteBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpConserto_OrigemCliente_AgrupamentoCliente, View);
end;

procedure TdtmControleESNF.frpConserto_OrigemCliente_AgrupamentoFornecedorBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpConserto_OrigemCliente_AgrupamentoFornecedor, View);
end;

procedure TdtmControleESNF.frpConserto_OrigemEmpresa_AgrupamentoEmpresaBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpConserto_OrigemEmpresa_AgrupamentoEmpresa, View);
end;

procedure TdtmControleESNF.frpConserto_OrigemEmpresa_AgrupamentoFornecedorBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpConserto_OrigemEmpresa_AgrupamentoFornecedor, View);
end;

end.
