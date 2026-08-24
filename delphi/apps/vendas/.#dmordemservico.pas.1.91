unit dmordemservico;

interface

uses
SysUtils, Classes, DB, Forms,Dialogs,
//terceiros
ZQuery, ZPgSqlQuery,ZTransact,
//biblio
ctconstantes, clparametrossistema,
//componentes
cpquery,cpdatasource,
//repositorio
dmbasico, dmtecsoft, dmimprimecarne, fmpreviewpadrao,
dmimprimecontratos, dmimprimeboleto, dmimprimeordemservicos, dmcadastrocontratos,
FR_Class, FR_DSet, FR_DBSet, dmcadastroequipamentos, StrUtils, fmEnviarEmail, controls,
clNFe, dmImprimeSaldoCliente, dmVisualizarSaldoTroca;

type
 TtecOnComplementarNota = function: Boolean of object;

 TtecErroNota = (ernSEMESTOQUE, ernTRANSFNAOPERMITIDA, ernSEMRESERVADO, ernNENHUMA);
  TtecVErrosNota = array of record
                     Erro: TtecErroNota;
                     Msg:  String;
                   end;
  TtecFornecedorTransporte = Record
    FornecedorTransporte: Integer;
    TipoFrete           : String;
    TipoTransp          : String;
    Volumes             : Integer;
    PesoBruto           : Real;
    PesoLiquido         : Real;
    Numeracao           : String;
    Marca               : String;
    EspecieTransporte   : String;
    EstadoPlaca         : String;
    Placa               : String;
    Observacao          : String;
  end;
  Tdtmordemservico = class(TdtmBasico)
    qryOrdemServico: TtecQuery;
    qryProdutosOrdemServico: TtecQuery;
    qryServicosOrdemServico: TtecQuery;
    dsrOrdemServico: TtecDataSource;
    dsrProdutosOrdemServico: TtecDataSource;
    dsrServicosOrdemServico: TtecDataSource;
    qryProcuraFilialOS: TtecQuery;
    qryProcuraFilialOSnome: TStringField;
    qryProcuraFilialOSmnemonico: TStringField;
    qryProcuraFilialOScodigo: TIntegerField;
    dsrProcuraFilialOS: TtecDataSource;
    qryConsultaEquipamentosOS: TtecQuery;
    qryConsultaEquipamentosOSdescricao: TStringField;
    qryConsultaEquipamentosOSreferencia: TStringField;
    qryConsultaEquipamentosOSano: TIntegerField;
    qryConsultaEquipamentosOSmodelo: TStringField;
    qryConsultaEquipamentosOSdescricaomarca: TStringField;
    dsrProcuraEquipamentosOS: TtecDataSource;
    qryProcuraEquipamentosOS: TtecQuery;
    qryProcuraEquipamentosOSdescricao: TStringField;
    qryProcuraEquipamentosOSreferencia: TStringField;
    qryProcuraEquipamentosOSmarca: TIntegerField;
    qryProcuraEquipamentosOSmodelo: TStringField;
    qryProcuraEquipamentosOSopcionais: TStringField;
    qryProcuraEquipamentosOSdescricaomarca: TStringField;
    qryProcuraEquipamentosOSano: TIntegerField;
    dsrProcuraCliente: TtecDataSource;
    qryProcuraCliente: TtecQuery;
    qryProcuraClientenome: TStringField;
    qryProcuraClientecodigo: TIntegerField;
    qryConsultaClientes: TtecQuery;
    qryConsultaClientesnome: TStringField;
    qryConsultaClientespessoanumero: TStringField;
    qryConsultaClientesnomecidade: TStringField;
    qryConsultaClientesestado: TStringField;
    qryConsultaClientescodigo: TIntegerField;
    qryConsultaClientescivil: TStringField;
    qryProcuraProduto: TtecQuery;
    qryProcuraProdutodescricao: TStringField;
    qryProcuraProdutoproduto: TLargeintField;
    qryProcuraProdutofilial: TIntegerField;
    qryProcuraProdutoaliquotaicms: TFloatField;
    qryProcuraProdutoicms: TIntegerField;
    qryProcuraProdutomontagem: TBooleanField;
    qryProcuraProdutounidade: TStringField;
    qryProcuraProdutobrinde: TBooleanField;
    qryProcuraProdutopromocao: TBooleanField;
    qryProcuraProdutoaliquotaipi: TFloatField;
    qryProcuraProdutovalorgrade1: TStringField;
    qryProcuraProdutovalorgrade2: TStringField;
    qryProcuraProdutolinha: TStringField;
    qryProcuraProdutocoluna: TStringField;
    qryProcuraProdutodescricaolc: TStringField;
    dsrProcuraProduto: TtecDataSource;
    qryProcuraServico: TtecQuery;
    qryProcuraServicocodigo: TIntegerField;
    qryProcuraServicodescricao: TStringField;
    qryProcuraServicoaliquotaissqn: TFloatField;
    qryProcuraServicovalor: TFloatField;
    dsrProcuraServico: TtecDataSource;
    qryConsultaServicos: TtecQuery;
    qryConsultaServicosdescricao: TStringField;
    qryConsultaServicoscodigo: TIntegerField;
    qryProcuraEquipamentos: TtecQuery;
    qryProcuraEquipamentosdescricao: TStringField;
    qryProcuraEquipamentosreferencia: TStringField;
    qryProcuraEquipamentosmarca: TIntegerField;
    qryProcuraEquipamentosmodelo: TStringField;
    qryProcuraEquipamentosopcionais: TStringField;
    qryProcuraEquipamentosdescricaomarca: TStringField;
    qryProcuraEquipamentosano: TIntegerField;
    dsrProcuraEquipamentos: TtecDataSource;
    qryConsultaEquipamentos: TtecQuery;
    qryConsultaEquipamentosdescricao: TStringField;
    qryConsultaEquipamentosreferencia: TStringField;
    qryConsultaEquipamentosano: TIntegerField;
    qryConsultaEquipamentosmodelo: TStringField;
    qryConsultaEquipamentosdescricaomarca: TStringField;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFilialProduto: TtecQuery;
    qryConsultaFilialProdutonome: TStringField;
    qryConsultaFilialProdutocodigo: TIntegerField;
    qryProcuraFilialProduto: TtecQuery;
    qryProcuraFilialProdutonome: TStringField;
    qryProcuraFilialProdutocodigo: TIntegerField;
    dsrProcuraFilialProduto: TtecDataSource;
    dsrEstoque: TtecDataSource;
    qryEstoque: TtecQuery;
    qryEstoquefilial: TIntegerField;
    qryEstoqueemestoque: TFloatField;
    qryConsultaOrdemServico: TtecQuery;
    qryConsultaProdutosOS: TtecQuery;
    qryProcuraProdutoOS: TtecQuery;
    dsrProcuraProdutoOS: TtecDataSource;
    qryServicosOrdemServicocontrato: TStringField;
    qryServicosOrdemServicoservico: TIntegerField;
    qryServicosOrdemServicoquantidade: TIntegerField;
    qryServicosOrdemServicoaliquotaissqn: TFloatField;
    qryServicosOrdemServicovalorservico: TFloatField;
    qryServicosOrdemServicocomplementoservico: TStringField;
    qryServicosOrdemServicofilialproduto: TIntegerField;
    qryServicosOrdemServicodescricaoservico: TStringField;
    dsrProcuraVendedor: TtecDataSource;
    qryProcuraVendedor: TtecQuery;
    qryProcuraVendedorcodigo: TIntegerField;
    qryProcuraVendedornome: TStringField;
    qryProcuraVendedorProduto: TtecQuery;
    qryProcuraVendedorProdutocodigo: TIntegerField;
    qryProcuraVendedorProdutonome: TStringField;
    dsrProcuraVendedorProduto: TtecDataSource;
    qryConsultaVendedores: TtecQuery;
    qryConsultaVendedoresnome: TStringField;
    qryConsultaVendedorescodigo: TIntegerField;
    qryProdutoEstoque: TtecQuery;
    qryProdutoEstoqueemestoque: TFloatField;
    qryProdutoEstoquepreco: TFloatField;
    qryProdutoEstoquereservado: TFloatField;
    qryProdutoEstoquefuturo: TFloatField;
    dsrProdutoEstoque: TtecDataSource;
    qryProcuraProdutovendasemestoque: TStringField;
    qryConsultaProdutos: TtecQuery;
    qryConsultaProdutosdescricao: TStringField;
    qryConsultaProdutosproduto: TLargeintField;
    qryConsultaProdutosvalorgrade1: TStringField;
    qryConsultaProdutosvalorgrade2: TStringField;
    qryConsultaProdutosfilial: TIntegerField;
    qryConsultaProdutosemestoque: TFloatField;
    qryConsultaProdutosreservado: TFloatField;
    qryConsultaProdutossimilares: TLargeintField;
    qryConsultaProdutosvalorproduto: TFloatField;
    qryServicosOrdemServicototalservico: TCurrencyField;
    qryProcuraProdutoOSdescricao: TStringField;
    qryProcuraProdutoOSlinha: TStringField;
    qryProcuraProdutoOScoluna: TStringField;
    qryProcuraProdutoOSvalorgrade1: TStringField;
    qryProcuraProdutoOSvalorgrade2: TStringField;
    qryProcuraProdutoOSfilial: TIntegerField;
    qryProcuraProdutoOSmontagem: TBooleanField;
    qryProcuraProdutoOSunidade: TStringField;
    qryProcuraProdutoOSbrinde: TBooleanField;
    qryProcuraProdutoOSaliquotaicms: TFloatField;
    qryProcuraProdutoOSicms: TIntegerField;
    qryProcuraProdutoOSaliquotaipi: TFloatField;
    qryProcuraProdutoOSvendasemestoque: TStringField;
    qryProcuraProdutoOSpromocao: TBooleanField;
    qryPlanoPagamento: TtecQuery;
    qryPlanoPagamentodescricao: TStringField;
    qryPlanoPagamentoagente: TIntegerField;
    qryPlanoPagamentoenderecocompleto: TBooleanField;
    qryPlanoPagamentointervaloparcelas: TIntegerField;
    qryPlanoPagamentoquantidadeparcelas: TIntegerField;
    qryPlanoPagamentomestrintadias: TBooleanField;
    dsrPlanoPagamento: TtecDataSource;
    dsrParcelas: TtecDataSource;
    qryParcelas: TtecQuery;
    qryParcelascontrato: TStringField;
    qryParcelasdatavencto: TDateField;
    qryParcelasvalorvencto: TFloatField;
    qryParcelasnumero: TIntegerField;
    qryParcelasformapagamento: TStringField;
    qryParcelasselecionado: TBooleanField;
    qryParcelasdatapagto: TDateField;
    qryParcelasparcelaorigem: TStringField;
    qryDesbloquearOrdemServico: TtecQuery;
    qryDesbloquearOrdemServicolock: TIntegerField;
    qryBloquearOrdemServico: TtecQuery;
    qryBloquearOrdemServicolock: TIntegerField;
    qryOrdemServiconumero: TStringField;
    qryOrdemServicodata: TDateField;
    qryOrdemServicofaturamento: TDateField;
    qryOrdemServicoavalista: TIntegerField;
    qryOrdemServicocliente: TIntegerField;
    qryOrdemServicotipocliente: TStringField;
    qryOrdemServicodependente: TIntegerField;
    qryOrdemServicovendedor: TIntegerField;
    qryOrdemServicofilialvenda: TIntegerField;
    qryOrdemServicovalorvista: TFloatField;
    qryOrdemServicovalorprazo: TFloatField;
    qryOrdemServicototalprodutos: TFloatField;
    qryOrdemServicototalservicos: TFloatField;
    qryOrdemServicodesconto: TFloatField;
    qryOrdemServicofrete: TFloatField;
    qryOrdemServicoseguro: TFloatField;
    qryOrdemServicoagente: TIntegerField;
    qryOrdemServicoanalista: TIntegerField;
    qryOrdemServiconomeanalista: TStringField;
    qryOrdemServicoorigem: TStringField;
    qryOrdemServicotiporenegociacao: TStringField;
    qryOrdemServicotaxajuros: TFloatField;
    qryOrdemServicoplano: TIntegerField;
    qryOrdemServicoconsideracoes: TStringField;
    qryOrdemServicoentrua: TStringField;
    qryOrdemServicoentestado: TStringField;
    qryOrdemServicoentcidade: TIntegerField;
    qryOrdemServicoentbairro: TIntegerField;
    qryOrdemServicoentcep: TIntegerField;
    qryOrdemServicoentfoneddd: TIntegerField;
    qryOrdemServicoentfonenumero: TIntegerField;
    qryOrdemServicoentfoneramal: TStringField;
    qryOrdemServicomontagemobs: TStringField;
    qryOrdemServicomontagemfilial: TIntegerField;
    qryOrdemServicosituacao: TStringField;
    qryOrdemServicoemitirnotadepoisde: TDateField;
    qryOrdemServiconomesituacao: TStringField;
    qryOrdemServicomotivo: TIntegerField;
    qryOrdemServicodescricaomotivo: TStringField;
    qryOrdemServiconomecidadeentrega: TStringField;
    qryOrdemServiconomebairroentrega: TStringField;
    qryOrdemServiconomecidadenaturalidade: TStringField;
    qryOrdemServiconomecidade: TStringField;
    qryOrdemServiconomebairro: TStringField;
    qryOrdemServiconomecidadeempresa: TStringField;
    qryOrdemServiconomebairroempresa: TStringField;
    qryOrdemServiconomecidadeconjuge: TStringField;
    qryOrdemServiconomebairroconjuge: TStringField;
    qryOrdemServiconomecidadereferencia: TStringField;
    qryOrdemServiconomebairroreferencia: TStringField;
    qryOrdemServiconome: TStringField;
    qryOrdemServiconascto: TDateField;
    qryOrdemServicoapelido: TStringField;
    qryOrdemServicosexo: TStringField;
    qryOrdemServicocivil: TStringField;
    qryOrdemServicocivildata: TDateField;
    qryOrdemServicoiddocumento: TStringField;
    qryOrdemServicoidorgao: TStringField;
    qryOrdemServicoiddata: TDateField;
    qryOrdemServicoidestado: TStringField;
    qryOrdemServicopessoatipo: TStringField;
    qryOrdemServicopessoanumero: TStringField;
    qryOrdemServicomae: TStringField;
    qryOrdemServicopai: TStringField;
    qryOrdemServicoconceito: TIntegerField;
    qryOrdemServiconaturalcidade: TIntegerField;
    qryOrdemServiconaturalestado: TStringField;
    qryOrdemServicorua: TStringField;
    qryOrdemServicoestado: TStringField;
    qryOrdemServicocidade: TIntegerField;
    qryOrdemServicobairro: TIntegerField;
    qryOrdemServicocep: TIntegerField;
    qryOrdemServicofonetipo: TStringField;
    qryOrdemServicofoneddd: TIntegerField;
    qryOrdemServicofonenumero: TIntegerField;
    qryOrdemServicofoneramal: TStringField;
    qryOrdemServicofone2ddd: TIntegerField;
    qryOrdemServicofone2numero: TIntegerField;
    qryOrdemServicofone2ramal: TStringField;
    qryOrdemServicorestipo: TStringField;
    qryOrdemServicoresonus: TFloatField;
    qryOrdemServicorestempo: TDateField;
    qryOrdemServicoempresa: TStringField;
    qryOrdemServicoempadmissao: TDateField;
    qryOrdemServicoempcep: TIntegerField;
    qryOrdemServicoempcomprovado: TBooleanField;
    qryOrdemServicoempfoneddd: TIntegerField;
    qryOrdemServicoempfonenumero: TIntegerField;
    qryOrdemServicoempfoneramal: TStringField;
    qryOrdemServicoempoutrasdescricao: TStringField;
    qryOrdemServicoempoutrasfaixa: TIntegerField;
    qryOrdemServicoempoutrasvalor: TFloatField;
    qryOrdemServicoemprendafaixa: TIntegerField;
    qryOrdemServicoemprendavalor: TFloatField;
    qryOrdemServicoemprua: TStringField;
    qryOrdemServicoempestado: TStringField;
    qryOrdemServicoempcidade: TIntegerField;
    qryOrdemServicoempbairro: TIntegerField;
    qryOrdemServicoempcargo: TIntegerField;
    qryOrdemServicoconjuge: TIntegerField;
    qryOrdemServicoconnome: TStringField;
    qryOrdemServicoconadmissao: TDateField;
    qryOrdemServicoconcep: TIntegerField;
    qryOrdemServicoconempresa: TStringField;
    qryOrdemServicoconfoneddd: TIntegerField;
    qryOrdemServicoconfonenumero: TIntegerField;
    qryOrdemServicoconfoneramal: TStringField;
    qryOrdemServicoconnascto: TDateField;
    qryOrdemServicoconrendafaixa: TIntegerField;
    qryOrdemServicoconrendavalor: TFloatField;
    qryOrdemServicoconrua: TStringField;
    qryOrdemServicoconestado: TStringField;
    qryOrdemServicoconcidade: TIntegerField;
    qryOrdemServicoconbairro: TIntegerField;
    qryOrdemServicoconcargo: TIntegerField;
    qryOrdemServicoreferencia: TStringField;
    qryOrdemServicoreftipo: TStringField;
    qryOrdemServicorefrua: TStringField;
    qryOrdemServicorefestado: TStringField;
    qryOrdemServicorefcidade: TIntegerField;
    qryOrdemServicorefbairro: TIntegerField;
    qryOrdemServicorefcep: TIntegerField;
    qryOrdemServicoreffoneddd: TIntegerField;
    qryOrdemServicoreffonenumero: TIntegerField;
    qryOrdemServicoreffoneramal: TStringField;
    qryOrdemServicoreffone2ddd: TIntegerField;
    qryOrdemServicoreffone2numero: TIntegerField;
    qryOrdemServicoreffone2ramal: TStringField;
    qryOrdemServicoobservacoes: TStringField;
    qryOrdemServicoemail: TStringField;
    qryOrdemServicolistacasamento: TIntegerField;
    qryOrdemServicoautomovel: TBooleanField;
    qryOrdemServicocartaocredito: TBooleanField;
    qryOrdemServicocartaoloja: TBooleanField;
    qryOrdemServicocheque: TBooleanField;
    qryOrdemServicochequeespecial: TBooleanField;
    qryOrdemServicodependentes: TIntegerField;
    qryOrdemServicoonus: TFloatField;
    qryOrdemServicoprimogenito: TStringField;
    qryOrdemServicopedidocliente: TStringField;
    qryOrdemServicorenegociado: TStringField;
    qryOrdemServicoprevisao: TDateField;
    qryOrdemServicodatafechamento: TDateField;
    qryOrdemServicotipoequipamento: TIntegerField;
    qryOrdemServicoproduto: TLargeintField;
    qryOrdemServicofilialproduto: TIntegerField;
    qryOrdemServicoautorizacao: TStringField;
    qryOrdemServicoautfoneddd: TIntegerField;
    qryOrdemServicoautfonenumero: TIntegerField;
    qryOrdemServicovalorinicial: TFloatField;
    qryOrdemServicoos: TBooleanField;
    qryOrdemServicoatualizacao: TDateField;
    qryEstoqueBloqueio: TtecQuery;
    qryEstoqueBloqueioproduto: TLargeintField;
    qryEstoqueBloqueiofilial: TIntegerField;
    qryEstoqueBloqueioemestoque: TFloatField;
    qryEstoqueBloqueioreservado: TFloatField;
    qryEstoqueBloqueiofuturo: TFloatField;
    qryProcuraClientetipo: TStringField;
    qryMovimentos: TtecQuery;
    qryMovimentosnumero: TIntegerField;
    qryMovimentosproduto: TLargeintField;
    qryMovimentosfilial: TIntegerField;
    qryMovimentostipomovimento: TStringField;
    qryMovimentosquantidade: TFloatField;
    qryMovimentosreferencia: TStringField;
    qryMovimentoscliente: TIntegerField;
    qryMovimentostipocliente: TStringField;
    qryMovimentosprecocomicms: TFloatField;
    qryMovimentosprecosemicms: TFloatField;
    qryMovimentosaliquotaipi: TFloatField;
    qryMovimentosdadofiscal: TIntegerField;
    qryProdutosReservas: TtecQuery;
    qryProdutosReservasreserva: TIntegerField;
    qryProdutosReservasproduto: TLargeintField;
    qryProdutosReservasfilial: TIntegerField;
    qryProdutosReservassaldo: TFloatField;
    qryProdutosReservasbaixado: TFloatField;
    qryProdutosReservasmovimento: TIntegerField;
    qryProdutosReservasquantidade: TFloatField;
    qryTransferencias: TtecQuery;
    qryTransferenciasfilialemitente: TIntegerField;
    qryTransferenciasfilialrecebimento: TIntegerField;
    qryTransferenciasproduto: TLargeintField;
    qryTransferenciasquantidade: TFloatField;
    qryTransferenciasdadofiscal: TIntegerField;
    qryNotas: TtecQuery;
    qryNotasfilial: TIntegerField;
    qryNotasserie: TStringField;
    qryNotasnumero: TIntegerField;
    qryNotasdadofiscal: TIntegerField;
    qryCupons: TtecQuery;
    qryCuponsfilial: TIntegerField;
    qryCuponsmaquina: TIntegerField;
    qryCuponsintervensao: TIntegerField;
    qryCuponsnumero: TIntegerField;
    qryCuponsdadofiscal: TIntegerField;
    qryCuponsicmsestornado: TBooleanField;
    qryExisteCGCCPF: TtecQuery;
    qryExisteCGCCPFcodigo: TIntegerField;
    qryExisteCGCCPFnome: TStringField;
    qryClientes: TtecQuery;
    qryClientescodigo: TIntegerField;
    qryClientesnomecidadenaturalidade: TStringField;
    qryClientesnomecidade: TStringField;
    qryClientesnomebairro: TStringField;
    qryClientesnomecidadeempresa: TStringField;
    qryClientesnomebairroempresa: TStringField;
    qryClientesnomecidadeconjuge: TStringField;
    qryClientesnomebairroconjuge: TStringField;
    qryClientesnomecidadereferencia: TStringField;
    qryClientesnomebairroreferencia: TStringField;
    qryClientesnome: TStringField;
    qryClientesnascto: TDateField;
    qryClientesapelido: TStringField;
    qryClientessexo: TStringField;
    qryClientescivil: TStringField;
    qryClientescivildata: TDateField;
    qryClientesiddocumento: TStringField;
    qryClientesidorgao: TStringField;
    qryClientesiddata: TDateField;
    qryClientesidestado: TStringField;
    qryClientespessoatipo: TStringField;
    qryClientespessoanumero: TStringField;
    qryClientesmae: TStringField;
    qryClientespai: TStringField;
    qryClientesconceito: TIntegerField;
    qryClientesnaturalcidade: TIntegerField;
    qryClientesnaturalestado: TStringField;
    qryClientesrua: TStringField;
    qryClientesestado: TStringField;
    qryClientescidade: TIntegerField;
    qryClientesbairro: TIntegerField;
    qryClientescep: TIntegerField;
    qryClientesfonetipo: TStringField;
    qryClientesfoneddd: TIntegerField;
    qryClientesfonenumero: TIntegerField;
    qryClientesfoneramal: TStringField;
    qryClientesfone2ddd: TIntegerField;
    qryClientesfone2numero: TIntegerField;
    qryClientesfone2ramal: TStringField;
    qryClientesrestipo: TStringField;
    qryClientesresonus: TFloatField;
    qryClientesrestempo: TDateField;
    qryClientesempresa: TStringField;
    qryClientesempadmissao: TDateField;
    qryClientesempcep: TIntegerField;
    qryClientesempcomprovado: TBooleanField;
    qryClientesempfoneddd: TIntegerField;
    qryClientesempfonenumero: TIntegerField;
    qryClientesempfoneramal: TStringField;
    qryClientesempoutrasdescricao: TStringField;
    qryClientesempoutrasfaixa: TIntegerField;
    qryClientesempoutrasvalor: TFloatField;
    qryClientesemprendafaixa: TIntegerField;
    qryClientesemprendavalor: TFloatField;
    qryClientesemprua: TStringField;
    qryClientesempestado: TStringField;
    qryClientesempcidade: TIntegerField;
    qryClientesempbairro: TIntegerField;
    qryClientesempcargo: TIntegerField;
    qryClientesconjuge: TIntegerField;
    qryClientesconnome: TStringField;
    qryClientesconadmissao: TDateField;
    qryClientesconcep: TIntegerField;
    qryClientesconempresa: TStringField;
    qryClientesconfoneddd: TIntegerField;
    qryClientesconfonenumero: TIntegerField;
    qryClientesconfoneramal: TStringField;
    qryClientesconnascto: TDateField;
    qryClientesconrendafaixa: TIntegerField;
    qryClientesconrendavalor: TFloatField;
    qryClientesconrua: TStringField;
    qryClientesconestado: TStringField;
    qryClientesconcidade: TIntegerField;
    qryClientesconbairro: TIntegerField;
    qryClientesconcargo: TIntegerField;
    qryClientesreferencia: TStringField;
    qryClientesreftipo: TStringField;
    qryClientesrefrua: TStringField;
    qryClientesrefestado: TStringField;
    qryClientesrefcidade: TIntegerField;
    qryClientesrefbairro: TIntegerField;
    qryClientesrefcep: TIntegerField;
    qryClientesreffoneddd: TIntegerField;
    qryClientesreffonenumero: TIntegerField;
    qryClientesreffoneramal: TStringField;
    qryClientesreffone2ddd: TIntegerField;
    qryClientesreffone2numero: TIntegerField;
    qryClientesreffone2ramal: TStringField;
    qryClientesobservacoes: TStringField;
    qryClientesemail: TStringField;
    qryClientesautomovel: TBooleanField;
    qryClientescartaocredito: TBooleanField;
    qryClientescartaoloja: TBooleanField;
    qryClientescheque: TBooleanField;
    qryClienteschequeespecial: TBooleanField;
    qryClientesdependentes: TIntegerField;
    qryClientesonus: TFloatField;
    qryClientesenderecoalterado: TDateField;
    spcOrdemServicoProximo: TtecQuery;
    spcOrdemServicoProximonumero: TStringField;
    qryProdutosOrdemServicocontrato: TStringField;
    qryProdutosOrdemServicoproduto: TLargeintField;
    qryProdutosOrdemServicofilial: TIntegerField;
    qryProdutosOrdemServiconumero: TIntegerField;
    qryProdutosOrdemServicoquantidade: TFloatField;
    qryProdutosOrdemServicocancelado: TFloatField;
    qryProdutosOrdemServicoprecovenda: TFloatField;
    qryProdutosOrdemServicoprecotabela: TFloatField;
    qryProdutosOrdemServicodescricaoprecovenda: TStringField;
    qryProdutosOrdemServicomontagem: TStringField;
    qryProdutosOrdemServicoentrega: TStringField;
    qryProdutosOrdemServicoprodutolista: TBooleanField;
    qryProdutosOrdemServicoemestoque: TFloatField;
    qryProdutosOrdemServicoreservado: TFloatField;
    qryProdutosOrdemServicofuturo: TFloatField;
    qryProdutosOrdemServicodescricao: TStringField;
    qryProdutosOrdemServicounidade: TStringField;
    qryProdutosOrdemServicovendasemestoque: TStringField;
    qryProdutosOrdemServicoaliquotaicms: TFloatField;
    qryProdutosOrdemServicoicms: TIntegerField;
    qryProdutosOrdemServicoaliquotaipi: TFloatField;
    qryProdutosOrdemServicoorigem: TIntegerField;
    qryProdutosOrdemServicoincidencia: TStringField;
    qryProdutosOrdemServicotransfautomatica: TBooleanField;
    qryProdutosOrdemServicomontagemoriginal: TBooleanField;
    qryProdutosOrdemServicopercreducaobase: TFloatField;
    qryProdutosOrdemServicoreserva: TIntegerField;
    qryProdutosOrdemServicobrinde: TBooleanField;
    qryProdutosOrdemServicovendedor: TIntegerField;
    qryProdutosOrdemServicomovimento: TIntegerField;
    qryProdutosOrdemServicoqtdecopiar: TFloatField;
    qryProdutosOrdemServicoqtdereservaprevia: TFloatField;
    qryProdutosOrdemServicoincluirnanotafiscal: TBooleanField;
    qryProdutosOrdemServicoincluirnalistacasamento: TBooleanField;
    qryProdutosOrdemServicopromocao: TBooleanField;
    qryProdutosOrdemServicolinha: TStringField;
    qryProdutosOrdemServicocoluna: TStringField;
    qryProdutosOrdemServicovalorgrade1: TStringField;
    qryProdutosOrdemServicovalorgrade2: TStringField;
    qryProdutosOrdemServicototalitem: TCurrencyField;
    qryFornecedores: TtecQuery;
    qryFornecedoresnome: TStringField;
    qryFornecedorespessoanumero: TStringField;
    qryFornecedoresrua: TStringField;
    qryFornecedoresestado: TStringField;
    qryFornecedorescidade: TIntegerField;
    qryFornecedoresbairro: TIntegerField;
    qryFornecedorescep: TIntegerField;
    qryFornecedoresfoneddd: TIntegerField;
    qryFornecedoresfonenumero: TIntegerField;
    qryFornecedoresobservacoes: TStringField;
    qryFornecedoresemail: TStringField;
    qryFornecedoresnomecidade: TStringField;
    qryFornecedoresnomebairro: TStringField;
    qryFornecedorespessoatipo: TStringField;
    qryFornecedorescodigo: TIntegerField;
    qryFornecedoresenderecoalterado: TDateField;
    qryProdutosEntregar: TtecQuery;
    qryProdutosEntregarproduto: TLargeintField;
    qryProdutosEntregarfilial: TIntegerField;
    qryProdutosEntregarqtdade: TFloatField;
    qryConsultaClientestipoorig: TStringField;
    qryConsultaClientestipo: TStringField;
    qryConsultaOrdemServiconome: TStringField;
    qryConsultaOrdemServicopessoanumero: TStringField;
    qryConsultaOrdemServiconumero: TStringField;
    qryConsultaOrdemServicodata: TDateField;
    qryConsultaOrdemServicopedidocliente: TStringField;
    qryConsultaOrdemServicosituacao: TStringField;
    spcClientesAtrasado: TtecQuery;
    spcClientesAtrasadosim: TBooleanField;
    qryConsultaMotivos: TtecQuery;
    qryConsultaMotivosdescricao: TStringField;
    qryConsultaMotivoscodigo: TIntegerField;
    qryMovimentosProdutoEmpresa: TtecQuery;
    qryMovimentosProdutoEmpresanumero: TIntegerField;
    qryMovimentosProdutoEmpresaproduto: TLargeintField;
    qryMovimentosProdutoEmpresafilial: TIntegerField;
    qryMovimentosProdutoEmpresatipomovimento: TStringField;
    qryMovimentosProdutoEmpresaquantidade: TFloatField;
    qryMovimentosProdutoEmpresareferencia: TStringField;
    qryMovimentosProdutoEmpresacliente: TIntegerField;
    qryMovimentosProdutoEmpresatipocliente: TStringField;
    qryMovimentosProdutoEmpresaprecocomicms: TFloatField;
    qryMovimentosProdutoEmpresaprecosemicms: TFloatField;
    qryMovimentosProdutoEmpresaaliquotaipi: TFloatField;
    qryMovimentosProdutoEmpresadadofiscal: TIntegerField;
    qryConsultaProdutosOSproduto: TLargeintField;
    qryConsultaProdutosOSfilial: TIntegerField;
    qryConsultaProdutosOSemestoque: TFloatField;
    qryConsultaProdutosOSreservado: TFloatField;
    qryConsultaProdutosOSdescricao: TStringField;
    qryConsultaProdutosOSvalorgrade1: TStringField;
    qryConsultaProdutosOSvalorgrade2: TStringField;
    qryConsultaProdutosOScaracteristica: TLargeintField;
    qryConsultaProdutosOSpreco: TIntegerField;
    qryConsultaProdutosOSunidade: TStringField;
    qryConsultaProdutosOSbrinde: TBooleanField;
    qryConsultaProdutosOSreferencia: TStringField;
    qryConsultaProdutosOSsimilares: TLargeintField;
    qryConsultaProdutosOSvalorproduto: TFloatField;
    qrySomaCustos: TtecQuery;
    qrySomaCustoscusto: TFloatField;
    qryMovimentoscontrato: TStringField;
    qryMovimentosProdutoEmpresacontrato: TStringField;
    qryMovimentosProdutoEmpresavalor: TFloatField;
    qryProdutosOrdemServicodata: TDateField;
    qryParcelasvalorpagto: TFloatField;
    qryProdutosOrdemServicoprecocusto: TFloatField;
    qryProdutoEstoqueprecocusto: TFloatField;
    qryProcuraCFPS: TtecQuery;
    qryProcuraCFPSdescricao: TStringField;
    qryProcuraCFPScodigo: TIntegerField;
    dsrProcuraCFPS: TtecDataSource;
    qryConsultaCFPS: TtecQuery;
    qryConsultaCFPSdescricao: TStringField;
    qryConsultaCFPScodigo: TIntegerField;
    qryOrdemServicocfps: TIntegerField;
    qryProdutosOrdemServicobaseicms: TFloatField;
    qryProdutosOrdemServicocomposto: TBooleanField;
    qryProdutosOrdemServicodiscriminarcomposto: TStringField;
    qryProdutosOrdemServicodiscriminarpreco: TBooleanField;
    qryProcuraProdutocomposto: TBooleanField;
    qryProdutosEquipamentosOS: TtecQuery;
    qryProdutosEquipamentosOSproduto: TLargeintField;
    qryProdutosEquipamentosOSquantidade: TFloatField;
    qryProdutosEquipamentosOSdescricao: TStringField;
    qryProdutosEquipamentosOSlinha: TStringField;
    qryProdutosEquipamentosOScoluna: TStringField;
    qryProdutosEquipamentosOSvalorgrade1: TStringField;
    qryProdutosEquipamentosOSvalorgrade2: TStringField;
    qryProdutosEquipamentosOSselecionado: TBooleanField;
    dsrProdutosEquipamentosOS: TtecDataSource;
    fdsProdutosEquipamentoOS: TfrDBDataSet;
    frpRequisicao: TfrReport;
    qryProdutosCompostos: TtecQuery;
    fdsProdutosCompostos: TfrDBDataSet;
    qryProdutosCompostoscomposto: TLargeintField;
    qryProdutosCompostoscomponente: TLargeintField;
    qryProdutosCompostosquantidade: TFloatField;
    qryProdutosCompostosdescricao: TStringField;
    qryProdutosCompostosvalorgrade1: TStringField;
    qryProdutosCompostosvalorgrade2: TStringField;
    qryProdutosCompostosunidade: TStringField;
    qryProdutosEquipamentosOSemestoque: TFloatField;
    qryProdutosEquipamentosOSdescricao_equipamentos: TStringField;
    fdsRequisicao: TfrDBDataSet;
    qryComponentesMontagem: TtecQuery;
    dsrComponentesMontagem: TtecDataSource;
    qryComponentesMontagemcomposto: TLargeintField;
    qryComponentesMontagemcomponente: TLargeintField;
    qryComponentesMontagemquantidade: TFloatField;
    qryComponentesMontagemdescricao: TStringField;
    qryComponentesMontagemvalorgrade1: TStringField;
    qryComponentesMontagemvalorgrade2: TStringField;
    qryComponentesMontagemunidade: TStringField;
    qryComponentesMontagemdescricaolc: TStringField;
    qryProdutosEquipamentosOScomposto: TBooleanField;
    qryProdutosEquipamentosOSordem: TStringField;
    qryServicosOrdemServicoestado: TStringField;
    qryServicosOrdemServicocidade: TIntegerField;
    qryServicosOrdemServicoreterissqn: TBooleanField;
    qryServicosOrdemServicovalorissqn: TFloatField;
    qryEquipamentosClientes: TtecQuery;
    qryEquipamentosClientescliente: TIntegerField;
    qryEquipamentosClientesdescricao: TStringField;
    qryEquipamentosClientesreferencia: TStringField;
    qryEquipamentosClientesmodelo: TStringField;
    qryEquipamentosClientesano: TIntegerField;
    qryEquipamentosClientesopcionais: TStringField;
    qryEquipamentosClientesdescricaomarca: TStringField;
    qryEquipamentos: TtecQuery;
    qryEquipamentosdescricao: TStringField;
    qryEquipamentosreferencia: TStringField;
    qryEquipamentosmarca: TIntegerField;
    qryEquipamentosmodelo: TStringField;
    qryEquipamentosopcionais: TStringField;
    qryEquipamentosano: TIntegerField;
    dsrEquipamentos: TtecDataSource;
    dsrEquipamentosClientes: TtecDataSource;
    qryReceitaOculos: TtecQuery;
    dsrReceitaOculos: TtecDataSource;
    qryReceitaOculoscontrato: TStringField;
    qryReceitaOculosesferico_od: TFloatField;
    qryReceitaOculoscilindro_od: TFloatField;
    qryReceitaOculoseixo_od: TFloatField;
    qryReceitaOculoslonge_dnp_od: TFloatField;
    qryReceitaOculosperto_dnp_od: TFloatField;
    qryReceitaOculosesferico_oe: TFloatField;
    qryReceitaOculoscilindro_oe: TFloatField;
    qryReceitaOculoseixo_oe: TFloatField;
    qryReceitaOculoslonge_dnp_oe: TFloatField;
    qryReceitaOculosperto_dnp_oe: TFloatField;
    qryReceitaOculoslente: TStringField;
    qryReceitaOculoscor: TStringField;
    qryReceitaOculostipo: TIntegerField;
    qryReceitaOculosadicao: TFloatField;
    qryReceitaOculosmedida: TStringField;
    qryReceitaOculosajuste: TStringField;
    qryReceitaOculosentrega: TStringField;
    qryReceitaOculosaltura: TFloatField;
    qryReceitaOculosvalornflente: TFloatField;
    qryReceitaOculosnumeronflente: TIntegerField;
    qryReceitaOculosmedico: TStringField;
    qryServicosOrdemServicocomissao: TCurrencyField;
    qryServicosOrdemServicocomissaoservico: TFloatField;
    qryServicosOrdemServicoValorComissao: TCurrencyField;
    qryServicosOrdemServicotipocomissaoservico: TStringField;
    qryClientesplanopadrao: TIntegerField;
    qryOrdemServicocreditotroca: TFloatField;
    qryCuponsnumeroserie: TStringField;
    qryConsultaProdutosOScodigobarras: TStringField;
    qryOrdemServicorenegociacao: TDateField;
    qryOrdemServicoclientebonus: TIntegerField;
    qryOrdemServicoquitado: TBooleanField;
    qryOrdemServicocan_data: TDateField;
    qryOrdemServicocan_usuariologado: TIntegerField;
    qryOrdemServicocan_usuarioautorizacao: TIntegerField;
    qryOrdemServicodatareservado: TDateField;
    qryOrdemServicobaseicmsproprio: TFloatField;
    qryOrdemServicovaloricmsproprio: TFloatField;
    qryOrdemServicobaseicmssubstituicao: TFloatField;
    qryOrdemServicovaloricmssubstituicao: TFloatField;
    qryOrdemServicoaliquotaicmsproprio: TFloatField;
    qryOrdemServicooperacao: TStringField;
    qryOrdemServiconrpontos: TIntegerField;
    qryOrdemServicolimitecredito: TFloatField;
    qryOrdemServicolimitedisponivel: TFloatField;
    qryOrdemServicolimiteparcela: TFloatField;
    qryOrdemServicoaberto30dias: TFloatField;
    qryOrdemServicocontribicms: TBooleanField;
    qryOrdemServicovendaconsumidorfinal: TBooleanField;
    qryOrdemServicoentnumero: TIntegerField;
    qryOrdemServicoendnumero: TIntegerField;
    qryOrdemServicoempnumero: TIntegerField;
    qryOrdemServicoconnumero: TIntegerField;
    qryOrdemServicorefnumero: TIntegerField;
    qryOrdemServicoentcomplemento: TStringField;
    qryOrdemServicoendcomplemento: TStringField;
    qryOrdemServicoempcomplemento: TStringField;
    qryOrdemServicoconcomplemento: TStringField;
    qryOrdemServicorefcomplemento: TStringField;
    qryOrdemServicodespesasacessorias: TFloatField;
    qryOrdemServiconosimples: TBooleanField;
    qryOrdemServicousuariologadoalteracao: TIntegerField;
    qryOrdemServicousuarioalteracao: TIntegerField;
    qryOrdemServicodatahoraalteracaousuario: TDateTimeField;
    qryOrdemServicofrete_transportadora: TStringField;
    qryOrdemServicofrete_servico: TStringField;
    qryOrdemServicofrete_erro: TBooleanField;
    qryOrdemServicofrete_mensagem: TStringField;
    qryOrdemServicofrete_prazo_entrega: TIntegerField;
    qryOrdemServicobandeira: TStringField;
    qryOrdemServicoinscricaomunicipal: TStringField;
    qryProdutosOrdemServicoxped: TStringField;
    qryProdutosOrdemServiconitemped: TIntegerField;
    qryProdutosOrdemServicoproduto_cliente: TStringField;
    dsrClientesProdutos: TtecDataSource;
    qryClientesProdutos: TtecQuery;
    qryClientesProdutoscliente: TIntegerField;
    qryClientesProdutostipocliente: TStringField;
    qryClientesProdutosproduto: TLargeintField;
    qryClientesProdutosproduto_cliente: TStringField;
    qryClientesProdutosfinalidade: TStringField;
    qryClientesProdutospn: TStringField;
    qryClientesProdutosorigem: TStringField;
    qryClientesProdutosprecocliente: TFloatField;
    qryClientesProdutosalteracaoprecocliente: TDateField;
    qryClientesProdutosvalorultimavenda: TFloatField;
    qryClientesProdutosdataultimavenda: TDateField;
    qryClientesProdutosdataultimoorcamento: TDateField;
    qryClientesProdutosvalorultimoorcamento: TFloatField;
    qryProdutoEstoquepreconormal: TFloatField;
    qryProdutoEstoquedescricaopreco: TStringField;
    qryProdutosOrdemServicovalordescontoitem: TFloatField;
    qryProdutosOrdemServicoprodutomonstruario: TBooleanField;
    qryProdutosOrdemServicodias: TIntegerField;
    qryProdutosSimilares: TtecQuery;
    qryProdutosSimilaresdescricao: TStringField;
    qryProdutosSimilaresvalorgrade1: TStringField;
    qryProdutosSimilaresvalorgrade2: TStringField;
    qryProdutosSimilarescodigo: TLargeintField;
    qryProdutosSimilaresfilial: TIntegerField;
    qryProdutosSimilaresemestoque: TFloatField;
    qryProdutosSimilaresreservado: TFloatField;
    qryProdutosSimilaresunidade: TStringField;
    qryProdutosSimilaresbrinde: TBooleanField;
    qryProdutosSimilaresvalorproduto: TFloatField;
    qryProdutosSimilaressimilares: TLargeintField;
    qryProdutosSimilareslinha: TStringField;
    qryProdutosSimilarescoluna: TStringField;
    qryProdutosSimilarescaracteristica: TLargeintField;
    qryProdutosSimilarespreco: TIntegerField;
    qryProdutosSimilaresdescricaopreco: TStringField;
    qryProdutosSimilarescodigovisual: TStringField;
    dsrProdutosSimilares: TtecDataSource;
    qryModelosCaracteristicas: TtecQuery;
    qryModelosCaracteristicascaracteristica: TLargeintField;
    qryModelosCaracteristicasdescricaomodelo: TStringField;
    qryModelosCaracteristicasespecificacao: TStringField;
    qryModelosCaracteristicasobservacao: TStringField;
    qryModelosCaracteristicasmodelo: TIntegerField;
    dsrModelosCaracteristicas: TtecDataSource;
    qryProcuraClientenaoexibirfichafinanceira: TBooleanField;
    qryProcuraClienterestricoesconceito: TBooleanField;
    qryProcuraClientedebito: TIntegerField;
    qryProcuraClientecredito: TIntegerField;
    qryProcuraClientecargocliente: TIntegerField;
    qryProcuraClientemarkup: TFloatField;
    qryProcuraClientenomebairro: TStringField;
    qryProcuraClientenomecidade: TStringField;
    qryProcuraClientecidadeibge: TIntegerField;
    qryProcuraClientenosimples: TBooleanField;
    qryCargosCliente: TtecQuery;
    qryCargosClienteproduto: TLargeintField;
    qryCargosClientedescricao: TStringField;
    qryCargosClientemarkup: TFloatField;
    qryCargosClientecargo: TIntegerField;
    qryProdutosOrdemServicosituacao_produto: TStringField;
    qryOrdemServicototalqtdeprodutos: TFloatField;
    qryOrdemServicosubtotalprodutos: TFloatField;
    qryOrdemServicodescontototal: TFloatField;
    qryOrdemServicoprodutoanterior: TLargeintField;
    qryServicosDadosFiscais: TtecQuery;
    qryServicosDadosFiscaisdadofiscal: TIntegerField;
    qryServicosDadosFiscaisservico: TIntegerField;
    qryServicosDadosFiscaisquantidade: TIntegerField;
    qryServicosDadosFiscaisaliquotaissqn: TFloatField;
    qryServicosDadosFiscaisvalorservico: TFloatField;
    qryServicosDadosFiscaisdescricao: TStringField;
    qryServicosDadosFiscaiscomplementoservico: TStringField;
    qryServicosDadosFiscaisestado: TStringField;
    qryServicosDadosFiscaiscidade: TIntegerField;
    qryServicosDadosFiscaisreterissqn: TBooleanField;
    qryServicosDadosFiscaisvalorissqn: TFloatField;
    qryServicosDadosFiscaiscodigofiscal: TIntegerField;
    qryServicosDadosFiscaisnatureza: TIntegerField;
    qryServicosDadosFiscaisdestacaripi: TBooleanField;
    qryServicosDadosFiscaispisbasecalculo: TFloatField;
    qryServicosDadosFiscaispisvalor: TFloatField;
    qryServicosDadosFiscaispiscst: TStringField;
    qryServicosDadosFiscaisaliquotapis: TFloatField;
    qryServicosDadosFiscaiscofinsbasecalculo: TFloatField;
    qryServicosDadosFiscaiscofinsvalor: TFloatField;
    qryServicosDadosFiscaiscofinscst: TStringField;
    qryServicosDadosFiscaisaliquotacofins: TFloatField;
    qryServicosDadosFiscaiscodigolcp116: TStringField;
    qryServicosDadosFiscaiscstissqn: TIntegerField;
    qryServicosDadosFiscaiscnae: TIntegerField;
    qryCancelarMov: TtecQuery;
    qryCancelarMovproduto: TLargeintField;
    qryCancelarMovfilial: TIntegerField;
    qryCancelarMovreservado: TFloatField;
    qryCancelarMovfuturo: TFloatField;
    spcMovimentosProximo: TtecQuery;
    spcMovimentosProximonumero: TIntegerField;
    qryProcuraProdutoOSproduto: TLargeintField;
    qryProcuraProdutoOSprodutovisual: TStringField;
    qryConsultaProdutosOSprodutovisual: TStringField;
    qryProdutosOrdemServicoprodutovisual: TStringField;
    qryOrdemServicoprodutovisual: TStringField;
    qryProcuraProdutoprodutovisual: TStringField;
    qryConsultaProdutosprodutovisual: TStringField;
    qryProdutosCompostoscomponentevisual: TStringField;
    qryFiliais: TtecQuery;
    qryFiliaisnome: TStringField;
    qryFiliaiscnpj: TStringField;
    qryFiliaisrua: TStringField;
    qryFiliaisestado: TStringField;
    qryFiliaiscidade: TIntegerField;
    qryFiliaisbairro: TIntegerField;
    qryFiliaiscep: TIntegerField;
    qryFiliaisfoneddd: TIntegerField;
    qryFiliaisfonenumero: TIntegerField;
    qryFiliaisnomecidade: TStringField;
    qryFiliaisnomebairro: TStringField;
    qryOrdemServicotipoequipamentoanterior: TIntegerField;
    dsrContratoCopia: TtecDataSource;
    qryContratoCopia: TtecQuery;
    qryContratoCopianumero: TStringField;
    qryContratoCopiacliente: TIntegerField;
    qryContratoCopiatipocliente: TStringField;
    qryContratoCopianome: TStringField;
    qryContratoCopiadata: TDateField;
    qryContratoCopiafaturamento: TDateField;
    qryContratoCopiapessoanumero: TStringField;
    qryContratoCopianomesituacao: TStringField;
    qryContratoCopiapessoatipo: TStringField;
    qryContratoCopiaestado: TStringField;
    qryProdutosContratoCopia: TtecQuery;
    qryProdutosContratoCopiacontrato: TStringField;
    qryProdutosContratoCopiaproduto: TLargeintField;
    qryProdutosContratoCopiafilial: TIntegerField;
    qryProdutosContratoCopianumero: TIntegerField;
    qryProdutosContratoCopiadescricao: TStringField;
    qryProdutosContratoCopiavalorgrade1: TStringField;
    qryProdutosContratoCopiavalorgrade2: TStringField;
    qryProdutosContratoCopiadescricaolc: TStringField;
    qryProdutosContratoCopiaquantidade: TFloatField;
    qryProdutosContratoCopiaprecovenda: TFloatField;
    qryProdutosContratoCopiaprecotabela: TFloatField;
    qryProdutosContratoCopiadescricaoprecovenda: TStringField;
    qryProdutosContratoCopiamontagem: TStringField;
    qryProdutosContratoCopiaentrega: TStringField;
    qryProdutosContratoCopiaprodutolista: TBooleanField;
    qryProdutosContratoCopiaaliquotaipi: TFloatField;
    qryProdutosContratoCopiareserva: TIntegerField;
    qryProdutosContratoCopiabrinde: TBooleanField;
    qryProdutosContratoCopiavendedor: TIntegerField;
    qryProdutosContratoCopiaclassificacaofiscal: TStringField;
    qryProdutosContratoCopiaipi: TIntegerField;
    qryProdutosContratoCopiafatorsubstituicao: TFloatField;
    qryProdutosContratoCopiaprecosubsttributaria: TFloatField;
    qryProdutosContratoCopiaacrescimo: TFloatField;
    qryProdutosContratoCopiadesconto: TFloatField;
    qryProdutosContratoCopiafrete: TFloatField;
    qryProdutosContratoCopiaseguro: TFloatField;
    qryProdutosContratoCopiaprecoatual: TFloatField;
    qryProdutosContratoCopiaprecosugerido: TFloatField;
    qryProdutosContratoCopiadias: TIntegerField;
    qryProdutosContratoCopiaxped: TStringField;
    qryProdutosContratoCopianitemped: TIntegerField;
    qryProdutosContratoCopiaselecionar: TBooleanField;
    qryProdutosContratoCopiaprodutovisual: TStringField;
    dsrProdutosContratoCopia: TtecDataSource;
    qryProdutosOrdemServicoclassificacaofiscal: TStringField;
    qryProcuraProdutoclassificacaofiscal: TStringField;
    qryProcuraProdutoincidencia: TStringField;
    qryProcuraProdutocsosn: TStringField;
    qryProdutosOrdemServicocsosn: TStringField;
    qryProdutosOrdemServicoipi: TIntegerField;
    qryProcuraProdutoipi: TIntegerField;
    qryProcuraProdutodiscriminarcomposto: TStringField;
    qryProcuraProdutodiscriminarpreco: TBooleanField;
    qryProdutosOrdemServicoaliquotaicmsst: TFloatField;
    qryProcuraProdutoaliquotaicmsst: TFloatField;
    qryProdutosOrdemServicoipicst: TStringField;
    qryProcuraProdutoipicst: TStringField;
    qryProdutosOrdemServicopiscst: TStringField;
    qryProdutosOrdemServicocofinscst: TStringField;
    qryProdutosOrdemServicopisaliquota: TFloatField;
    qryProdutosOrdemServicocofinsaliquota: TFloatField;
    qryProcuraProdutopiscst: TStringField;
    qryProcuraProdutoaliquotapis: TFloatField;
    qryProcuraProdutocofinscst: TStringField;
    qryProcuraProdutoaliquotacofins: TFloatField;
    qryProcuraProdutoicmsmodalidade: TIntegerField;
    qryProcuraProdutoicmsmodsubst: TIntegerField;
    qryProcuraProdutoextipi: TStringField;
    qryProcuraProdutogenero: TIntegerField;
    qryProcuraProdutoorigem: TIntegerField;
    qryProdutosOrdemServicoicmsmodalidade: TIntegerField;
    qryProdutosOrdemServicoicmsmodsubst: TIntegerField;
    qryProdutosOrdemServicogenero: TIntegerField;
    qryProdutosOrdemServicoextipi: TStringField;
    qryProcuraReservaProduto: TtecQuery;
    qryProcuraReservaProdutonumero: TIntegerField;
    qryProcuraReservaProdutoquantidade: TFloatField;
    qryProcuraReservaProdutodescricao: TStringField;
    dsrProcuraReservaProduto: TtecDataSource;
    qryConsultaReservasProduto: TtecQuery;
    qryConsultaReservasProdutonumero: TIntegerField;
    qryConsultaReservasProdutodata: TDateTimeField;
    qryConsultaReservasProdutocliente: TStringField;
    qryConsultaReservasProdutodescricao: TStringField;
    qryConsultaReservasProdutoquantidade: TFloatField;
    qryConsultaReservasProdutovalorgrade1: TStringField;
    qryConsultaReservasProdutovalorgrade2: TStringField;
    qryProdutosOrdemServicoprodutocliente: TStringField;
    qryOrdemServicototalipi: TFloatField;
    qryCopiarContrato: TtecQuery;
    qryCopiarContratonumero: TStringField;
    qryCopiarContratodata: TDateField;
    qryCopiarContratoavalista: TIntegerField;
    qryCopiarContratocliente: TIntegerField;
    qryCopiarContratotipocliente: TStringField;
    qryCopiarContratovendedor: TIntegerField;
    qryCopiarContratofilialvenda: TIntegerField;
    qryCopiarContratovalorvista: TFloatField;
    qryCopiarContratovalorprazo: TFloatField;
    qryCopiarContratodesconto: TFloatField;
    qryCopiarContratofrete: TFloatField;
    qryCopiarContratoseguro: TFloatField;
    qryCopiarContratoagente: TIntegerField;
    qryCopiarContratoanalista: TIntegerField;
    qryCopiarContratoemitirnotadepoisde: TDateField;
    qryCopiarContratoorigem: TStringField;
    qryCopiarContratoprimogenito: TStringField;
    qryCopiarContratotiporenegociacao: TStringField;
    qryCopiarContratotaxajuros: TFloatField;
    qryCopiarContratoplano: TIntegerField;
    qryCopiarContratoconsideracoes: TStringField;
    qryCopiarContratoentrua: TStringField;
    qryCopiarContratoentestado: TStringField;
    qryCopiarContratoentcidade: TIntegerField;
    qryCopiarContratoentbairro: TIntegerField;
    qryCopiarContratoentcep: TIntegerField;
    qryCopiarContratoentfoneddd: TIntegerField;
    qryCopiarContratoentfonenumero: TIntegerField;
    qryCopiarContratoentfoneramal: TStringField;
    qryCopiarContratomontagemobs: TStringField;
    qryCopiarContratomontagemfilial: TIntegerField;
    qryCopiarContratosituacao: TStringField;
    qryCopiarContratomotivo: TIntegerField;
    qryCopiarContratonome: TStringField;
    qryCopiarContratonascto: TDateField;
    qryCopiarContratoapelido: TStringField;
    qryCopiarContratosexo: TStringField;
    qryCopiarContratocivil: TStringField;
    qryCopiarContratocivildata: TDateField;
    qryCopiarContratoiddocumento: TStringField;
    qryCopiarContratoidorgao: TStringField;
    qryCopiarContratoiddata: TDateField;
    qryCopiarContratoidestado: TStringField;
    qryCopiarContratopessoatipo: TStringField;
    qryCopiarContratopessoanumero: TStringField;
    qryCopiarContratomae: TStringField;
    qryCopiarContratopai: TStringField;
    qryCopiarContratoconceito: TIntegerField;
    qryCopiarContratonaturalcidade: TIntegerField;
    qryCopiarContratonaturalestado: TStringField;
    qryCopiarContratorua: TStringField;
    qryCopiarContratoestado: TStringField;
    qryCopiarContratocidade: TIntegerField;
    qryCopiarContratobairro: TIntegerField;
    qryCopiarContratocep: TIntegerField;
    qryCopiarContratofonetipo: TStringField;
    qryCopiarContratofoneddd: TIntegerField;
    qryCopiarContratofonenumero: TIntegerField;
    qryCopiarContratofoneramal: TStringField;
    qryCopiarContratofone2ddd: TIntegerField;
    qryCopiarContratofone2numero: TIntegerField;
    qryCopiarContratofone2ramal: TStringField;
    qryCopiarContratorestipo: TStringField;
    qryCopiarContratoresonus: TFloatField;
    qryCopiarContratorestempo: TDateField;
    qryCopiarContratoempresa: TStringField;
    qryCopiarContratoempadmissao: TDateField;
    qryCopiarContratoempcep: TIntegerField;
    qryCopiarContratoempcomprovado: TBooleanField;
    qryCopiarContratoempfoneddd: TIntegerField;
    qryCopiarContratoempfonenumero: TIntegerField;
    qryCopiarContratoempfoneramal: TStringField;
    qryCopiarContratoempoutrasdescricao: TStringField;
    qryCopiarContratoempoutrasfaixa: TIntegerField;
    qryCopiarContratoempoutrasvalor: TFloatField;
    qryCopiarContratoemprendafaixa: TIntegerField;
    qryCopiarContratoemprendavalor: TFloatField;
    qryCopiarContratoemprua: TStringField;
    qryCopiarContratoempestado: TStringField;
    qryCopiarContratoempcidade: TIntegerField;
    qryCopiarContratoempbairro: TIntegerField;
    qryCopiarContratoempcargo: TIntegerField;
    qryCopiarContratoconjuge: TIntegerField;
    qryCopiarContratoconnome: TStringField;
    qryCopiarContratoconadmissao: TDateField;
    qryCopiarContratoconcep: TIntegerField;
    qryCopiarContratoconempresa: TStringField;
    qryCopiarContratoconfoneddd: TIntegerField;
    qryCopiarContratoconfonenumero: TIntegerField;
    qryCopiarContratoconfoneramal: TStringField;
    qryCopiarContratoconnascto: TDateField;
    qryCopiarContratoconrendafaixa: TIntegerField;
    qryCopiarContratoconrendavalor: TFloatField;
    qryCopiarContratoconrua: TStringField;
    qryCopiarContratoconestado: TStringField;
    qryCopiarContratoconcidade: TIntegerField;
    qryCopiarContratoconbairro: TIntegerField;
    qryCopiarContratoconcargo: TIntegerField;
    qryCopiarContratoreferencia: TStringField;
    qryCopiarContratoreftipo: TStringField;
    qryCopiarContratorefrua: TStringField;
    qryCopiarContratorefestado: TStringField;
    qryCopiarContratorefcidade: TIntegerField;
    qryCopiarContratorefbairro: TIntegerField;
    qryCopiarContratorefcep: TIntegerField;
    qryCopiarContratoreffoneddd: TIntegerField;
    qryCopiarContratoreffonenumero: TIntegerField;
    qryCopiarContratoreffoneramal: TStringField;
    qryCopiarContratoreffone2ddd: TIntegerField;
    qryCopiarContratoreffone2numero: TIntegerField;
    qryCopiarContratoreffone2ramal: TStringField;
    qryCopiarContratoobservacoes: TStringField;
    qryCopiarContratoemail: TStringField;
    qryCopiarContratoautomovel: TBooleanField;
    qryCopiarContratocartaocredito: TBooleanField;
    qryCopiarContratocartaoloja: TBooleanField;
    qryCopiarContratocheque: TBooleanField;
    qryCopiarContratochequeespecial: TBooleanField;
    qryCopiarContratodependentes: TIntegerField;
    qryCopiarContratoonus: TFloatField;
    qryCopiarContratopedidocliente: TStringField;
    qryCopiarContratocreditotroca: TFloatField;
    qryCopiarContratodatareservado: TDateField;
    qryCopiarContratoentnumero: TIntegerField;
    qryCopiarContratoentcomplemento: TStringField;
    qryCopiarContratoendnumero: TIntegerField;
    qryCopiarContratoendcomplemento: TStringField;
    qryCopiarContratoempnumero: TIntegerField;
    qryCopiarContratoempcomplemento: TStringField;
    qryCopiarContratoconnumero: TIntegerField;
    qryCopiarContratoconcomplemento: TStringField;
    qryCopiarContratorefnumero: TIntegerField;
    qryCopiarContratorefcomplemento: TStringField;
    qryCopiarContratocontribicms: TBooleanField;
    qryCopiarContratoinscricaomunicipal: TStringField;
    qryCopiarProdutosContrato: TtecQuery;
    qryCopiarProdutosContratocontrato: TStringField;
    qryCopiarProdutosContratonumero: TIntegerField;
    qryCopiarProdutosContratoquantidade: TFloatField;
    qryCopiarProdutosContratoprecotabela: TFloatField;
    qryCopiarProdutosContratoprecovenda: TFloatField;
    qryCopiarProdutosContratodescricaoprecovenda: TStringField;
    qryCopiarProdutosContratomontagem: TStringField;
    qryCopiarProdutosContratoentrega: TStringField;
    qryCopiarProdutosContratocancelado: TFloatField;
    qryCopiarProdutosContratoproduto: TLargeintField;
    qryCopiarProdutosContratofilial: TIntegerField;
    qryCopiarProdutosContratoreserva: TIntegerField;
    qryCopiarProdutosContratobrinde: TBooleanField;
    qryCopiarProdutosContratoprodutolista: TBooleanField;
    qryCopiarProdutosContratomovimento: TIntegerField;
    qryCopiarProdutosContratovendedor: TIntegerField;
    qryCopiarProdutosContratofuturo: TFloatField;
    qryCopiarProdutosContratodias: TIntegerField;
    qryCopiarProdutosContratoxped: TStringField;
    qryCopiarProdutosContratonitemped: TIntegerField;
    qryCopiarProdutosContratoprodutovisual: TStringField;
    qryContratoCopiaos: TBooleanField;
    qryCopiarContratoos: TBooleanField;
    qryContatos: TtecQuery;
    qryContatoscodigo: TIntegerField;
    qryContatoscontato: TStringField;
    qryContatosfoneddd: TIntegerField;
    qryContatosfonenumero: TIntegerField;
    qryContatosemail: TStringField;
    qryContatosobservacoes: TStringField;
    qryContatoscodigovfornecedores: TIntegerField;
    qryContatostipovfornecedores: TStringField;
    qryContatoscargo: TIntegerField;
    qryContatosfoneramal: TStringField;
    qryContatosdescricaocargo: TStringField;
    dsrContatos: TtecDataSource;
    qryProdutosOrdemServicoprodutodigitado: TStringField;
    qryProdutosContratoCopiaprodutodigitado: TStringField;
    qryOrdemServicoprodutodigitado: TStringField;
    qryProdutosContratoCopiapercreducaomva: TFloatField;
    qryNotasContrato: TtecQuery;
    qryNotasContratofilial: TIntegerField;
    qryNotasContratoserie: TStringField;
    qryNotasContratonumero: TIntegerField;
    qryNotasContratodatasaida: TDateField;
    qryNotasContratosituacao: TStringField;
    qryNotasContratodescricaosituacao: TStringField;
    dsrNotasContratos: TDataSource;
    qryCuponsContrato: TtecQuery;
    qryCuponsContratofilial: TIntegerField;
    qryCuponsContratomaquina: TIntegerField;
    qryCuponsContratonumeroserie: TStringField;
    qryCuponsContratointervensao: TIntegerField;
    qryCuponsContratonumero: TIntegerField;
    qryCuponsContratodatasaida: TDateField;
    qryCuponsContratosituacao: TStringField;
    qryCuponsContratodescricaosituacao: TStringField;
    dsrCuponsContrato: TDataSource;
    qryOrdemServicoEquipamento: TStringField;
    qryEquipamentosCodigo: TStringField;
    qryEquipamentosClientesEquipamento: TStringField;
    qryConsultaEquipamentosCodigo: TStringField;
    qryProcuraEquipamentosCodigo: TStringField;
    qryProcuraEquipamentosOSCodigo: TStringField;
    qryConsultaEquipamentosOSCodigo: TStringField;
    qryServicosOrdemServicoEquipamento: TStringField;
    qryServicosDadosFiscaisEquipamento: TStringField;
    qryServicosOrdemServicocancelado: TIntegerField;
    qryOrdemServicoDescricaoTipoEquipamento: TStringField;
    qryProdutosEquipamentosOSprodutovisual: TStringField;
    qryOrdemServicoos_garantia: TBooleanField;
    qryOrdemServicoos_garantia_status: TStringField;
    qryOrdemServicoos_garantia_processo: TStringField;
    qryOrdemServicoos_cortesia: TBooleanField;
    qryOrdemServico_log: TtecQuery;
    qryOrdemServico_logos_garantia: TBooleanField;
    qryOrdemServico_logos_garantia_status: TStringField;
    qryOrdemServico_logos_garantia_processo: TStringField;
    qryOrdemServico_logos_cortesia: TBooleanField;
    qryOrdemServico_logtrigger_mode: TStringField;
    qryOrdemServico_logtrigger_changed: TDateTimeField;
    qryOrdemServico_logtrigger_user: TStringField;
    qryOrdemServico_logtrigger_mode_d: TStringField;
    dsrOrdemServico_log: TtecDataSource;
    qryOrdemServico_lognumero: TStringField;
    qryOrdemServico_logtrigger_tuple: TStringField;
    qryOrdemServico_logtrigger_id: TLargeintField;
    qryClientesconsumidorfinal: TBooleanField;
    qryParcelastipopagto: TStringField;
    qryParcelasnometipopagto: TStringField;
    qryParcelasfilialpagto: TIntegerField;
    qryParcelastiporecebimento: TIntegerField;
    qryParcelasdescricao: TStringField;
    qryParcelassubstituicao: TBooleanField;
    qryParcelastransacao: TIntegerField;
    qryParcelasparcelaoriginal: TIntegerField;
    qryParcelaspagamentoextracaixa: TBooleanField;
    qryParcelascontaboleto: TIntegerField;
    qryParcelasevento: TIntegerField;
    qryProcuraProdutoobservacoesvenda: TStringField;
    qryOrdemServicoprevisao_anterior: TDateField;
    qryOrdemServicoordemservico_atual: TStringField;
    qryServicosDadosFiscaiscodigoatividade: TIntegerField;
    qryProdutosOrdemServicodescricaoproduto: TStringField;
    qryProcuraEquipamentosOSchecklist: TIntegerField;
    qryServicosOrdemServicodescricaoequipamento: TStringField;
    qryServicosOrdemServicoreferencia: TStringField;
    qryServicosOrdemServicomarca: TIntegerField;
    qryServicosOrdemServicomodelo: TStringField;
    qryServicosOrdemServicoopcionais: TStringField;
    qryServicosOrdemServicoano: TIntegerField;
    qryServicosOrdemServicodescricaomarca: TStringField;
    qryServicosOrdemServiconomecidade: TStringField;
    qryServicosOrdemServicovalorissqndigitado: TBooleanField;
    qryServicosOrdemServicopiscst: TStringField;
    qryServicosOrdemServicopisaliquota: TFloatField;
    qryServicosOrdemServicocofinscst: TStringField;
    qryServicosOrdemServicocofinsaliquota: TFloatField;
    qryServicosOrdemServicocodigolcp116: TStringField;
    qryServicosOrdemServicocnae: TIntegerField;
    qryServicosOrdemServicocstissqn: TIntegerField;
    qryServicosOrdemServicocodigoatividade: TIntegerField;
    qryServicosOrdemServicocodigoatividademunicipio: TIntegerField;
    qryProcuraServicopiscst: TStringField;
    qryProcuraServicopisaliquota: TFloatField;
    qryProcuraServicocofinscst: TStringField;
    qryProcuraServicocofinsaliquota: TFloatField;
    qryProcuraServicocodigolcp116: TStringField;
    qryProcuraServicocodigoatividade: TIntegerField;
    qryProcuraServicocstissqn: TIntegerField;
    qryProcuraServicocnae: TIntegerField;
    qryProcuraServicocodigoatividademunicipio: TIntegerField;
    qryServicosOrdemServicoproduto: TLargeintField;
    qryProdutosOrdemServicodeny_discount: TBooleanField;
    qryOrdemServicoTotalLiquidoServicos: TCurrencyField;
    qryConsultaProdutosmodelos_agg: TStringField;
    qryProdutosSimilaresmodelos_agg: TStringField;
    qryConsultaClientesapelido: TStringField;
    qryPlanoPagamentopermitirimpressaodoboleto: TBooleanField;
    qryClientescodigoibge: TIntegerField;
    qryClientesnumero: TIntegerField;
    qryClientescomplemento: TStringField;
    qryFornecedoresnumero: TIntegerField;
    qryFornecedorescomplemento: TStringField;
    qryFiliaisnumero: TIntegerField;
    qryFiliaiscomplemento: TStringField;
    qryOrdemServicoentrada: TDateField;
    qryConsultaProdutosespecificacoes_agg: TStringField;
    qryProdutosSimilaresespecificacoes_agg: TStringField;
    qryAtendimentos: TtecQuery;
    dsrAtendimentos: TtecDataSource;
    qryAtendimentosdescricao: TStringField;
    qryAtendimentosdata: TDateField;
    procedure qryOrdemServicoAfterOpen(DataSet: TDataSet);
    procedure qryProcuraEquipamentosOSAfterOpen(DataSet: TDataSet);
    procedure AbreTabelasConsulta(TipoConsulta: TtecOrdemServicoTipoConsulta);
    //procedure Selecionar(TipoConsulta: TtecOrdemServicoTipoConsulta);
    procedure qryProdutosSimilaresAfterScroll(DataSet: TDataSet);
    procedure qryConsultaProdutosAfterOpen(DataSet: TDataSet);
    procedure qryProcuraProdutoAfterOpen(DataSet: TDataSet);
    procedure dsrProdutosOrdemServicoDataChange(Sender: TObject;
      Field: TField);
    procedure qryProcuraServicoAfterOpen(DataSet: TDataSet);
    procedure qryProdutosOrdemServicoCalcFields(DataSet: TDataSet);
    procedure qryServicosOrdemServicoCalcFields(DataSet: TDataSet);
    procedure qryProdutosOrdemServicoAfterDelete(DataSet: TDataSet);
    procedure qryServicosOrdemServicoAfterDelete(DataSet: TDataSet);
    procedure qryProcuraProdutoOSAfterOpen(DataSet: TDataSet);
    procedure qryConsultaProdutosOSAfterOpen(DataSet: TDataSet);
    procedure qryOrdemServicoAfterClose(DataSet: TDataSet);
    procedure qryOrdemServicoBeforeClose(DataSet: TDataSet);
    procedure qryOrdemServicoBeforeCancel(DataSet: TDataSet);
    procedure qryOrdemServicoBeforeOpen(DataSet: TDataSet);
    procedure qryOrdemServicoNewRecord(DataSet: TDataSet);
    procedure dsrOrdemServicoDataChange(Sender: TObject; Field: TField);
    procedure qryOrdemServicoclienteChange(Sender: TField);
    procedure qryOrdemServicoAfterScroll(DataSet: TDataSet);
    procedure qryClientesAfterScroll(DataSet: TDataSet);
    procedure frpRequisicaoBeforePrint(Memo: TStringList; View: TfrView);
    procedure qryProdutosEquipamentosOSAfterScroll(DataSet: TDataSet);
    procedure qryProdutosEquipamentosOSFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryComponentesMontagemCalcFields(DataSet: TDataSet);
    procedure qryProcuraEquipamentosOSBeforeOpen(DataSet: TDataSet);
    procedure qryServicosOrdemServicoNewRecord(DataSet: TDataSet);
    procedure qryServicosOrdemServicoBeforePost(DataSet: TDataSet);
    procedure qryClientesAfterPost(DataSet: TDataSet);
    procedure qryClientesAfterOpen(DataSet: TDataSet);
    procedure qryClientesAfterClose(DataSet: TDataSet);
    procedure dsrReceitaOculosDataChange(Sender: TObject; Field: TField);
    procedure qryConsultaProdutosBeforeOpen(DataSet: TDataSet);
    procedure qryProdutosOrdemServicoNewRecord(DataSet: TDataSet);
    procedure qryProdutosOrdemServicoBeforeInsert(DataSet: TDataSet);
    procedure qryProcuraClienteBeforeOpen(DataSet: TDataSet);
    procedure qryContratoCopiaAfterOpen(DataSet: TDataSet);
    procedure qryProdutosContratoCopiaAfterInsert(DataSet: TDataSet);
    procedure qryProdutosOrdemServicoAfterPost(DataSet: TDataSet);
    procedure qryProdutosOrdemServicoBeforeDelete(DataSet: TDataSet);
    procedure qryProdutosOrdemServicoBeforePost(DataSet: TDataSet);
    procedure qryProcuraClienteAfterOpen(DataSet: TDataSet);
    procedure qryOrdemServicoCalcFields(DataSet: TDataSet);
    procedure qryOrdemServicoBeforePost(DataSet: TDataSet);
    procedure qryOrdemServico_logCalcFields(DataSet: TDataSet);
    procedure qryParcelasNewRecord(DataSet: TDataSet);
    procedure dsrOrdemServico_logDataChange(Sender: TObject;
      Field: TField);
    procedure qryProcuraCFPSBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaCFPSBeforeOpen(DataSet: TDataSet);
    procedure qryProcuraServicoBeforeOpen(DataSet: TDataSet);
    procedure qryServicosOrdemServicoBeforeOpen(DataSet: TDataSet);
  protected
//    dtmCadastroEquipamentosLocal: TdtmCadastroEquipamentos;
    FOperacaoCopia: Boolean;
    FBloqueado: Boolean;
    FOrdemServicoBloqueado: String;
    FVendedorDefault: Integer;
    FInseriuProduto: Boolean;
    FRegistrosMarcados: Integer;
    FOnComplementarNota: TtecOnComplementarNota;
    FQtdadeDadosFiscais: Integer;
    FDadosFiscais: array of Integer;
    StateAnt: TDataSetState;
    FPermiteDesconto: Boolean;
    OperacaoEmBloco: Boolean;
    function  GetTabelaProdutosOrdemServico: TtecQuery;
    function  GetTabelaServicosOrdemServico: TtecQuery;
    function  GetTabelaConsultaProdutos: TZDataset;
    function  GetTabelaConsultaServicos: TZDataset;
    function  GetTabelaConsultaFilialProduto: TZDataset;
    function  GetTabelaConsultaVendedores: TZDataset;
    function  GetTabelaConsultaMotivos: TZDataset;
    function  GetPlanoUtilizado: Integer;
    function  getDataAbertura: String;
    function  GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
    function  BloquearOrdemServico(Numero: String): Boolean;
    procedure BloquearEstoque;
    function  GetSituacaoOrdemServico: TtecSituacaoContrato;
    procedure SetSituacaoOrdemServico(const Value: TtecSituacaoContrato);
    procedure SetVendedorDefault(const Value: Integer);
    function  GetTotalProdutos: Currency;
    function  GetTotalServicos: Currency;
    function  SomenteBrindes: Boolean;
    function  EnderecoCompleto: Boolean;
    function  ReservarOrdemServico: Boolean;
    procedure MontarProdutosReservas;
//    function  VerificarSerieFilial:Boolean;
    procedure NovoMovimento(Produto: int64; Filial: Integer);
    function  FormaPagtoSomenteDinheiro: Boolean;
    procedure AtribuirClienteNoContrato;
    procedure AtribuirContratoNoCliente;
    procedure AtribuirFornecedorNoContrato;
    procedure AtribuirFiliaisNoContrato;

    procedure AtribuirContratonoFornecedor;
    function  PermitirVendaSemEstoque: Boolean;
    function  GetDadosFiscais(Value: Integer): Integer;
    procedure AtribuirQuery(qr1, qr2: TtecQuery);
    function  GetAlterado: Boolean;
    function  getPermiteEmitirNota: Boolean;
    function  GetCodigoCliente: Integer;
    function  GetTipoCliente: String;
    function  GetNomeCliente: String;
    function  GetClienteAtrasado: Boolean;
    function  CancelarOrdemServicoReservado: Boolean;
    function  QualquerPagamento: Boolean;
    procedure ProdutoParaConserto;
    procedure TiraConsertoSomaCustos;
    function  PrecoVenda:Currency;
    procedure AtualizaPrecosdeVenda;
private
    SituacaoAnt: TtecSituacaoContrato;
    FCliente: Integer;
    FImprimindo: Boolean;
    FTodosEquipamentos: Boolean;
    FOnScrollLinhaColunaGradeSimilares: TNotifyEvent;
    FAfterCloseClientes: TNotifyEvent;
    FOnScrollClientes: TNotifyEvent;
    FAfterPostClientes: TNotifyEvent;
    FParametroCabecalho: String;
    FTotalDesconto: Real;
    FAfterPostTipoEquipamento: TNotifyEvent;
    feHGarantia: boolean;
    feHCortesia: boolean;
    dtmVisualizarSaldoTroca: TdtmVisualizarSaldoTroca;
    FCreditoTrocaAnt: Currency;
    fdtmCadastroContratos: TdtmCadastroContratos;
    function  GetColunadaGradeSimilares: String;
    function  GetLinhadaGradeSimilares: String;
    function  GetTabelaOrdemServico: TZDataset;
    function  GetConsultaOrdemServico: TZDataset;
    function  GetConsultaFiliais: TZDataset;
    function  GetConsultaClientes: TZDataset;
    function  GetConsultaEqptoOS: TZDataset;
    function  GetConsultaProdutosOS: TZDataset;
    function  GetSituacao: String;
    function  GetPodeAlterarCampos: Boolean;
    function  GetProdutoEmPromocao: Boolean;
    function  GetEditandoProdutosOrdemServico: Boolean;
    function  getIncluindoProdutosOrdemServico: Boolean;
    function  GetTotalOrdemServico: Currency;
    function  GetConsultaCFPS: TZDataset;
    function GetEquipamento: String;
    function GetTabelaProdutosEquipamentos: TZDataset;
    function GetProdutosEquipamentosOSFiltered: Boolean;
    function GetProdutoEhComposto: Boolean;
    function getTabelaComposicaoMontagem: TZDataset;
    function GetIntervaloCarnes: vString;
    function GetIntervaloCarnesAbertas: vString;
    function getPlanoPadraoClienteSemParcelas: Boolean;
    function getClientePlanoPadrao: Integer;
    function getProdutoCancelado: Boolean;
    function getProdutoNotaEmitida: Boolean;
    function getIncluirNaNotaFiscal: Boolean;
    procedure setIncluirNaNotaFiscal(const Value: Boolean);
    function GetQtdadeProdutos: Integer;
    function getMarcarProdutoCopiar: Boolean;
    procedure setMarcarProdutoCopiar(const Value: Boolean);
    function GetTabelaConsultaContratos: TZDataset; override;
    function GetTabelaConsultaClientes: TZDataset; override;
    function GetTabelaContratoCopia: TZDataset; override;
    function GetProdutoMontavel: Boolean;
    function GetTotalIPI: Currency;
    function getContratoInserindo: Boolean;
    function GetContratosRecordCount: Integer;
    function GetQtdadeServicos: Integer;
    function getServicoCancelado: Boolean;
    function GeteHCortesia: boolean;
    function GeteHGarantia: boolean;
    function GetTabelaSaldoCredito: TZDataset;
    function GetTabelaSaldoCreditoAtual: TZDataset;
    function GetCreditoTroca: Currency;
    procedure SetCreditoTroca(const Value: Currency);
    function GetSaldoCreditoAtual: Currency;
    function getdtmCadastroContratos: TdtmCadastroContratos;


    { Private declarations }
  public
    { Public declarations }
   //constructor Create(AOwner: TComponent); override;
    ConsultaExecutada: Boolean;

   constructor Create(AOwner: TComponent; OperBloco: Boolean); reintroduce;

   property  ClientePlanoPadrao: Integer read getClientePlanoPadrao;
   property  OnScrollClientes: TNotifyEvent read FOnScrollClientes write FOnScrollClientes;
   property  AfterPostClientes: TNotifyEvent read FAfterPostClientes write FAfterPostClientes;
   property  AfterCloseClientes: TNotifyEvent read FAfterCloseClientes write FAfterCloseClientes;
   property  AfterPostTipoEquipamento: TNotifyEvent read FAfterPostTipoEquipamento write FAfterPostTipoEquipamento;
   property  TabelaOrdemServico: TZDataset read GetTabelaOrdemServico;
   property  TabelaConsultaMotivos: TZDataset read GetTabelaConsultaMotivos;
   function  IncluirOrdemServico: Boolean;
   function  ExcluirOrdemServico: Boolean;
   property  ConsultaOrdemServico : TZDataset read GetConsultaOrdemServico;
   property  ConsultaFiliais : TZDataset read GetConsultaFiliais;
   property  ConsultaClientes: TZDataset read GetConsultaClientes;
   property  ConsultaEqptoOS: TZDataset read GetConsultaEqptoOS;
   property  ConsultaProdutosOS: TZDataset read GetConsultaProdutosOS;
   function  ExisteContrato(NomeCampo: String; Value: Variant): Boolean;
   function  Existefilial(NomeCampo: String; Value: Variant): Boolean;
   function  ExisteCliente(NomeCampo: String; Value: Variant): Boolean; override;
   function  ExisteEquipamentoOS(Nomecampo: String; Value: Variant): boolean;
   property  Situacao: String read GetSituacao;
   property  PodeAlterarCampos: Boolean read GetPodeAlterarCampos;
   property  ProdutoEmPromocao: Boolean read GetProdutoEmPromocao;
   property  TabelaProdutosOrdemServico: TtecQuery read GetTabelaProdutosOrdemServico;
   function  ExisteProduto(NomeCampo: String; Value: Variant): Boolean;
   function  ExisteProdutoOS(NomeCampo: String; Value: Variant): Boolean;
   function  ExisteServico(NomeCampo: String; Value: Variant): Boolean;
   property  TabelaServicosOrdemServico: TtecQuery read GetTabelaServicosOrdemServico;
   function  ExisteFilialProduto(NomeCampo: String; Value: Variant): Boolean;
   function  ExisteVendedor(NomeCampo: String; inf: Variant): Boolean;
   function  ExcluirProdutoOrdemServico: Boolean;
   function  ExcluirServicoOrdemServico: Boolean;
   procedure LerProdutosFiliaisIncluidos(Incluindo: Boolean);
   procedure FiltrarProdutosEFiliaisOrdemServico;
   property  EditandoProdutosOrdemServico: Boolean read GetEditandoProdutosOrdemServico;
   function  GravarProdutoOrdemServico: Boolean;
   function  GravarServicoOrdemServico: Boolean;
   function  IncluirProdutosOrdemServico: Boolean;
   function  IncluirEquipamentos: Boolean;
   procedure IncluirProdutosRequisicaoProdutosOS;
   function  IncluirServicosOrdemServico(Editar: Boolean): Boolean;
   procedure VerificarServicos(Editando: Boolean);
   property  TabelaConsultaVendedores: TZDataset read GetTabelaConsultaVendedores;
   property  TabelaConsultaProdutos: TZDataset read GetTabelaConsultaProdutos;
   property  TabelaConsultaServicos: TZDataset read GetTabelaConsultaServicos;
   property  TabelaConsultaFilialProduto: TZDataset read GetTabelaConsultaFilialProduto;
   property  OnScrollLinhaColunaGradeSimilares: TNotifyEvent read FOnScrollLinhaColunaGradeSimilares write FOnScrollLinhaColunaGradeSimilares;
   property  LinhadaGradeSimilares: String read GetLinhadaGradeSimilares;
   property  ColunadaGradeSimilares: String read GetColunadaGradeSimilares;
   procedure TrocaProdutoOrdemServicoporSimilar;
   property  IncluindoProdutosOrdemServico: Boolean read getIncluindoProdutosOrdemServico;
   function  EditarProdutosOrdemServico: Boolean;
   function  EditarServicosOrdemServico: Boolean;
   procedure SelecionaTabelasConsulta(TipoConsulta: TtecOrdemServicoTipoConsulta);
   procedure FechaTabelasConsulta(TipoConsulta: TtecOrdemServicoTipoConsulta);
   function  GetSql: TStrings;
   property  TotalOrdemServico: Currency Read GetTotalOrdemServico;
   procedure EditarOrdemServico;
   property  PlanoUtilizado: Integer read GetPlanoUtilizado;
   property  DataAbertura: String read getDataAbertura;
   procedure ResumoParcelas(var Parcelas: TResumosParcelas);

   procedure DefinirParcelas(var Parcelas: TResumosParcelas; var ValorPrazo, TaxaJuros, Desconto: Real; var Plano: Integer);

   property  ReadOnly: Boolean read GetReadOnly write SetReadOnly;
   procedure DesbloquearOrdemServico; overload;
   procedure DesbloquearOrdemServico(Numero: String); overload;
   property  Bloqueado: Boolean read FBloqueado;
   property  Alterado: Boolean read GetAlterado;
   property  SituacaoOrdemServico: TtecSituacaoContrato read GetSituacaoOrdemServico write SetSituacaoOrdemServico;
   property  VendedorDefault: Integer read FVendedorDefault write SetVendedorDefault;

//   procedure CalcularValorTotalProdutos;
//   procedure CalcularValorTotalServicos;

   procedure CalcularTotais;


   property  TotalProdutos: Currency Read GetTotalProdutos;
   property  TotalServicos: Currency Read GetTotalServicos;
   procedure CalcularValorAVista;
   property  PermiteDesconto: Boolean read FPermiteDesconto;
   function  GetNumeroOrdemServico: String;
   property  NumeroOrdemServico: String read GetNumeroOrdemServico;
   function  GravarOrdemServico(var ErroCupom, CupomEmitido: Boolean; var FormaPagamento: Integer;
                                var DadosFornec: String; var ValorPagoDinheiro: Currency;
                                NotaFiscalVinculada: Boolean = False;
                                ViaCaixa: Boolean = False; ComTEF: Boolean = False;
                                NroParcela: Integer = 0; ValorParcela: Real = 0): Boolean;
   property  OnComplementarNota: TtecOnComplementarNota read FOnComplementarNota write FOnComplementarNota;
   property  QtdadeDadosFiscais: Integer read FQtdadeDadosFiscais;
   function  PagamentoAVista: Currency;
   property  InseriuProduto: Boolean read FInseriuProduto write FInseriuProduto;
   property  RegistrosMarcados: Integer read FRegistrosMarcados write FRegistrosMarcados;
   property  DadosFiscais[Value: Integer]: Integer read GetDadosFiscais;
   procedure ImprimirOrdemServico;

   procedure ImprimirCarne(SomenteAbertas: Boolean); overload;
   procedure ImprimirCarne(NumeroParcelas: vString); overload;
   procedure ImprimirBoleto(NumeroParcelas: vString);
   procedure EnviarPDFBoletoViaEmail(NumeroParcelas: vString);

   procedure ImprimirSaldo;
   procedure ImprimirEtiquetasListaCasamento;

   function VerificarParametrosImpressaoBoletos: Boolean;


   procedure VoltarSituacaoOrdemServico(Situacao : TtecSituacaoContrato);
   procedure CancelarAlteracoesOrdemServico;
   property  PermiteEmitirNota: Boolean read getPermiteEmitirNota;
   procedure RefazConsultaOrdemServico; overload;
   procedure RefazConsultaOrdemServico(Numero: String); overload;
   function  MarcarTodososProdutos: boolean;
   procedure RefazConsultaProdutosEntregar;
   procedure RefazConsultaProdutoEstoque(produto:String;filial:integer);
   procedure RefazConsultaPrecoParaCliente;   

   procedure ImprimirDuplicatas(SomenteAbertas: Boolean); overload;
   procedure ImprimirDuplicatas(NumeroParcelas: vString); overload;

   property  CodigoCliente: Integer read GetCodigoCliente;
   property  TipoCliente: String read GetTipoCliente;
   property  NomeCliente: String read GetNomeCliente;
   property  ClienteAtrasado: Boolean read GetClienteAtrasado;
   function  TipoEquipamento: Integer;
   function  ExisteCFPS(NomeCampo: String; Value: Variant): Boolean;
   property  ConsultaCFPS: TZDataset read GetConsultaCFPS;
   property  Equipamento: String read GetEquipamento;
   property  TabelaProdutosEquipamentos: TZDataset read GetTabelaProdutosEquipamentos;
   function  RefazConsultaRequisicaoOS: Boolean;
   procedure SelecionarRegistroRequisicao;
   procedure ImprimirRequisicao;
   property  ProdutosEquipamentosOSFiltered: Boolean read GetProdutosEquipamentosOSFiltered;
   property  ProdutoEhComposto: Boolean read GetProdutoEhComposto;
   procedure RefazConsultaComposicaoMontagem;
   property  TabelaComposicaoMontagem: TZDataset read getTabelaComposicaoMontagem;
   function  IncluirEquipamentosCliente(Editar: Boolean): Boolean;
   property  Cliente: Integer read FCliente write FCliente;
   procedure gravarReceitaoculos;
   property IntervaloCarnes: vString read GetIntervaloCarnes;
   property IntervaloCarnesAbertas: vString read GetIntervaloCarnesAbertas;
   property  PlanoPadraoClienteSemParcelas: Boolean read getPlanoPadraoClienteSemParcelas;
   property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
   function DocumentosFiscaisOrdemServico: Boolean;
   property TotalDesconto: Real read FTotalDesconto write FTotalDesconto;
   property ProdutoCancelado: Boolean read getProdutoCancelado;
   property ServicoCancelado: Boolean read getServicoCancelado;

   property ProdutoNotaEmitida: Boolean read getProdutoNotaEmitida;
   property IncluirNaNotaFiscal: Boolean read getIncluirNaNotaFiscal write setIncluirNaNotaFiscal;
   property  QtdadeProdutos: Integer read GetQtdadeProdutos;
   property  QtdadeServicos: Integer read GetQtdadeServicos;

   property  MarcarProdutoCopiar: Boolean read getMarcarProdutoCopiar write setMarcarProdutoCopiar;
   procedure IncluirProdutosContratoCopia;
   procedure AbreConsultaClientes; override;
   procedure SelecionarContratoCopia; override;
   procedure AbreConsultaContrato; override;
   property  TabelaConsultaContratos: TZDataset read GetTabelaConsultaContratos;
   property  TabelaConsultaClientes: TZDataset read GetTabelaConsultaClientes;
   procedure SelecionarProdutosContratoCopiar(Marcar, Todos: Boolean); override;
   property  TabelaContratoCopia: TZDataset read GetTabelaContratoCopia;
   procedure AlterarPrecoProdutosContratoCopiar(PrecoAtual: Boolean); override;
   function HaProdutoContratoCopiarSelecionado: Boolean; override;
   property  ProdutoMontavel: Boolean read GetProdutoMontavel;
   function  ValidarProdutosContratos: Boolean;
   function  PermitirVendaProdutoSemEstoque: Boolean;
   procedure SelecionarProdutoContratoProcura;
   function  CopiarContrato: Boolean;
   procedure MarcarProdutosBrinde(Todos, marcando: Boolean);
   property TotalIPI: Currency Read GetTotalIPI;
   property ContratoInserindo: Boolean read getContratoInserindo;
   property ContratosRecordCount: Integer read GetContratosRecordCount;
   procedure SelecionarProdutoContratoConsulta;
   procedure MarcarProdutos(Marcar:Boolean);
   property eHGarantia: boolean read GeteHGarantia write feHGarantia;
   property eHCortesia: boolean read GeteHCortesia write feHCortesia;
   procedure AtualizarDadosLog;
   procedure ApagarParcelas;
   function GetTipoDocumento: String;
   procedure AbrirDadosCreditoCliente;
   property TabelaSaldoCreditoAtual: TZDataset read GetTabelaSaldoCreditoAtual;
   property TabelaSaldoCredito: TZDataset read GetTabelaSaldoCredito;

   property  CreditoTroca: Currency Read GetCreditoTroca write SetCreditoTroca;

   property SaldoCreditoAtual: Currency read GetSaldoCreditoAtual;

   function SugerirCreditoTroca(Perguntar,Atribuir: Boolean): Boolean;
   property CreditoTrocaAnt: Currency read FCreditoTrocaAnt write FCreditoTrocaAnt;

   function ValidarCreditoTroca: Boolean;
   procedure AbrirConsultaAtendimentos;
   property dtmCadastroContratos: TdtmCadastroContratos read getdtmCadastroContratos write fdtmCadastroContratos;


 end;

var
  dtmordemservico: Tdtmordemservico;
  PrecisaReCalcularParcelasOrdemServico: Boolean;
//  frm_CadastroContratos: TfrmCadastroContratos;

  TotalProdInc: Real;
  aProdFilial: array of record
    Prod,
    Filial: String
  end;

const
   SQLEstoquesDeposito = ' and  (filial in (Select codigo ' +
                                           ' From filiais '+
                                           ' Where (tipofilial = ''D''))) ';
   SQLEqptodoCliente = 'Where e.codigo in (select ec.equipamento ' +
                                           ' From Equipamentosclientes ec '+
                                           ' where ec.cliente = %s '+
                                           ' order by ec.equipamento) ';
implementation

uses
  {//CLX
  DateUtils,
  clecf, cttef;}
    //CLX
  Variants, DateUtils, Math,
  //Terceiros
  ZSqlTypes,
  //Biblio
  biblio, clusuario, clecf, cttef, fmlistacasamento;


{$R *.dfm}

{ TdtmOrdemServico }

//constructor TdtmOrdemServico.Create(AOwner: TComponent);
constructor Tdtmordemservico.Create(AOwner: TComponent; OperBloco: Boolean);
begin
  //inherited;
  Inherited Create(AOwner);

  FOperacaoCopia                      := False;
  OperacaoEmBloco               := OperBloco;
  FVendedorDefault              := 0;
  qryOrdemServico.Tag           := ctVendaOrdemServico;
  qryConsultaOrdemServico.Tag   := ctVendaTabelaConsultaOrdemServico;
  qryConsultaClientes.Tag       := ctVendaTabelaConsultaClientes;
  qryConsultaProdutos.Tag       := ctVendaTabelaConsultaProdutos;
//  qryConsultaProdutosOS.Tag     := ctVendaTabelaConsultaProdutos;
  qryConsultaServicos.Tag       := ctVendaTabelaConsultaServicos;
  qryConsultaServicos.tag       := ctVendaTabelaConsultaServicos;
  qryConsultaFiliais.Tag        := ctVendaTabelaConsultaFiliais;
  qryConsultaFilialProduto.Tag  := ctVendaTabelaConsultaFilialProduto;
  qryConsultaVendedores.Tag     := ctVendaTabelaConsultaVendedores;
  qryConsultaServicos.Tag       := ctVendaTabelaConsultaServicos;
  qryConsultaEquipamentosOS.Tag := ctVendaTabelaConsultaEquipamentosOS;
  qryConsultaMotivos.Tag        := ctVendaTabelaConsultaMotivos;
  qryConsultaCFPS.Tag           := ctVendaTabelaConsultaCFPS;
  //qryConsultaEquipamentos.Tag   := ctVendaTabelaConsultaEquipamentos;

  qryConsultaProdutos.ParamByName('ConsiderarMarkupCliente').AsBoolean := ParSistema.ConsiderarMarkupClientes;
  qryConsultaProdutos.ParamByName('PrecodaFilialBase').AsBoolean := ParSistema.UtilizarPrecoFilialBase;
  qryConsultaProdutos.ParamByName('FilialBase').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
  qryConsultaProdutos.ParamByName('ConsiderarMarkupCargos').AsBoolean := ParSistema.PrecosporCargo;
  
  qryConsultaProdutosOS.ParamByName('PrecodaFilialBase').AsBoolean := true;
  qryConsultaProdutosOS.ParamByName('FilialBase').AsInteger := FilialBase;

  qryProcuraCliente.Params[1].AsString    := 'C';


  qryProcuraProduto.ParamByName('ConsiderarMarkupClientes').AsBoolean   := ParSistema.ConsiderarMarkupClientes;
  qryProcuraProduto.ParamByName('ConsiderarMarkupcargos').AsBoolean   := ParSistema.PrecosporCargo;
  qryProcuraProduto.ParamByname('FilialBase').AsInteger      := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
  qryProcuraProduto.ParamByname('FilialSaida').AsInteger     := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
  qryProcuraProduto.ParamByname('FilialPreco').AsInteger     := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);

//  qryProcuraProduto.ParamByName('estado').AsString    := EstadoFilialBase;

  qryProcuraProdutoOS.Parambyname('estado').AsString    := EstadoFilialBase;
  qryProcuraProdutoOS.Parambyname('filialbase').AsInteger   := FilialBase;
  qryProcuraProdutoOS.Parambyname('filialsaida').AsInteger   := FilialBase;
  qryProcuraProdutoOS.Parambyname('filialpreco').AsInteger   := FilialBase;
  qryProcuraProdutoOS.Parambyname('inserindo').AsBoolean   := qryOrdemServico.State = dsInsert;

  if (ParSistema.FiliaisIndependentes) then
  begin
    qryConsultaProdutos.MacroByName('FilialIndependente').AsString := 'and (e.filial = ' + IntToStr(ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)) + ')';
    qryConsultaFilialProduto.macrobyname('SQLLimiteFiliais').asstring    := 'and (f.codigo = ' + IntToStr(ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)) + ')';
    qryProcuraFilialProduto.macrobyname('SQLLimiteFiliais').asstring := 'and (f.codigo = ' + IntToStr(ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)) + ' or f.codigo = :codigo)';
    qryConsultaProdutosfilial.Visible  := Not (ParSistema.FiliaisIndependentes);
    qryProdutosOrdemServicofilial.Visible := Not (ParSistema.FiliaisIndependentes);
  end
  else
  if (ParSistema.PesquisaSomenteEstoqueFilialBasevendas) then
  begin
    qryConsultaProdutos.MacroByName('FilialIndependente').AsString := 'and (e.filial in (' + ListaEstoquesFiliais + '))';
    qryConsultaFilialProduto.macrobyname('SQLLimiteFiliais').asstring    := 'and (f.codigo in (' + ListaEstoquesFiliais + '))';
    qryProcuraFilialProduto.macrobyname('SQLLimiteFiliais').asstring   := 'and (f.codigo in (' + ListaEstoquesFiliais + ') or f.codigo = :codigo)';
  end
  else
  begin
    qryConsultaProdutos.MacroByName('FilialIndependente').AsString := '';
    qryConsultaFilialProduto.macrobyname('SQLLimiteFiliais').asstring    := '';
    qryProcuraFilialProduto.macrobyname('SQLLimiteFiliais').asstring    := '';
  end;


  qryConsultaProdutosOS.macrobyname('FilialIndependente').AsString := 'and (e.filial = ' + IntToStr(FilialBase) + ')';

  if ParSistema.SoVisualizarEstoqueDeposito then
   qryEstoque.Sql[4] := SQLEstoquesDeposito
  else
   qryEstoque.Sql[4] := '';

  qryProdutoEstoque.ParamByname('FilialPreco').AsInteger    := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
  qryProdutoEstoque.ParamByname('ConsiderarmarkupClientes').AsBoolean   := ParSistema.ConsiderarMarkupClientes;
  qryProdutoEstoque.ParamByName('ConsiderarMarkupCargos').AsBoolean   := ParSistema.PrecosporCargo;
  qryProdutoEstoque.ParamByName('FilialBase').AsInteger   := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);

  qryProdutosOrdemServicoquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutoEstoqueemestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryEstoqueemestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryConsultaProdutosemestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryConsultaProdutosreservado.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryConsultaProdutosOSemestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryConsultaProdutosOSreservado.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosEquipamentosOSquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosEquipamentosOSemestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;

  qryProdutosOrdemServico.ParamByName('VisualizarSituacaoProdutos').AsBoolean :=  ParSistema.VisualizarSituacaoProdutos;
  qryProdutosOrdemServico.ParamByName('EstadoFilialBase').AsString   := EstadoFilialBase;


//  fdtmCadastroContratos := TdtmCadastroContratos.Create(self, false, True);

//  qryOrdemServicovendaconsumidorfinal.AsBoolean := parsistema.vendaconsumidorfinal;


end;

function Tdtmordemservico.ExcluirOrdemServico: Boolean;
begin
  if SituacaoOrdemServico in [scORCADO, scRESERVADO, scFATURADO] then
  begin
    if MensagemConfirmacao('O cadastro do cliente será atualizado.') = smbOk then
      AtribuirContratoNoCliente;
    Result := CancelarOrdemServicoReservado
  end
  else
    Result := False;
  FInseriuProduto   := False;
  FRegistrosMarcados:= 0;
end;

function Tdtmordemservico.ExisteCliente(NomeCampo: String;
  Value: Variant): Boolean;
const
  SQL = 'and (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
  SQLRazaoNome = 'and ( (upper(pg_catalog.to_ascii(cast(%s as varchar),''LATIN1'')) ilike upper(pg_catalog.to_ascii(''%s%s'',''LATIN1''))) or (upper(pg_catalog.to_ascii(cast(%s as varchar),''LATIN1'')) ilike upper(pg_catalog.to_ascii(''%s%s'',''LATIN1''))))';
begin
  if (NomeCampo = 'nome') or (NomeCampo = 'apelido') then
     qryConsultaClientes.Sql[14]:= Format(SQLRazaoNome, ['v.nome', ANSIUpperCase(Value), '%', 'v.razao', ANSIUpperCase(Value), '%'])
  else
  if NomeCampo = 'nomecidade' then
       NomeCampo:= 'c.nome'
  else NomeCampo:= 'v.' + NomeCampo;

  if parsistema.SelecionarSomenteClientesnasVendas then
    qryConsultaClientes.Sql[14] :=
      qryConsultaClientes.Sql[14] + 'and v.tipo = ''C''';

  qryConsultaClientes.Open;
  Result := qryConsultaClientes.RecordCount > 0
end;

function Tdtmordemservico.ExisteEquipamentoOS(Nomecampo: String;
  Value: Variant): boolean;
begin
  Result:=Existecodigo(qryConsultaEquipamentosOS, Nomecampo, Value);
end;

function Tdtmordemservico.Existefilial(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result:=Existecodigo(qryConsultaFiliais, Nomecampo, Value);
end;

function Tdtmordemservico.ExisteContrato(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result:=ExisteCodigo(qryConsultaOrdemServico, Nomecampo, Value);
end;

function Tdtmordemservico.GetConsultaClientes: TZDataset;
begin
 result := qryConsultaClientes;
end;

function Tdtmordemservico.GetConsultaEqptoOS: TZDataset;
begin
  result := qryConsultaEquipamentosOS;
end;

function Tdtmordemservico.GetConsultaProdutosOS: TZDataset;
begin
  result := qryConsultaProdutosOS;
end;


function Tdtmordemservico.GetConsultaFiliais: TZDataset;
begin
  result := qryConsultaFiliais;
end;

function Tdtmordemservico.GetConsultaOrdemServico: TZDataset;
begin
  result := qryConsultaOrdemServico;
end;

function Tdtmordemservico.GetTabelaOrdemServico: TZDataset;
begin
  result := qryOrdemServico;
end;

function Tdtmordemservico.GetTabelaConsultaMotivos: TZDataset;
begin
  result := qryConsultaMotivos;
end;

//function TdtmOrdemServico.GravarOrdemServico: Boolean;
//begin
//end;

function Tdtmordemservico.IncluirOrdemServico: Boolean;
begin
  ReadOnly:=False;
  dsrOrdemServico.OnDataChange := nil;
  DesbloquearOrdemServico;
  qryOrdemServico.insert;

  if (ParSistema.ANEXOCONTRATORECEITAOCULOS) then
    ReFazConsulta(qryReceitaOculos,[0],[qryOrdemServiconumero.AsString]);

  ReFazConsulta(qryParcelas, [0], [qryOrdemServiconumero.AsString]);
  RefazConsultaPorNome(qryProdutosOrdemServico, ['estado','cliente','tipocliente','ordemservico'],
            [EstadoFilialBase, qryOrdemServicocliente.AsInteger, qryOrdemServicotipocliente.AsString, qryOrdemServiconumero.AsString]);
  RefazConsultaPorNome(qryServicosOrdemServico,['ordemservico'],[qryOrdemServiconumero.AsString]);

  ReFazConsulta(qryPlanoPagamento, [0], [0]);
  qryOrdemServicodata.value := DataServidor;
  qryOrdemServicoatualizacao.Value := DataServidor;
  qryOrdemServicofilialvenda.Value := FilialBase;
  qryOrdemServicotipoequipamento.AsInteger := 1;
  qryOrdemServicotipocliente.AsString := 'C';
  CalcularTotais;
  dsrOrdemServico.OnDataChange := dsrOrdemServicoDataChange;
  Result:=true;
end;

procedure Tdtmordemservico.qryOrdemServicoAfterOpen(DataSet: TDataSet);
begin
  inherited;
   if qryOrdemServico.RecordCount = 1 then
   begin
    RefazConsulta(qryProcuraFilialOS,[0],[qryOrdemServicofilialvenda.AsVariant]);
    ReFazConsulta(qryParcelas,[0],[qryOrdemServiconumero.AsString]);

    RefazConsultaPorNome(qryProdutosOrdemServico, ['estado','cliente','tipocliente','ordemservico'],
              [EstadoFilialBase, qryOrdemServicocliente.AsInteger, qryOrdemServicotipocliente.AsString, qryOrdemServiconumero.AsString]);

    ReFazConsulta(qryServicosDadosFiscais,[0],[qryOrdemServiconumero.AsString]);

    ReFazConsultaPorNome(qryServicosOrdemServico,['ordemservico'],[qryOrdemServiconumero.AsString]);

    ReFazConsulta(qryPlanoPagamento,[0],[qryOrdemServicoplano.AsInteger]);

    ReFazConsultapornome(qryContatos,['cliente'],[qryOrdemServicocliente.AsVariant]);

    if (ParSistema.ANEXOCONTRATORECEITAOCULOS) then
    ReFazConsulta(qryReceitaOculos,[0],[qryOrdemServiconumero.AsVariant]);

//    dtmCadastroEquipamentoslocal.Cliente:= qryOrdemServicocliente.AsInteger;

{
    if qryProdutosOrdemServico.Active then
      CalcularValorTotalProdutos;

    if ParSistema.ContratoComServico then
      CalcularValorTotalServicos;
}
    CalcularTotais;      
      
    RefazConsultaProdutosEntregar;

    if (Not UsuarioLogin.Vendedor or parsistema.NaoPermitirAlteraroVendedornosProdutosdoContrato) and (Not qryOrdemServicovendedor.IsNull) then
      VendedorDefault := qryOrdemServicovendedor.AsInteger;

    if FBloqueado then
      MensagemAviso(ctINFORMACAOSENDOEDITADA);
  end;
  ReadOnly := (SituacaoOrdemServico > scRESERVADO) or FBloqueado;
end;

procedure Tdtmordemservico.qryProcuraEquipamentosOSAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
   qryProcuraEquipamentosOSdescricao.ReadOnly := qryProcuraEquipamentosOScodigo.AsString<>'';
   qryProcuraEquipamentosOSmarca.ReadOnly     := qryProcuraEquipamentosOScodigo.AsString<>'';
   qryProcuraEquipamentosOSmodelo.ReadOnly    := qryProcuraEquipamentosOScodigo.AsString<>'';
   qryProcuraEquipamentosOSano.ReadOnly       := qryProcuraEquipamentosOScodigo.AsString<>'';
   if (qryProcuraEquipamentosOScodigo.AsString='') and
      not (qryProcuraEquipamentosOS.state in [dsedit, dsinsert]) then
     qryProcuraEquipamentosOS.edit;
end;

procedure Tdtmordemservico.AbreTabelasConsulta(TipoConsulta: TtecOrdemServicoTipoConsulta);
begin
  case TipoConsulta of
    ctosORDEMSERVICO : AbreConsultaContrato;
    ctosCLIENTES     : begin
                         qryConsultaClientes.Sql[14]:= 'and (v.codigo = 0)';
                         //abre(ctVendaTabelaConsultaClientes);
                         qryConsultaClientes.Open;
                       end;
    ctosFILIAISOS    : Abre(ctVendaTabelaConsultaFiliais);
    ctosFILIALPRODUTO: Abre(ctVendaTabelaConsultaFilialProduto);

    ctosEQPTOSOS     : abre(ctVendaTabelaConsultaEquipamentosOS);
    ctosPRODUTOSOS   :
                      if ParSistema.UsarConsultaInterativa then
                      begin
                         qryConsultaProdutosOS.macrobyname('SQL').AsString := '';
                         qryConsultaProdutosOS.close;
                         qryConsultaProdutosOS.Open;
                      end
                      else
                      begin
                        qryConsultaProdutosOS.macrobyname('SQL').AsString := 'and (produto = 0)';
                        qryConsultaProdutosOS.close;
                        qryConsultaProdutosOS.Open;
                      end;

    ctosVENDEDOR,
    ctosVENDEDORPRODUTO : Abre(ctVendaTabelaConsultaVendedores);
    ctosPRODUTOS    : (* if ParSistema.UsarConsultaInterativa then
                      begin
                         qryConsultaProdutos.macrobyname('SQL').asstring := '';
                         Abre(ctVendaTabelaConsultaProdutos);
                      end
                      else
                      begin
                        qryConsultaProdutos.macrobyname('SQL').asstring := 'and (produto = 0)';
                        Abre(ctVendaTabelaConsultaProdutos);
                      end;
                      *)
                      begin
                         qryConsultaProdutos.MacroByName('Produto').ASString:= ' and false';
                         if ParSistema.UsarConsultaInterativa then
                           qryConsultaProdutos.MacroByName('Produto').ASString:= '';
                         Abre(ctVendaTabelaConsultaProdutos);
                      end;
    ctosSERVICOSOS  : Abre(ctVendaTabelaConsultaServicos);
    ctosMotivos     : Abre(ctVendaTabelaConsultaMotivos);
    ctosCFPS        : Abre(ctVendaTabelaConsultaCFPS);
  end;
end;

{*
procedure TdtmOrdemServico.FechaTabelasConsulta(TipoConsulta: TtecOrdemServicoTipoConsulta);
begin
  case TipoConsulta of
    ctosORDEMSERVICO : fecha(ctVendaOrdemServico);
    ctosCLIENTES     : fecha(ctVendaTabelaConsultaClientes);
    ctosFILIAISOS    : fecha(ctVendaTabelaConsultaFiliais);
    ctosEQPTOSOS     : fecha(ctVendaTabelaConsultaEquipamentosOS);
  end;
end;

procedure TdtmOrdemServico.Selecionar(TipoConsulta: TtecOrdemServicoTipoConsulta);
begin
  case TipoConsulta of
    ctosORDEMSERVICO : ReFazConsulta(qryOrdemServico,[0],[qryConsultaOrdemServiconumero.AsVariant]);
    ctosCLIENTES     : qryOrdemServicocliente.AsInteger := qryConsultaClientescodigo.AsInteger;
    ctosFILIAISOS    : qryOrdemServicofilialvenda.AsInteger := qryConsultaFiliaiscodigo.AsInteger;
    ctosEQPTOSOS     : qryOrdemServicoequipamento.AsInteger := qryConsultaEquipamentosOScodigo.AsInteger;
  end;
end;
*}

function Tdtmordemservico.GetSituacao: String;
begin
  Result:= qryOrdemServicosituacao.AsString;
end;

function Tdtmordemservico.GetPodeAlterarCampos: Boolean;
begin
  if ((Situacao='F') OR (Situacao='N') OR (Situacao='P')) THEN
    Result:=false
  else
    Result:=true;
end;

function Tdtmordemservico.GetProdutoEmPromocao: Boolean;
begin
  Result:= qryProcuraProdutopromocao.AsBoolean
end;

function Tdtmordemservico.GetEditandoProdutosOrdemServico: Boolean;
begin
  Result:= (qryProdutosOrdemServico.State = dsEdit);
end;


function Tdtmordemservico.GetTabelaProdutosOrdemServico: TtecQuery;
begin
  Result:= qryProdutosOrdemServico;
end;

function Tdtmordemservico.GetTabelaServicosOrdemServico: TtecQuery;
begin
  Result:= qryServicosOrdemServico;
end;

function Tdtmordemservico.ExisteProduto(NomeCampo: String; Value: Variant): Boolean;
var
 SQL,SQL2 : String;

begin
(*
  if ParSistema.UsarConsultaInterativa then
    Result := ExisteCodigo(qryConsultaProdutos, NomeCampo, Value)
  else begin
    qryConsultaProdutos.macrobyname('SQL').asstring := ' and (Maiusculo(' + NomeCampo + ') ilike Maiusculo(''' + Value + '%''))';
    qryConsultaProdutos.Close;
    qryConsultaProdutos.Open;
    Result := qryConsultaProdutos.RecordCount > 0;
  end;
*)


  if ParSistema.UsarConsultaInterativa then
    Result := ExisteCodigo(qryConsultaProdutos, NomeCampo, Value)
  else
  begin
    SQL := '';
    SQL2 := '';

    if Value = '' then
      qryConsultaProdutos.MacroByName('Produto').ASString:= ''
    else
    begin
      if (NomeCampo = 'caracteristica') then
      begin
        SQL := ' and upper(to_ascii(p.' + NomeCampo + ',''LATIN1'')) ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1'')) ';
        if ParSistema.PesquisarProdutonoCliente then
        begin
          if qryOrdemServicocliente.IsNull then
            SQL := SQL +
                 ' or (e.produto in (select cp.produto '+
                         'from clientesprodutos cp '+
                         'where (upper(to_ascii(cp.produto_cliente,''latin1'')) '+
                         'ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1''))) ) )'
          else
            SQL := SQL +
                 ' or (e.produto in (select cp.produto '+
                         'from clientesprodutos cp '+
                         'where cp.cliente = ' + qryOrdemServicocliente.AsString + ' and cp.tipocliente = ' + quotedstr(qryOrdemServicotipocliente.AsString) +
                         ' and (upper(to_ascii(cp.produto_cliente,''latin1'')) '+
                         'ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1''))) ) )';
        end
      end
      else
      if (NomeCampo = 'produto') then
      begin
        SQL := ' and upper(to_ascii(e.' + NomeCampo + ',''LATIN1'')) ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1'')) ';
        if ParSistema.PesquisarProdutonoCliente then
        begin
          if qryOrdemServicocliente.IsNull then
            SQL := SQL +
                 ' or (e.produto in (select cp.produto '+
                         'from clientesprodutos cp '+
                         'where (upper(to_ascii(cp.produto_cliente,''latin1'')) '+
                         'ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1''))) ) )'
          else
            SQL := SQL +
                 ' or (e.produto in (select cp.produto '+
                         'from clientesprodutos cp '+
                         'where cp.cliente = ' + qryOrdemServicocliente.AsString + ' and cp.tipocliente = ' + quotedstr(qryOrdemServicotipocliente.AsString) +
                         ' and (upper(to_ascii(cp.produto_cliente,''latin1'')) '+
                         'ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1''))) ) )';
        end;
      end
      else
      if (NomeCampo = 'produtovisual') then
      begin

        SQL := ' and  (upper(to_ascii(p.codigovisual,''LATIN1'')) ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1'')) '+
               '  or to_ascii(cast(p.codigo as varchar),''latin1'') ilike to_ascii(''' + Value +'%'',''LATIN1'') '+
               '  or p.codigo in (select pcb.produto from produtoscodigobarras pcb where to_ascii(pcb.codigobarras,''latin1'') ilike to_ascii(''' + Value + '%'',''latin1'')))';

        if ParSistema.PesquisarProdutonoCliente then
        begin
          if qryOrdemServicocliente.IsNull then
            SQL := SQL +
                 ' or (e.produto in (select cp.produto '+
                         'from clientesprodutos cp '+
                         'where (upper(to_ascii(cp.produto_cliente,''latin1'')) '+
                         'ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1''))) ) )'
          else
            SQL := SQL +
                 ' or (e.produto in (select cp.produto '+
                         'from clientesprodutos cp '+
                         'where cp.cliente = ' + qryOrdemServicocliente.AsString + ' and cp.tipocliente = ' + quotedstr(qryOrdemServicotipocliente.AsString) +
                         ' and (upper(to_ascii(cp.produto_cliente,''latin1'')) '+
                         'ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1''))) ) )';
        end;
      end
      else
      if (NomeCampo = 'descricao') then
         SQL := ' and upper(to_ascii(p.' + NomeCampo + ',''LATIN1'')) ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1''))'
      else
      if (NomeCampo = 'filial') then
         SQL := ' and upper(to_ascii(e.' + NomeCampo + ',''LATIN1'')) ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1''))'
      else
      if (NomeCampo = 'emestoque') or
         (NomeCampo = 'reservado') or
         (NomeCampo = 'similares') or
         (NomeCampo = 'codigobarras') then
        SQL2 := ' and upper(to_ascii(' + NomeCampo + ',''LATIN1'')) ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1''))'
      else
      if (NomeCampo = 'valorproduto') then
        SQL2 := ' and ' + NomeCampo + ' = ' + trocar(trocar(Value,'.',''),',','.')
      else
      if (NomeCampo = 'peso') then
        SQL := ' and ' + NomeCampo + ' = ' +Value
      else
      if (NomeCampo = 'modelos_agg') then
        SQL := ' and c.codigo in (select mc.caracteristica      ' +
               '                  from modeloscaracteristicas mc  ' +
               '                       join modelos mo          ' +
               '                       on mc.modelo = mo.codigo ' +
               ' where upper(pg_catalog.to_ascii(cast(mo.descricao as varchar),''LATIN1'')) ilike upper(pg_catalog.to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1'')))'
      else
      if (NomeCampo = 'especificacoes_agg') then
        SQL := ' and c.codigo in (select mc.caracteristica      ' +
               '                  from modeloscaracteristicas mc  ' +
               '                       join modelos mo          ' +
               '                       on mc.modelo = mo.codigo ' +
               ' where upper(pg_catalog.to_ascii(cast(mo.especificacao as varchar),''LATIN1'')) ilike upper(pg_catalog.to_ascii(''' + ansiuppercase(Value) + '%'',''LATIN1'')))';


    end;

    if SQL<>'' then
      if SQL<>qryConsultaProdutos.MacroByName('produto').AsString then
      begin
        qryConsultaProdutos.MacroByName('produto').AsString := SQL;
        qryConsultaProdutos.MacroByName('produto2').AsString := '';
        qryConsultaProdutos.Close;
        qryConsultaProdutos.Open;
      end;

    if SQL2<>'' then
      if SQL2<>qryConsultaProdutos.MacroByName('produto2').AsString then
      begin
        qryConsultaProdutos.MacroByName('produto').AsString := '';
        qryConsultaProdutos.MacroByName('produto2').AsString := SQL2;
        qryConsultaProdutos.Close;
        qryConsultaProdutos.Open;
      end;

    Result := qryConsultaProdutos.RecordCount > 0;
  end;

end;

function Tdtmordemservico.ExisteProdutoOS(NomeCampo: String; Value: Variant): Boolean;
begin
  if ParSistema.UsarConsultaInterativa then
    Result := ExisteCodigo(qryConsultaProdutosOS, NomeCampo, Value)
  else
  begin
    qryConsultaProdutosOS.macrobyname('SQL').AsString := ' and (Maiusculo(' + NomeCampo + ') ilike Maiusculo(''' + Value + '%''))';
    qryConsultaProdutosOS.Close;
    qryConsultaProdutosOS.Open;
    Result := qryConsultaProdutosOS.RecordCount > 0;
  end;
end;

function Tdtmordemservico.ExisteServico(NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaServicos, NomeCampo, Value);
end;


function Tdtmordemservico.ExisteFilialProduto(NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, NomeCampo, Value)
end;

function Tdtmordemservico.ExisteVendedor(NomeCampo: String; inf: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaVendedores, NomeCampo, Inf);
end;

function Tdtmordemservico.ExcluirProdutoOrdemServico: Boolean;
begin
  Result := True;
  if qryProdutosOrdemServico.RecordCount > 0 then begin
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o PRODUTO DA OS'])) = smbOk then begin
      if qryProdutosOrdemServico.State = dsInsert then
           qryProdutosOrdemServico.Cancel
      else begin
        qryProdutosOrdemServico.Delete;
        RefazConsulta(qryEstoque,[0],[IntToStr(qryProdutosOrdemServicoproduto.AsLargeInt)]);
        LerProdutosFiliaisIncluidos(False);
        qryProdutosOrdemServico.Edit;
        qryProdutosOrdemServico.Cancel;
      end;
      qryOrdemServico.Edit;
    end;
  end;
end;

function Tdtmordemservico.ExcluirServicoOrdemServico: Boolean;
begin
  if qryServicosOrdemServico.RecordCount > 0 then begin
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o SERVIÇO'])) = smbOk then begin
      if qryServicosOrdemServico.State = dsInsert then
           qryServicosOrdemServico.Cancel
      else qryServicosOrdemServico.Delete;
      qryOrdemServico.Edit;
    end;
  end;
  Result:= True;
end;

procedure Tdtmordemservico.LerProdutosFiliaisIncluidos(Incluindo: Boolean);
var
  Pos: TBookmark;
  a, Filial: Integer;
  Prod: Int64;
begin
  inherited;
  if Incluindo then begin
    qryConsultaFilialProduto.Params[0].AsInteger := 0;
    qryProcuraFilialProduto.Params[1].AsInteger  := 0;
  end else begin
    qryConsultaFilialProduto.Params[0].AsString := IntToStr(qryProdutosOrdemServicoproduto.AsLargeInt);
    qryProcuraFilialProduto.Params[1].AsString  := IntToStr(qryProdutosOrdemServicoproduto.AsLargeInt);
  end;
  Pos := qryProdutosOrdemServico.GetBookmark;


  qryProdutosOrdemServico.DisableControls;
  try
    a := 0;
    aProdFilial := nil;
    Prod   := qryProdutosOrdemServicoproduto.AsLargeInt;
    Filial := qryProdutosOrdemServicofilial.AsInteger;
    qryProdutosOrdemServico.First;
    while Not qryProdutosOrdemServico.Eof do begin
      if Incluindo or ((Prod <> qryProdutosOrdemServicoproduto.AsLargeInt) or
                       (Filial <> qryProdutosOrdemServicofilial.AsInteger))
      then begin
        SetLength(aProdFilial, a + 1);
        aProdFilial[a].Prod   := qryProdutosOrdemServicoproduto.AsString;
        aProdFilial[a].Filial := qryProdutosOrdemServicofilial.AsString;
        Inc(a);
      end;
      qryProdutosOrdemServico.Next;
    end;
  finally
    qryProdutosOrdemServico.GotoBookmark(Pos);
    qryProdutosOrdemServico.FreeBookmark(Pos);
    qryProdutosOrdemServico.EnableControls;
  end;
  FiltrarProdutosEFiliaisOrdemServico;

end;

procedure Tdtmordemservico.FiltrarProdutosEFiliaisOrdemServico;
const
  SQLStr = ' and (%s)';
var
  SQLP, SQLF: String;
  a: Integer;
begin
  inherited;
  for a := 0 to High(aProdFilial) do begin
    SQLP := SQLP +
    '((p.codigo <> ' + aProdFilial[a].Prod +') or ' +
    '(e.filial <> ' + aProdFilial[a].Filial + ')) and ';
    SQLF := SQLF +
    '((e.produto <> ' + aProdFilial[a].Prod +') or ' +
    '(e.filial <> ' + aProdFilial[a].Filial + ')) and ';
  end;

  if SQLP = '' then begin
    qryProcuraProduto.MacroByName('FiltrarProdutosEFiliaisContratos').AsString := '';
    qryConsultaProdutos.MacroByName('ProdutosFiliaisContratos').AsString:= '';
  end else
  begin
    if not ParSistema.GravarProdutoContratoAutomaticamente then
    begin
      Delete(SQLP, Length(SQLP)-4, 5);
      qryProcuraProduto.MacroByName('FiltrarProdutosEFiliaisContratos').AsString := Format(SQLStr, [SQLP]);
      qryConsultaProdutos.MacroByName('ProdutosFiliaisContratos').AsString := Format(SQLStr, [SQLP]);
    end;
  end;

  if SQLF = '' then begin
    qryConsultaFilialProduto.macrobyname('ListaProdutosJaCadastrados').asstring := '';
    qryProcuraFilialProduto.macrobyname('ListaProdutosJaCadastrados').asstring  := '';
  end else begin
    if not ParSistema.GravarProdutoContratoAutomaticamente then
    begin
      Delete(SQLF, Length(SQLF)-4, 5);
      qryConsultaFilialProduto.macrobyname('ListaProdutosJaCadastrados').asstring := Format(SQLStr, [SQLF]);;
      qryProcuraFilialProduto.macrobyname('ListaProdutosJaCadastrados').asstring  := Format(SQLStr, [SQLF]);
    end;
  end;
end;

function Tdtmordemservico.GravarProdutoOrdemServico: Boolean;
begin
  if qryProdutosOrdemServico.CheckRequiredFields then begin
    if (qryProdutosOrdemServicoprecovenda.AsCurrency <= 0) then begin
      MensagemAviso(ctPRECOZERO);
      Result := False
    end else
    begin
      qryOrdemServico.Edit;
      if (qryProdutosOrdemServico.state in [dsinsert, dsedit]) then
        qryProdutosOrdemServico.Post;
        
      Result := True;
    end
  end
  else Result:= False;
end;

function Tdtmordemservico.GravarServicoOrdemServico: Boolean;
begin
  Result:= False;
  if qryServicosOrdemServico.CheckRequiredFields then begin
    qryOrdemServico.Edit;
    qryServicosOrdemServico.Post;
    Result := True
  end
end;

function Tdtmordemservico.IncluirProdutosOrdemServico: Boolean;
begin
  LerProdutosFiliaisIncluidos(True);
  qryProdutoEstoque.Close;
  qryClientesProdutos.Close;
  qryProdutosSimilares.Close;
  qryModelosCaracteristicas.Close;
  qryProdutosOrdemServico.Append;
  FInseriuProduto   := True;
  FRegistrosMarcados:= 0;
  Result := True

end;

function Tdtmordemservico.IncluirServicosOrdemServico(Editar:Boolean): Boolean;
begin
  VerificarServicos(Editar);
  if (not Editar or qryServicosOrdemServico.IsEmpty) then begin
    qryServicosOrdemServico.Append;
    qryServicosOrdemServicoquantidade.AsInteger:= 1;
  end;
  Result:= True;
end;


function Tdtmordemservico.GetTabelaConsultaVendedores: TZDataset;
begin
  Result := qryConsultaVendedores
end;

function Tdtmordemservico.GetTabelaConsultaProdutos: TZDataset;
begin
  Result := qryConsultaProdutos
end;

{function TdtmOrdemServico.GetTabelaConsultaProdutosOS: TZDataset;
begin
  Result := qryConsultaProdutosOS
end;}

function Tdtmordemservico.GetTabelaConsultaServicos: TZDataset;
begin
  Result := qryConsultaServicos
end;

function Tdtmordemservico.GetTabelaConsultaFilialProduto: TZDataset;
begin
  Result := qryConsultaFilialProduto
end;

function Tdtmordemservico.GetColunadaGradeSimilares: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosSimilarescoluna.AsString)
end;

function Tdtmordemservico.GetLinhadaGradeSimilares: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosSimilareslinha.AsString)
end;

procedure Tdtmordemservico.qryProdutosSimilaresAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(OnScrollLinhaColunaGradeSimilares) then
    OnScrollLinhaColunaGradeSimilares(qryProdutosSimilares);
end;

procedure Tdtmordemservico.TrocaProdutoOrdemServicoporSimilar;
var
a: integer;
produto, filial : String;
begin
  produto := '';
  filial := '';
  for a := 0 to High(aProdFilial) do
   if (aProdFilial[a].Prod = qryProdutosSimilarescodigo.AsString) and
      (aProdFilial[a].Filial = qryProdutosSimilaresfilial.AsString) then
   begin
    produto := aProdFilial[a].Prod;
    filial := aProdFilial[a].Filial;
    break;
   end;

  if (Produto = qryProdutosSimilarescodigo.AsString) and
     (Filial = qryProdutosSimilaresfilial.AsString) then
  begin
    if (MensagemConfirmacao(format(ctPRODUTOJACADASTRADOEDITAR,[produto,filial, ctORDEMSERVICO]))=smbOK) then
    begin
      if (qryProdutosOrdemServico.State in [dsinsert, dsedit]) then
         qryProdutosOrdemServico.Cancel;
      if qryProdutosOrdemServico.Locate('produto;filial',
                                    VarArrayOf([Produto,
                                                Filial]),[]) then
        ReFazConsulta(qryProdutosSimilares,[0,1],[qryProdutosOrdemServicoproduto.AsVariant, ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)]);
    end;
  end
  else
  begin
    if not (qryProdutosOrdemServico.State in [dsinsert, dsedit]) then
      qryProdutosOrdemServico.Edit;
    qryProdutosOrdemServicofilial.AsString := qryProdutosSimilaresfilial.AsString;

    qryProdutosOrdemServicoprodutovisual.AsString := qryProdutosSimilarescodigovisual.AsString;
    qryProdutosOrdemServicoproduto.AsString := qryProdutosSimilarescodigo.AsString;
    qryProdutosOrdemServicoprodutodigitado.AsString := qryProdutosSimilarescodigovisual.AsString;

  end;
end;

function Tdtmordemservico.getIncluindoProdutosOrdemServico: Boolean;
begin
   Result:= (qryProdutosOrdemServico.State = dsInsert);
end;

function Tdtmordemservico.EditarProdutosOrdemServico: Boolean;
begin
  if qryProdutosOrdemServico.IsEmpty then begin
    IncluirProdutosOrdemServico;
    Result:= True;
  end else begin
    RefazConsulta(qryEstoque,[0],[IntToStr(qryProdutosOrdemServicoproduto.AsLargeInt)]);

    if Parsistema.MostrarSimilaresContrato then
      ReFazConsulta(qryProdutosSimilares,[0,1],[qryProdutosOrdemServicoproduto.AsVariant, ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)]);

    if parsistema.LiberarVisualizacaodeModelosProdutos then
      ReFazConsulta(qryModelosCaracteristicas,[0],[qryProdutosOrdemServicoproduto.AsVariant]);

    if ParSistema.FiliaisIndependentes then
    begin
      qryProcuraProduto.ParamByName('FilialSaida').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
      qryProcuraProduto.ParamByName('FilialPreco').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
    end
    else
    begin
      qryProcuraProduto.ParamByName('FilialSaida').AsInteger := qryProdutosOrdemServicofilial.AsInteger;
      if ParSistema.UtilizarPrecoFilialBase then
        qryProcuraProduto.ParamByName('FilialPreco').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)
      else
        qryProcuraProduto.ParamByName('FilialPreco').AsInteger := qryProdutosOrdemServicofilial.AsInteger;
    end;

    if qryProdutosOrdemServico.RecordCount = 0 then begin
      LerProdutosFiliaisIncluidos(True);
      qryProdutosOrdemServico.Append;
    end else begin
      LerProdutosFiliaisIncluidos(False);
      qryProdutosOrdemServico.Edit;
      qryProdutosOrdemServico.Cancel;
    end;

    RefazConsultaProdutoEstoque(IntToStr(qryProdutosOrdemServicoproduto.AsLargeInt), qryProdutosOrdemServicofilial.AsInteger);
    RefazConsultaPrecoParaCliente;
    Result := True
  end;
end;

function Tdtmordemservico.EditarServicosOrdemServico: Boolean;
begin
  VerificarServicos(true);
  if qryServicosOrdemServico.IsEmpty then
  begin
    IncluirServicosOrdemServico(False);
    Result:= True;
  end
  else
  begin
    if qryServicosOrdemServico.RecordCount = 0 then
    begin
      //LerProdutosFiliaisIncluidos(True);
      qryServicosOrdemServico.Append;
    end else
    begin
      //LerProdutosFiliaisIncluidos(False);
      qryServicosOrdemServico.Edit;
      qryServicosOrdemServico.Cancel;
    end;
    Result := True
  end;
end;





procedure Tdtmordemservico.qryConsultaProdutosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryConsultaProdutosvalorgrade1.Visible := ParSistema.UsarGradesProdutos;
  qryConsultaProdutosvalorgrade2.Visible := ParSistema.UsarGradesProdutos;
end;

procedure Tdtmordemservico.qryProcuraProdutoAfterOpen(DataSet: TDataSet);
begin
  inherited;
;
end;

procedure Tdtmordemservico.SelecionaTabelasConsulta(TipoConsulta: TtecOrdemServicoTipoConsulta);
begin
  case TipoConsulta of
       ctosORDEMSERVICO    : begin
                               ReFazConsulta(qryOrdemServico,[0],[qryConsultaOrdemServiconumero.AsString]);
                               qryProcuraCliente.Params[1].AsString := qryOrdemServicotipocliente.AsString;
                               qryProcuraProdutoOS.Parambyname('inserindo').AsBoolean   := qryOrdemServico.State = dsInsert;
                             end;
        ctosCLIENTES       : begin
                              //qryProcuraCliente.Params[1].AsString:= qryConsultaClientestipo.AsString;
                              if qryOrdemServico.State = dsBrowse then
                                qryOrdemServico.Edit;

                              qryOrdemServicotipocliente.asstring := qryConsultaClientestipoorig.AsString;
                              RefazConsultaPorNome(qryProcuraCliente, ['codigo','tipocliente'], [qryConsultaClientescodigo.AsInteger, qryConsultaClientestipoorig.AsString]);
                              qryOrdemServicocliente.AsInteger := qryConsultaClientescodigo.AsInteger;

                              {
                              if qryConsultaClientes.RecordCount > 0 then
                              begin
                                qryOrdemServicotipocliente.AsString := qryConsultaClientestipoorig.AsString;
                                if qryConsultaClientestipoorig.AsString = 'C' then
                                  RefazConsulta(qryClientes, [0], [qryConsultaClientescodigo.AsInteger])
                                else
                                if qryConsultaClientestipoorig.AsString = 'F' then
                                  ReFazConsulta(qryFornecedores, [0], [qryConsultaClientescodigo.AsInteger])
                                else
                                if qryConsultaClientestipoorig.AsString = 'L' then
                                  ReFazConsulta(qryFiliais, [0], [qryConsultaClientescodigo.AsInteger]);

                                AtribuirClienteNoContrato;
                              end;
                              }
                             end;
        ctosVENDEDOR       : begin
                              if qryOrdemServico.State = dsBrowse then
                               qryOrdemServico.Edit;
                              qryOrdemServicovendedor.AsInteger := qryConsultaVendedorescodigo.AsInteger
                             end;
        ctosVENDEDORPRODUTO: begin
                              if qryProdutosOrdemServico.State = dsBrowse then
                                qryProdutosOrdemServico.Edit;
                              qryProdutosOrdemServicovendedor.AsInteger:= qryConsultaVendedorescodigo.AsInteger;
                             end;
         ctosPRODUTOS      : begin
//                             if qryProdutosOrcamentos.State = dsBrowse then
                               if ParSistema.FiliaisIndependentes then
                               begin
                                 qryProcuraProduto.ParamByName('FilialSaida').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
                                 qryProcuraProduto.ParamByName('FilialPreco').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
                               end
                               else
                               begin
                                 qryProcuraProduto.ParamByName('FilialSaida').AsInteger := qryConsultaProdutosfilial.AsInteger;
                                 if ParSistema.UtilizarPrecoFilialBase then
                                   qryProcuraProduto.ParamByName('FilialPreco').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)
                                 else
                                   qryProcuraProduto.ParamByName('FilialPreco').AsInteger := qryConsultaProdutosfilial.AsInteger;
                               end;

                               if qryProdutosOrdemServico.State = dsBrowse then
                                 qryProdutosOrdemServico.Edit;
                               qryProdutosOrdemServicoproduto.AsLargeInt := qryConsultaProdutosproduto.AsLargeInt;
                               qryProdutosOrdemServicofilial.AsInteger   := qryConsultaProdutosfilial.AsInteger;
                               qryProdutosOrdemServicoprodutovisual.AsString := qryConsultaProdutosprodutovisual.AsString;

                               RefazConsulta(qryEstoque,[0],[IntToStr(qryConsultaProdutosproduto.AsLargeInt)]);
                             end;
              ctosFILIAISOS : qryOrdemServicofilialvenda.AsInteger := qryConsultaFiliaiscodigo.AsInteger;
          ctosFILIALPRODUTO : begin
                                if qryProdutosOrdemServico.State = dsBrowse then
                                  qryProdutosOrdemServico.Edit;
                                qryProdutosOrdemServicofilial.AsInteger:= qryConsultaFilialProdutocodigo.AsInteger;
                              end;
          ctosEQPTOSOS      : begin
                                qryOrdemServico.edit;
                                qryOrdemServicoequipamento.AsString := qryConsultaEquipamentosOScodigo.AsString;
                              end;

          ctosPRODUTOSOS    : begin
                               qryProcuraProdutoOS.Parambyname('filialsaida').AsInteger   := FilialBase;
                               qryProcuraProdutoOS.Parambyname('filialpreco').AsInteger   := FilialBase;
                               qryProcuraProdutoOS.Parambyname('inserindo').AsBoolean   := qryOrdemServico.State = dsInsert;

                               if qryOrdemServico.State = dsBrowse then
                                 qryOrdemServico.Edit;
                               qryOrdemServicoproduto.AsLargeInt := qryConsultaProdutosOSproduto.AsLargeInt;
                               qryOrdemServicoprodutovisual.AsString := qryConsultaProdutosOSprodutovisual.AsString;
                               qryOrdemServicoprodutodigitado.AsString := qryConsultaProdutosOSprodutovisual.AsString;


                               qryOrdemServicofilialproduto.AsInteger   := FilialBase;
                               RefazConsulta(qryEstoque,[0],[IntToStr(qryConsultaProdutosOSproduto.AsLargeInt)]);
                             end;

          ctosSERVICOSOS    : begin
                                qryServicosOrdemServico.Edit;
                                qryServicosOrdemServicoservico.AsInteger:= qryConsultaServicoscodigo.AsInteger;
                              end;
          ctosCFPS          : begin
                                 qryOrdemServico.Edit;
                                 qryOrdemServicocfps.AsInteger := qryConsultaCFPScodigo.AsInteger;
                              end;
  end;
end;

procedure Tdtmordemservico.FechaTabelasConsulta(TipoConsulta: TtecOrdemServicoTipoConsulta);
begin
  case TipoConsulta of
       ctosORDEMSERVICO    : Fecha(ctVendaTabelaConsultaVendas);
       ctosCLIENTES        : qryConsultaClientes.close;
       ctosVENDEDOR,
       ctosVENDEDORPRODUTO : Fecha(ctVendaTabelaConsultaVendedores);
       ctosPRODUTOS        : Fecha(ctVendaTabelaConsultaProdutos);
       ctosPRODUTOSOS      : qryConsultaProdutosOS.close;
       ctosFILIAISOS       : Fecha(ctVendaTabelaConsultaFiliais);
       ctosFILIALPRODUTO   : Fecha(ctVendaTabelaConsultaFilialProduto);
       ctosEQPTOSOS        : Fecha(ctVendaTabelaConsultaEquipamentosOS);
       ctosSERVICOSOS      : Fecha(ctVendaTabelaConsultaServicos);
  end;
end;

procedure Tdtmordemservico.dsrProdutosOrdemServicoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryProdutosOrdemServicofilial then begin
    if (qryProdutosOrdemServicofilial.AsInteger = 0) or ParSistema.FiliaisIndependentes then
    begin
      qryProcuraProduto.ParamByName('FilialSaida').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
      qryProcuraProduto.ParamByName('FilialPreco').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
    end
    else
    begin
      qryProcuraProduto.ParamByName('FilialSaida').AsInteger := qryProcuraFilialProdutocodigo.AsInteger;
      if ParSistema.UtilizarPrecoFilialBase then
        qryProcuraProduto.ParamByName('FilialPreco').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)
      else
        qryProcuraProduto.ParamByName('FilialPreco').AsInteger := qryProcuraFilialProdutocodigo.AsInteger;
    end;

    RefazConsultaProdutoEstoque(IntToStr(qryProdutosOrdemServicoproduto.AsLargeInt), qryProdutosOrdemServicofilial.AsInteger);

    if (qryprodutosordemservico.state in [dsinsert, dsedit]) then
    begin
      qryProdutosOrdemServicoprecovenda.AsFloat  := PrecoVenda; //qryProdutoEstoquepreco.AsFloat;
      qryProdutosOrdemServicoprecocusto.AsFloat  := qryProdutoEstoqueprecocusto.AsFloat;
      qryProdutosOrdemServicoprecotabela.AsFloat := qryProdutoEstoquepreco.AsFloat;
    end;


  end
  else
  if (field = qryProdutosOrdemServicoprodutovisual) and
     (qryProcuraProdutoproduto.AsLargeInt<>0) and
     (qryProdutosOrdemServicoproduto.AsLargeInt  <> qryProcuraProdutoproduto.AsLargeInt) then
  begin
    if (qryprodutosordemservico.state in [dsinsert, dsedit]) then
    begin
      dsrProdutosOrdemServico.OnDataChange:= nil;
      qryProdutosOrdemServicoproduto.AsLargeInt   := qryProcuraProdutoproduto.AsLargeInt;
      dsrProdutosOrdemServico.OnDataChange:= dsrProdutosOrdemServicoDataChange;
    end;
  end
  else
  if (field = qryProdutosOrdemServicoproduto) and
     (qryProcuraProdutoProduto.AsLargeInt<>0) and
     (qryProdutosOrdemServicoprodutovisual.AsString <> qryProcuraProdutoProdutoVisual.AsString) then
  begin
    if (qryprodutosordemservico.state in [dsinsert, dsedit]) then
    begin
      dsrProdutosOrdemServico.OnDataChange:= nil;
      qryProdutosOrdemServicoprodutovisual.AsString  := qryProcuraProdutoProdutoVisual.AsString;
      dsrProdutosOrdemServico.OnDataChange:= dsrProdutosOrdemServicoDataChange;
    end;
  end
  else
  if Field = qryProdutosOrdemServicoquantidade then
  begin
    if (SituacaoOrdemServico = scORCADO) and MarcarProdutoCopiar then
    begin
      if qryProdutosOrdemServicoqtdecopiar.AsCurrency > qryProdutosOrdemServicoquantidade.AsCurrency then
         qryProdutosOrdemServicoqtdecopiar.AsCurrency:= qryProdutosOrdemServicoquantidade.AsCurrency;
    end;

    if (RegistrosMarcados > 0) and (SituacaoOrdemServico >= scRESERVADO) then
    begin
      MensagemAviso('Não é possível alterar a quantidade do produto' + #13#10 +
                  'durante a operação de Cópia do Contrato.');
      qryProdutosOrdemServico.Cancel;
    end;

  end
  else
  if (Field = qryProdutosOrdemServicoqtdecopiar) and (Not qryProdutosOrdemServicoreserva.IsNull) then
  begin
    if qryProdutosOrdemServicoqtdecopiar.AsCurrency > (qryProdutosOrdemServicoquantidade.AsCurrency
                                                 - qryProdutosOrdemServicoqtdereservaprevia.AsCurrency) then
    begin
      MensagemAviso('A Quantidade a ser copiada não pode ser maior que a ''RESERVA PREVIA'' feita anteriormente.');
      qryProdutosOrdemServico.Cancel;
    end;
  end
  else
  if (field = qryProdutosOrdemServicovalordescontoitem) then
  begin
    if truncar(field.asCurrency, 2) >
       truncar((qryProdutosOrdemServicoquantidade.AsCurrency *
                qryProdutosOrdemServicoprecovenda.AsCurrency),2) then
    begin
      MensagemErro('O valor do desconto do item está superior ao valor total do produdto!');
      field.asCurrency := 0;
    end;
  end;



  (*
  if (Field = qryProdutosOrdemServicoproduto) or
     (Field = qryProdutosOrdemServicoprodutovisual) or
     (Field = qryProdutosOrdemServicocodigobarras) then
  begin
    dsrProdutosOrdemServico.OnDataChange:= nil;
    //ATUALIZACAO PELO CODIGO DA FILIAL DO PRODUTO
    if (ParSistema.FiliaisIndependentes) then
    begin
      qryProcuraProduto.ParamByname('FilialSaida').AsInteger     := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
      qryProcuraProduto.ParamByname('FilialPreco').AsInteger     := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
    end
    else
    begin
      qryProcuraProduto.ParamByname('FilialSaida').AsInteger      := qryProcuraProdutofilial.Asinteger;
      if ParSistema.UtilizarPrecoFilialBase then
        qryProcuraProduto.ParamByname('FilialPreco').AsInteger    := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)
      else
        qryProcuraProduto.ParamByname('FilialPreco').AsInteger := qryProcuraProdutofilial.AsInteger;
    end;

    RefazConsulta(qryEstoque,[0],[IntToStr(qryProcuraProdutoproduto.AsLargeInt)]);

    qryConsultaFilialProduto.Params[0].AsString := IntToStr(qryProcuraProdutoproduto.AsLargeInt);
    qryProcuraFilialProduto.Params[1].AsString  := IntToStr(qryProcuraProdutoproduto.AsLargeInt);


    if (field = qryProdutosOrdemServicoprodutovisual) and
       (qryProcuraProdutoproduto.AsLargeInt<>0) and
       (qryProdutosOrdemServicoproduto.AsLargeInt  <> qryProcuraProdutoproduto.AsLargeInt) then
      qryProdutosOrdemServicoproduto.AsLargeInt   := qryProcuraProdutoproduto.AsLargeInt
    else
    if (field = qryProdutosOrdemServicoproduto) and
       (qryProcuraProdutoProduto.AsLargeInt<>0) and
       (qryProdutosOrdemServicoprodutovisual.AsString <> qryProcuraProdutoProdutoVisual.AsString) then
      qryProdutosOrdemServicoprodutovisual.AsString  := qryProcuraProdutoProdutoVisual.AsString;

    qryProdutosOrdemServicocodigobarras.AsString   := qryProcuraProdutocodigobarras.AsString;
    qryProdutosOrdemServicodescricao.AsString       := qryProcuraProdutodescricao.AsString;
    if qryProcuraProdutofilial.AsInteger <> 0 then
      qryProdutosOrdemServicofilial.AsInteger         := qryProcuraProdutofilial.AsInteger;
    qryProdutosOrdemServicovalorgrade1.AsString     := qryProcuraProdutovalorgrade1.AsString;
    qryProdutosOrdemServicovalorgrade2.AsString     := qryProcuraProdutovalorgrade2.AsString;
    qryProdutosOrdemServicolinha.AsString           := qryProcuraProdutolinha.AsString;
    qryProdutosOrdemServicocoluna.AsString          := qryProcuraProdutocoluna.AsString;
    qryProdutosOrdemServicounidade.AsString         := qryProcuraProdutounidade.AsString;
    qryProdutosOrdemServicobrinde.AsBoolean         := qryProcuraProdutobrinde.AsBoolean;

    if qryProcuraProdutomontagem.AsBoolean then
       qryProdutosOrdemServicomontagem.AsString := 'S'
    else
       qryProdutosOrdemServicomontagem.AsString := 'N';

    qryProdutosOrdemServicofilial.AsInteger         := qryProcuraProdutofilial.AsInteger;
    qryProdutosOrdemServicovendasemestoque.AsString := qryProcuraProdutovendasemestoque.AsString;
    qryProdutosOrdemServicocomposto.AsBoolean       := qryprocuraprodutocomposto.AsBoolean;

    if contribipi then
      qryProdutosOrdemServicoaliquotaipi.AsCurrency := qryProcuraProdutoaliquotaipi.AsCurrency;

    RefazConsultaProdutoEstoque(IntToStr(qryProcuraProdutoproduto.AsLargeInt), qryProdutosOrdemServicofilial.AsInteger);

    qryProdutosOrdemServicoprecovenda.AsFloat  := PrecoVenda;//qryProdutoEstoquepreco.AsFloat;
    qryProdutosOrdemServicoprecocusto.AsFloat  := qryProdutoEstoqueprecocusto.AsFloat;
    qryProdutosOrdemServicoprecotabela.AsFloat := qryProdutoEstoquepreco.AsFloat;
    qryProdutosOrdemServicoemestoque.AsCurrency := qryProdutoEstoqueemestoque.AsCurrency;
    qryProdutosOrdemServicoreservado.AsCurrency := qryProdutoEstoquereservado.AsCurrency;
    qryProdutosOrdemServicopromocao.AsBoolean  := qryProcuraProdutopromocao.AsBoolean;
    ReFazConsulta(qryProdutosSimilares,[0,1],[qryProdutosOrdemServicoproduto.AsVariant, FilialBase]);
    dsrProdutosOrdemServico.OnDataChange:= dsrProdutosOrdemServicoDataChange;

  end;
  *)
end;

procedure Tdtmordemservico.qryProcuraServicoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if qryServicosOrdemServico.State in [dsEdit, dsInsert] then
  begin;

    qryServicosOrdemServicoaliquotaissqn.AsFloat     := qryProcuraServicoaliquotaissqn.AsFloat;
    qryServicosOrdemServicovalorservico.AsFloat      := qryProcuraServicovalor.AsFloat;
    qryServicosOrdemServicodescricaoservico.AsString := qryProcuraServicodescricao.AsString;

    qryServicosOrdemServicocnae.Asinteger                     := qryProcuraServicocnae.AsInteger;
    qryServicosOrdemServicocodigoatividade.AsString           := qryProcuraServicocodigoatividade.AsString;
    qryServicosOrdemServicocodigoatividademunicipio.asinteger := qryProcuraServicocodigoatividademunicipio.asinteger;
    qryServicosOrdemServicopiscst.AsString                    := qryProcuraServicopiscst.AsString;
    qryServicosOrdemServicocstissqn.AsInteger                 := qryProcuraServicocstissqn.AsInteger;
    qryServicosOrdemServicopisaliquota.ascurrency             := qryProcuraServicopisaliquota.AsCurrency;
    qryServicosOrdemServicocofinscst.asString                 := qryProcuraServicocofinscst.AsString;
    qryServicosOrdemServicocofinsaliquota.ascurrency          := qryProcuraServicocofinsaliquota.AsCurrency;
    qryServicosOrdemServicocodigolcp116.AsString              := qryProcuraServicocodigolcp116.AsString;
    qryServicosOrdemServicocodigoatividade.AsString           := qryProcuraServicocodigoatividade.AsString;
  end;
end;

procedure Tdtmordemservico.qryProdutosOrdemServicoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosOrdemServicototalitem.AsCurrency := Truncar(qryProdutosOrdemServicoquantidade.asFloat*qryProdutosOrdemServicoprecovenda.AsCurrency,2);

  if not qryProdutosOrdemServicoproduto_cliente.IsNull then
    qryProdutosOrdemServicoprodutocliente.AsString := qryProdutosOrdemServicoproduto_cliente.AsString + '-' + qryProdutosOrdemServicoprodutovisual.AsString
  else
    qryProdutosOrdemServicoprodutocliente.AsString := qryProdutosOrdemServicoprodutovisual.AsString;


  qryProdutosOrdemServicodescricaoproduto.AsString := trim(IfThen(qryProdutosOrdemServicoproduto_cliente.AsString<>'',qryProdutosOrdemServicoproduto_cliente.AsString+' - ') +
                                                      qryProdutosOrdemServicodescricao.AsString + ' ' +
                                                      qryProdutosOrdemServicovalorgrade1.asString + ' '+
                                                      qryProdutosOrdemServicovalorgrade2.asString);



end;

procedure Tdtmordemservico.qryServicosOrdemServicoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryServicosOrdemServicototalservico.AsCurrency := Truncar(qryServicosOrdemServicoquantidade.asFloat*qryServicosOrdemServicovalorservico.AsCurrency,2);
  if qryServicosOrdemServicotipocomissaoservico.AsString = '%' then
    qryServicosOrdemServicoValorComissao.AsCurrency:=
                                        Truncar(qryServicosOrdemServicototalservico.AsCurrency*
                                        (qryServicosOrdemServicocomissaoservico.AsFloat/100),2)
  else
     qryServicosOrdemServicoValorComissao.asCurrency:= qryServicosOrdemServicocomissaoservico.AsFloat;
end;


procedure Tdtmordemservico.CalcularTotais;
var
  Pos: TBookmark;
  QtdadeTotal,
  Produto, servico, Desconto: Real;
begin
  Pos := qryProdutosOrdemServico.GetBookmark;
  qryProdutosOrdemServico.DisableControls;
  Produto         := 0;
  Servico         := 0;
  TotalDesconto   := 0;
  Desconto        := 0;
  QtdadeTotal     := 0;

  FPermiteDesconto:= True;
  try
    qryProdutosOrdemServico.First;
    while Not qryProdutosOrdemServico.Eof do
    begin
      if Not qryProdutosOrdemServicobrinde.AsBoolean then
      begin
        QtdadeTotal := QtdadeTotal + qryProdutosOrdemServicoquantidade.asFloat;
        Produto := Produto + Truncar(qryProdutosOrdemServicoquantidade.asFloat * qryProdutosOrdemServicoprecovenda.AsFloat,2);
        Desconto    := qryProdutosOrdemServicovalordescontoitem.AsCurrency;
        TotalDesconto := TotalDesconto + Desconto;
      end;


      if (qryProdutosOrdemServicopromocao.AsBoolean and not ParSistema.PermitirDescontoContratoPromocao) or
         qryProdutosOrdemServicodeny_discount.AsBoolean then
        FPermiteDesconto:= False;

      qryProdutosOrdemServico.Next
    end;
  finally
    qryOrdemServicosubtotalprodutos.AsFloat:= Produto;
    qryOrdemServicototalprodutos.AsFloat := Produto - TotalDesconto;
    qryOrdemServicototalqtdeprodutos.AsFloat := QtdadeTotal;
    qryOrdemServicodescontototal.AsFloat := TotalDesconto;

    qryProdutosOrdemServico.GotoBookmark(Pos);
    qryProdutosOrdemServico.FreeBookmark(Pos);
    qryProdutosOrdemServico.EnableControls;
  end;

  Pos := qryServicosOrdemServico.GetBookmark;
  qryServicosOrdemServico.DisableControls;
  Servico := 0;
  try
    qryServicosOrdemServico.First;
    while Not qryServicosOrdemServico.Eof do begin
      Servico := Servico + Truncar(qryServicosOrdemServicoquantidade.AsInteger * qryServicosOrdemServicovalorservico.AsFloat,2);
      qryServicosOrdemServico.Next
    end;
  finally
    qryOrdemServicototalservicos.AsFloat := Servico;
    qryServicosOrdemServico.GotoBookmark(Pos);
    qryServicosOrdemServico.FreeBookmark(Pos);
    qryServicosOrdemServico.EnableControls;
  end;

  qryOrdemServicovalorvista.AsCurrency:=produto+servico;


end;

procedure Tdtmordemservico.qryProdutosOrdemServicoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  CalcularTotais;
end;

procedure Tdtmordemservico.qryServicosOrdemServicoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  CalcularTotais;
end;

function Tdtmordemservico.GetSql:TStrings;
begin
  Result:=qryConsultaProdutosOS.Sql;
end;

procedure Tdtmordemservico.qryProcuraProdutoOSAfterOpen(DataSet: TDataSet);
begin
  inherited;
;
end;

procedure Tdtmordemservico.qryConsultaProdutosOSAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaProdutosOSvalorgrade1.Visible := ParSistema.UsarGradesProdutos;
  qryConsultaProdutosOSvalorgrade2.Visible := ParSistema.UsarGradesProdutos;
end;

function Tdtmordemservico.GetTotalOrdemServico: Currency;
begin
  Result:=qryOrdemServicovalorvista.AsCurrency;
end;

procedure Tdtmordemservico.EditarOrdemServico;
begin
  if qryOrdemServico.State = dsBrowse then
    qryOrdemServico.Edit;
end;

function Tdtmordemservico.GetPlanoUtilizado: Integer;
begin
  Result := qryOrdemServicoplano.AsInteger
end;

function Tdtmordemservico.getDataAbertura: String;
begin
  Result := qryOrdemServicodata.AsString
end;

procedure Tdtmordemservico.ResumoParcelas(var Parcelas: TResumosParcelas);
var
  Pos: TBookmark;
  a: Integer;
begin
  SetLength(Parcelas, qryParcelas.RecordCount);
  qryParcelas.DisableControls;
  Pos := qryParcelas.GetBookmark;
  try
    a := 0;
    qryParcelas.First;
    while Not qryParcelas.Eof do begin
      Parcelas[a].Parcelas   := 1; //qryParcelasparcelas.AsInteger;
      Parcelas[a].Vencimento := qryParcelasdatavencto.AsDateTime;
      Parcelas[a].Valor      := qryParcelasvalorvencto.AsCurrency;
      qryParcelas.Next;
      Inc(a)
    end
  finally
    qryParcelas.GotoBookmark(Pos);
    qryParcelas.FreeBookmark(Pos);
    qryParcelas.EnableControls;
  end
end;


(*

procedure Tdtmordemservico.DefinirParcelas(Parcelas: TResumosParcelas; var ValorPrazo,
  TaxaJuros, Desconto: Real; var Plano: Integer);
const
  Numero        = 1;
  Vencimento    = 2;
  Valor         = 3;
var
  Data  : TDateTime;
  A,B,NP, QTP: Integer;
  ParcelasAuxiliar: array [1..3] of TStringList;
  Vencto : String;

  function TotalParcelas: Currency;
  var
    Total: Currency;
  begin
    Total:= 0;
    qryParcelas.First;
    while not qryParcelas.Eof do begin
      Total:= Total + qryParcelasvalorvencto.AsCurrency;
      qryParcelas.Next;
    end;
    Result:= Total;
  end;

  procedure ValidarValoresContratos;
  var
    aVista,
    aPrazo,
    Produtos,
    Servicos: Currency;

  begin
    //Produtos:= qryContratostotalprodutos.AsCurrency;
    //Servicos:= qryContratostotalservicos.AsCurrency;
    {aVista:= ((qryOrdemServicovalorvista.AsCurrency) - qryOrdemServicodesconto.AsCurrency);
    aPrazo:= TotalParcelas;
    if aVista > aPrazo then begin
      qryOrdemServicodesconto.AsCurrency   := (qryOrdemServicodesconto.AsCurrency + (aVista - aPrazo));
      qryOrdemServicovalorvista.AsCurrency := aPrazo;
    end
    else
      qryOrdemServicovalorvista.AsCurrency := aVista;}
    Produtos:= qryOrdemServicototalprodutos.AsCurrency;
    Servicos:= qryOrdemServicototalservicos.AsCurrency;
//    ipi := qryordemservicotContratostotalipi.AsCurrency;
    aVista:= ((Produtos {+ ipi + qryordemservicovaloricmssubstituicao.AsCurrency }+ Servicos + qryOrdemServicofrete.AsCurrency + qryOrdemServicoseguro.AsCurrency) - qryOrdemServicodesconto.AsCurrency) ;
    aPrazo:= TotalParcelas;
    if aVista > aPrazo then
    begin
      qryOrdemServicodesconto.AsCurrency   := qryOrdemServicodesconto.AsCurrency + (aVista - aPrazo);
      qryOrdemServicovalorvista.AsCurrency := aPrazo;
    end
    else
      qryOrdemServicovalorvista.AsCurrency := aVista;
  end;

begin
  if qryOrdemServico.State = dsBrowse then
    qryOrdemServico.Edit;
  if Plano > 0 then begin
    qryOrdemServicovalorprazo.AsCurrency := ValorPrazo;
    qryOrdemServicodesconto.AsFloat      := Desconto;
    qryOrdemServicotaxajuros.AsFloat     := TaxaJuros;
    qryOrdemServicoplano.AsInteger       := Plano;

    qryParcelas.DisableControls;
    try
      if (qryParcelas.RecordCount > 0) then begin
        qryParcelas.First;
        while Not qryParcelas.Eof do
          qryParcelas.Delete;
      end;

      ParcelasAuxiliar[Numero] := TStringList.Create;
      ParcelasAuxiliar[Vencimento] := TStringList.Create;
      ParcelasAuxiliar[Valor] := TStringList.Create;

      NP:= 1;
      for A := 0 to Length(Parcelas) - 1 do begin
        B := 0;
        Data := Parcelas[A].Vencimento;
        while B < Parcelas[A].Parcelas do begin
          ParcelasAuxiliar[Numero].Append(inttostr(NP));
          ParcelasAuxiliar[Vencimento].Append(datetimetostr(Data));
          ParcelasAuxiliar[Valor].Append(floattostr(Parcelas[A].Valor));
          if qryPlanoPagamentomestrintadias.AsBoolean then
               Data:= SomarDia(Data,qryPlanoPagamentointervaloparcelas.AsInteger,'S')
          else Data:= SomarDia(Data,qryPlanoPagamentointervaloparcelas.AsInteger,'N');
          Inc(B);
          Inc(NP);
        end;
      end;

      for A := 1 to ParcelasAuxiliar[Vencimento].Count - 1 do begin
        B := A;
        While strtodatetime(ParcelasAuxiliar[Vencimento].Strings[B])<
              strtodatetime(ParcelasAuxiliar[Vencimento].Strings[B-1]) do
        begin
          ParcelasAuxiliar[Vencimento].Move(B,B-1);
          ParcelasAuxiliar[Numero].Move(B,B-1);
          ParcelasAuxiliar[Valor].Move(B,B-1);
          if B=1 then
            break
          else
            B := B-1;
        end;
      end;

      QTP:= 0;
      Vencto := '';
      for A := 0 to ParcelasAuxiliar[Vencimento].Count - 1 do
        if (ParcelasAuxiliar[Vencimento].Strings[A] <> Vencto) or
           ((ParcelasAuxiliar[Vencimento].Strings[A] = Vencto) and
            (ParSistema.GerarParcelaSubstituicaoTributaria) and
            (qryOrdemServicopessoatipo.AsString = 'J')) then
        begin
          QTP := QTP + 1;
          Vencto := ParcelasAuxiliar[Vencimento].Strings[A];
        end;
      NP:= 0;
      Vencto := '';
      for A := 0 to ParcelasAuxiliar[Vencimento].Count - 1 do begin
        if (ParcelasAuxiliar[Vencimento].Strings[A] <> Vencto) or
           ((ParcelasAuxiliar[Vencimento].Strings[A] = Vencto) and
            (ParSistema.GerarParcelaSubstituicaoTributaria) and
            (qryOrdemServicopessoatipo.AsString = 'J')) then
        begin
          NP := NP + 1;
          Vencto := ParcelasAuxiliar[Vencimento].Strings[A];
        end;
        qryParcelas.Append;
        qryParcelasnumero.AsInteger        := strtoint(ParcelasAuxiliar[Numero].Strings[A]);
        qryParcelasparcelaorigem.AsString  := inttostr(NP)+'/'+inttostr(QTP);
        qryParcelasdatavencto.AsString     := ParcelasAuxiliar[Vencimento].strings[A];
        qryParcelasvalorvencto.AsString    := ParcelasAuxiliar[Valor].strings[A];
        qryParcelasformapagamento.AsString := 'D';
      end;
    finally
      qryParcelas.EnableControls;
      qryParcelas.First;
    end;
    ValidarValoresContratos;
  end;
end;
*)



procedure Tdtmordemservico.DefinirParcelas(var Parcelas: TResumosParcelas; var ValorPrazo,
  TaxaJuros, Desconto: Real; var Plano: Integer);

const
  Numero           = 1;
  Vencimento       = 2;
  Valor            = 3;
  FormaPagamento   = 4;
  TipoRecebimento  = 5;
  DescricaoTipoRecebimento = 6;
  Substituicao     = 7;
var
  Data  : TDateTime;
  A,B,NP, QTP: Integer;
  ParcelasAuxiliar: array [1..7] of TStringList;
  Vencto : String;

  function TotalParcelas: Currency;
  var
    Total: Currency;
  begin
    Total:= 0;
    qryParcelas.First;
    while not qryParcelas.Eof do begin
      Total:= Total + qryParcelasvalorvencto.AsCurrency;
      qryParcelas.Next;
    end;
    Result:= Total;
  end;

  {
  procedure ValidarValoresContratos;
  var
    aVista,
    aPrazo,
    Produtos,
    Servicos,
//    ICMS,
    DescontoReal,
    ipi: Currency;

  begin
    Produtos:= qryOrdemServicototalprodutos.AsCurrency;
    Servicos:= qryOrdemServicoTotalLiquidoServicos.AsCurrency;


    ipi := qryOrdemServicototalipi.AsCurrency;
    aVista:= ((Produtos + ipi + qryOrdemServicovaloricmssubstituicao.AsCurrency + Servicos + qryOrdemServicoFrete.AsCurrency + qryOrdemServicoseguro.AsCurrency) - qryOrdemServicodesconto.AsCurrency) ;
    aPrazo:= TotalParcelas;
//    aPrazo:= TotalParcelas + impostoretido;
    if aVista > aPrazo then
    begin
//      qryOrdemServicodesconto.AsCurrency   := qryOrdemServicodesconto.AsCurrency + (aVista - aPrazo);
      qryOrdemServicodescontototaldoContrato.asCurrency:= qryOrdemServicodesconto.AsCurrency; ;
      DescontoReal:= ((Produtos + ipi + qryOrdemServicovaloricmssubstituicao.AsCurrency +
                       Servicos + qryOrdemServicoFrete.AsCurrency + qryOrdemServicoseguro.AsCurrency)
                       - aPrazo);
//      ICMS:= qryOrdemServicovaloricmssubstituicao.AsCurrency;
      qryOrdemServicodesconto.AsCurrency:= DescontoReal;
      if qryParcelas.Locate('substituicao',true,[]) then
      begin
        qryParcelas.Edit;
        qryParcelasvalorvencto.AsCurrency := qryOrdemServicovaloricmssubstituicao.AsCurrency;
        qryParcelas.Post;
      end;
      qryOrdemServicovalorvista.AsCurrency := aPrazo;
    end
    else
    begin
      qryOrdemServicovalorvista.AsCurrency := aVista;
    end;
    qryOrdemServicovalorprazo.AsCurrency := aPrazo;
  end;
  }

  procedure ValidarValoresContratos;
  var
    aVista,
    aPrazo,
    Produtos,
    Servicos: Currency;

  begin
    //Produtos:= qryContratostotalprodutos.AsCurrency;
    //Servicos:= qryContratostotalservicos.AsCurrency;
    {aVista:= ((qryOrdemServicovalorvista.AsCurrency) - qryOrdemServicodesconto.AsCurrency);
    aPrazo:= TotalParcelas;
    if aVista > aPrazo then begin
      qryOrdemServicodesconto.AsCurrency   := (qryOrdemServicodesconto.AsCurrency + (aVista - aPrazo));
      qryOrdemServicovalorvista.AsCurrency := aPrazo;
    end
    else
      qryOrdemServicovalorvista.AsCurrency := aVista;}
    Produtos:= qryOrdemServicototalprodutos.AsCurrency;
    Servicos:= qryOrdemServicototalservicos.AsCurrency;
//    ipi := qryordemservicotContratostotalipi.AsCurrency;
    aVista:= ((Produtos {+ ipi + qryordemservicovaloricmssubstituicao.AsCurrency }+ Servicos + qryOrdemServicofrete.AsCurrency + qryOrdemServicoseguro.AsCurrency) - qryOrdemServicodesconto.AsCurrency) ;
    aPrazo:= TotalParcelas;
    if aVista > aPrazo then
    begin
      qryOrdemServicodesconto.AsCurrency   := qryOrdemServicodesconto.AsCurrency + (aVista - aPrazo);
      qryOrdemServicovalorvista.AsCurrency := aPrazo;
    end
    else
      qryOrdemServicovalorvista.AsCurrency := aVista;

    if qryOrdemServicovalorprazo.Ascurrency <> aPrazo then
      qryOrdemServicovalorprazo.Ascurrency := aPrazo;

  end;


begin
  if qryOrdemServico.State = dsBrowse then
    qryOrdemServico.Edit;

  if Plano > 0 then
  begin


    qryOrdemServicovalorprazo.AsCurrency := ValorPrazo;
    qryOrdemServicodesconto.AsFloat      := Desconto;
    qryOrdemServicotaxajuros.AsFloat     := TaxaJuros;
    qryOrdemServicoplano.AsInteger       := Plano;


    qryParcelas.DisableControls;
    try
      if (qryParcelas.RecordCount > 0) then begin
        qryParcelas.First;
        while Not qryParcelas.Eof do
          qryParcelas.Delete;
      end;
      ParcelasAuxiliar[Numero] := TStringList.Create;
      ParcelasAuxiliar[Vencimento] := TStringList.Create;
      ParcelasAuxiliar[Valor] := TStringList.Create;
      ParcelasAuxiliar[FormaPagamento] := TStringList.Create;
      ParcelasAuxiliar[TipoRecebimento] := TStringList.Create;
      ParcelasAuxiliar[DescricaoTipoRecebimento] := TStringList.Create;
      ParcelasAuxiliar[Substituicao] := TStringList.Create;

      NP:= 1;
      if ParSistema.utilizarcreditotrocacontrato  then
        if qryOrdemServicocreditotroca.AsCurrency > 0 then
        begin
          ParcelasAuxiliar[Numero].Append(inttostr(NP));
          if not qryOrdemServicofaturamento.IsNull then
            ParcelasAuxiliar[Vencimento].Append(datetimetostr(qryOrdemServicofaturamento.AsDateTime))
          else ParcelasAuxiliar[Vencimento].Append(datetimetostr(qryOrdemServicodata.AsDateTime));
          ParcelasAuxiliar[Valor].Append(floattostr(qryOrdemServicocreditotroca.AsCurrency));
          ParcelasAuxiliar[FormaPagamento].Append('T');
          Parcelasauxiliar[TipoRecebimento].Append('1');
          Parcelasauxiliar[DescricaoTipoRecebimento].Append(ValorCampodaTabela('tiposrecebimentos', ['descricao'], ['CRÉDITO DE TROCA'], ['codigo'])[0]);
          ParcelasAuxiliar[Substituicao].Append('FALSE');
          NP := NP+1;
        end;

      if {(qryOrdemServicodesconto.AsCurrency > 0) and*}
         (qryOrdemServicovaloricmssubstituicao.AsCurrency > 0) and
         (ParSistema.GerarParcelaSubstituicaoTributaria) then
        for A := 0 to high(Parcelas) do
          if Parcelas[A].Substituicao then
            Parcelas[A].Valor := qryOrdemServicovaloricmssubstituicao.AsCurrency;

      for A := 0 to high(Parcelas) do begin
        B := 0;
        Data := Parcelas[A].Vencimento;
        while B < Parcelas[A].Parcelas do
        begin
          if (Parcelas[A].Valor<>0) then
          begin
            ParcelasAuxiliar[Numero].Append(inttostr(NP));
{          ParcelasAuxiliar[Vencimento].Append(datetimetostr(Data));
}          if B = 0 then
              ParcelasAuxiliar[Vencimento].Append(datetimetostr(Data))
            else
            begin
              if qryPlanoPagamentomestrintadias.AsBoolean then
                ParcelasAuxiliar[Vencimento].Append(datetimetostr(SomarDia(Data,qryPlanoPagamentointervaloparcelas.AsInteger*B,'S')))
              else ParcelasAuxiliar[Vencimento].Append(datetimetostr(SomarDia(Data,qryPlanoPagamentointervaloparcelas.AsInteger*B,'N')));
            end;
            ParcelasAuxiliar[Valor].Append(floattostr(Parcelas[A].Valor));
            ParcelasAuxiliar[FormaPagamento].Append(Parcelas[A].FormaPagamento);
            ParcelasAuxiliar[TipoRecebimento].Append(IntToStr(Parcelas[A].TipoRecebimento));
            ParcelasAuxiliar[DescricaoTipoRecebimento].Append(Parcelas[A].DescricaoTipoRecebimento);
            ParcelasAuxiliar[Substituicao].Append(BoolToStr(Parcelas[A].Substituicao,True));
{          if qryPlanoPagamentomestrintadias.AsBoolean then
                 Data:= SomarDia(Data,qryPlanoPagamentointervaloparcelas.AsInteger,'S')
            else Data:= SomarDia(Data,qryPlanoPagamentointervaloparcelas.AsInteger,'N');
}          Inc(NP);
          end;
          Inc(B);
        end;
      end;

      for A := 1 to ParcelasAuxiliar[Vencimento].Count - 1 do begin
        B := A;
        While strtodatetime(ParcelasAuxiliar[Vencimento].Strings[B])<
              strtodatetime(ParcelasAuxiliar[Vencimento].Strings[B-1]) do
        begin
          ParcelasAuxiliar[Vencimento].Move(B,B-1);
          ParcelasAuxiliar[Numero].Move(B,B-1);
          ParcelasAuxiliar[Valor].Move(B,B-1);
          ParcelasAuxiliar[FormaPagamento].Move(B,B-1);
          ParcelasAuxiliar[TipoRecebimento].Move(B,B-1);
          ParcelasAuxiliar[DescricaoTipoRecebimento].Move(B,B-1);
          ParcelasAuxiliar[Substituicao].Move(B,B-1);
          if B=1 then
            break
          else
            B := B-1;
        end;
      end;

      QTP:= 0;
      Vencto := '';
      for A := 0 to ParcelasAuxiliar[Vencimento].Count - 1 do
        if (ParcelasAuxiliar[Vencimento].Strings[A] <> Vencto) or
           ((ParcelasAuxiliar[Vencimento].Strings[A] = Vencto) and
            (ParSistema.GerarParcelaSubstituicaoTributaria) and
            (qryOrdemServicopessoatipo.AsString = 'J')) then
        begin
          QTP := QTP + 1;
          Vencto := ParcelasAuxiliar[Vencimento].Strings[A];
        end;
      NP:= 0;
      Vencto := '';
      for A := 0 to ParcelasAuxiliar[Vencimento].Count - 1 do begin
        if (ParcelasAuxiliar[Vencimento].Strings[A] <> Vencto) or
           ((ParcelasAuxiliar[Vencimento].Strings[A] = Vencto) and
            (ParSistema.GerarParcelaSubstituicaoTributaria) and
            (qryOrdemServicopessoatipo.AsString = 'J')) then
        begin
          NP := NP + 1;
          Vencto := ParcelasAuxiliar[Vencimento].Strings[A];
        end;
        qryParcelas.Append;
        qryParcelasnumero.AsInteger        := strtoint(ParcelasAuxiliar[Numero].Strings[A]);
        qryParcelasparcelaorigem.AsString  := inttostr(NP)+'/'+inttostr(QTP);
        qryParcelasdatavencto.AsString     := ParcelasAuxiliar[Vencimento].strings[A];
        qryParcelasvalorvencto.AsString    := ParcelasAuxiliar[Valor].strings[A];
        if ParcelasAuxiliar[TipoRecebimento].Strings[A] <> '0' then
          qryParcelastiporecebimento.AsString := ParcelasAuxiliar[TipoRecebimento].Strings[A];
        qryParcelasDescricao.AsString := ParcelasAuxiliar[DescricaoTipoRecebimento].Strings[A];

        if ParcelasAuxiliar[FormaPagamento].strings[A]='T' then
        begin
          qryParcelasformapagamento.AsString := ParcelasAuxiliar[FormaPagamento].strings[A];
          if SituacaoOrdemServico > scRESERVADO then
          begin
            qryParcelasdatapagto.AsDateTime := qryParcelasdatavencto.AsDateTime;
            qryParcelasvalorpagto.Ascurrency := qryParcelasvalorvencto.AsCurrency;
            qryParcelasfilialpagto.AsInteger := FilialBase;
            qryParcelasNometipopagto.AsString := 'Quitada';
          end;
        end
        else
          if ParcelasAuxiliar[FormaPagamento].strings[A] <> '' then
            qryParcelasformapagamento.AsString := ParcelasAuxiliar[FormaPagamento].strings[A]
          else
            qryParcelasformapagamento.AsString := 'D';
//        qryParcelassubstituicao.AsBoolean := StrToBool(ParcelasAuxiliar[Substituicao].Strings[A]);

         if ParcelasAuxiliar[Substituicao].Strings[A] = 'True' then
           qryParcelassubstituicao.AsBoolean := true
         else
           qryParcelassubstituicao.AsBoolean := false;


        qryparcelas.Post;
      end;

      {
      if (qryparcelas.RecordCount = 0) then
        if FSomenteBrindes then
          if ParSistema.PermitirAlterarBrindenoContrato then
          begin
            qryParcelas.Append;
            qryParcelasnumero.AsInteger        := 1;
            qryParcelasparcelaorigem.AsString  := '1/1';
            if qryOrdemServicofaturamento.IsNull then
              qryParcelasdatavencto.AsString :=  qryOrdemServicodata.AsString
            else
              qryParcelasdatavencto.AsString := qryOrdemServicofaturamento.AsString;
            qryParcelasformapagamento.AsString := 'D';
            if qryOrdemServicovaloricmssubstituicao.AsFloat = 0 then
            begin
              qryParcelasvalorvencto.AsCurrency    := 0.00;
              qryParcelasdatapagto.AsDateTime := qryParcelasdatavencto.AsDateTime;
              qryParcelasvalorpagto.Ascurrency := qryParcelasvalorvencto.AsCurrency;
              qryParcelasfilialpagto.AsInteger := FilialBase;
              qryParcelasNometipopagto.AsString := 'Quitada';
            end
            else
            begin
              qryParcelasvalorvencto.AsCurrency    := qryOrdemServicovaloricmssubstituicao.AsCurrency;
            end;
            qryparcelas.Post;
          end;
          }
    finally
      qryParcelas.EnableControls;
      qryParcelas.First;
    end;
    ValidarValoresContratos;
  end;
end;




(*

procedure TdtmOrdemServico.DefinirParcelas(var Parcelas: TResumosParcelas; var ValorPrazo,
  TaxaJuros, Desconto: Real; var Plano: Integer);
const
  Numero           = 1;
  Vencimento       = 2;
  Valor            = 3;
  FormaPagamento   = 4;
  TipoRecebimento  = 5;
  DescricaoTipoRecebimento = 6;
  Substituicao     = 7;
var
  Data  : TDateTime;
  A,B,NP, QTP: Integer;
  ParcelasAuxiliar: array [1..7] of TStringList;
  Vencto : String;

  function TotalParcelas: Currency;
  var
    Total: Currency;
  begin
    Total:= 0;
    qryParcelas.First;
    while not qryParcelas.Eof do begin
      Total:= Total + qryParcelasvalorvencto.AsCurrency;
      qryParcelas.Next;
    end;
    Result:= Total;
  end;

  procedure ValidarValoresContratos;
  var
    aVista,
    aPrazo,
    Produtos,
    Servicos,
//    ICMS,
    DescontoReal,
    ipi: Currency;

  begin
    Produtos:= TotalProdutos; { qryOrdemServicototalprodutos.AsCurrency; }
    Servicos:= qryOrdemServicoTotalLiquidoServicos.AsCurrency;
    ipi := qryOrdemServicototalipi.AsCurrency;
    aVista:= ((Produtos + ipi + qryOrdemServicovaloricmssubstituicao.AsCurrency + Servicos + qryOrdemServicoFrete.AsCurrency + qryOrdemServicoseguro.AsCurrency) - qryOrdemServicodesconto.AsCurrency) ;
    aPrazo:= TotalParcelas;
//    aPrazo:= TotalParcelas + impostoretido;
    if aVista > aPrazo then
    begin
//      qryOrdemServicodesconto.AsCurrency   := qryOrdemServicodesconto.AsCurrency + (aVista - aPrazo);
      qryOrdemServicodescontototaldoContrato.asCurrency:= qryOrdemServicodesconto.AsCurrency {+ FTotalDesconto};
      DescontoReal:= ((Produtos + ipi + qryOrdemServicovaloricmssubstituicao.AsCurrency +
                       Servicos + qryOrdemServicoFrete.AsCurrency + qryOrdemServicoseguro.AsCurrency)
                       - aPrazo);
//      ICMS:= qryOrdemServicovaloricmssubstituicao.AsCurrency;
      qryOrdemServicodesconto.AsCurrency:= DescontoReal;
      if qryParcelas.Locate('substituicao',true,[]) then
      begin
        qryParcelas.Edit;
        qryParcelasvalorvencto.AsCurrency := qryOrdemServicovaloricmssubstituicao.AsCurrency;
        qryParcelas.Post;
      end;
      qryOrdemServicovalorvista.AsCurrency := aPrazo;
    end
    else
    begin
      qryOrdemServicovalorvista.AsCurrency := aVista;
    end;
    qryOrdemServicovalorprazo.AsCurrency := aPrazo;
  end;

begin
  if qryOrdemServico.State = dsBrowse then
    qryOrdemServico.Edit;

  if Plano > 0 then
  begin

//    qryOrdemServicovalorprazo.AsCurrency := ValorPrazo+ImpostoRetido+creditotroca;
    qryOrdemServicodesconto.AsFloat      := Desconto;
    if ParSistema.CalcularSubstituicaoTributarianoContrato and (ValorICMSSubstTributaria > 0) then
      qryOrdemServicovalorprazo.AsCurrency := ValorPrazo + creditotroca + ValorICMSSubstTributaria
    else
      qryOrdemServicovalorprazo.AsCurrency := ValorPrazo + creditotroca;
    qryOrdemServicotaxajuros.AsFloat     := TaxaJuros;
    qryOrdemServicoplano.AsInteger       := Plano;

    qryParcelas.DisableControls;
    try
      if (qryParcelas.RecordCount > 0) then begin
        qryParcelas.First;
        while Not qryParcelas.Eof do
          qryParcelas.Delete;
      end;

      ParcelasAuxiliar[Numero] := TStringList.Create;
      ParcelasAuxiliar[Vencimento] := TStringList.Create;
      ParcelasAuxiliar[Valor] := TStringList.Create;
      ParcelasAuxiliar[FormaPagamento] := TStringList.Create;
      ParcelasAuxiliar[TipoRecebimento] := TStringList.Create;
      ParcelasAuxiliar[DescricaoTipoRecebimento] := TStringList.Create;
      ParcelasAuxiliar[Substituicao] := TStringList.Create;

      NP:= 1;
      if ParSistema.utilizarcreditotrocacontrato  then
        if qryOrdemServicocreditotroca.AsCurrency > 0 then
        begin
          ParcelasAuxiliar[Numero].Append(inttostr(NP));
          if not qryOrdemServicofaturamento.IsNull then
            ParcelasAuxiliar[Vencimento].Append(datetimetostr(qryOrdemServicofaturamento.AsDateTime))
          else ParcelasAuxiliar[Vencimento].Append(datetimetostr(qryOrdemServicodata.AsDateTime));
          ParcelasAuxiliar[Valor].Append(floattostr(qryOrdemServicocreditotroca.AsCurrency));
          ParcelasAuxiliar[FormaPagamento].Append('T');
          Parcelasauxiliar[TipoRecebimento].Append(ValorCampodaTabela('tiposrecebimentos', ['descricao'], ['CRÉDITO DE TROCA'], ['codigo'])[0]);
          Parcelasauxiliar[DescricaoTipoRecebimento].Append('CRÉDITO DE TROCA');
          ParcelasAuxiliar[Substituicao].Append('FALSE');
          NP := NP+1;
        end;

      if (qryOrdemServicovaloricmssubstituicao.AsCurrency > 0) and
         (ParSistema.GerarParcelaSubstituicaoTributaria) then
        for A := 0 to high(Parcelas) do
          if Parcelas[A].Substituicao then
            Parcelas[A].Valor := qryOrdemServicovaloricmssubstituicao.AsCurrency;

      for A := 0 to high(Parcelas) do
      begin
        B := 0;
        Data := Parcelas[A].Vencimento;
        while B < Parcelas[A].Parcelas do
        begin
          if (Parcelas[A].Valor<>0) then
          begin
            ParcelasAuxiliar[Numero].Append(inttostr(NP));
            if B = 0 then
              ParcelasAuxiliar[Vencimento].Append(datetimetostr(Data))
            else
            begin
              if qryPlanoPagamentomestrintadias.AsBoolean then
                ParcelasAuxiliar[Vencimento].Append(datetimetostr(SomarDia(Data,qryPlanoPagamentointervaloparcelas.AsInteger*B,'S')))
              else ParcelasAuxiliar[Vencimento].Append(datetimetostr(SomarDia(Data,qryPlanoPagamentointervaloparcelas.AsInteger*B,'N')));
            end;
            ParcelasAuxiliar[Valor].Append(floattostr(Parcelas[A].Valor));
            ParcelasAuxiliar[FormaPagamento].Append(Parcelas[A].FormaPagamento);
            ParcelasAuxiliar[TipoRecebimento].Append(IntToStr(Parcelas[A].TipoRecebimento));
            ParcelasAuxiliar[DescricaoTipoRecebimento].Append(Parcelas[A].DescricaoTipoRecebimento);
            ParcelasAuxiliar[Substituicao].Append(BoolToStr(Parcelas[A].Substituicao,True));
            Inc(NP);
          end;
          Inc(B);
        end;
      end;

      for A := 1 to ParcelasAuxiliar[Vencimento].Count - 1 do begin
        B := A;
        While strtodatetime(ParcelasAuxiliar[Vencimento].Strings[B])<
              strtodatetime(ParcelasAuxiliar[Vencimento].Strings[B-1]) do
        begin
          ParcelasAuxiliar[Vencimento].Move(B,B-1);
          ParcelasAuxiliar[Numero].Move(B,B-1);
          ParcelasAuxiliar[Valor].Move(B,B-1);
          ParcelasAuxiliar[FormaPagamento].Move(B,B-1);
          ParcelasAuxiliar[TipoRecebimento].Move(B,B-1);
          ParcelasAuxiliar[DescricaoTipoRecebimento].Move(B,B-1);
          ParcelasAuxiliar[Substituicao].Move(B,B-1);
          if B=1 then
            break
          else
            B := B-1;
        end;
      end;

      QTP:= 0;
      Vencto := '';
      for A := 0 to ParcelasAuxiliar[Vencimento].Count - 1 do
        if (ParcelasAuxiliar[Vencimento].Strings[A] <> Vencto) or
           ((ParcelasAuxiliar[Vencimento].Strings[A] = Vencto) and
            (ParSistema.GerarParcelaSubstituicaoTributaria) and
            (qryOrdemServicopessoatipo.AsString = 'J')) then
        begin
          QTP := QTP + 1;
          Vencto := ParcelasAuxiliar[Vencimento].Strings[A];
        end;

      NP:= 0;
      Vencto := '';
      for A := 0 to ParcelasAuxiliar[Vencimento].Count - 1 do
      begin

        if (ParcelasAuxiliar[Vencimento].Strings[A] <> Vencto) or
           ((ParcelasAuxiliar[Vencimento].Strings[A] = Vencto) and
            (ParSistema.GerarParcelaSubstituicaoTributaria) and
            (qryOrdemServicopessoatipo.AsString = 'J')) then
        begin
          NP := NP + 1;
          Vencto := ParcelasAuxiliar[Vencimento].Strings[A];
        end;

        qryParcelas.Append;
        qryParcelasnumero.AsInteger        := strtoint(ParcelasAuxiliar[Numero].Strings[A]);
        qryParcelasparcelaorigem.AsString  := inttostr(NP)+'/'+inttostr(QTP);
        qryParcelasdatavencto.AsString     := ParcelasAuxiliar[Vencimento].strings[A];
        qryParcelasvalorvencto.AsString    := ParcelasAuxiliar[Valor].strings[A];
        if ParcelasAuxiliar[TipoRecebimento].Strings[A] <> '0' then
          qryParcelastiporecebimento.AsString := ParcelasAuxiliar[TipoRecebimento].Strings[A];
        qryParcelasDescricao.AsString := ParcelasAuxiliar[DescricaoTipoRecebimento].Strings[A];

        if ParcelasAuxiliar[FormaPagamento].strings[A]='T' then
        begin
          qryParcelasformapagamento.AsString := ParcelasAuxiliar[FormaPagamento].strings[A];
          if SituacaoContrato > scRESERVADO then
          begin
            qryParcelasdatapagto.AsDateTime := qryParcelasdatavencto.AsDateTime;
            qryParcelasvalorpagto.Ascurrency := qryParcelasvalorvencto.AsCurrency;
            qryParcelasfilialpagto.AsInteger := FilialBase;
            qryParcelasNometipopagto.AsString := 'Quitada';
          end;
        end
        else
          if ParcelasAuxiliar[FormaPagamento].strings[A] <> '' then
            qryParcelasformapagamento.AsString := ParcelasAuxiliar[FormaPagamento].strings[A]
          else
            qryParcelasformapagamento.AsString := 'D';
//        qryParcelassubstituicao.AsBoolean := StrToBool(ParcelasAuxiliar[Substituicao].Strings[A]);

         if ParcelasAuxiliar[Substituicao].Strings[A] = 'True' then
           qryParcelassubstituicao.AsBoolean := true
         else
           qryParcelassubstituicao.AsBoolean := false;


        qryparcelas.Post;
      end;

      if (qryparcelas.RecordCount = 0) then
        if FSomenteBrindes then
          if ParSistema.PermitirAlterarBrindenoContrato then
          begin
            qryParcelas.Append;
            qryParcelasnumero.AsInteger        := 1;
            qryParcelasparcelaorigem.AsString  := '1/1';
            if qryOrdemServicofaturamento.IsNull then
              qryParcelasdatavencto.AsString :=  qryOrdemServicodata.AsString
            else
              qryParcelasdatavencto.AsString := qryOrdemServicofaturamento.AsString;
            qryParcelasformapagamento.AsString := 'D';
            if qryOrdemServicovaloricmssubstituicao.AsFloat = 0 then
            begin
              qryParcelasvalorvencto.AsCurrency    := 0.00;
              qryParcelasdatapagto.AsDateTime := qryParcelasdatavencto.AsDateTime;
              qryParcelasvalorpagto.Ascurrency := qryParcelasvalorvencto.AsCurrency;
              qryParcelasfilialpagto.AsInteger := FilialBase;
              qryParcelasNometipopagto.AsString := 'Quitada';
            end
            else
            begin
              qryParcelasvalorvencto.AsCurrency    := qryOrdemServicovaloricmssubstituicao.AsCurrency;
            end;
            qryparcelas.Post;
          end;
    finally
      qryParcelas.EnableControls;
      qryParcelas.First;
    end;
    ValidarValoresContratos;
  end;
end;

*)



function Tdtmordemservico.GetReadOnly: Boolean;
begin
  Result := qryOrdemServico.ReadOnly;
end;

procedure Tdtmordemservico.SetReadOnly(const Value: Boolean);
begin
  qryOrdemServico.ReadOnly         := Value;
  qryProdutosOrdemServico.ReadOnly := Value;
  qryServicosOrdemServico.ReadOnly := Value;
  qryParcelas.ReadOnly             := Value;
end;

function Tdtmordemservico.BloquearOrdemServico(Numero: String): Boolean;
begin
  {
  ReFazConsulta(qryBloquearOrdemServico, [0], [Numero]);
  Result := (qryBloquearOrdemServico.RecordCount > 0) and (qryBloquearOrdemServicolock.AsInteger = 1);
  FBloqueado := Not Result;
  }

  FBloqueado := false;
end;

procedure Tdtmordemservico.DesbloquearOrdemServico;
begin

  // DesbloquearOrdemServico(qryOrdemServiconumero.AsString)

end;

procedure Tdtmordemservico.DesbloquearOrdemServico(Numero: String);
begin
//  ReFazConsulta(qryDesbloquearOrdemServico, [0], [Numero]);
  FBloqueado := False
end;

procedure Tdtmordemservico.BloquearEstoque;
var
  WhereSQL: String;
begin
  if SituacaoOrdemServico in [scRESERVADO, scNOTAFISCAL, scNOTAPARCIAL] then
  begin
    qryProdutosOrdemServico.DisableControls;
    try
      if qryProdutosOrdemServico.RecordCount = 0 then
        WhereSQL := 'false'
      else
      begin
        WhereSQL := '';
        qryProdutosOrdemServico.First;
        while Not qryProdutosOrdemServico.Eof do
        begin
          WhereSQL := WhereSQL +
          '((e.produto = ' + qryProdutosOrdemServicoproduto.AsString + ')and' +
          '(e.filial = '   + qryProdutosOrdemServicofilial.AsString  + '))or';
          if (qryProdutosOrdemServicoproduto.AsLargeInt <> qryProdutosOrdemServicoproduto.OldValue) or
             (qryProdutosOrdemServicofilial.AsInteger   <> qryProdutosOrdemServicofilial.OldValue) then
            WhereSQL := WhereSQL +
            '((e.produto = ' + VarToStr(qryProdutosOrdemServicoproduto.OldValue) + ')and' +
            '(e.filial = '   + VarToStr(qryProdutosOrdemServicofilial.OldValue)  + '))or';
          qryProdutosOrdemServico.Next
        end;

        //BLOQUEIA TAMBÉM O ESTOQUE DO PRODUTO DA OS
       { if not qryOrdemServicoproduto.IsNull then
          WhereSQL := WhereSQL + '((e.produto = ' + qryOrdemServicoproduto.AsString +')and'+
                      '(e.filial='+qryOrdemServicofilialvenda.AsString+'))or';
         if ((qryOrdemServicoproduto.AsLargeInt <> qryOrdemServicoproduto.OldValue) and (qryOrdemServicoproduto.OldValue>0)) then
           WhereSQL := WhereSQL +
                       '((e.produto = ' + VarToStr(qryOrdemServicoproduto.OldValue) + ')and' +
                       '(e.filial = '   + VarToStr(qryOrdemServicofilialvenda.OldValue)  + '))or';}

        Delete(WhereSQL, Length(WhereSQL) - 1, 2);
      end
    finally
      qryProdutosOrdemServico.EnableControls
    end;
    qryEstoqueBloqueio.Sql[8] := WhereSQL;
    qryEstoqueBloqueio.Open;
  end
end;

function Tdtmordemservico.GetSituacaoOrdemServico: TtecSituacaoContrato;
var
S:String;
begin
  S:=qryOrdemServicosituacao.AsString;
  if S = 'F' then
    Result := scFATURADO
  else if S = 'C' then
    Result := scCANCELADO
  else if ((S = 'N') or ( S='P')) then
  begin
    if not qryOrdemServicoorigem.IsNull or ((qryProdutosEntregar.RecordCount=0)
                                            and (qryServicosOrdemServico.RecordCount = qryServicosDadosFiscais.RecordCount)) then
      Result := scNOTAFISCAL
    else
      Result := scNOTAPARCIAL;
  end
  else if S = 'O' then
    Result := scORCADO
  else if S = 'R' then
    Result := scRESERVADO
  else
    Result := scNENHUM
end;

procedure Tdtmordemservico.SetSituacaoOrdemServico(const Value: TtecSituacaoContrato);
begin
  if SituacaoOrdemServico <> Value then begin
    SituacaoAnt := SituacaoOrdemServico;
    if SituacaoAnt in [scFATURADO, scNOTAPARCIAL] then
      ReadOnly := False;
    if qryOrdemServico.State = dsBrowse then
      qryOrdemServico.Edit;
    case Value of
      scFATURADO:   qryOrdemServicosituacao.AsString := 'F';
      scCANCELADO:  qryOrdemServicosituacao.AsString := 'C';
      scORCADO:     qryOrdemServicosituacao.AsString := 'O';
      scNOTAFISCAL: qryOrdemServicosituacao.AsString := 'N';
      scRESERVADO:  qryOrdemServicosituacao.AsString := 'R';
    end;
    qryOrdemServiconomesituacao.AsString := vstrSituacaoOrdemServico[SituacaoOrdemServico];
  end
end;

procedure Tdtmordemservico.qryOrdemServicoAfterClose(DataSet: TDataSet);
begin
  inherited;
  DesbloquearOrdemServico(FOrdemServicoBloqueado);
//  ReFazConsulta(qryDesbloquearContrato, [0], [FContratoBloqueado]);
  qryParcelas.Close;
  qryProdutosOrdemServico.Close;
  qryServicosOrdemServico.Close;
  qryPlanoPagamento.Close;
  qryReceitaOculos.Close;
end;

procedure Tdtmordemservico.qryOrdemServicoBeforeClose(DataSet: TDataSet);
begin
  inherited;
  FOrdemServicoBloqueado := qryOrdemServiconumero.AsString
end;

procedure Tdtmordemservico.qryOrdemServicoBeforeCancel(DataSet: TDataSet);
begin
  inherited;
  StateAnt := qryOrdemServico.State;
end;

procedure Tdtmordemservico.qryOrdemServicoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if Trim(qryOrdemServico.Params[0].AsString) <> '' then
    BloquearOrdemServico(qryOrdemServico.Params[0].AsString);
  ReadOnly := FBloqueado;
end;

procedure Tdtmordemservico.qryOrdemServicoNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryOrdemServicotipoequipamento.AsInteger := 1;
  qryProcuraCliente.Params[1].AsString := 'C';
  qryOrdemServicodata.AsDateTime       := DataServidor;
  qryOrdemServicofilialvenda.AsInteger    := FilialBase;
  qryOrdemServicovalorvista.AsFloat       := 0;
  qryOrdemServicovalorprazo.AsFloat       := 0;
  qryOrdemServicotaxajuros.AsFloat        := 0;
  SituacaoOrdemServico                    := scORCADO;
  qryOrdemServicopessoatipo.AsString      := 'F';
  qryOrdemServicosexo.AsString            := 'M';
  qryOrdemServicocivil.AsString           := 'S';
  qryOrdemServicofonetipo.AsString        := 'P';
  qryOrdemServicorestipo.AsString         := 'P';
  qryOrdemServicoreftipo.AsString         := 'P';
  qryOrdemServicoOS.AsBoolean             := true;
  qryOrdemServicoos_garantia.AsBoolean    := false;
  qryOrdemServicoos_cortesia.AsBoolean    := false;

  if(ParSistema.PlanoOrcamentoPadrao>0) then
    qryOrdemServicoplano.AsInteger:=ParSistema.PlanoOrcamentoPadrao;

  {
  if UsuarioLogin.Vendedor then begin
    if FVendedorDefault > 0 then
      qryOrdemServicovendedor.AsInteger  := FVendedorDefault;
  end;
  }

  if UsuarioLogin.Vendedor then
  begin
    VendedorDefault := UsuarioLogin.CodigoUsuario;
    qryOrdemServicovendedor.AsInteger  := UsuarioLogin.CodigoUsuario;
  end;


  //if Not UsuarioLogin.AlterarFilialVenda then
  //  qryContratosfilialvenda.AsInteger := FilialBase;
  //ReFazConsulta(qryConjuge,[0],[0]);
  RefazConsulta(qryProcuraFilialOS,[0],[qryOrdemServicofilialvenda.AsVariant]);
  qryOrdemServicovendaconsumidorfinal.AsBoolean := parsistema.vendaconsumidorfinal;
end;

procedure Tdtmordemservico.SetVendedorDefault(const Value: Integer);
begin
  if FVendedorDefault <> Value then
    FVendedorDefault:= Value;

  if (qryProdutosOrdemServico.RecordCount>0) then
  begin
   if ParSistema.NaoPermitirAlteraroVendedornosProdutosdoContrato then
   begin
     GuardarRegistroAtual(qryProdutosOrdemServico,true);
     qryProdutosOrdemServico.First;
     while not qryProdutosOrdemServico.Eof do
     begin
       if qryProdutosOrdemServicovendedor.AsInteger <> FVendedorDefault then
        AtribuirDados(qryProdutosOrdemServico, [qryProdutosOrdemServicovendedor], [fVendedorDefault]);

        qryProdutosOrdemServico.Next;
       end;
       VoltarRegistroAtual(qryProdutosOrdemServico);
     end;
  end;

end;


procedure Tdtmordemservico.dsrOrdemServicoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if Field = qryOrdemServicoplano then
    if qryOrdemServicoplano.AsInteger > 0 then
    begin
      ReFazConsulta(qryPlanoPagamento, [0], [qryOrdemServicoplano.AsInteger]);
      if qryPlanoPagamentoagente.AsInteger > 0 then
      begin
         qryOrdemServicoagente.AsInteger := qryPlanoPagamentoagente.AsInteger;
      end;
    end;

// if (Field = qryOrdemServicoequipamento) then
//   AtualizaPrecosdeVenda;

  if field = qryOrdemServicotipoequipamento then
  begin
    if qryOrdemServico.State <> dsBrowse then
    begin

      AtualizaPrecosdeVenda;

      case field.AsInteger of
      1,2,3 : begin
                if not qryOrdemServicoproduto.IsNull then
                begin
                  if MensagemConfirmacao('Remover o Produto indicado da OS?') = smbOk then
                  begin
                     qryOrdemServicoproduto.Clear;
                     qryOrdemServicoprodutovisual.Clear;
                     qryOrdemServicoprodutodigitado.Clear;
                     qryOrdemServicofilialproduto.Clear;
                   end
                   else
                   begin
                     dsrOrdemServico.onDataChange := nil;
                     qryOrdemServicotipoequipamento.AsInteger := qryOrdemServicotipoequipamentoanterior.AsInteger;
                     dsrOrdemServico.onDataChange := dsrOrdemServicoDataChange;
                   end;
                end;
              end;
      4 :     begin
                if not qryOrdemServicoequipamento.IsNull then
                begin
                  if MensagemConfirmacao('Remover o Equipamento indicado da OS?') = smbOk then
                     qryOrdemServicoequipamento.Clear
                  else
                  begin
                     dsrOrdemServico.onDataChange := nil;
                     qryOrdemServicotipoequipamento.AsInteger := qryOrdemServicotipoequipamentoanterior.AsInteger;
                     dsrOrdemServico.onDataChange := dsrOrdemServicoDataChange;
                  end;
                end;
              end;
      end;
      AfterPostTipoEquipamento(nil);
    end;
  end;

  if Field = qryOrdemServicocliente then
  begin

    if qryClientesconsumidorfinal.isnull then
      qryOrdemServicovendaconsumidorfinal.AsBoolean := parsistema.vendaconsumidorfinal
    else
      qryOrdemServicovendaconsumidorfinal.AsBoolean := qryClientesconsumidorfinal.asboolean;


    qryOrdemServicoequipamento.Clear;
    qryOrdemServicotipoequipamento.AsInteger:=1;
    if qryOrdemServicopessoatipo.AsString = 'J' then begin
      if not qryOrdemServicorefrua.IsNull then
        qryOrdemServicoentrua.AsString            := qryOrdemServicorefrua.AsString;
      if not qryOrdemServicorefestado.IsNull then
        qryOrdemServicoentestado.AsString         := qryOrdemServicorefestado.AsString;
      if not qryOrdemServicorefcidade.IsNull then
        qryOrdemServicoentcidade.AsInteger        := qryOrdemServicorefcidade.AsInteger;
      if not qryOrdemServicorefbairro.IsNull then
        qryOrdemServicoentbairro.AsInteger        := qryOrdemServicorefbairro.AsInteger;
      if not qryOrdemServicorefcep.IsNull then
        qryOrdemServicoentcep.AsInteger           := qryOrdemServicorefcep.AsInteger;
      if not qryOrdemServiconomecidadereferencia.IsNull then
        qryOrdemServiconomecidadeentrega.AsString := qryOrdemServiconomecidadereferencia.AsString;
      if not qryOrdemServiconomebairroreferencia.IsNull then
        qryOrdemServiconomebairroentrega.AsString := qryOrdemServiconomebairroreferencia.AsString;
    end else begin
      qryOrdemServicoentrua.Clear;
      qryOrdemServicoentestado.Clear;
      qryOrdemServicoentcidade.Clear;
      qryOrdemServicoentbairro.Clear;
      qryOrdemServicoentcep.Clear;
      qryOrdemServiconomecidadeentrega.Clear;
      qryOrdemServiconomebairroentrega.Clear;
    end;
    qryProcuraEquipamentosOS.ParamByName('cliente').value := qryOrdemServicocliente.value;
    qryProcuraEquipamentosOS.ParamByName('tipocliente').value := qryOrdemServicotipocliente.value;

    qryConsultaEquipamentosOS.ParamByName('cliente').value := qryOrdemServicocliente.value;
    qryConsultaEquipamentosOS.ParamByName('tipocliente').value := qryOrdemServicotipocliente.value;

    qryProcuraProduto.ParamByName('estadofilialbase').AsString := EstadoFilialBase;
    qryProcuraProduto.ParamByName('Estadocfo').AsString := qryOrdemServicoestado.AsString;
    qryProcuraProduto.ParamByName('tipoPessoa').AsString := qryOrdemServicopessoatipo.AsString;


  end;


  if field = qryOrdemServicoentrada then
  begin
    if field.asDateTime < qryOrdemServicodata.asDateTime then
      MensagemAviso('A data de entrada está inferior à data de cadastrado.');
  end;
end;

{
procedure Tdtmordemservico.CalcularValorTotalProdutos;
var
  Pos: TBookmark;
  QtdadeTotal,
  Produto, servico, Desconto: Real;
begin
  Pos := qryProdutosOrdemServico.GetBookmark;
  qryProdutosOrdemServico.DisableControls;
  Produto         := 0;
  Servico         := 0;
  TotalDesconto   := 0;
  Desconto        := 0;
  QtdadeTotal     := 0;

  FPermiteDesconto:= True;
  try
    qryProdutosOrdemServico.First;
    while Not qryProdutosOrdemServico.Eof do
    begin
      if Not qryProdutosOrdemServicobrinde.AsBoolean then
      begin
        QtdadeTotal := QtdadeTotal + qryProdutosOrdemServicoquantidade.asFloat;
        Produto := Produto + Truncar(qryProdutosOrdemServicoquantidade.asFloat * qryProdutosOrdemServicoprecovenda.AsFloat,2);
        Desconto    := qryProdutosOrdemServicovalordescontoitem.AsCurrency;
        TotalDesconto := TotalDesconto + Desconto;
      end;

      if qryProdutosOrdemServicopromocao.AsBoolean then
        FPermiteDesconto:= False;

      qryProdutosOrdemServico.Next
    end;
  finally
    qryOrdemServicosubtotalprodutos.AsFloat:= Produto;
    qryOrdemServicototalprodutos.AsFloat := Produto - TotalDesconto;
    qryOrdemServicototalqtdeprodutos.AsFloat := QtdadeTotal;
    qryOrdemServicodescontototal.AsFloat := TotalDesconto;

    qryProdutosOrdemServico.GotoBookmark(Pos);
    qryProdutosOrdemServico.FreeBookmark(Pos);
    qryProdutosOrdemServico.EnableControls;
  end;

  Pos := qryServicosOrdemServico.GetBookmark;
  qryServicosOrdemServico.DisableControls;
  Servico := 0;
  try
    qryServicosOrdemServico.First;
    while Not qryServicosOrdemServico.Eof do begin
      Servico := Servico + Truncar(qryServicosOrdemServicoquantidade.AsInteger * qryServicosOrdemServicovalorservico.AsFloat,2);
      qryServicosOrdemServico.Next
    end;
  finally
    qryOrdemServicototalservicos.AsFloat := Servico;
    qryServicosOrdemServico.GotoBookmark(Pos);
    qryServicosOrdemServico.FreeBookmark(Pos);
    qryServicosOrdemServico.EnableControls;
  end;

  qryOrdemServicovalorvista.AsCurrency:=produto+servico;


end;
}

function Tdtmordemservico.GetTotalProdutos: Currency;
begin
  Result := qryOrdemServicototalprodutos.AsFloat
end;

function Tdtmordemservico.GetTotalServicos: Currency;
begin
  Result:= qryOrdemServicototalservicos.AsFloat;
end;

{
procedure Tdtmordemservico.CalcularValorTotalServicos;
var
  Pos: TBookmark;
  Preco,
  Servico: Real;
begin
  Pos := qryServicosOrdemServico.GetBookmark;
  qryServicosOrdemServico.DisableControls;
  Servico := 0;
  try
    qryServicosOrdemServico.First;
    while Not qryServicosOrdemServico.Eof do begin
      Preco   := Truncar(qryServicosOrdemServicoquantidade.AsInteger * qryServicosOrdemServicovalorservico.AsFloat,2);
      Servico := Servico + Preco;
      qryServicosOrdemServico.Next
    end;
  finally
    qryOrdemServicototalservicos.AsFloat := Servico;
    qryServicosOrdemServico.GotoBookmark(Pos);
    qryServicosOrdemServico.FreeBookmark(Pos);
    qryServicosOrdemServico.EnableControls;
  end
end;
}

procedure Tdtmordemservico.CalcularValorAVista;
begin
  qryOrdemServicovalorvista.AsFloat := qryOrdemServicototalprodutos.AsFloat +
                                       qryOrdemServicototalservicos.AsFloat +
                                       qryOrdemServicofrete.AsFloat +
                                       qryOrdemServicoseguro.AsFloat -
                                       qryOrdemServicodesconto.AsFloat;
end;

function Tdtmordemservico.GetNumeroOrdemServico: String;
begin
  Result := qryOrdemServiconumero.AsString
end;

function Tdtmordemservico.GravarOrdemServico(var ErroCupom, CupomEmitido: Boolean;
                                             var FormaPagamento: Integer; var DadosFornec: String; var ValorPagoDinheiro: Currency;
                                             NotaFiscalVinculada, ViaCaixa, ComTEF: Boolean; NroParcela: Integer; ValorParcela: Real): Boolean;
var
  Pos: TBookmark;
  NaoHaProdutosSelecionados,
  CancelarCupom,
  TemEntrega, TodosSelecionados: Boolean;
  ErroNota: TtecVErrosNota;
//  FiliaisErro,
  FormaPagto: String;
  Parcelas: array of TtecParcelasTEF;
//  DadosTEF: array of TtecDadosTEF;
  CredValor,
  DebValor,
  TotalCtr,
  TotalNota: Currency;
  QtdadeDadosTEF,
  a,
  CredQtdadeParcelas,
  DebQtdadeParcelas: Integer;
  StateAnt: TDataSetState;
  MsgErro: String;

  procedure FecharQuerys;
  begin
    if qryMovimentos.State <> dsInactive then
      qryMovimentos.Close;
    if qryMovimentosProdutoEmpresa.State <> dsInactive then
      qryMovimentosProdutoEmpresa.Close;

{    if qryServicosDadosFiscais.State <> dsInactive then
      qryServicosDadosFiscais.Close;}
    if qryEstoqueBloqueio.State <> dsInactive then
      qryEstoqueBloqueio.Sql[8] := 'false';
    if qryProdutosReservas.State <> dsInactive then
      qryProdutosReservas.Close;
    if qryTransferencias.State <> dsInactive then
      qryTransferencias.Close;
    if qryNotas.State <> dsInactive then
      qryNotas.Close;
    if qryCupons.State <> dsInactive then
      qryCupons.Close;

      {
    if qrySeriesFiliais.State <> dsInactive then
      qrySeriesFiliais.Close;
      }

    if qryCopiarContrato.State <> dsInactive then
      qryCopiarContrato.Close;
    if qryCopiarProdutosContrato.State <> dsInactive then
      qryCopiarProdutosContrato.Close;
      {
    if qryTEF.Active then
      qryTEF.Close;
    if qryParcelasTEF.Active then
      qryParcelasTEF.Close;}
  end;

  Procedure AtribuirNumeroProdutosContratos;
  var
    Cont: Integer;
  begin
    Cont:= 1;
    qryProdutosOrdemServico.First;
    while Not qryProdutosOrdemServico.Eof do begin
      qryProdutosOrdemServico.Edit;
      qryProdutosOrdemServiconumero.AsInteger:= Cont;
      qryProdutosOrdemServico.Post;
      Inc(Cont);
      qryProdutosOrdemServico.Next;
    end;
  end;

  Procedure AtribuirNumeroMovimentosContratos;
  //var
  //Pos: TBookmark;
  begin
    // Pos:=qryMovimentos.GetBookmark;
     qryMovimentos.First;
     while not qryMovimentos.Eof do
     begin
       qryMovimentos.Edit;
       qryMovimentoscontrato.AsString:=qryOrdemServiconumero.AsString;
       qryMovimentos.Post;
       qryMovimentos.Next;
     end;
  end;

  procedure AtualizaParcelas;
  begin
    qryParcelas.DisableControls;
    try
      qryParcelas.First;
      while not qryParcelas.Eof do begin
        qryParcelas.Edit;
        qryParcelascontrato.AsString:= qryOrdemServiconumero.AsString;
        qryParcelas.Post;
        qryParcelas.Next;
      end;
    finally
      qryParcelas.EnableControls;
    end;
  end;

  {
  procedure AtualizaParcelasComTEF;
  var
    a, b: Integer;
  begin
    if Not qryTEF.Active then
      qryTEF.Open;
    if Not qryParcelasTEF.Active then
      qryParcelasTEF.Open;
    for a := 0 to QtdadeDadosTEF - 1 do begin
      Insert('/', DadosTEF[a].DataNSU, 3);
      Insert('/', DadosTEF[a].DataNSU, 6);
      Insert(':', DadosTEF[a].HoraNSU, 3);
      Insert(':', DadosTEF[a].HoraNSU, 6);
      qryTEF.Append;
      spcTEFProximo.Open;
      qryTEFcodigo.AsInteger := spcTEFProximocodigo.AsInteger;
      spcTEFProximo.Close;
      qryTEFnumeronsu.AsString   := DadosTEF[a].NSUTEF;
      qryTEFdatansu.AsDateTime   := StrToDate(DadosTEF[a].DataNSU);
      qryTEFhoransu.AsDateTime   := StrToTime(DadosTEF[a].HoraNSU);
      qryTEFnomeredensu.AsString := DadosTEF[a].NomeRedeNSU;
      qryTEFvalor.AsFloat        := DadosTEF[a].Valor;
      qryTEF.Post;
      for b := 0 to DadosTEF[a].NroParcela - 1 do begin
        qryParcelasTEF.Append;
        qryParcelasTEFcontrato.AsString := qryContratosnumero.AsString;
        qryParcelasTEFparcela.AsInteger := DadosTEF[a].Parcelas[b];
        qryParcelasTEFtef.AsInteger     := qryTEFcodigo.AsInteger;
        qryParcelasTEF.Post
      end
    end;
  end;
  }

{
  procedure ValoresQtdadeParcelas(var CredValor, DebValor: Currency;
                                  var Parcelas CredParcelas, DebParcelas: array of TtecParcelasTEF;
                                  var CredQtdadeParcelas, DebQtdadeParcelas: Integer);
  var
    a: Integer;
  begin
    qryParcelas.DisableControls;
    try
      a                  := 0;
      CredValor          := 0;
      DebValor           := 0;
      CredQtdadeParcelas := 0;
      DebQtdadeParcelas  := 0;
      qryParcelas.First;
      while not qryParcelas.Eof do begin
        if qryParcelasformapagamento.AsString = 'C' then begin
          CredValor := CredValor + qryParcelasvalorvencto.AsFloat;
          Inc(CredQtdadeParcelas);
        end else if qryParcelasformapagamento.AsString = 'B' then begin
          DebValor := DebValor + qryParcelasvalorvencto.AsFloat;
          Inc(DebQtdadeParcelas);
        end;
        if (qryParcelasformapagamento.AsString = 'C') or
           (qryParcelasformapagamento.AsString = 'B')
        then begin
          Parcelas[a].Numero     := qryParcelasnumero.AsInteger;
          Parcelas[a].Valor      := qryParcelasvalorvencto.AsFloat;
          Parcelas[a].FormaPagto := qryParcelasformapagamento.AsString;
          Inc(a);
        end;
        qryParcelas.Next;
      end;
    finally
      qryParcelas.EnableControls;
    end;
  end;}

begin
  NaoHaProdutosSelecionados := False;
  ReFazConsulta(qryExisteCGCCPF, [0, 1], [qryOrdemServicopessoanumero.AsString, qryOrdemServicotipocliente.AsString]);

//  qryOrdemServicocfps.Required := ((not qryServicosOrdemServico.IsEmpty) and (ParSistema.CFPSOBRIGATORIO));

  if qryOrdemServico.CheckRequiredFields then
  begin
    if (SituacaoOrdemServico <= scFATURADO) and (qryOrdemServicopessoanumero.AsString <> '') then
      ReFazConsulta(qryExisteCGCCPF,[0,1],[qryOrdemServicopessoanumero.AsString, qryOrdemServicotipocliente.AsString]);
    Result:= True;
    if Result then
    begin
      if (((qryProdutosOrdemServico.RecordCount = 0) and (qryServicosOrdemServico.RecordCount = 0)) and (SituacaoOrdemServico > scRESERVADO))then
      begin
        MensagemAviso(format(ctOSSEMPRODUTOSERVICOS,[qryOrdemServicoNumero.AsString]));
        Result := False
      end
      else if ((qryOrdemServicoequipamento.IsNull) and (qryOrdemServicoproduto.IsNull)) then
      begin
        MensagemAviso('Equipamento ou Produto não informado!');
        Result:=false;
      end
      else if SomenteBrindes then
      begin
        MensagemAviso(ctSOMENTEBRINDENOCONTRATO);
        Result := False
      end
      else if ((qryParcelas.RecordCount = 0) and (SituacaoOrdemServico>=scFATURADO)
                and NOT ((qryOrdemServicotipoequipamento.AsInteger=3) or (qryOrdemServicotipoequipamento.AsInteger=4)))then
      begin
        MensagemAviso(format(ctCONTRATOSEMPARCELAS,[qryOrdemServicoNumero.AsString]));
        Result := False
      end
      else if Not EnderecoCompleto then
      begin
        MensagemAviso(ctPLANOCOMENDERECOCOMPLETO);
        Result := False
      end
      else
      begin
        TemEntrega := False;
        TodosSelecionados := True;
        Result := True;
        qryProdutosOrdemServico.DisableControls;
        Pos := qryProdutosOrdemServico.GetBookmark;
        try
          if Result then
          begin
            if ((qryOrdemServico.State = dsInsert) and (qryOrdemServiconumero.IsNull)) then
            begin
              spcOrdemServicoProximo.Open;
              qryOrdemServiconumero.AsString := spcOrdemServicoProximonumero.AsString;
              spcOrdemServicoProximo.Close;
            end;

            NaoHaProdutosSelecionados := Not OperacaoEmBloco and (qryProdutosOrdemServico.RecordCount > 0); //and  Not TodosProdutosCancelados;
            qryProdutosOrdemServico.First;
            while Not qryProdutosOrdemServico.Eof do
            begin
              if qryProdutosOrdemServicocontrato.AsString = '' then
              begin
                qryProdutosOrdemServico.Edit;
                qryProdutosOrdemServicocontrato.AsString := qryOrdemServiconumero.AsString;
                qryProdutosOrdemServico.Post;
              end;
              if OperacaoEmBloco then
              begin
                //Verificar Variavel ProdutoNotaEmitida (OS SOMENTE TERÁ DUAS SITUAÇÕES RESERVADO E NOTA FISCAL)
                //if (SituacaoOrdemServico > scRESERVADO) {and not ProdutoNotaEmitida} then
                //begin
                //  qryProdutosOrdemServico.Edit;
                //  qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean := True;
                //  qryProdutosOrdemServico.Post;
                //end
              end
              else
              begin
                if qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean then
                  NaoHaProdutosSelecionados := False;
                //COLOQUEI EM COMENTARIO POR QUE NA OS NÃO EXISTE ENTREGA
                {if qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean
                   and (qryProdutosOrdemServicoentrega.AsString = 'S') then
                  TemEntrega := True;
                if TodosSelecionados then
                 if not qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean then
                   if ProdutoNotaEmitida or not ProdutoCancelado then
                     TodosSelecionados := false;}
              end;
              qryProdutosOrdemServico.Next;
            end;
            //Atribui o numero, Equipamento,Produto e Filial da OS
            qryServicosOrdemServico.First;
            while Not qryServicosOrdemServico.Eof do begin
              if qryServicosOrdemServicocontrato.AsString = '' then
              begin
                qryServicosOrdemServico.Edit;
                qryServicosOrdemServicocontrato.AsString := qryOrdemServiconumero.AsString;
                if not qryOrdemServicoequipamento.IsNull then
                  qryServicosOrdemServicoequipamento.AsString:= qryOrdemServicoequipamento.AsString;
                if not qryOrdemServicoproduto.IsNull then
                begin
                  qryServicosOrdemServicoproduto.Value:=qryOrdemServicoproduto.Value;
                  if not (qryOrdemServicoproduto.IsNull) and (qryOrdemServicofilialproduto.Value=0) then
                    qryOrdemServicofilialproduto.AsInteger:=FilialBase;
                  qryServicosOrdemServicofilialproduto.Value:=qryOrdemServicofilialproduto.Value;
                end;
                qryServicosOrdemServico.Post;
              end;
              qryServicosOrdemServico.Next;
            end;

            if (ParSistema.ANEXOCONTRATORECEITAOCULOS) then
            begin
              if (not qryReceitaOculos.IsEmpty) and
                (qryReceitaOculoscontrato.AsString = '') then
              begin
                qryReceitaOculos.Edit;
                qryReceitaOculoscontrato.AsString := qryOrdemServiconumero.AsString;
                qryReceitaOculos.Post;
              end;
              if qryReceitaOculos.state in [dsedit, dsinsert] then
                qryReceitaOculos.post;
            end;

          end
        finally
          qryProdutosOrdemServico.GotoBookmark(Pos);
          qryProdutosOrdemServico.FreeBookmark(Pos);
          qryProdutosOrdemServico.EnableControls
        end;

        if Result then
          try
            if SituacaoOrdemServico = scRESERVADO then
            begin
              AtualizaParcelas;
              Result := ReservarOrdemServico;
              //JOGA PARA CONSERTO CASO TIPO EQUIPAMENTO=4
              ProdutoParaConserto;
              AtribuirNumeroMovimentosContratos;
              AtribuirNumeroProdutosContratos;
            end;

            if Result then
            begin
              FInseriuProduto    := False;
              FRegistrosMarcados:= 0;
              StateAnt := qryOrdemServico.State;

              if (qryOrdemServicoprevisao.asDateTime <> qryOrdemServicoprevisao_anterior.asDateTime) and not qryOrdemServicoprevisao.isNull
                 and ParSistema.IncluirAtendimentoOrdemServicoPrevisaoEntrega then
                result := IncluirAtendimento_(qryOrdemServiconumero.AsString, qryOrdemServicocliente.AsInteger,
                                              qryOrdemServicotipocliente.AsString, OrdemServicoPrevisaoEntrega,
                                              'PREVISÃO ENTREGA ORDEM SERVIÇO ' + qryOrdemServicoNumero.asString,
                                              qryOrdemServico, qryOrdemServicoNomeSituacao.asString,
                                              qryOrdemServicoordemservico_atual.asString);

              if result then
              begin
                if qryOrdemServico.State in [dsEdit, dsInsert] then
                  qryOrdemServico.Post;

                if SituacaoOrdemServico = scORCADO then
                begin
                  AtualizaParcelas;
                  AtribuirNumeroProdutosContratos;
                  //AtribuirContratoNoCliente;

                  try
                    //if qryContratostipocliente.AsString='C' then begin
                     Perpetrar([qryOrdemServico, qryParcelas, qryProdutosOrdemServico,
                                qryServicosOrdemServico, qryReceitaOculos, qryCopiarContrato,
                                qryCopiarProdutosContrato]);
                     //AtribuirClienteNoConjuge;
                    (*end else if qryContratostipocliente.AsString='F' then
                      Perpetrar([{qryfornecedores, }qryContratos, qryParcelas, qryProdutosOrdemServico,
                                qryServicosContratos, qryProdutosListaCasamento, qryCopiarContrato,
                                qryCopiarProdutosContrato]); *)

                    RefazConsultaPorNome(qryProdutosOrdemServico, ['estado','cliente','tipocliente','ordemservico'],
                              [EstadoFilialBase, qryOrdemServicocliente.AsInteger, qryOrdemServicotipocliente.AsString, qryOrdemServiconumero.AsString]);

                    if StateAnt = dsInsert then
                    begin

                      BloquearOrdemServico(qryOrdemServiconumero.AsString);
                    end;

                    if FOperacaoCopia then
                      FOperacaoCopia:= False;

                  except
                    ReFazConsulta(qryOrdemServico,[0],[qryConsultaOrdemServiconumero.AsInteger]);
                    FecharQuerys;
                    raise;
                  end;
                end else if SituacaoOrdemServico = scRESERVADO then
                begin
                  //AtribuirContratoNoCliente;
                  try
                    //if qryContratostipocliente.AsString='C' then begin
                      Perpetrar([qryOrdemServico, qryProdutosOrdemServico,
                               qryServicosOrdemServico, qryParcelas, qryMovimentos, qryReceitaOculos, qryMovimentosProdutoEmpresa,qryProdutosReservas,
                               qryCopiarContrato, qryCopiarProdutosContrato ]);
                      //AtribuirClienteNoConjuge;
                    (*end else if qryContratostipocliente.AsString='F' then
                      Perpetrar([qryFornecedores, qryContratos, qryProdutosOrdemServico,
                               qryServicosContratos, qryParcelas, qryMovimentos, qryProdutosReservas,
                               qryProdutosListaCasamento, qryReservasListaCasamento, qryCopiarContrato,
                               qryCopiarProdutosContrato]); *)


                    RefazConsultaPorNome(qryProdutosOrdemServico, ['estado','cliente','tipocliente','ordemservico'],
                         [EstadoFilialBase, qryOrdemServicocliente.AsInteger, qryOrdemServicotipocliente.AsString, qryOrdemServiconumero.AsString]);

                    SituacaoAnt := SituacaoOrdemServico;

                    if FOperacaoCopia then
                      FOperacaoCopia:= False;

                  except
                    ReFazConsulta(qryOrdemServico,[0],[qryConsultaOrdemServiconumero.AsString]);
                    FecharQuerys;
                  raise;
                 end;
                end;
              end;
            end
          finally
            if Result then
            begin
              if Not ViaCaixa then
                FecharQuerys
            end
            else if ((SituacaoOrdemServico = scRESERVADO) and not (qryOrdemServico.State=dsInsert)) then
              ReFazConsulta(qryOrdemServico,[0],[qryOrdemServiconumero.AsInteger])
            else if SituacaoOrdemServico in [scNOTAFISCAL, scNOTAPARCIAL] then begin
              if Not ViaCaixa then
                FecharQuerys;
              if ErroECF then
                MensagemErro(ctERROECF)
              else begin
                MsgErro := '';
                for a := 0 to High(ErroNota) do
                  if ErroNota[a].Erro = ernTRANSFNAOPERMITIDA then
                    MsgErro := MsgErro + Format(ctTRANSFERENCIANAOPERMITIDA, [ErroNota[a].Msg]) + #13#10
                  else if ErroNota[a].Erro = ernSEMRESERVADO then
                    MsgErro := MsgErro + Format(ctSEMESTOQUEEMITIRNOTA, [ErroNota[a].Msg, qryOrdemServiconumero.AsString]) + #13#10
                  else if ErroNota[a].Erro = ernSEMESTOQUE then
                    MsgErro := MsgErro + Format(ctSEMESTOQUEEMITIRNOTAVENDAFUTURO, [ErroNota[a].Msg, qryOrdemServiconumero.AsString]) + #13#10;

                if MsgErro <> '' then
                   MensagemAviso(MsgErro)
              end
{              else if ErroNota = ernSEMESTOQUE then
                MensagemAviso(Format(ctSEMESTOQUEEMITIRNOTACONTRATO, [qryContratosnumero.AsString]))
              else if ErroNota = ernTRANSFNAOPERMITIDA then
                MensagemAviso(Format(ctTRANSFERENCIANAOPERMITIDA, [FiliaisErro]));}
            end else if Not ViaCaixa then
              FecharQuerys
          end
        else
          if SituacaoOrdemServico > scRESERVADO then
            qryProdutosOrdemServico.RequestLive := False;
      end
    end
  end
  else
    Result := False
end;

function Tdtmordemservico.SomenteBrindes: Boolean;
var
  Pos: TBookmark;
begin

  if ((qryServicosOrdemServico.RecordCount > 0) or (SituacaoOrdemServico<scFATURADO)) then
      Result := False
  else
  begin
    Pos := qryProdutosOrdemServico.GetBookmark;
    qryProdutosOrdemServico.DisableControls;
    Result := True;
    try
      qryProdutosOrdemServico.First;
      while Not qryProdutosOrdemServico.Eof do begin
        if Not qryProdutosOrdemServicobrinde.AsBoolean then
        begin
          Result := False;
          break
        end;
        qryProdutosOrdemServico.Next
      end
    finally
      qryProdutosOrdemServico.GotoBookmark(Pos);
      qryProdutosOrdemServico.FreeBookmark(Pos);
      qryProdutosOrdemServico.EnableControls
    end
  end
end;

function Tdtmordemservico.EnderecoCompleto: Boolean;
begin
  if (SituacaoOrdemServico = scORCADO) and
    qryPlanoPagamentoenderecocompleto.AsBoolean
  then
    Result := Not (qryOrdemServicorua.IsNull or
                   qryOrdemServicobairro.IsNull or
                   qryOrdemServicocidade.IsNull or
                   qryOrdemServicoestado.IsNull or
                   qryOrdemServicocep.IsNull)
  else
    Result := True
end;

function Tdtmordemservico.ReservarOrdemServico: Boolean;
var
  SituacaoProduto : TtecComposicao;
  MovCopiar: array of record
    Produto: int64;
    Filial: Integer;
    Quantidade: Currency;
    Tipo,
    Referencia: String
  end;

  MovExtras: array of record
    Produto: int64;
    Filial: Integer;
    Quantidade: Currency;
    Tipo,
    Referencia: String
  end;

  AtualizarReserva,
  Movimentar: Boolean;
  Referencia: String;
  a: integer;
  Qtdade,
  Futuro,
  QtdadeReservado,
  EmEstoque: Currency;
  PosProd: TBookmark;
  Existe: Boolean;
  RecordTypesAnt: TZUpdateRecordTypes;
  Prod: int64;
  Fil: Integer;

  procedure NovoMovimentoCopia(Produto: int64; Filial, Reserva: Integer; Tipo: String; Futuro: Real);
  begin
    if High(MovCopiar) = -1 then
      SetLength(MovCopiar, 1)
    else
      SetLength(MovCopiar, High(MovCopiar) + 2);

    if qryCopiarProdutosContrato.Locate('produto;filial', VarArrayOf([inttostr(Produto),Filial]),[]) then begin
      MovCopiar[High(MovCopiar)].Produto    := Produto;
      MovCopiar[High(MovCopiar)].Filial     := Filial;
      if Futuro > 0 then begin
        if qryCopiarProdutosContratoquantidade.AsCurrency <= Futuro then
          MovCopiar[High(MovCopiar)].Quantidade := qryCopiarProdutosContratoquantidade.AsCurrency
        else if qryCopiarProdutosContratoquantidade.AsCurrency > Futuro then begin
          if Tipo = 'TER' then
            MovCopiar[High(MovCopiar)].Quantidade := qryCopiarProdutosContratoquantidade.AsCurrency - Futuro
          else if Tipo = 'AQU' then
            MovCopiar[High(MovCopiar)].Quantidade := Futuro;
        end;
      end
      else
        MovCopiar[High(MovCopiar)].Quantidade := qryCopiarProdutosContratoquantidade.AsCurrency;
      MovCopiar[High(MovCopiar)].Tipo       := Tipo;
      if Reserva > 0 then
           MovCopiar[High(MovCopiar)].Referencia := 'CT ' + qryCopiarContratonumero.AsString +
                                                    ' RS ' + IntToStr(Reserva)
      else MovCopiar[High(MovCopiar)].Referencia := 'CT ' + qryCopiarContratonumero.AsString;
    end;
  end;

  procedure NovoMovimentoExtra(Qtdade: Currency; Tipo: String);
  begin
    if High(MovExtras) = -1 then
      SetLength(MovExtras, 1)
    else
      SetLength(MovExtras, High(MovExtras) + 2);
    MovExtras[High(MovExtras)].Produto    := qryMovimentosproduto.AsLargeInt;
    MovExtras[High(MovExtras)].Filial     := qryMovimentosfilial.AsInteger;
    MovExtras[High(MovExtras)].Quantidade := Qtdade;
    MovExtras[High(MovExtras)].Tipo       := Tipo;
    MovExtras[High(MovExtras)].Referencia := Referencia;
  end;

begin
  Result := True;
  if qryMovimentos.State = dsInactive then
    qryMovimentos.Open;
  if qryMovimentosProdutoEmpresa.State = dsInactive then
    qryMovimentosProdutoEmpresa.Open;

  PosProd := qryProdutosOrdemServico.GetBookmark;
//O metodo UpdateStatus nao funciona apos a execucao do metodo DisableControls

  RecordTypesAnt := qryProdutosOrdemServico.ShowRecordTypes;
  try
    if qryOrdemServicosituacao.AsString = qryOrdemServicosituacao.OldValue then
      qryProdutosOrdemServico.ShowRecordTypes := [ztModified, ztInserted, ztDeleted]
    else
      qryProdutosOrdemServico.ShowRecordTypes := [ztModified, ztInserted, ztUnmodified];
    BloquearEstoque;
    MontarProdutosReservas;
    for SituacaoProduto := stNAOCOMPOSTO to stCOMPOSTO do
    begin
      qryProdutosOrdemServico.First;
      while Not qryProdutosOrdemServico.eof do
      begin
        if  FiltrarComposto(qryProdutosOrdemServicocomposto.asboolean, SituacaoProduto) then
        begin
          Existe := qryMovimentos.Locate('produto;filial', VarArrayOf([
                                          qryProdutosOrdemServicoproduto.AsString,
                                          qryProdutosOrdemServicofilial.AsInteger]), []);
          if Not Existe then
            NovoMovimento(qryProdutosOrdemServicoproduto.AsLargeInt, qryProdutosOrdemServicofilial.AsInteger)
          else
            qryMovimentos.Edit;

          if qryProdutosOrdemServico.UpdateStatus = usDeleted then
            qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat - qryProdutosOrdemServicoquantidade.asFloat
          else
          if qryProdutosOrdemServico.UpdateStatus = usInserted then
            qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat + qryProdutosOrdemServicoquantidade.asFloat
          else
          if qryProdutosOrdemServico.UpdateStatus = usModified then
          begin
            if (qryProdutosOrdemServicoproduto.AsLargeInt <> qryProdutosOrdemServicoproduto.OldValue) or
               (qryProdutosOrdemServicofilial.AsInteger <> qryProdutosOrdemServicofilial.OldValue)then
            begin
              qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat +
                                                   qryProdutosOrdemServicoquantidade.asFloat;
              if qryOrdemServicosituacao.AsString = qryOrdemServicosituacao.OldValue then
              begin
                qryMovimentos.Post;
                if qryProdutosOrdemServicoquantidade.asFloat = qryProdutosOrdemServicoquantidade.OldValue then
                  Qtdade := qryProdutosOrdemServicoquantidade.asFloat
                else
                  Qtdade := qryProdutosOrdemServicoquantidade.OldValue;
                if qryProdutosOrdemServicoproduto.AsLargeInt = qryProdutosOrdemServicoproduto.OldValue then
                  Prod := qryProdutosOrdemServicoproduto.AsLargeInt
                else
                  Prod := qryProdutosOrdemServicoproduto.OldValue;

                if qryProdutosOrdemServicofilial.AsInteger = qryProdutosOrdemServicofilial.OldValue then
                  Fil := qryProdutosOrdemServicofilial.AsInteger
                else
                  Fil := qryProdutosOrdemServicofilial.OldValue;

                Existe := qryMovimentos.Locate('produto;filial', VarArrayOf([inttostr(Prod), Fil]), []);

                if not Existe then
                  NovoMovimento(Prod, Fil);
                qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat - Qtdade;
              end
            end
            else
            if qryProdutosOrdemServicoquantidade.asFloat <> qryProdutosOrdemServicoquantidade.OldValue then
            begin
              if qryOrdemServicosituacao.AsString = qryOrdemServicosituacao.OldValue then
                Qtdade := qryProdutosOrdemServicoquantidade.asFloat - qryProdutosOrdemServicoquantidade.OldValue
              else
                Qtdade := qryProdutosOrdemServicoquantidade.asFloat;
              qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat + Qtdade
            end
            else
              if qryOrdemServicosituacao.AsString <> qryOrdemServicosituacao.OldValue then
              qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat + qryProdutosOrdemServicoquantidade.asFloat;
          end
          else
            qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat + qryProdutosOrdemServicoquantidade.asFloat;

          if qryMovimentos.State in [dsEdit, dsInsert] then
            qryMovimentos.Post;
        end;
        qryProdutosOrdemServico.next;
      end;
    end;

    qryMovimentos.First;
    while Not qryMovimentos.Eof do
    begin
      if qryMovimentosquantidade.asFloat = 0 then
        qryMovimentos.Delete
      else
      begin
        Movimentar := True;
        if qryEstoqueBloqueio.Locate('produto;filial', VarArrayOf([
                                      qryMovimentosproduto.AsString,
                                      qryMovimentosfilial.AsInteger]), []) then
        begin
          Futuro    := qryEstoqueBloqueiofuturo.AsCurrency;
          EmEstoque := qryEstoqueBloqueioemestoque.AsCurrency;
        end
        else
        begin
          Futuro    := 0;
          EmEstoque := 0;
        end;
        qryProdutosOrdemServico.Locate('produto;filial', VarArrayOf([
                                    qryMovimentosproduto.AsString,
                                    qryMovimentosfilial.AsInteger]), []);
        qryProdutosReservas.Locate('produto;reserva;filial', VarArrayOf([
                                    qryProdutosOrdemServicoproduto.AsString,
                                    qryProdutosOrdemServicoreserva.Asinteger,
                                    qryProdutosOrdemServicofilial.AsInteger]), []);
        Referencia := 'OS ' + qryOrdemServiconumero.AsString;
        qryMovimentos.Edit;
        if qryProdutosOrdemServicoreserva.AsInteger <> 0 then
          Referencia := Referencia + ' RS ' + qryProdutosOrdemServicoreserva.AsString;
        qryMovimentosreferencia.AsString := Referencia;
        if qryMovimentosquantidade.asFloat < 0 then
        begin
          qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat * -1;
          if (qryProdutosOrdemServicoreserva.AsInteger <> 0) and Not FOperacaoCopia then
          begin
            QtdadeReservado                     := qryMovimentosquantidade.asFloat;
            qryMovimentostipomovimento.AsString := 'TPE';
            if Futuro > 0 then
              if qryMovimentosquantidade.asFloat > Futuro then
              begin
                NovoMovimentoExtra(Futuro, 'SQU');
                QtdadeReservado                   := qryMovimentosquantidade.asFloat - Futuro;
                qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat - Futuro
              end
              else
              begin
                qryMovimentostipomovimento.AsString := 'SQU';
                QtdadeReservado                     := 0;
              end;
            if QtdadeReservado > 0 then
            begin
              qryProdutosReservas.Edit;
              qryProdutosReservasquantidade.asFloat := qryProdutosReservasquantidade.asFloat - QtdadeReservado;
              qryProdutosReservasbaixado.AsCurrency    := qryProdutosReservasquantidade.asFloat;
              qryProdutosReservas.Post
            end
          end
          else if Futuro > 0 then
            if qryMovimentosquantidade.asFloat <= Futuro then
            begin
              qryMovimentostipomovimento.AsString := 'SQU';
              if FOperacaoCopia then
                NovoMovimentoCopia(qryMovimentosproduto.AsLargeInt, qryMovimentosfilial.AsInteger,
                                    qryProdutosOrdemServicoreserva.AsInteger, 'AQU', Futuro);

            end
            else
            begin
              qryMovimentostipomovimento.AsString := 'TRE';
              qryMovimentosquantidade.asFloat := qryMovimentosquantidade.asFloat - Futuro;
              if FOperacaoCopia then
                NovoMovimentoCopia(qryMovimentosproduto.AsLargeInt, qryMovimentosfilial.AsInteger,
                                   qryProdutosOrdemServicoreserva.AsInteger, 'TER', Futuro);
              NovoMovimentoExtra(Futuro, 'SQU');
              if FOperacaoCopia then
                NovoMovimentoCopia(qryMovimentosproduto.AsLargeInt, qryMovimentosfilial.AsInteger,
                                   qryProdutosOrdemServicoreserva.AsInteger, 'AQU', Futuro);
            end
          else
          begin
            qryMovimentostipomovimento.AsString := 'TRE';
            if FOperacaoCopia then
              NovoMovimentoCopia(qryMovimentosproduto.AsLargeInt, qryMovimentosfilial.AsInteger,
                                 qryProdutosOrdemServicoreserva.AsInteger, 'TER', 0);
          end
        end
        else
        begin
          if qryProdutosOrdemServicoreserva.AsInteger = 0 then
          begin
            if EmEstoque < qryMovimentosquantidade.asFloat then
            begin
              if ((qryProdutosOrdemServicovendasemestoque.AsString <> 'S') or not parsistema.PermitirVendaSemEstoque) then
              begin

                    MensagemAviso(Format(ctSEMESTOQUESEMVENDA, [
                      VarToStr(ValorCampodaTabela('produtos', ['codigo'], [qryMovimentos.FieldByName('produto').AsString], ['codigovisual'])[0]),
                      qryMovimentos.FieldByName('filial').AsString]));

                Result := False;
                break
              end
              else
              if PermitirVendaSemEstoque then
              begin
                if EmEstoque = 0 then
                  qryMovimentostipomovimento.AsString := 'AQU'
                else
                begin
                  NovoMovimentoExtra(qryMovimentosquantidade.asFloat - EmEstoque, 'AQU');
                  qryMovimentostipomovimento.AsString := 'TER';
                  qryMovimentosquantidade.asFloat := EmEstoque;
                end;
              end
              else
              begin
                Result := False;  {AQUI}
                break;
              end;
            end
            else
              qryMovimentostipomovimento.AsString := 'TER';
          end
          else
          begin
            QtdadeReservado  := 0;
            AtualizarReserva := False;
            if qryMovimentosquantidade.asFloat = qryProdutosReservassaldo.AsCurrency then
            begin
              Movimentar := False;
              Qtdade := qryMovimentosquantidade.asFloat;
              qryMovimentos.Delete;
            end
            else
            if qryMovimentosquantidade.asFloat < qryProdutosReservassaldo.AsCurrency then
            begin
              qryMovimentostipomovimento.AsString := 'TPE';
              QtdadeReservado                     := qryMovimentosquantidade.asFloat;
              Qtdade                              := qryMovimentosquantidade.asFloat;
              qryMovimentosquantidade.asFloat   := qryProdutosReservassaldo.AsCurrency - qryMovimentosquantidade.asFloat;
              AtualizarReserva                    := True;
            end
            else
            begin
              Qtdade := qryMovimentosquantidade.asFloat - qryProdutosReservassaldo.AsCurrency;
              if Qtdade > EmEstoque then
              begin
                if ((qryProdutosOrdemServicovendasemestoque.AsString <> 'S') or not parsistema.PermitirVendaSemEstoque) then
                begin
                  MensagemAviso(Format(ctSEMESTOQUESEMVENDA, [
                      VarToStr(ValorCampodaTabela('produtos', ['codigo'], [qryMovimentos.FieldByName('produto').AsString], ['codigovisual'])[0]),
                      qryMovimentos.FieldByName('filial').AsString]));

                  Result := False;
                  break
                end
                else
                if PermitirVendaSemEstoque then
                begin
                  if EmEstoque = 0 then
                  begin
                    qryMovimentostipomovimento.AsString := 'AQU';
                    qryMovimentosquantidade.asFloat   := Qtdade;
                    if qryProdutosReservassaldo.AsCurrency > 0 then
                    begin
                      Qtdade           := qryProdutosReservassaldo.AsCurrency;
                      AtualizarReserva := True;
                    end;
                  end
                  else
                  begin
                    NovoMovimentoExtra(Qtdade - EmEstoque, 'AQU');
                    qryMovimentostipomovimento.AsString := 'TEP';
                    qryMovimentosquantidade.asFloat   := EmEstoque;
                    QtdadeReservado                     := qryProdutosReservasquantidade.asFloat + EmEstoque;
                    Qtdade                              := qryProdutosReservasbaixado.AsCurrency + EmEstoque;
                    AtualizarReserva                    := True
                  end;
                end
                else
                begin
                  Result := False; {AQUI 2}
                  break;
                end;
              end
              else
              begin
                qryMovimentostipomovimento.AsString := 'TEP';
                QtdadeReservado                     := qryProdutosReservasquantidade.asFloat + Qtdade;
                qryMovimentosquantidade.asFloat   := Qtdade;
                Qtdade                              := QtdadeReservado;
                AtualizarReserva                    := True;
              end;
            end;
            if AtualizarReserva then
            begin
              qryProdutosReservas.Edit;
              if QtdadeReservado <> 0 then
                qryProdutosReservasquantidade.asFloat := QtdadeReservado;
              qryProdutosReservasbaixado.AsCurrency      := Qtdade;
              qryProdutosReservas.Post;
            end;
          end;
        end;
        if qryMovimentos.State = dsEdit then
          qryMovimentos.Post;
        if Movimentar then
          qryMovimentos.Next;
      end
    end;
    if Result then
    begin
      for a := 0 to High(MovExtras) do
      begin
        NovoMovimento(MovExtras[a].Produto, MovExtras[a].Filial);
        qryMovimentosquantidade.asFloat   := MovExtras[a].Quantidade;
        qryMovimentostipomovimento.AsString := MovExtras[a].Tipo;
        qryMovimentosreferencia.AsString    := MovExtras[a].Referencia;
        qryMovimentos.Post;
      end;

      for a := 0 to High(MovCopiar) do
      begin
        NovoMovimento(MovCopiar[a].Produto, MovCopiar[a].Filial);
        qryMovimentosquantidade.asFloat   := MovCopiar[a].Quantidade;
        qryMovimentostipomovimento.AsString := MovCopiar[a].Tipo;
        qryMovimentosreferencia.AsString    := MovCopiar[a].Referencia;
        qryMovimentos.Post;
      end;
    end;
  finally
    qryProdutosOrdemServico.ShowRecordTypes := RecordTypesAnt;
    qryProdutosOrdemServico.GotoBookmark(PosProd);
    qryProdutosOrdemServico.FreeBookmark(PosProd);
  end
end;

procedure Tdtmordemservico.MontarProdutosReservas;
const
  where = 'where ';
var
  SQLReserva: String;
begin
  SQLReserva := where;
  qryProdutosOrdemServico.First;
  while Not qryProdutosOrdemServico.Eof do begin
    if qryProdutosOrdemServicoreserva.AsInteger <> 0 then begin
      SQLReserva := SQLReserva +
      '((reserva = ' + qryProdutosOrdemServicoreserva.AsString + ')and' +
      ' (produto = ' + qryProdutosOrdemServicoproduto.AsString + ')and' +
      ' (filial  = ' + qryProdutosOrdemServicofilial.AsString  + '))or'
    end;
    qryProdutosOrdemServico.Next
  end;
  qryProdutosReservas.Close;
  if SQLReserva = where then
    SQLReserva := SQLReserva + 'false'
  else
    Delete(SQLReserva, Length(SQLReserva) - 1, 2);
  qryProdutosReservas.Sql[8] := SQLReserva;
  qryProdutosReservas.Open;
end;



{
function Tdtmordemservico.VerificarSerieFilial: Boolean;
begin
  ReFazConsulta(qrySeriesFiliais, [0, 1], [FilialBase, SerieSugestao]);
  if qrySeriesFiliais.RecordCount = 0 then begin
    MensagemAviso(format(ctFILIALSEMSERIE, [FilialBase, 'mercadorias']));
    Result := False;
  end else if qrySeriesFiliaismodelonota.IsNull then begin
    MensagemAviso(ctSERIESUGESTAOSEMMODELO);
    Result := False;
  end else
    Result := True;
end;
}

procedure Tdtmordemservico.NovoMovimento(Produto: int64; Filial: Integer);
begin
  qryMovimentos.Append;
  spcMovimentosProximo.Open;
  qryMovimentosnumero.AsInteger := spcMovimentosProximonumero.AsInteger;
  spcMovimentosProximo.Close;
  qryMovimentosproduto.AsLargeInt   := Produto;
  qryMovimentosfilial.AsInteger     := Filial;
  qryMovimentoscontrato.AsString    := qryOrdemServiconumero.AsString;
  qryMovimentoscliente.AsInteger    := qryOrdemServicocliente.AsInteger;
  qryMovimentostipocliente.AsString := qryOrdemServicotipocliente.AsString;
end;

function Tdtmordemservico.FormaPagtoSomenteDinheiro: Boolean;
var
  Pos: TBookmark;
begin
  Result := True;
  Pos := qryParcelas.GetBookmark;
  qryParcelas.DisableControls;
  try
    qryParcelas.First;
    while Not qryParcelas.Eof do begin
      if qryParcelasformapagamento.AsString <> 'D' then begin
        Result := False;
        break
      end;
      qryParcelas.Next;
    end
  finally
    qryParcelas.GotoBookmark(Pos);
    qryParcelas.FreeBookmark(Pos);
    qryParcelas.EnableControls
  end
end;


function Tdtmordemservico.PagamentoAVista: Currency;
var
  Pos: TBookmark;
  Data: TDateTime;
begin
  Result := 0;
  Pos := qryParcelas.GetBookmark;
  qryParcelas.DisableControls;
  try
    Data := IncDay(qryOrdemServicofaturamento.AsDateTime, ParSistema.DiasAtraso1);
    qryParcelas.First;
    while Not qryParcelas.Eof do
    begin
      if Data > qryParcelasdatavencto.AsDateTime then
        Result := Result + qryParcelasvalorvencto.AsCurrency;
      qryParcelas.Next
    end
  finally
    qryParcelas.GotoBookmark(Pos);
    qryParcelas.FreeBookmark(Pos);
    qryParcelas.EnableControls;
  end;
end;

procedure Tdtmordemservico.AtribuirContratoNoCliente;
begin
  if (qryClientescodigo.AsInteger <> qryOrdemServicocliente.AsInteger) and
     (qryOrdemServicotipocliente.AsString='C') then
    ReFazConsulta(qryClientes, [0], [qryOrdemServicocliente.AsInteger])
  else
    if (qryFornecedorescodigo.AsInteger <> qryOrdemServicocliente.AsInteger) and
     (qryOrdemServicotipocliente.asstring='F') then
    ReFazConsulta(qryFornecedores, [0], [qryOrdemServicocliente.AsInteger]);

  if qryClientes.Active and (qryOrdemServicotipocliente.AsString = 'C') then
    AtribuirQuery(qryClientes, qryOrdemServico)
  else
   if qryFornecedores.Active and (qryOrdemServicotipocliente.AsString = 'F') then
     AtribuirContratonoFornecedor;
end;

procedure Tdtmordemservico.AtribuirContratonoFornecedor;
begin
  qryfornecedores.Edit;
  if (qryFornecedoresrua.AsString     <> qryOrdemServicorua.AsString) or
     (qryFornecedoresestado.AsString  <> qryOrdemServicoestado.AsString) or
     (qryFornecedorescidade.AsInteger <> qryOrdemServicocidade.AsInteger) or
     (qryFornecedoresbairro.AsInteger <> qryOrdemServicobairro.AsInteger) or
     (qryFornecedorescep.AsInteger    <> qryOrdemServicocep.AsInteger) then
   qryFornecedoresenderecoalterado.AsDateTime := DataHoraLocal;

  qryFornecedoresnome.AsString        := qryOrdemServiconome.AsString;
  qryFornecedorespessoatipo.AsString  := qryOrdemServicopessoatipo.AsString;
  qryFornecedorespessoanumero.AsString:= qryOrdemServicopessoanumero.AsString;
  qryFornecedoresrua.AsString         := qryOrdemServicorua.AsString;
  qryFornecedoresnumero.value         := qryOrdemServicoendnumero.value;
  qryFornecedorescomplemento.value    := qryOrdemServicoendcomplemento.value;

  qryFornecedoresestado.AsString      := qryOrdemServicoestado.AsString;
  qryFornecedorescidade.AsInteger     := qryOrdemServicocidade.AsInteger;
  qryFornecedoresbairro.AsInteger     := qryOrdemServicobairro.AsInteger;
  qryFornecedorescep.AsInteger        := qryOrdemServicocep.AsInteger;
  qryFornecedoresfoneddd.AsInteger    := qryOrdemServicofoneddd.AsInteger;
  qryFornecedoresfonenumero.AsInteger := qryOrdemServicofonenumero.AsInteger;
  qryFornecedoresobservacoes.AsString := qryOrdemServicoobservacoes.AsString;
  qryFornecedoresemail.AsString       := qryOrdemServicoemail.AsString;
  qryFornecedoresnomecidade.AsString  := qryOrdemServiconomecidade.AsString;
  qryFornecedoresnomebairro.AsString  := qryOrdemServiconomebairro.AsString;
  qryfornecedores.post;
end;


function Tdtmordemservico.PermitirVendaSemEstoque: Boolean;
var
  UsrAut: TtecUsuarios;
  Complemento: String;
begin
  if ParSistema.SolicitarAutorizacaoVendaFutura or Not UsuarioLogin.GerenteEstoque then
  begin
    Complemento := Format(ctSEMESTOQUESEMVENDA, [qryProdutosOrdemServicoprodutovisual.AsString, qryProdutosOrdemServicofilial.AsString]);
    UsrAut := ObterAutorizacao(taLOGIN, ctVENDASEMESTOQUE, ctGERENTEESTOQUE, Complemento);
    Result := Assigned(UsrAut) and UsrAut.GerenteEstoque;
    if Assigned(UsrAut) and Not UsrAut.GerenteEstoque then
    begin
      MensagemAviso(ctUSUARIOSEMPERMISSAO);
      Result := False
    end
  end
  else
    Result := True
end;


function Tdtmordemservico.GetDadosFiscais(Value: Integer): Integer;
begin
  if (0 < Value) and (Value <= FQtdadeDadosFiscais) then
    Result := FDadosFiscais[Value-1]
  else
    Result := 0
end;

procedure Tdtmordemservico.AtribuirQuery(qr1, qr2: TtecQuery);
var
  a: Integer;
begin
  if (qr1 = qryOrdemServico) and (qr2 = qryClientes) then
  begin
    for a := 0 to qr2.Fields.Count - 1 do
    begin
      { da tabela de clientes não serão copiados estes campos }
      if ((qr2.fields[a].FieldName <> 'codigo') or
          (qr2.fields[a].FieldName <> 'enderecoalterado') or
          (qr2.fields[a].FieldName <> 'planopadrao')) then
      begin

        if (qr2.fields[a].FieldName = 'numero') then
          qr1.fieldbyname('endnumero').value := qr2.Fieldbyname('numero').Value
        else
        if (qr2.fields[a].FieldName = 'complemento') then
          qr1.fieldbyname('endcomplemento').value := qr2.Fieldbyname('complemento').Value
        else
        if qr1.FindField(qr2.fields[a].FieldName)<> nil then
           qr1.Fieldbyname(qr2.fields[a].FieldName).Value := qr2.fields[a].value;
      end
    end
  end
  else if (qr2 = qryOrdemServico) and (qr1 = qryClientes) then
  begin
    qr1.Edit;

    for a := 0 to qr1.Fields.Count - 1 do
    begin
      { da tabela de clientes não serão copiados estes campos }
      if ((qr1.fields[a].FieldName <> 'codigo') or
          (qr1.fields[a].FieldName <> 'enderecoalterado') or
          (qr1.fields[a].FieldName <> 'planopadrao'))then
      begin
        if (qr1.fields[a].FieldName = 'numero') then
          qr1.fields[a].value := qr2.Fieldbyname('endnumero').Value
        else
        if (qr1.fields[a].FieldName = 'complemento') then
          qr1.fields[a].value := qr2.Fieldbyname('endcomplemento').Value
        else
        if qr2.FindField(qr1.fields[a].FieldName)<> nil then
           qr1.fields[a].value := qr2.Fieldbyname(qr1.fields[a].FieldName).Value;
      end
    end;

    if (qryOrdemServicorua.AsString<>qryClientesrua.AsString) or
       (qryOrdemServicobairro.AsInteger<>qryClientesbairro.AsInteger) or
       (qryOrdemServicocidade.AsInteger<>qryClientescidade.AsInteger) or
       (qryOrdemServicoestado.AsString<>qryClientesestado.AsString) or
       (qryOrdemServicocep.AsInteger<>qryclientescep.AsInteger)
    then
       qryClientesenderecoalterado.AsDateTime := DataHoraLocal;
    qr1.Post
  end
end;



procedure Tdtmordemservico.AtribuirClienteNoContrato;
begin
  if qryProcuraClientetipo.AsString = 'C' then
     AtribuirQuery(qryOrdemServico, qryClientes)
  else
  if qryProcuraClientetipo.AsString = 'F' then
     AtribuirFornecedorNoContrato
  else
  if qryProcuraClientetipo.AsString = 'L' then
     AtribuirFiliaisNoContrato;


end;

procedure Tdtmordemservico.AtribuirFornecedorNoContrato;
begin
  qryOrdemServiconome.AsString         := qryFornecedoresnome.AsString;
  qryOrdemServicopessoatipo.AsString   := qryFornecedorespessoatipo.AsString;
  qryOrdemServicopessoanumero.AsString := qryFornecedorespessoanumero.AsString;
  qryOrdemServicorua.AsString          := qryFornecedoresrua.AsString;

  qryOrdemServicoendnumero.value       := qryFornecedoresnumero.value;
  qryOrdemServicoendcomplemento.value  := qryFornecedorescomplemento.value;

  qryOrdemServicoestado.AsString       := qryFornecedoresestado.AsString;
  qryOrdemServicocidade.AsInteger      := qryFornecedorescidade.AsInteger;
  qryOrdemServicobairro.AsInteger      := qryFornecedoresbairro.AsInteger;
  qryOrdemServicocep.AsInteger         := qryFornecedorescep.AsInteger;
  qryOrdemServicofoneddd.AsInteger     := qryFornecedoresfoneddd.AsInteger;
  qryOrdemServicofonenumero.AsInteger  := qryFornecedoresfonenumero.AsInteger;
  if Not qryOrdemServicofonenumero.IsNull then
    qryOrdemServicofonetipo.AsString   := 'P';
  qryOrdemServicoobservacoes.AsString  := qryFornecedoresobservacoes.AsString;
  qryOrdemServicoemail.AsString        := qryFornecedoresemail.AsString;
  qryOrdemServiconomecidade.AsString   := qryFornecedoresnomecidade.AsString;
  qryOrdemServiconomebairro.AsString   := qryFornecedoresnomebairro.AsString;

  qryOrdemServicosexo.AsString           := 'E';
  qryOrdemServicocivil.AsString          := 'O';
  qryOrdemServicorestipo.AsString        := 'P';
  qryOrdemServicoreftipo.AsString        := 'P';
  qryOrdemServicoempcomprovado.AsBoolean := False;
  qryOrdemServicocartaocredito.AsBoolean := False;
  qryOrdemServicocartaoloja.AsBoolean    := False;
  qryOrdemServicocheque.AsBoolean        := False;
  qryOrdemServicochequeespecial.AsBoolean:= False;
  qryOrdemServicoautomovel.AsBoolean     := False;
  qryOrdemServicovendaconsumidorfinal.asboolean := false;
end;

procedure Tdtmordemservico.qryOrdemServicoclienteChange(Sender: TField);
begin
  inherited;

  if qryProcuraCliente.Recordcount > 0 then
  begin
    qryOrdemServicotipocliente.AsString := qryProcuraClientetipo.AsString;
    if qryProcuraClientetipo.AsString = 'C' then
      RefazConsulta(qryClientes,[0],[qryProcuraClientecodigo.AsInteger])
    else
    if qryProcuraClientetipo.AsString = 'F' then
      ReFazConsulta(qryFornecedores,[0],[qryProcuraClientecodigo.AsInteger])
    else
    if qryProcuraClientetipo.AsString = 'L' then
      ReFazConsulta(qryFiliais,[0],[qryProcuraClientecodigo.AsInteger]);

    if PlanoPadraoClienteSemParcelas then
      qryOrdemServicoplano.AsInteger := qryClientesplanopadrao.AsInteger;

    AtribuirClienteNoContrato;
  end;
end;

procedure Tdtmordemservico.qryOrdemServicoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryOrdemServicoAfterOpen(qryOrdemServico);

  qryProcuraEquipamentosOS.ParamByName('cliente').value := qryOrdemServicocliente.value;
  qryProcuraEquipamentosOS.ParamByName('tipocliente').value := qryOrdemServicotipocliente.value;

  qryConsultaEquipamentosOS.ParamByName('cliente').value := qryOrdemServicocliente.value;
  qryConsultaEquipamentosOS.ParamByName('tipocliente').value := qryOrdemServicotipocliente.value;
  
  if qryOrdemServicotipocliente.AsString <> '' then
  begin
    qryProcuraCliente.Params[1].AsString:= qryOrdemServicotipocliente.AsString;
  end;

  if qryOrdemServicotipocliente.AsString <> '' then
  begin
    if qryProcuraCliente.ParamByName('tipocliente').AsString <> qryOrdemServicotipocliente.AsString then
    begin
      qryProcuraCliente.ParamByName('tipocliente').AsString := qryOrdemServicotipocliente.AsString;
      if qryProcuraCliente.recordcount <> 0 then
      begin
        qryProcuraCliente.close;
        qryProcuraCliente.open;
      end;
    end;
  end;

  FRegistrosMarcados:= 0;

  SituacaoAnt := SituacaoOrdemServico;


  RefazConsultaPorNome(qryNotasContrato,['contrato'],[qryOrdemServiconumero.asstring]);
  RefazConsultaPorNome(qryCuponsContrato,['contrato'],[qryOrdemServiconumero.asstring]);
  AbrirConsultaAtendimentos;
  


end;


procedure Tdtmordemservico.ImprimirOrdemServico;
const
 SQL = 'and ct.numero = %s';
var
 dtmImprimeOrdemServicos: TdtmImprimeOrdemServicos;
begin
  try

    dtmImprimeOrdemServicos := TdtmImprimeOrdemServicos.Create(self);
    with dtmImprimeOrdemServicos do
    begin
     qryOrdemServicos.MacroByName('numero').AsString := Format(SQL,[quotedstr(qryOrdemServiconumero.AsString)]);
     FParametroCabecalho:= 'Ordem de Serviço: '+ qryOrdemServicosnumero.AsString;
     Refazconsulta(qryordemservicos, [],[]);
     ImprimirRelatorio(FParametroCabecalho,'',2,false);
    end;

  finally

    if assigned(dtmImprimeOrdemServicos) then
      dtmImprimeOrdemServicos.Free;
  end;    
end;

procedure Tdtmordemservico.VoltarSituacaoOrdemServico(Situacao: TtecSituacaoContrato);
begin
  SituacaoOrdemServico := Situacao;
  qryOrdemServico.Post;
end;

procedure Tdtmordemservico.CancelarAlteracoesOrdemServico;
begin
  if (qryOrdemServico.RecordCount > 0) and (StateAnt = dsInsert) then
  begin
    BloquearOrdemServico(qryOrdemServiconumero.AsString);
    ReadOnly := FBloqueado;
    if FBloqueado then
      MensagemAviso(ctINFORMACAOSENDOEDITADA);
  end;

  if not qryParcelas.IsEmpty then
    ReFazConsulta(qryParcelas, [0], [qryOrdemServiconumero.AsString]);
  if not qryProdutosOrdemServico.IsEmpty then
     RefazConsultaPorNome(qryProdutosOrdemServico, ['estado','cliente','tipocliente','ordemservico'],
          [EstadoFilialBase, qryOrdemServicocliente.AsInteger, qryOrdemServicotipocliente.AsString, qryOrdemServiconumero.AsString]);
  if not qryServicosOrdemServico.IsEmpty then
    ReFazConsulta(qryServicosOrdemServico,[0],[qryOrdemServiconumero.AsString]);
  if not qryPlanoPagamento.IsEmpty then
    ReFazConsulta(qryPlanoPagamento, [0], [qryOrdemServicoplano.AsInteger]);

  CalcularTotais;
  {
  CalcularValorTotalProdutos;
  CalcularValorTotalServicos;
  }
  
  ReadOnly := (SituacaoOrdemServico > scRESERVADO) or FBloqueado;
  FInseriuProduto   := False;
  FRegistrosMarcados:= 0;
  if FOperacaoCopia then FOperacaoCopia:= False;

  qryCopiarContrato.Close;
  qryCopiarProdutosContrato.Close;


end;

function Tdtmordemservico.GetAlterado: Boolean;
begin
  Result := qryOrdemServico.State in [dsEdit, dsInsert]
end;

function Tdtmordemservico.getPermiteEmitirNota: Boolean;
begin
  Result := qryOrdemServicoemitirnotadepoisde.IsNull or (qryOrdemServicoemitirnotadepoisde.AsDateTime < DataServidor);
end;

procedure Tdtmordemservico.RefazConsultaOrdemServico;
begin
  ReFazConsulta(qryOrdemServico,[0],[qryOrdemServiconumero.AsString]);
end;

procedure Tdtmordemservico.RefazConsultaOrdemServico(Numero: String);
begin
  ReFazConsulta(qryOrdemServico,[0],[Numero]);
end;

function Tdtmordemservico.MarcarTodososProdutos: Boolean;
var
Pos: TBookmark;
begin
  Result:=true;
  Pos:=qryProdutosOrdemServico.GetBookmark;
  qryProdutosOrdemServico.First;
  while not qryProdutosOrdemServico.Eof do
  begin
    qryProdutosOrdemServico.Edit;
    qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean:=true;
    qryProdutosOrdemServico.Post;
    qryProdutosOrdemServico.Next;
  end;
  qryProdutosOrdemServico.GotoBookmark(Pos);
  qryProdutosOrdemServico.FreeBookmark(Pos);
end;

procedure Tdtmordemservico.RefazConsultaProdutosEntregar;
begin
  if (qryOrdemServiconumero.AsString <> '') then
    ReFazConsultaPorNome(qryProdutosEntregar,['primogenito','contrato'],[qryOrdemServicoprimogenito.AsString, qryOrdemServiconumero.AsString]);
end;

function Tdtmordemservico.GetCodigoCliente: Integer;
begin
  Result := qryOrdemServicocliente.AsInteger
end;

function Tdtmordemservico.GetTipoCliente: String;
begin
  Result := qryOrdemServicotipocliente.AsString;
end;

function Tdtmordemservico.GetClienteAtrasado: Boolean;
begin
  if qryOrdemServico.State <> dsInsert then
    Result := False
  else
  begin
    spcClientesAtrasado.Params[0].AsInteger := qryOrdemServicocliente.AsInteger;
    spcClientesAtrasado.Params[1].AsString  := qryOrdemServicotipocliente.AsString;
    spcClientesAtrasado.Open;
    Result := spcClientesAtrasadosim.AsBoolean;
    spcClientesAtrasado.Close
  end
end;

function Tdtmordemservico.GetNomeCliente: String;
begin
  Result := qryOrdemServiconome.AsString;
end;

function Tdtmordemservico.QualQuerPagamento: Boolean;
var
  PosAnt: TBookmark;
begin
  PosAnt := qryParcelas.GetBookmark;
  qryParcelas.DisableControls;
  try
    Result := False;
    qryParcelas.First;
    while Not qryParcelas.Eof do begin
      if Not (qryParcelasdatapagto.IsNull or qryParcelastipopagto.IsNull) then begin
        Result := True;
        break
      end;
      qryParcelas.Next
    end
  finally
    qryParcelas.GotoBookmark(PosAnt);
    qryParcelas.FreeBookmark(PosAnt);
    qryParcelas.EnableControls
  end
end;



function Tdtmordemservico.CancelarOrdemServicoReservado: Boolean;
var
  SituacaoProduto : TtecComposicao;
  Pos: TBookmark;
  SQL: String;
  MovExtra,
  MovExtraResPrevia: Boolean;
  Qtdade: Currency;
begin

  BloquearEstoque;
  ReadOnly := False;

  if (SituacaoOrdemServico in [scRESERVADO, scFATURADO]) then
  begin

    if qryMovimentos.State = dsInactive then
      qryMovimentos.Open;

    if qryMovimentosProdutoEmpresa.State = dsInactive then
      qryMovimentosProdutoEmpresa.Open;
    qryProdutosOrdemServico.DisableControls;
    Pos := qryProdutosOrdemServico.GetBookmark;
    try
      SQL := '';
      //TIRA DO CONSERTO O PRODUTO DA OS
      if not qryOrdemServicoproduto.IsNull then
      begin
        qryMovimentosProdutoEmpresa.Append;
        spcMovimentosProximo.Open;
        qryMovimentosProdutoEmpresanumero.AsInteger := spcMovimentosProximonumero.AsInteger;
        spcMovimentosProximo.Close;
        qryMovimentosProdutoEmpresaproduto.AsLargeInt:=qryOrdemServicoproduto.AsLargeInt;
        qryMovimentosProdutoEmpresafilial.AsInteger:=qryOrdemServicofilialvenda.AsInteger;
        qryMovimentosProdutoEmpresatipomovimento.AsString:='CFE';
        qryMovimentosProdutoEmpresaquantidade.asFloat:=1;
        qryMovimentosProdutoEmpresareferencia.AsString:='OS ' + qryOrdemServiconumero.AsString + ' CANCELAMENTO';
        qryMovimentosProdutoEmpresacontrato.AsString:=qryOrdemServiconumero.AsString;
        qryMovimentosProdutoEmpresa.Post;
      end;

      qryProdutosOrdemServico.First;
      while Not qryProdutosOrdemServico.Eof do
      begin
        SQL := SQL + '((m1.produto = ' + qryProdutosOrdemServicoproduto.AsString + ') and ' +
                      '(m1.filial = ' + qryProdutosOrdemServicofilial.AsString   + ')) or ';
        qryProdutosOrdemServico.Next
      end;
      if SQL <> '' then
      begin
        Delete(SQL, Length(SQL) - 3, 4);
        qryCancelarMov.Sql[8] := SQL;
      end;
      qryCancelarMov.Open;
      if qryCancelarMov.RecordCount > 0 then
      begin
        try
          MovExtra          := False;
          MovExtraResPrevia := False;

          for SituacaoProduto := stNAOCOMPOSTO to stCOMPOSTO do
          begin
            qryProdutosOrdemServico.First;
            while Not qryProdutosOrdemServico.Eof do
            begin
              if FiltrarComposto(qryProdutosOrdemServicocomposto.asboolean, SituacaoProduto) then
              begin
                if Not MovExtra then
                  qryCancelarMov.Locate('produto;filial', VarArrayOf([qryProdutosOrdemServicoproduto.AsString, qryProdutosOrdemServicofilial.AsInteger]), []);
                NovoMovimento(qryProdutosOrdemServicoproduto.AsLargeInt, qryProdutosOrdemServicofilial.AsInteger);
                if qryProdutosOrdemServicoquantidade.asFloat = qryProdutosOrdemServicoqtdereservaprevia.AsCurrency then
                begin
                  qryMovimentosquantidade.asFloat   := qryProdutosOrdemServicoquantidade.asFloat;
                  qryMovimentostipomovimento.AsString := 'TPE';
                end else
                begin
                  Qtdade := qryProdutosOrdemServicoquantidade.asFloat - qryProdutosOrdemServicoqtdereservaprevia.AsCurrency;
                  if Qtdade <= qryCancelarMovfuturo.AsCurrency then
                  begin
                    if qryProdutosOrdemServicoqtdereservaprevia.AsCurrency > 0 then
                    begin
                      if MovExtra then
                      begin
                        qryMovimentosquantidade.asFloat := Qtdade;
                        qryMovimentostipomovimento.AsString := 'SQU';
                      end
                      else
                      begin
                        qryMovimentosquantidade.asFloat := qryProdutosOrdemServicoqtdereservaprevia.AsCurrency;
                        qryMovimentostipomovimento.AsString := 'TPE';
                      end;
                      MovExtra := Not MovExtra;
                    end else
                    begin
                      qryMovimentosquantidade.asFloat := Qtdade;
                      qryMovimentostipomovimento.AsString := 'SQU';
                    end;
                  end else
                  begin
                    if MovExtra then
                    begin
                      qryMovimentosquantidade.asFloat := qryCancelarMovfuturo.AsCurrency;
                      qryMovimentostipomovimento.AsString := 'SQU'
                    end
                    else begin
                      if MovExtraResPrevia then
                      begin
                        if qryProdutosOrdemServicoqtdereservaprevia.AsCurrency > 0 then
                        begin
                          qryMovimentosquantidade.asFloat := qryProdutosOrdemServicoqtdereservaprevia.AsCurrency;
                          qryMovimentostipomovimento.AsString := 'TPE';
                        end
                      end else
                      begin
                        qryMovimentosquantidade.asFloat := Qtdade - qryCancelarMovfuturo.AsCurrency;
                        qryMovimentostipomovimento.AsString := 'TRE';
                      end;
                      if qryProdutosOrdemServicoqtdereservaprevia.AsCurrency > 0 then
                      begin
                        MovExtraResPrevia := Not MovExtraResPrevia;
                        MovExtra          := MovExtraResPrevia;
                      end
                    end;
                    if qryCancelarMovfuturo.AsCurrency > 0 then
                      MovExtra := Not MovExtra
                  end
                end;
                qryMovimentosreferencia.AsString  := 'OS ' + qryOrdemServiconumero.AsString + ' CANCELADA';
                qryMovimentos.Post;
              end;
              if Not (MovExtra or MovExtraResPrevia) then
                qryProdutosOrdemServico.Next;
            end
          end;
        finally
          qryCancelarMov.Close
        end
      end
    finally
      qryProdutosOrdemServico.GotoBookmark(Pos);
      qryProdutosOrdemServico.FreeBookmark(Pos);
      qryProdutosOrdemServico.EnableControls
    end;
  end;

  qryOrdemServico.Edit;
  SituacaoOrdemServico := scCANCELADO;
  if Not qryConsultaMotivoscodigo.IsNull then
    qryOrdemServicomotivo.AsInteger := qryConsultaMotivoscodigo.AsInteger;
  qryOrdemServicodescricaomotivo.AsString := qryConsultaMotivosdescricao.AsString;
  qryOrdemServico.Post;


  if (CreditoTroca <> 0) and not qryOrdemServicofaturamento.IsNull then
  begin

    if self.dtmCadastroContratos.SelecionarContrato(qryOrdemServiconumero.AsString, True) then
      if not self.dtmCadastroContratos.Bloqueado then
      begin


        self.dtmCadastroContratos.qryparcelas.readonly := false;
        self.dtmCadastroContratos.AtualizarDataParcela;

        self.dtmCadastroContratos.AtualizarSaldoCreditoCliente('E');

        if self.dtmCadastroContratos.qrycontratos.state = dsedit then
          self.dtmCadastroContratos.qrycontratos.post;


        if qryOrdemServicotipocliente.AsString = 'C' then
          Perpetrar([qryClientes, qryOrdemServico, qryMovimentos, qryMovimentosProdutoEmpresa, self.dtmCadastroContratos.qrycontratos, self.dtmCadastroContratos.qryparcelas, self.dtmCadastroContratos.qryprodutostrocados])
        else
          Perpetrar([qryFornecedores, qryOrdemServico, qryMovimentos, qryMovimentosProdutoEmpresa, self.dtmCadastroContratos.qrycontratos, self.dtmCadastroContratos.qryparcelas, self.dtmCadastroContratos.qryprodutostrocados]);

        self.dtmCadastroContratos.DesbloquearContrato;

      end;
  end
  else
  begin

    if qryOrdemServicotipocliente.AsString = 'C' then
      Perpetrar([qryClientes, qryOrdemServico, qryMovimentos, qryMovimentosProdutoEmpresa])
    else
      Perpetrar([qryFornecedores, qryOrdemServico, qryMovimentos, qryMovimentosProdutoEmpresa]);

  end;

  qryMovimentos.Close;
  ReadOnly := True;
  Result := True
end;

procedure Tdtmordemservico.ProdutoParaConserto;
begin

    if (qryOrdemServicoproduto.AsString <>
        qryOrdemServicoprodutoanterior.Asstring) and
       (SituacaoOrdemServico = scRESERVADO) and
       (qryOrdemServicoprodutoanterior.AsString<>'') then
    begin
    //CASO PRODUTO TENHA SIDO TROCADO, RETIRA CONSERTO E COLOCA EM ESTOQUE
      qryMovimentosProdutoEmpresa.Append;
      spcMovimentosProximo.Open;
      qryMovimentosProdutoEmpresanumero.AsInteger := spcMovimentosProximonumero.AsInteger;
      spcMovimentosProximo.Close;
      qryMovimentosProdutoEmpresaproduto.AsLargeInt:=qryOrdemServicoprodutoanterior.AsLargeInt;
      qryMovimentosProdutoEmpresafilial.AsInteger:=qryOrdemServicofilialvenda.OldValue;
      qryMovimentosProdutoEmpresatipomovimento.AsString:='CFE';
      qryMovimentosProdutoEmpresaquantidade.asFloat:=1;
      qryMovimentosProdutoEmpresareferencia.AsString:='OS ' + qryOrdemServiconumero.AsString;
      qryMovimentosProdutoEmpresacontrato.AsString:=qryOrdemServiconumero.AsString;
      qryMovimentosProdutoEmpresa.Post;
    end;

    //COLOCA EM CONSERTO CASO PRODUTO TENHA SIDO ALTERADO E ESTEJA PREENCHIDO
    if ((SituacaoAnt = scORCADO) or
        ((qryOrdemServicoproduto.AsString <> qryOrdemServicoprodutoanterior.Asstring) and
         (SituacaoOrdemServico = scRESERVADO))) and
       (qryOrdemServicoproduto.AsString<>'') then
    begin
      qryMovimentosProdutoEmpresa.Append;
      spcMovimentosProximo.Open;
      qryMovimentosProdutoEmpresanumero.AsInteger := spcMovimentosProximonumero.AsInteger;
      spcMovimentosProximo.Close;
      qryMovimentosProdutoEmpresaproduto.AsLargeInt:=qryOrdemServicoproduto.AsLargeInt;
      qryMovimentosProdutoEmpresafilial.AsInteger:=qryOrdemServicofilialvenda.AsInteger;
      qryMovimentosProdutoEmpresaquantidade.asFloat:=1;
      qryMovimentosProdutoEmpresatipomovimento.AsString:='TFC';
      qryMovimentosProdutoEmpresareferencia.AsString:='OS ' + qryOrdemServiconumero.AsString;
      qryMovimentosProdutoEmpresacontrato.AsString:=qryOrdemServiconumero.AsString;
      qryMovimentosProdutoEmpresa.Post;

      if not (qryOrdemServico.State in [dsedit, dsinsert]) then
        qryOrdemServico.Edit;

      qryOrdemServicoprodutoanterior.AsString := qryOrdemServicoproduto.AsString;
    end;
end;


procedure Tdtmordemservico.TiraConsertoSomaCustos;
var
Custos: Currency;
begin
   //SOMA VALOR DOS PRODUTOS E DOS SERVIÇOS
   if not qryOrdemServicoproduto.IsNull then
   begin
     qrySomaCustos.Params[0].AsString:=qryOrdemServiconumero.AsString;
     qrySomaCustos.open;
     Custos:=qrySomacustoscusto.AsCurrency;
     qrySomaCustos.Close;

     //RETIRA DO CONSERTO, ADICIONA EM ESTOQUE E ADICIONA NO CUSTO DO PRODUTO O VALOR DOS PRODUTOS DA OS
     qryMovimentosProdutoEmpresa.Append;
     spcMovimentosProximo.Open;
     qryMovimentosProdutoEmpresanumero.AsInteger := spcMovimentosProximonumero.AsInteger;
     spcMovimentosProximo.Close;
     qryMovimentosProdutoEmpresaproduto.AsLargeInt:=qryOrdemServicoproduto.AsLargeInt;
     qryMovimentosProdutoEmpresafilial.AsInteger:=qryOrdemServicofilialvenda.AsInteger;
     qryMovimentosProdutoEmpresatipomovimento.AsString:='FO+';
     qryMovimentosProdutoEmpresaquantidade.asFloat:=1;
     qryMovimentosProdutoEmpresavalor.AsCurrency:=Custos;
     qryMovimentosProdutoEmpresareferencia.AsString:='OS ' + qryOrdemServiconumero.AsString;
     qryMovimentosProdutoEmpresacontrato.AsString:=qryOrdemServiconumero.AsString;
     qryMovimentosProdutoEmpresa.Post;
   end;
end;

function Tdtmordemservico.TipoEquipamento: integer;
begin
  Result:= qryOrdemServicotipoequipamento.AsInteger;
end;

procedure Tdtmordemservico.qryClientesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryOrdemServicoautfoneddd.AsInteger:=qryClientesfoneddd.AsInteger;
  qryOrdemServicoautfonenumero.AsInteger:=qryClientesfonenumero.AsInteger;

end;

function Tdtmordemservico.PrecoVenda: Currency;
begin
  if qryOrdemServicotipoequipamento.AsInteger in [3,4] then
    Result:=qryProdutoEstoqueprecocusto.AsFloat
  else
    Result:=qryProdutoEstoquepreco.AsFloat;
end;

procedure Tdtmordemservico.AtualizaPrecosdeVenda;
begin
  if not qryProdutosOrdemServico.isempty and
     (MensagemConfirmacao('O preço de venda dos produtos serão recalculados. Confirma?')=smbok) then
  begin
    if qryProdutosOrdemServico.Active then
    begin
      GuardarRegistroAtual(qryProdutosOrdemServico,True);
      qryProdutosOrdemServico.First;
      While not qryProdutosOrdemServico.Eof do
      begin
        if qryOrdemServicotipoequipamento.AsInteger in [3,4] then
        begin
          if qryProdutosOrdemServicoprecovenda.AsFloat <> qryProdutosOrdemServicoprecocusto.AsFloat then
          begin
            qryProdutosOrdemServico.Edit;
            qryProdutosOrdemServicoprecovenda.AsFloat := qryProdutosOrdemServicoprecocusto.AsFloat;
            qryProdutosOrdemServico.Post;
            PrecisaReCalcularParcelasOrdemServico := true;
          end;
        end
        else
        begin
          if qryProdutosOrdemServicoprecovenda.AsFloat <> qryProdutosOrdemServicoprecotabela.AsFloat then
          begin
            qryProdutosOrdemServico.Edit;
            qryProdutosOrdemServicoprecovenda.AsFloat := qryProdutosOrdemServicoprecotabela.AsFloat;
            qryProdutosOrdemServico.Post;
            PrecisaReCalcularParcelasOrdemServico := true;
          end;
        end;
        qryProdutosOrdemServico.Next;
      end;
      VoltarRegistroAtual(qryProdutosOrdemServico);
      CalcularTotais;
    end;
  end;

end;

procedure Tdtmordemservico.ImprimirDuplicatas(SomenteAbertas: Boolean);
var
  dtmImprimeCarne: TdtmImprimeCarne;
begin
  dtmImprimeCarne := TdtmImprimeCarne.Create(Self);
  try
    dtmImprimeCarne.ImprimirCarnesContrato(NumeroOrdemServico, SomenteAbertas)
  finally
    dtmImprimeCarne.Free
  end
end;

function Tdtmordemservico.ExisteCFPS(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaCFPS, NomeCampo, Value);
end;

function Tdtmordemservico.GetConsultaCFPS: TZDataset;
begin
  Result := qryConsultaCFPS;
end;

function Tdtmordemservico.GetEquipamento: String;
begin
  Result := qryOrdemServicoequipamento.AsString;
end;

function Tdtmordemservico.GetTabelaProdutosEquipamentos: TZDataset;
begin
  Result := qryProdutosEquipamentosOS;
end;

function Tdtmordemservico.RefazConsultaRequisicaoOS: Boolean;
var
  produtos : String;
begin
{  if qryProdutosOrdemServico.RecordCount > 0 then
  begin
    produtos := '';
    GuardarRegistroAtual(qryProdutosOrdemServico,true);
    qryProdutosOrdemServico.First;
    while not qryProdutosOrdemServico.Eof do
    begin
      produtos := produtos + qryProdutosOrdemServicoproduto.AsString + ',';
      qryProdutosOrdemServico.Next;
    end;
    delete(produtos,length(produtos),1);
    VoltarRegistroAtual(qryProdutosOrdemServico);
    qryProdutosEquipamentosOS.MacroByName('PRODUTOS').AsString := Format('and pe.produto not in (%s)', [produtos]);
  end
  else
    qryProdutosEquipamentosOS.MacroByName('PRODUTOS').AsString := '';}
  qryProdutosEquipamentosOS.Params[0].AsString := qryOrdemServicoequipamento.AsString;
  if qryProdutosEquipamentosOS.Active then
    qryProdutosEquipamentosOS.Close;
  qryProdutosEquipamentosOS.Open;
  Result := qryProdutosEquipamentosOS.RecordCount > 0;
end;

procedure Tdtmordemservico.SelecionarRegistroRequisicao;

 procedure Selecionar;
 begin
   qryProdutosEquipamentosOS.Edit;
   qryProdutosEquipamentosOSselecionado.AsBoolean := not qryProdutosEquipamentosOSselecionado.AsBoolean;
   qryProdutosEquipamentosOS.Post;
 end;

begin
  if not qryProdutosEquipamentosOSselecionado.AsBoolean then
  begin
    if qryProdutosOrdemServico.Locate('produto',qryProdutosEquipamentosOSproduto.AsVariant,[]) then
    begin
      if MensagemConfirmacao('O produto já está incluido na ordem de serviço. Confirme a reimpressão!') = smbOk then
        Selecionar;
    end
    else
      Selecionar;
    {else
    if qryProdutosEquipamentosOSquantidade.asFloat < qryProdutosEquipamentosOSemestoque.AsCurrency then
    begin
      Selecionar;
    end
    else
      MensagemAviso('A quantidade em estoque insuficiente!');}
  end
  else
    Selecionar;
end;

procedure Tdtmordemservico.ImprimirRequisicao;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  qryProdutosEquipamentosOS.Filter := 'selecionado';
  GuardarRegistroAtual(qryProdutosEquipamentosOS, true);
  qryProdutosEquipamentosOS.First;
  while not qryProdutosEquipamentosOS.Eof do
  begin
    if qryProdutosEquipamentosOSselecionado.AsBoolean then
    begin
      qryProdutosEquipamentosOS.Filtered := True;
      break;
    end;
    qryProdutosEquipamentosOS.Next;
  end;
  {   IMPRIMIR OS SELECIONADOS, INDEPENDENTE DA QUANTIDADE. NENHUM SELECIONADO = TODOS
  if not qryProdutosEquipamentosOS.Filtered then
  begin
    qryProdutosEquipamentosOS.First;
    while not qryProdutosEquipamentosOS.Eof do
    begin
      if (qryProdutosEquipamentosOSquantidade.asFloat < qryProdutosEquipamentosOSemestoque.AsCurrency) and
         not qryProdutosOrdemServico.Locate('produto', qryProdutosEquipamentosOSproduto.AsVariant, []) then
      begin
        qryProdutosEquipamentosOS.Edit;
        qryProdutosEquipamentosOSselecionado.AsBoolean := True;
        qryProdutosEquipamentosOS.Post;
      end;
      qryProdutosEquipamentosOS.Next;
    end;
    qryProdutosEquipamentosOS.Filtered := True;
  end;}
  VoltarRegistroAtual(qryProdutosEquipamentosOS);

  FImprimindo := True;
  frVariables['titulo']:='REQUISIÇÃO DE MATERIAL';
//  frpRequisicao.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3;
  try
    Relatorio := frmPreview.frCompositeReport;
    frmPreview.frCompositeReport.Reports.Clear;
    frmPreview.frCompositeReport.Reports.Add(frpRequisicao);
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
  finally
    qryProdutosEquipamentosOS.Filtered := False;
    frmPreview.Free;
    FImprimindo := False;
  end;
end;

procedure Tdtmordemservico.IncluirProdutosRequisicaoProdutosOS;
var
  produtos : String;

  function Selecionado: Boolean;
  begin
    Result := False;
    produtos := '';
    GuardarRegistroAtual(qryProdutosEquipamentosOS, True);
    qryProdutosEquipamentosOS.First;
    while not qryProdutosEquipamentosOS.Eof do
    begin
      if qryProdutosEquipamentosOSselecionado.AsBoolean then
      begin
        Result := True;
        Break;
      end
      else
        produtos := produtos + qryProdutosEquipamentosOSproduto.AsString + ',';
      qryProdutosEquipamentosOS.Next;
    end;
    VoltarRegistroAtual(qryProdutosEquipamentosOS);
  end;

begin
//  GuardarRegistroAtual(qryProdutosEquipamentosOS, True);
  if Selecionado then
  begin
    qryProdutosEquipamentosOS.First;
    while not qryProdutosEquipamentosOS.Eof do
    begin
      if qryProdutosEquipamentosOSselecionado.AsBoolean and
         (qryProdutosEquipamentosOSquantidade.asFloat <= qryProdutosEquipamentosOSemestoque.AsCurrency) and
         not qryProdutosOrdemServico.Locate('produto', qryProdutosEquipamentosOSproduto.AsVariant, []) then
      begin
        if (qryProdutosEquipamentosOSproduto.AsString <> qryProcuraProdutoproduto.AsString) then
          RefazConsultapornome(qryProcuraProduto,['produtovisual'], [qryProdutosEquipamentosOSprodutovisual.AsString]);
        qryProdutosOrdemServico.Append;
        qryProdutosOrdemServicoproduto.AsLargeInt := qryProdutosEquipamentosOSproduto.AsLargeInt;
        qryProdutosOrdemServicoprodutovisual.AsString := qryProdutosEquipamentosOSprodutovisual.AsString;
        SelecionarProdutoContratoProcura;
        
        qryProdutosOrdemServicoquantidade.asFloat := qryProdutosEquipamentosOSquantidade.asFloat;
        qryProdutosOrdemServicodescricao.AsString := qryProdutosEquipamentosOSdescricao.AsString;


        qryProdutosOrdemServicodata.AsDateTime:=DataServidor;
        qryProdutosOrdemServicoentrega.AsString      := 'N';
        qryProdutosOrdemServicomontagem.AsString     := 'N';
        if qryProdutosOrdemServico.CheckRequiredFields then
        begin
          qryProdutosOrdemServico.Post;
          qryOrdemServico.Edit;
        end
        else
          Break;
      end;
      qryProdutosEquipamentosOS.Next;
    end;
  //  VoltarRegistroAtual(qryProdutosEquipamentosOS);
 end;
end;

procedure Tdtmordemservico.frpRequisicaoBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRequisicao, View);
end;

procedure Tdtmordemservico.qryProdutosEquipamentosOSAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if FImprimindo then
    RefazConsulta(qryProdutosCompostos, [0], [qryProdutosEquipamentosOSproduto.AsInteger]);
end;

function Tdtmordemservico.GetProdutosEquipamentosOSFiltered: Boolean;
begin
  Result := qryProdutosEquipamentosOS.Filtered;
end;

function Tdtmordemservico.GetProdutoEhComposto: Boolean;
begin
  Result := qryProdutosOrdemServicocomposto.AsBoolean;
end;

procedure Tdtmordemservico.RefazConsultaComposicaoMontagem;
begin
  ReFazConsulta(qryComponentesMontagem,[0],[qryProdutosOrdemServicoproduto.AsLargeInt]);
end;

function Tdtmordemservico.getTabelaComposicaoMontagem: TZDataset;
begin
  Result := qryComponentesMontagem;
end;

procedure Tdtmordemservico.qryProdutosEquipamentosOSFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qryProdutosEquipamentosOS.filtered then
    accept := qryProdutosEquipamentosOSselecionado.AsBoolean;
end;

procedure Tdtmordemservico.qryComponentesMontagemCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryComponentesMontagemdescricaolc.AsString := qryComponentesMontagemdescricao.AsString + ' ' +
                                                qryComponentesMontagemvalorgrade1.AsString + ' ' +
                                                qryComponentesMontagemvalorgrade2.AsString;
end;

procedure Tdtmordemservico.qryProcuraEquipamentosOSBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if (qryOrdemServicocliente.AsInteger <> qryProcuraEquipamentosOS.ParamByName('cliente').AsInteger) or
     (qryOrdemServicotipocliente.AsString <> qryProcuraEquipamentosOS.ParamByName('tipocliente').AsString) then
  begin
    qryProcuraEquipamentosOS.ParamByName('cliente').AsInteger := qryOrdemServicocliente.AsInteger;
    qryProcuraEquipamentosOS.ParamByName('tipocliente').AsString := qryOrdemServicotipocliente.AsString;

  end;
end;

procedure Tdtmordemservico.qryServicosOrdemServicoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryServicosOrdemServicoestado.AsString := EstadoFilialBase;
  qryServicosOrdemServicocidade.AsString := CodigoCidadeFilialBase;
  qryServicosOrdemServicoreterissqn.AsBoolean := false;
  qryServicosOrdemServicoquantidade.asFloat := ParSistema.ValordaQuantidade;
end;

procedure Tdtmordemservico.qryServicosOrdemServicoBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  qryServicosOrdemServicovalorissqn.AsCurrency :=
    truncar(((qryServicosOrdemServicoquantidade.asFloat * qryServicosOrdemServicovalorservico.AsCurrency) *
             qryServicosOrdemServicoaliquotaissqn.AsCurrency)/100,2);
end;


function Tdtmordemservico.IncluirEquipamentos: Boolean;
begin
 //qryEquipamentosOS.Append;
 Result:= True;
end;

function Tdtmordemservico.IncluirEquipamentosCliente(Editar: Boolean): Boolean;
{
  procedure Equipamentos;
  var
    Pos: TBookmark;
    Campos: String;
    Equipamento: String;
  begin
    Campos:= '';
    Equipamento:= qryEquipamentosClientesequipamento.AsString;
    Pos:= qryEquipamentosClientes.GetBookmark;
    try
      qryEquipamentosClientes.DisableControls;
      qryEquipamentosClientes.First;
      while not qryEquipamentosClientes.Eof do begin
        if not Editar then
          Campos:= Campos + '' + qryEquipamentosClientesequipamento.AsString + ','
        else if qryEquipamentosClientesequipamento.AsString <> Equipamento then
          Campos:= Campos + '' + qryEquipamentosClientesequipamento.AsString + ',';
        qryEquipamentosClientes.Next;
      end;
    finally
      qryEquipamentosClientes.GotoBookmark(Pos);
      qryEquipamentosClientes.FreeBookmark(Pos);
      qryEquipamentosClientes.EnableControls;
      Delete(Campos,Length(Campos),1);
      if Campos = '' then Campos:= '0';
    end;
  end;
}

begin
//  Equipamentos;
  if not Editar or qryEquipamentosClientes.IsEmpty then
  begin
    qryEquipamentosClientes.Append;
    qryEquipamentosClientescliente.AsInteger := qryOrdemServicocliente.asinteger;
    qryEquipamentosClientesEquipamento.asstring := qryOrdemServicoEquipamento.asstring;
    qryEquipamentosClientes.post;
    perpetrar([qryEquipamentosClientes], AguardareTerminarDentroDm);
  end
  else
  begin
    qryEquipamentosClientes.Edit;
    qryEquipamentosClientes.Cancel;
  end;
  Result:= True;
end;

procedure Tdtmordemservico.qryClientesAfterPost(DataSet: TDataSet);
begin
  inherited;
  if (Assigned(AfterPostClientes)) then
    AfterPostClientes(qryClientes);
end;

procedure Tdtmordemservico.qryClientesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if Assigned(OnscrollClientes) then
    OnscrollClientes(qryClientes);
end;

procedure Tdtmordemservico.qryClientesAfterClose(DataSet: TDataSet);
begin
  inherited;
  if Assigned(AfterCloseClientes) then
    AfterCloseClientes(qryClientes);
end;

procedure Tdtmordemservico.dsrReceitaOculosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if SituacaoOrdemServico < scFATURADO then
    if field <> nil then
    begin
      if qryReceitaOculos.State in [dsedit,dsinsert] then
      begin
        if not (qryOrdemServico.State in [dsedit, dsinsert]) then
          qryOrdemServico.Edit;
      end;
    end;
end;

procedure Tdtmordemservico.gravarReceitaoculos;
begin
  if qryReceitaOculos.State in [dsEdit,dsInsert] then
  begin
    qryReceitaOculoscontrato.AsString := qryOrdemServiconumero.asString;
    qryReceitaOculos.Post;
    Perpetrar([qryReceitaOculos]);
  end;
end;

function Tdtmordemservico.GetIntervaloCarnes: vString;
var
  a: integer;
begin
  a:=0;
  result := nil;
  SetLength(result, qryparcelas.RecordCount);
  qryParcelas.First;
  while not qryparcelas.Eof do
  begin
    result[a] := qryParcelasnumero.AsString;
    inc(a);
    qryparcelas.next;
  end;
end;

function Tdtmordemservico.GetIntervaloCarnesAbertas: vString;
var
  a: integer;
begin
  a:=0;
  result := nil;
  qryParcelas.First;
  while not qryparcelas.Eof do
  begin
    if qryParcelasdatapagto.AsString='' then
    begin
      SetLength(result, length(result)+1);
      result[a] := qryParcelasnumero.AsString;
      inc(a);
    end;
    qryparcelas.next;
  end;
end;

function Tdtmordemservico.getPlanoPadraoClienteSemParcelas: Boolean;
begin
  result := (qryParcelas.RecordCount = 0) and
            ParSistema.ClientesComPlanoPadrao and
            (qryClientesplanopadrao.AsInteger <> 0);
end;

function Tdtmordemservico.getClientePlanoPadrao: Integer;
begin
  result := qryClientesplanopadrao.AsInteger;
end;



procedure Tdtmordemservico.ImprimirDuplicatas(NumeroParcelas: vString);
var
  dtmImprimeCarne: TdtmImprimeCarne;
begin
  dtmImprimeCarne := TdtmImprimeCarne.Create(Self);
  try
    dtmImprimeCarne.ImprimirCarnesContrato(qryOrdemServiconumero.asstring, NumeroParcelas)
  finally
    dtmImprimeCarne.Free;
  end
end;

function Tdtmordemservico.DocumentosFiscaisOrdemServico: Boolean;
begin

  qryOrdemServicocfps.Required := ((not qryServicosOrdemServico.IsEmpty) and (ParSistema.CFPSOBRIGATORIO));

  result := qryOrdemServico.CheckRequiredFields(False, false, true, self.owner, true, false);

  if result  then
  begin

    if self.dtmCadastroContratos.SelecionarContrato(qryOrdemServiconumero.AsString, True) then
      if not self.dtmCadastroContratos.Bloqueado then
      begin


        self.dtmCadastroContratos.qryparcelas.readonly := false;
        self.dtmCadastroContratos.AtualizarDataParcela;

        if CreditoTroca <> 0 then
          self.dtmCadastroContratos.AtualizarSaldoCreditoCliente('S');

        if ehGarantia or ehCortesia then
          AtribuirDados(self.dtmCadastroContratos.qryparcelas,
                       [self.dtmCadastroContratos.qryParcelasdatapagto,
                        self.dtmCadastroContratos.qryParcelasvalorpagto,
                        self.dtmCadastroContratos.qryParcelasformapagamento],
                       [DataServidor, 0,'D']);

        if self.dtmCadastroContratos.qrycontratos.state = dsedit then
          self.dtmCadastroContratos.qrycontratos.post;

        result := perpetrar([self.dtmCadastroContratos.qrycontratos,
                   self.dtmCadastroContratos.qryparcelas,
                   self.dtmCadastroContratos.qryprodutostrocados]);

        {
        if not self.dtmCadastroContratos.qryparcelas.readonly then
        begin
          self.dtmCadastroContratos.AtualizarDataParcela;
          if self.dtmCadastroContratos.qrycontratos.state = dsedit then
            self.dtmCadastroContratos.qrycontratos.post;

          perpetrar([self.dtmCadastroContratos.qrycontratos, self.dtmCadastroContratos.qryparcelas]);
        end
        else
        begin
          self.dtmCadastroContratos.qryparcelas.readonly := false;
          self.dtmCadastroContratos.AtualizarDataParcela;
        end;
        }

        if result then
          result := self.dtmCadastroContratos.DocumentoFiscaisContrato;

        if result then
          self.dtmCadastroContratos.DesbloquearContrato;
      end;
  //  dtmCadastroContratos.SelecionarContrato('0', False);

  //  self.dtmCadastroContratos := nil;

    self.dtmCadastroContratos.Free;
    self.dtmCadastroContratos := nil;

//    RefazConsultaPorNome(qryOrdemServico, ['numero'],[qryOrdemServiconumero.AsString]);

  end;



end;

procedure Tdtmordemservico.RefazConsultaProdutoEstoque(produto: String;
  filial: integer);
const
  SQL = 'and produto = (%s)';
var
  Markup: Currency;
begin
  if ParSistema.ConsiderarMarkupClientes then
    Markup := qryProcuraClientemarkup.AsCurrency
  else
    Markup := 0;
  if ParSistema.PrecosporCargo then
    begin
      if produto <> '' then
      begin
        qryCargosCliente.MacroByName('Produto').AsString:= Format(SQL,[produto]);
        qryCargosCliente.Close;
        qryCargosCliente.Open;
        RefazConsulta(qryCargosCliente,[0],[qryProcuraClientecargocliente.AsInteger]);
        Markup := qryCargosClientemarkup.AsCurrency;
      end
      else
      Markup := 0;
    end;

  if ParSistema.UtilizarPrecoFilialBase then
    RefazConsultaPorNome(qryProdutoEstoque,['FilialBase','Markup','Codigo','Filial','Cliente','TipoCliente'],
                                    [ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual),Markup,produto,filial,
                                     qryOrdemServicocliente.AsVariant,qryOrdemServicotipocliente.AsVariant])
  else
    RefazConsultaPorNome(qryProdutoEstoque,['Filial','Markup','Codigo','Filial','Cliente','TipoCliente'],
                                    [filial,Markup,produto,filial,
                                    qryOrdemServicocliente.AsVariant,qryOrdemServicotipocliente.AsVariant]);

  RefazConsultaPrecoParaCliente;
end;

procedure Tdtmordemservico.RefazConsultaPrecoParaCliente;
begin

  if ParSistema.PrecoParaCliente then
    RefazConsultaPorNome(qryClientesProdutos,
                         ['cliente',
                          'tipocliente',
                          'produto'],
                         [qryOrdemServicocliente.AsVariant,
                          qryOrdemServicotipocliente.AsVariant,
                          inttostr(qryProdutosOrdemServicoproduto.aslargeint)]);

end;

procedure Tdtmordemservico.VerificarServicos(Editando: Boolean);
var
  Campos  : String;
  Pos     : TBookmark;
begin
  Campos:= '0,';
  qryServicosOrdemServico.DisableControls;
  Pos:= qryServicosOrdemServico.GetBookmark;
  try
    qryServicosOrdemServico.First;
    while not qryServicosOrdemServico.Eof do begin
      if (qryServicosOrdemServicoservico.AsInteger > 0) then begin
        if not Editando then
          Campos := Campos + '' + qryServicosOrdemServicoservico.AsString + ','
      end;
      qryServicosOrdemServico.Next;
    end;
  finally
    qryServicosOrdemServico.GotoBookmark(Pos);
    qryServicosOrdemServico.FreeBookmark(Pos);
    qryServicosOrdemServico.EnableControls;
    Delete(Campos,Length(Campos),1);
  end;

  qryProcuraServico.Macrobyname('SQLCondicao').asString  := Format('and not (s.codigo in (%s))', [Campos]);
  qryConsultaServicos.Sql[03]:= Format('Where not (codigo in (%s))', [Campos]);
end;


function Tdtmordemservico.getProdutoCancelado: Boolean;
begin
  Result := qryProdutosOrdemServicoquantidade.asFloat = qryProdutosOrdemServicocancelado.AsCurrency
end;

function Tdtmordemservico.getProdutoNotaEmitida: Boolean;
begin
  if qryProdutosEntregar.Active and  // Anderson
     qryProdutosEntregar.Locate('produto;filial',VarArrayOf([qryProdutosOrdemServicoproduto.AsString,
                                                             qryProdutosOrdemServicofilial.AsInteger]),[])
      then
    Result:= qryProdutosEntregarqtdade.AsCurrency = 0
  else
    Result:= qryProdutosOrdemServicoquantidade.asFloat > qryProdutosOrdemServicocancelado.AsCurrency
end;

function Tdtmordemservico.getIncluirNaNotaFiscal: Boolean;
begin
  Result := qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean
end;

procedure Tdtmordemservico.setIncluirNaNotaFiscal(const Value: Boolean);
begin

end;

function Tdtmordemservico.GetQtdadeProdutos: Integer;
begin
  Result := qryProdutosOrdemServico.RecordCount
end;

function Tdtmordemservico.getMarcarProdutoCopiar: Boolean;
begin
  Result:= qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean;
end;

procedure Tdtmordemservico.setMarcarProdutoCopiar(const Value: Boolean);
begin
  if qryProdutosOrdemServicoquantidade.AsCurrency = qryProdutosOrdemServicoqtdereservaprevia.AsCurrency then
    MensagemAviso('Produtos com RESERVA PRÉVIA igual a quantidade não podem ser copiados.')
  else if Not ReadOnly then begin
    qryProdutosOrdemServico.Edit;
    qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean:= Value;
    if Value then begin
      if qryProdutosOrdemServicoreserva.IsNull then
        qryProdutosOrdemServicoqtdecopiar.AsCurrency := qryProdutosOrdemServicoquantidade.AsCurrency
      else
        qryProdutosOrdemServicoqtdecopiar.AsCurrency := qryProdutosOrdemServicoquantidade.AsCurrency
                                                   - qryProdutosOrdemServicoqtdereservaprevia.AsCurrency;
      Inc(FRegistrosMarcados);
    end
    else begin
      qryProdutosOrdemServicoqtdecopiar.AsCurrency:= 0;
      Dec(FRegistrosMarcados);
    end;
    qryProdutosOrdemServico.Post;
    if FRegistrosMarcados > 0 then
      qryOrdemServico.Edit
    else if (SituacaoOrdemServico = scRESERVADO) then begin
      MensagemAviso('As operações realizadas no contrato serão perdidas.');
      qryOrdemServico.Cancel;
    end
  end

end;

procedure Tdtmordemservico.qryConsultaProdutosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaProdutos.ParamByName('cliente').AsInteger := qryOrdemServicocliente.AsInteger;
  qryConsultaProdutos.ParamByName('tipocliente').AsString := qryOrdemServicotipocliente.AsString;
  qryConsultaProdutos.ParamByName('parsistema_LiberarVisualizacaodeModelosProdutos').AsBoolean := parsistema.LiberarVisualizacaodeModelosProdutos;

end;

procedure Tdtmordemservico.qryProdutosOrdemServicoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryEstoque.Close;
  qryProdutosOrdemServicomontagem.AsString  := 'N';

  if ParSistema.MarcarProdutosParaEntregaContrato then
    qryProdutosOrdemServicoentrega.AsString   := 'S'
  else
    qryProdutosOrdemServicoentrega.AsString := 'N';

  qryProdutosOrdemServicoprodutolista.AsBoolean:= false;
  if VendedorDefault > 0 then
    qryProdutosOrdemServicovendedor.AsInteger := VendedorDefault;
  qryProdutosOrdemServicoquantidade.asFloat := ParSistema.ValordaQuantidade;

  qryProdutosOrdemServicoprodutomonstruario.AsBoolean := False;

  if ParSistema.MarcarProdutosParaEntregaContrato then
    qryProdutosOrdemServicoentrega.AsString   := 'S'
  else
    qryProdutosOrdemServicoentrega.AsString   := 'N';

  qryProdutosOrdemServicovalordescontoitem.AsCurrency := 0;
  qryProdutosOrdemServiconumero.AsInteger := qryProdutosOrdemServico.RecordCount + 1;

  qryProdutosOrdemServicofilial.AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);

  qryProdutosOrdemServicodata.AsDateTime:=DataServidor;

  qryProdutosOrdemServicoprodutomonstruario.AsBoolean := False;
  qryProdutosOrdemServicobrinde.asboolean := false;


end;

procedure Tdtmordemservico.qryProdutosOrdemServicoBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  LerProdutosFiliaisIncluidos(True);
end;

procedure Tdtmordemservico.AtribuirFiliaisNoContrato;
begin
  qryOrdemServiconome.AsString         := qryFiliaisnome.AsString;
  qryOrdemServicopessoatipo.AsString   := 'J';
  qryOrdemServicopessoanumero.AsString := qryFiliaisCNPJ.AsString;
  qryOrdemServicorua.AsString          := qryFiliaisRua.AsString;

  qryOrdemServicoendnumero.value       := qryFiliaisnumero.value;
  qryOrdemServicoendcomplemento.value  := qryFiliaiscomplemento.value;

  qryOrdemServicoestado.AsString       := qryFiliaisestado.AsString;
  qryOrdemServicocidade.AsInteger      := qryFiliaiscidade.AsInteger;
  qryOrdemServicobairro.AsInteger      := qryFiliaisbairro.AsInteger;
  qryOrdemServicocep.AsInteger         := qryFiliaiscep.AsInteger;
  qryOrdemServicofoneddd.AsInteger     := qryFiliaisfoneddd.AsInteger;
  qryOrdemServicofonenumero.AsInteger  := qryFiliaisfonenumero.AsInteger;
  if Not qryOrdemServicofonenumero.IsNull then
    qryOrdemServicofonetipo.AsString   := 'P';

//  qryOrdemServicoobservacoes.AsString  := qryFornecedoresobservacoes.AsString;
//  qryOrdemServicoemail.AsString        := qryFornecedoresemail.AsString;
  qryOrdemServiconomecidade.AsString   := qryFiliaisnomecidade.AsString;
  qryOrdemServiconomebairro.AsString   := qryFiliaisnomebairro.AsString;

  qryOrdemServicosexo.AsString           := 'E';
  qryOrdemServicocivil.AsString          := 'O';
  qryOrdemServicorestipo.AsString        := 'P';
  qryOrdemServicoreftipo.AsString        := 'P';
  qryOrdemServicoempcomprovado.AsBoolean := False;
  qryOrdemServicocartaocredito.AsBoolean := False;
  qryOrdemServicocartaoloja.AsBoolean    := False;
  qryOrdemServicocheque.AsBoolean        := False;
  qryOrdemServicochequeespecial.AsBoolean:= False;
  qryOrdemServicoautomovel.AsBoolean     := False;

end;

procedure Tdtmordemservico.qryProcuraClienteBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  {
  qryProcuraCliente.Params[1].AsString := qryOrdemServicotipocliente.AsString;
   }

  if not qryConsultaClientes.Active then
  begin
    if ParSistema.SelecionarSomenteClientesnasVendas then
    begin
      if qryProcuraCliente.ParamByname('codigo').AsString = qryOrdemServicocliente.AsString then
        qryProcuraCliente.ParamByname('tipocliente').AsString := qryOrdemServicotipocliente.AsString
      else
        qryProcuraCliente.ParamByname('tipocliente').AsString:= 'C';
    end
    else
      qryProcuraCliente.ParamByname('tipocliente').AsString := qryOrdemServicotipocliente.AsString;
  end;

  if qryProcuraCliente.ParamByname('tipocliente').AsString = '' then
    qryProcuraCliente.ParamByname('tipocliente').AsString:= 'C';


end;

procedure Tdtmordemservico.IncluirProdutosContratoCopia;
begin
  if not qryProdutosContratoCopia.IsEmpty then
  begin

    try
      qryProdutosContratoCopia.First;
      while not qryProdutosContratoCopia.Eof do
      begin
        if qryProdutosContratoCopiaselecionar.AsBoolean then
        begin

          qryProcuraProduto.ParamByName('produtovisual').Clear;
          
          RefazConsultaPorNome(qryProcuraProduto,['produtovisual','filialsaida','FilialPreco','estadofilialbase','estadocfo','tipopessoa'],
                                         [qryProdutosContratoCopiaprodutovisual.AsString,
                                          qryProdutosContratoCopiafilial.AsInteger,
                                          qryProdutosContratoCopiafilial.AsInteger,
                                          EstadoFilialBase,
                                          qryContratoCopiaestado.AsString,
                                          qryContratoCopiapessoatipo.AsString]);


          if not qryProdutosOrdemServico.IsEmpty and
             qryProdutosOrdemServico.Locate('produto;filial',VarArrayOf([qryProdutosContratoCopiaproduto.AsString, qryProdutosContratoCopiafilial.AsInteger]), []) then
          begin
            qryProdutosOrdemServico.Edit;
            qryProdutosOrdemServicoquantidade.AsCurrency := qryProdutosOrdemServicoquantidade.AsCurrency + qryProdutosContratoCopiaquantidade.AsCurrency;
            qryProdutosOrdemServico.Post;
            qryOrdemServico.Edit;
          end
          else
          begin
            qryProdutosOrdemServico.Append;
            qryProdutosOrdemServicoproduto.AsString        := qryProdutosContratoCopiaproduto.AsString;
            qryProdutosOrdemServicoprodutovisual.AsString  := qryProdutosContratoCopiaprodutovisual.AsString;
            qryProdutosOrdemServicoprodutodigitado.AsString := qryProdutosContratoCopiaprodutodigitado.AsString;

            qryProdutosOrdemServicofilial.AsInteger        := qryProdutosContratoCopiafilial.AsInteger;
            qryProdutosOrdemServicoprecovenda.AsCurrency   := qryProdutosContratoCopiaprecosugerido.AsCurrency;
            qryProdutosOrdemServicoquantidade.AsCurrency   := qryProdutosContratoCopiaquantidade.AsCurrency;
            qryProdutosOrdemServicodescricaoprecovenda.AsString := qryProdutosContratoCopiadescricaoprecovenda.AsString;
            if qryProdutosContratoCopiaentrega.AsString = 'S' then
               qryProdutosOrdemServicoentrega.AsString := 'S'
            else
               qryProdutosOrdemServicoentrega.AsString := 'N';

            if qryProdutosContratoCopiadias.AsInteger <= 0 then
               qryProdutosOrdemServicodias.clear
            else
               qryProdutosOrdemServicodias.AsInteger := qryProdutosContratoCopiadias.AsInteger;

            qryProdutosOrdemServicoxped.AsString := qryProdutosContratoCopiaxped.AsString;

            if not qryProdutosContratoCopianitemped.isnull then
            qryProdutosOrdemServiconitemped.asinteger := qryProdutosContratoCopianitemped.asinteger;


            qryProdutosOrdemServicoaliquotaipi.AsCurrency       := qryProcuraProdutoaliquotaipi.AsCurrency;
            qryProdutosOrdemServicoclassificacaofiscal.AsString := qryProcuraProdutoclassificacaofiscal.AsString;
            qryProdutosOrdemServicomontagemoriginal.AsBoolean   := qryProcuraProdutomontagem.AsBoolean;
            qryProdutosOrdemServicopromocao.AsBoolean           := qryProcuraProdutopromocao.AsBoolean;
            if qryProcuraProdutomontagem.AsBoolean then
               qryProdutosOrdemServicomontagem.AsString := 'S'
            else
               qryProdutosOrdemServicomontagem.AsString := 'N';

            qryProdutosOrdemServicodescricao.AsString      := qryProcuraProdutodescricao.AsString;
            qryProdutosOrdemServicovalorgrade1.AsString    := qryProcuraProdutovalorgrade1.AsString;
            qryProdutosOrdemServicovalorgrade2.AsString    := qryProcuraProdutovalorgrade2.AsString;
            qryProdutosOrdemServicolinha.AsString          := qryProcuraProdutolinha.AsString;
            qryProdutosOrdemServicocoluna.AsString         := qryProcuraProdutocoluna.AsString;
            qryProdutosOrdemServicovalorgrade2.AsString    := qryProcuraProdutovalorgrade2.AsString;
            qryProdutosOrdemServicounidade.AsString        := qryProcuraProdutounidade.AsString;
            qryProdutosOrdemServicobrinde.AsBoolean        := qryProcuraProdutobrinde.AsBoolean;
            qryProdutosOrdemServicofilial.Asinteger        := qryProcuraProdutofilial.Asinteger;
            qryProdutosOrdemServicovendasemestoque.AsString:= qryProcuraProdutovendasemestoque.AsString;
            qryProdutosOrdemServicoincidencia.AsString      := qryProcuraProdutoincidencia.AsString;
            qryProdutosOrdemServicocsosn.AsString      := qryProcuraProdutocsosn.AsString;
            qryProdutosOrdemServicoipi.AsString             := qryProcuraprodutoipi.AsString;
            qryProdutosOrdemServicocomposto.AsBoolean           := qryProcuraProdutocomposto.AsBoolean;
            qryProdutosOrdemServicodiscriminarcomposto.AsString := qryProcuraProdutodiscriminarcomposto.AsString;
            qryProdutosOrdemServicodiscriminarpreco.AsBoolean   := qryProcuraProdutodiscriminarpreco.AsBoolean;

            qryProdutosOrdemServicoaliquotaicms.AsCurrency   := qryProcuraProdutoaliquotaicms.AsCurrency;
            qryProdutosOrdemServicoaliquotaicmsst.AsCurrency := qryProcuraProdutoaliquotaicmsst.AsCurrency;

            qryProdutosOrdemServicoicms.AsInteger          := qryProcuraProdutoicms.AsInteger;
            qryProdutosOrdemServicoipicst.AsString         := qryProcuraProdutoipicst.AsString;
            qryProdutosOrdemServicoaliquotaipi.AsCurrency  := qryProcuraProdutoaliquotaipi.AsCurrency;
            qryProdutosOrdemServicoclassificacaofiscal.AsString := qryProcuraProdutoclassificacaofiscal.AsString;
            qryProdutosOrdemServicopiscst.AsString         := qryProcuraProdutopiscst.AsString;
            qryProdutosOrdemServicopisaliquota.AsCurrency  := qryProcuraprodutoaliquotapis.AsCurrency;
            qryProdutosOrdemServicocofinscst.AsString      := qryProcuraProdutocofinscst.AsString;
            qryProdutosOrdemServicocofinsaliquota.AsCurrency := qryProcuraProdutoaliquotacofins.AsCurrency;
            qryProdutosOrdemServicoicmsmodalidade.AsString := qryProcuraProdutoicmsmodalidade.AsString;
            qryProdutosOrdemServicoicmsmodsubst.AsString   := qryProcuraProdutoicmsmodsubst.AsString;
            qryProdutosOrdemServicoextipi.AsString         := qryProcuraprodutoextipi.AsString;
            qryProdutosOrdemServicogenero.AsString         := qryProcuraprodutogenero.AsString;
            qryProdutosOrdemServicoorigem.AsInteger        := qryProcuraprodutoorigem.AsInteger;

            RefazConsultaProdutoEstoque(qryProcuraProdutoProduto.AsString,
                                        qryProdutosOrdemServicofilial.AsInteger);

            qryProdutosOrdemServicoemestoque.AsCurrency := qryProdutoEstoqueemestoque.AsCurrency;
            qryProdutosOrdemServicoreservado.AsCurrency := qryProdutoEstoquereservado.AsCurrency;
            qryProdutosOrdemServicofuturo.AsCurrency    := qryProdutoEstoquefuturo.AsCurrency;
            qryProdutosOrdemServicoprecotabela.AsFloat  := qryProdutoEstoquepreco.AsFloat;

            qryProdutosOrdemServico.Post;
            qryOrdemServico.Edit;
          end;
        end;
        qryProdutosContratoCopia.Next;
      end;
    finally
      qryContratoCopia.Close;
      qryProdutosContratoCopia.Close;
    end;

  end;

end;

procedure Tdtmordemservico.AbreConsultaClientes;
begin
  inherited;
  qryConsultaClientes.Open;
end;

procedure Tdtmordemservico.SelecionarContratoCopia;
begin
  inherited;
  ReFazConsulta(qryContratoCopia, [0], [qryConsultaOrdemServiconumero.AsString]);
  qryProcuraCliente.ParamByName('tipocliente').AsString := qryContratoCopiatipocliente.AsString;
end;

procedure Tdtmordemservico.AbreConsultaContrato;
begin
  inherited;
  qryConsultaOrdemServico.MacroByName('TipoCliente').AsString := 'and tipocliente = '+quotedstr(qryConsultaClientestipoorig.AsString);
  RefazConsultaPorNome(qryConsultaOrdemServico, ['cliente'], [qryConsultaClientescodigo.AsInteger]);
end;

function Tdtmordemservico.GetTabelaConsultaContratos: TZDataset;
begin
  Result := qryConsultaOrdemServico;
end;

function Tdtmordemservico.GetTabelaConsultaClientes: TZDataset;
begin
  Result := qryConsultaClientes

end;

procedure Tdtmordemservico.SelecionarProdutosContratoCopiar(Marcar,
  Todos: Boolean);
begin
  inherited;
  if Todos then
  begin
    try
      GuardarRegistroAtual(qryProdutosContratoCopia,True);
      qryProdutosContratoCopia.First;
      while not qryProdutosContratoCopia.Eof do
      begin
        qryProdutosContratoCopia.Edit;
        qryProdutosContratoCopiaselecionar.AsBoolean := Marcar;
        qryProdutosContratoCopia.Post;
        qryProdutosContratoCopia.Next;
      end;
    finally
      VoltarRegistroAtual(qryProdutosContratoCopia);
    end;
  end
  else
  begin
    qryProdutosContratoCopia.Edit;
    qryProdutosContratoCopiaselecionar.AsBoolean := not qryProdutosContratoCopiaselecionar.AsBoolean;
    qryProdutosContratoCopia.Post;
  end;

end;

function Tdtmordemservico.GetTabelaContratoCopia: TZDataset;
begin
  result := qrycontratocopia;
end;

procedure Tdtmordemservico.AlterarPrecoProdutosContratoCopiar(
  PrecoAtual: Boolean);
begin
  inherited;
  try
    GuardarRegistroAtual(qryProdutosContratoCopia,True);
    qryProdutosContratoCopia.First;
    while not qryProdutosContratoCopia.Eof do
    begin
      qryProdutosContratoCopia.Edit;
      if PrecoAtual then
        qryProdutosContratoCopiaprecosugerido.AsFloat := qryProdutosContratoCopiaprecoatual.AsFloat
      else
        qryProdutosContratoCopiaprecosugerido.AsFloat := qryProdutosContratoCopiaprecovenda.AsFloat;
      qryProdutosContratoCopia.Post;
      qryProdutosContratoCopia.Next;
    end;
  finally
    VoltarRegistroAtual(qryProdutosContratoCopia);
  end;

end;

function Tdtmordemservico.HaProdutoContratoCopiarSelecionado: Boolean;
begin
  Result := False;

  if qryContratoCopia.Active then
  begin
    try
      GuardarRegistroAtual(qryProdutosContratoCopia,true);
      qryProdutosContratoCopia.First;
      while not qryProdutosContratoCopia.Eof do
      begin
        if qryProdutosContratoCopiaselecionar.AsBoolean then
        begin
          Result := True;
          Break;
        end;
        qryProdutosContratoCopia.Next;
      end;
      if not Result then
        Result := MensagemConfirmacao(ctNENHUMPRODUTOSELECIONADO) = smbOK;
    finally
      VoltarRegistroAtual(qryProdutosContratoCopia);
    end;
  end;
end;

procedure Tdtmordemservico.qryContratoCopiaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryProdutosContratoCopia,['MarkupClientes','Markup','MarkupCargos','Cargo','Contrato'],
                                                [ParSistema.ConsiderarMarkupClientes,
                                                 qryProcuraClientemarkup.AsCurrency,
                                                 ParSistema.PrecosporCargo,
                                                 qryProcuraClientecargocliente.AsVariant,
                                                 qryContratoCopianumero.AsString]);
  AlterarPrecoProdutosContratoCopiar(True);

end;

procedure Tdtmordemservico.qryProdutosContratoCopiaAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosContratoCopia.Cancel;

end;

function Tdtmordemservico.GetProdutoMontavel: Boolean;
begin
  Result := qryProdutosOrdemServicomontagemoriginal.AsBoolean
end;

function Tdtmordemservico.ValidarProdutosContratos: Boolean;
begin
  RefazConsulta(qryEstoque,[0],[IntToStr(qryProcuraProdutoProduto.AsLargeInt)]);
  RefazConsultaProdutoEstoque(IntToStr(qryProcuraProdutoProduto.AsLargeInt),qryProcuraProdutofilial.AsInteger);
  RefazConsultaPrecoParaCliente;

  if (qryProdutoEstoqueemestoque.AsFloat <= 0) then
  begin
    if(PermitirVendaProdutoSemEstoque) then
    begin
      SelecionarProdutoContratoProcura;
      Result:= True;
      ConsultaExecutada:= True;
    end
    else
    begin
      qryProcuraProduto.Cancel;
      qryProdutosOrdemServico.Cancel;
      Fecha(ctVendaTabelaConsultaProdutos);
      Result:= False;
      ConsultaExecutada:= True;
    end;
  end
  else
  begin
    SelecionarProdutoContratoProcura;
    Result:= True;
  end;

end;

function Tdtmordemservico.PermitirVendaProdutoSemEstoque: Boolean;
var
  UsrAut: TtecUsuarios;
  Complemento: String;
begin
  if ParSistema.ProdutoVendaFutura or Not UsuarioLogin.GerenteEstoque then begin
    Complemento := Format(ctSEMESTOQUESEMVENDA, [qryProdutosOrdemServicoprodutovisual.AsString, qryProdutosOrdemServicofilial.AsString]);
    UsrAut := ObterAutorizacao(taLOGIN, ctVENDASEMESTOQUE, ctGERENTEESTOQUE, Complemento);
    Result := Assigned(UsrAut) and UsrAut.GerenteEstoque;
    if Assigned(UsrAut) and Not UsrAut.GerenteEstoque then begin
      MensagemAviso(ctUSUARIOSEMPERMISSAO);
      Result := False
    end
  end else
    Result := True
end;

procedure Tdtmordemservico.SelecionarProdutoContratoProcura;
begin
  //ATUALIZACAO PELO CODIGO DO PRODUTO
  RefazConsulta(qryEstoque,[0],[IntToStr(qryProcuraProdutoproduto.AsLargeInt)]);

  qryConsultaFilialProduto.Params[0].AsString    := IntToStr(qryProcuraProdutoproduto.AsLargeInt);
  qryProcuraFilialProduto.Params[1].AsString     := IntToStr(qryProcuraProdutoproduto.AsLargeInt);

  if (qryProdutosOrdemServico.state in [dsedit, dsinsert]) then
  begin

    AtribuirdadosProdutos(qryProdutosOrdemServico, qryOrdemServico, nil, false, OrdemdeServico,
                          qryOrdemServicoestado.asString);

    qryProdutosOrdemServicomontagemoriginal.AsBoolean := qryProcuraProdutomontagem.AsBoolean;
    qryProdutosOrdemServicopromocao.AsBoolean:= qryProcuraProdutopromocao.AsBoolean;
    if qryProcuraProdutomontagem.AsBoolean then
       qryProdutosOrdemServicomontagem.AsString := 'S'
    else
       qryProdutosOrdemServicomontagem.AsString := 'N';

    qryProdutosOrdemServicodescricao.AsString      := qryProcuraProdutodescricao.AsString;
    qryProdutosOrdemServicovalorgrade1.AsString    := qryProcuraProdutovalorgrade1.AsString;
    qryProdutosOrdemServicovalorgrade2.AsString    := qryProcuraProdutovalorgrade2.AsString;
    qryProdutosOrdemServicolinha.AsString          := qryProcuraProdutolinha.AsString;
    qryProdutosOrdemServicocoluna.AsString         := qryProcuraProdutocoluna.AsString;
    qryProdutosOrdemServicovalorgrade2.AsString    := qryProcuraProdutovalorgrade2.AsString;
    qryProdutosOrdemServicounidade.AsString        := qryProcuraProdutounidade.AsString;
    qryProdutosOrdemServicobrinde.AsBoolean        := qryProcuraProdutobrinde.AsBoolean;
    qryProdutosOrdemServicofilial.Asinteger        := qryProcuraProdutofilial.Asinteger;
    qryProdutosOrdemServicovendasemestoque.AsString:= qryProcuraProdutovendasemestoque.AsString;
    qryProdutosOrdemServicoipi.AsString             := qryProcuraprodutoipi.AsString;
    qryProdutosOrdemServicoicms.AsInteger          := qryProcuraProdutoicms.AsInteger;
    qryProdutosOrdemServicoaliquotaicms.AsCurrency := qryProcuraProdutoaliquotaicms.AsCurrency;
    qryProdutosOrdemServicoaliquotaicmsst.AsCurrency := qryProcuraProdutoaliquotaicmsst.AsCurrency;
    qryProdutosOrdemServicoincidencia.AsString     := qryProcuraProdutoincidencia.AsString;
    qryProdutosOrdemServicocsosn.AsString          := qryProcuraProdutocsosn.AsString;
    qryProdutosOrdemServicoipicst.AsString         := qryProcuraProdutoipicst.AsString;
    qryProdutosOrdemServicoaliquotaipi.AsCurrency  := qryProcuraProdutoaliquotaipi.AsCurrency;
    qryProdutosOrdemServicoclassificacaofiscal.AsString := qryProcuraProdutoclassificacaofiscal.AsString;
    qryProdutosOrdemServicopiscst.AsString         := qryProcuraProdutopiscst.AsString;
    qryProdutosOrdemServicopisaliquota.AsCurrency  := qryProcuraprodutoaliquotapis.AsCurrency;
    qryProdutosOrdemServicocofinscst.AsString      := qryProcuraProdutocofinscst.AsString;
    qryProdutosOrdemServicocofinsaliquota.AsCurrency := qryProcuraProdutoaliquotacofins.AsCurrency;
    qryProdutosOrdemServicoicmsmodalidade.AsString := qryProcuraProdutoicmsmodalidade.AsString;
    qryProdutosOrdemServicoicmsmodsubst.AsString   := qryProcuraProdutoicmsmodsubst.AsString;
    qryProdutosOrdemServicoextipi.AsString         := qryProcuraprodutoextipi.AsString;
    qryProdutosOrdemServicogenero.AsString         := qryProcuraprodutogenero.AsString;
    qryProdutosOrdemServicoorigem.AsInteger        := qryProcuraprodutoorigem.AsInteger;

    qryProdutosOrdemServicocomposto.AsBoolean      := qryProcuraProdutocomposto.AsBoolean;
    qryProdutosOrdemServicodiscriminarcomposto.AsString := qryProcuraProdutodiscriminarcomposto.AsString;
    qryProdutosOrdemServicodiscriminarpreco.AsBoolean   := qryProcuraProdutodiscriminarpreco.AsBoolean;


    RefazConsultaProdutoEstoque(IntToStr(qryProcuraProdutoProduto.AsLargeInt),
                                 qryProdutosOrdemServicofilial.AsInteger);

    RefazConsultaPrecoParaCliente;

    qryProdutosOrdemServicoemestoque.AsCurrency := qryProdutoEstoqueemestoque.AsCurrency;
    qryProdutosOrdemServicoreservado.AsCurrency := qryProdutoEstoquereservado.AsCurrency;
    qryProdutosOrdemServicofuturo.AsCurrency    := qryProdutoEstoquefuturo.AsCurrency;

    qryProdutosOrdemServicoprecovenda.AsFloat  := PrecoVenda; //qryProdutoEstoquepreco.AsFloat;
    qryProdutosOrdemServicoprecocusto.AsFloat  := qryProdutoEstoqueprecocusto.AsFloat;
    qryProdutosOrdemServicoprecotabela.AsFloat := qryProdutoEstoquepreco.AsFloat;

  end;

  if ParSistema.MostrarSimilaresContrato then
    ReFazConsulta(qryProdutosSimilares,[0,1],[qryProcuraProdutoProduto.AsLargeInt, ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)]);

  if parsistema.LiberarVisualizacaodeModelosProdutos then
    ReFazConsulta(qryModelosCaracteristicas,[0],[qryProdutosOrdemServicoproduto.AsVariant]);

  //ATUALIZACAO PELO CODIGO DA FILIAL DO PRODUTO
  if (ParSistema.FiliaisIndependentes) then
  begin
    qryProcuraProduto.ParamByname('FilialSaida').AsInteger     := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
    qryProcuraProduto.ParamByname('FilialPreco').AsInteger     := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
  end
  else
  begin
    qryProcuraProduto.ParamByname('FilialSaida').AsInteger      := qryProcuraProdutofilial.Asinteger;
    if ParSistema.UtilizarPrecoFilialBase then
      qryProcuraProduto.ParamByname('FilialPreco').AsInteger    := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)
    else
      qryProcuraProduto.ParamByname('FilialPreco').AsInteger := qryProcuraProdutofilial.AsInteger;
  end;

  ReFazConsulta(qryProcuraReservaProduto,[2,3],[IntToStr(qryProcuraProdutoProduto.AsLargeInt),
                                                  qryProcuraProdutofilial.asinteger]);
  ReFazConsulta(qryConsultaReservasProduto,[1,2],[IntToStr(qryProcuraProdutoProduto.AsLargeInt),
                                                  qryProcuraFilialProdutocodigo.AsInteger]);

  if (qryProdutosOrdemServico.state in [dsedit, dsinsert]) then
    if qryProcuraReservaProduto.RecordCount = 0 then
      qryProdutosOrdemServicoreserva.Clear

end;

procedure Tdtmordemservico.qryProdutosOrdemServicoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarOrdemServico;
end;

procedure Tdtmordemservico.qryProdutosOrdemServicoBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarOrdemServico;
end;

procedure Tdtmordemservico.qryProdutosOrdemServicoBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if qryProdutosOrdemServicoincidencia.AsString = '' then
    qryProdutosOrdemServicoincidencia.Clear;

  if qryProdutosOrdemServicocsosn.AsString = '' then
    qryProdutosOrdemServicocsosn.Clear;

end;

function Tdtmordemservico.CopiarContrato: Boolean;
var

  Cont: Integer;
  Copiar: Boolean;
  Total: Currency;
  NovoContrato: String;
begin
  Result:= False;
  Copiar:= False;
  qryProdutosOrdemServico.First;
  while not qryProdutosOrdemServico.Eof and not Copiar do begin
    Copiar:= qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean;
    qryProdutosOrdemServico.Next;
  end;

  if Copiar then begin
    if MensagemConfirmacao('Confirma a cópia da ordem de serviço?') = smbOk then begin
      ReFazConsulta(qryCopiarContrato,[0],['']);
      ReFazConsulta(qryCopiarProdutosContrato,[0],['']);

      spcOrdemServicoProximo.Open;
      NovoContrato := spcOrdemServicoProximonumero.AsString;
      spcOrdemServicoProximo.Close;

      qryProdutosOrdemServico.DisableControls;
      qryProdutosOrdemServico.First;
      try
        Total:= 0;  Cont:= 1;
        while not qryProdutosOrdemServico.Eof do begin
          if MarcarProdutoCopiar then begin
            qryCopiarProdutosContrato.Append;
            qryCopiarProdutosContratocontrato.AsString             := NovoContrato;
            qryCopiarProdutosContratonumero.AsInteger              := Cont;
            if not qryProdutosOrdemServicoqtdecopiar.IsNull then
              qryCopiarProdutosContratoquantidade.AsCurrency        := qryProdutosOrdemServicoqtdecopiar.AsCurrency;
            if not qryProdutosOrdemServicoprecotabela.IsNull then
              qryCopiarProdutosContratoprecotabela.AsCurrency      := qryProdutosOrdemServicoprecotabela.AsCurrency;
            if not qryProdutosOrdemServicoprecovenda.IsNull then
              qryCopiarProdutosContratoprecovenda.AsCurrency       := qryProdutosOrdemServicoprecovenda.AsCurrency;
            if not qryProdutosOrdemServicodescricaoprecovenda.IsNull then
              qryCopiarProdutosContratodescricaoprecovenda.AsString:= qryProdutosOrdemServicodescricaoprecovenda.AsString;
            if not qryProdutosOrdemServicomontagem.IsNull then
              qryCopiarProdutosContratomontagem.AsString           := qryProdutosOrdemServicomontagem.AsString;
            if not qryProdutosOrdemServicoentrega.IsNull then
              qryCopiarProdutosContratoentrega.AsString            := qryProdutosOrdemServicoentrega.AsString;
            if not qryProdutosOrdemServicodias.IsNull then
              qryCopiarProdutosContratodias.AsString            := qryProdutosOrdemServicodias.AsString;
            if not qryProdutosOrdemServicoxped.IsNull then
              qryCopiarProdutosContratoxped.AsString            := qryProdutosOrdemServicoxped.AsString;

            if not qryProdutosOrdemServiconitemped.IsNull then
              qryCopiarProdutosContratonitemped.Asinteger            := qryProdutosOrdemServiconitemped.AsInteger;

            if not qryProdutosOrdemServicocancelado.IsNull then
              qryCopiarProdutosContratocancelado.AsCurrency         := qryProdutosOrdemServicocancelado.AsCurrency;

            if not qryProdutosOrdemServicoproduto.IsNull then
              qryCopiarProdutosContratoproduto.AsLargeInt           := qryProdutosOrdemServicoproduto.AsLargeInt;

            if not qryProdutosOrdemServicoprodutovisual.IsNull then
              qryCopiarProdutosContratoprodutovisual.AsString     := qryProdutosOrdemServicoprodutovisual.AsString;

            if not qryProdutosOrdemServicofilial.IsNull then
              qryCopiarProdutosContratofilial.AsInteger            := qryProdutosOrdemServicofilial.AsInteger;
            qryCopiarProdutosContratoreserva.Clear;
            if not qryProdutosOrdemServicobrinde.IsNull then
              qryCopiarProdutosContratobrinde.AsBoolean            := qryProdutosOrdemServicobrinde.AsBoolean;
            if not qryProdutosOrdemServicomovimento.IsNull then
              qryCopiarProdutosContratomovimento.AsInteger         := qryProdutosOrdemServicomovimento.AsInteger;
            if not qryProdutosOrdemServicovendedor.IsNull then
              qryCopiarProdutosContratovendedor.AsInteger          := qryProdutosOrdemServicovendedor.AsInteger;
            qryCopiarProdutosContrato.Post;

            Total:= Total + (qryProdutosOrdemServicoqtdecopiar.AsCurrency * qryProdutosOrdemServicoprecovenda.AsCurrency);
            Inc(Cont);
          end;
          qryProdutosOrdemServico.Next;
        end;

        qryCopiarProdutosContrato.First;
        while not qryCopiarProdutosContrato.Eof do begin
          if qryProdutosOrdemServico.Locate('produto;filial',
                                          VarArrayOf([qryCopiarProdutosContratoproduto.AsString,
                                                      qryCopiarProdutosContratofilial.AsInteger]),[]) then begin
            if qryCopiarProdutosContratoquantidade.AsCurrency = qryProdutosOrdemServicoquantidade.AsCurrency then
              qryProdutosOrdemServico.Delete
            else begin
              qryProdutosOrdemServico.Edit;
              qryProdutosOrdemServicoquantidade.AsCurrency:= (qryProdutosOrdemServicoquantidade.AsCurrency -
                                                          qryCopiarProdutosContratoquantidade.AsCurrency);
              qryProdutosOrdemServicoincluirnanotafiscal.AsBoolean:= False;
              qryProdutosOrdemServico.Post;
            end;
          end;
          qryCopiarProdutosContrato.Next;
        end;
      finally
        qryProdutosOrdemServico.EnableControls;
      end;

      qryCopiarContrato.Insert;
      qryCopiarContratoos.AsBoolean := true;
      qryCopiarContratonumero.AsString        := NovoContrato;
      if not qryOrdemServicodata.IsNull then
        qryCopiarContratodata.AsDateTime      := qryOrdemServicodata.AsDateTime;
      if not qryOrdemServicoavalista.IsNull then
        qryCopiarContratoavalista.AsInteger   := qryOrdemServicoavalista.AsInteger;
      if not qryOrdemServicocliente.IsNull then
        qryCopiarContratocliente.AsInteger    := qryOrdemServicocliente.AsInteger;
      if not qryOrdemServicotipocliente.IsNull then
        qryCopiarContratotipocliente.AsString := qryOrdemServicotipocliente.AsString;
      if not qryOrdemServicocontribicms.IsNull then
        qryCopiarContratocontribicms.AsBoolean := qryOrdemServicocontribicms.AsBoolean;
      if not qryOrdemServicovendedor.IsNull then
        qryCopiarContratovendedor.AsInteger   := qryOrdemServicovendedor.AsInteger;
      if not qryOrdemServicofilialvenda.IsNull then
        qryCopiarContratofilialvenda.AsInteger:= qryOrdemServicofilialvenda.AsInteger;
      qryCopiarContratovalorvista.AsCurrency  := Total;
      qryCopiarContratovalorprazo.AsCurrency  := Total;
      qryCopiarContratodesconto.Clear;
      qryCopiarContratofrete.Clear;
      qryCopiarContratoseguro.Clear;
      if not qryOrdemServicoagente.IsNull then
        qryCopiarContratoagente.AsInteger     := qryOrdemServicoagente.AsInteger;
      if not qryOrdemServicoanalista.IsNull then
        qryCopiarContratoanalista.AsInteger   := qryOrdemServicoanalista.AsInteger;
      if not qryOrdemServicoemitirnotadepoisde.IsNull then
        qryCopiarContratoemitirnotadepoisde.AsDateTime:= qryOrdemServicoemitirnotadepoisde.AsDateTime;
      if not qryOrdemServicoorigem.IsNull then
        qryCopiarContratoorigem.AsString      := qryOrdemServicoorigem.AsString;
      if not qryOrdemServicoprimogenito.IsNull then
        qryCopiarContratoprimogenito.AsString := qryOrdemServicoprimogenito.AsString;
      if not qryOrdemServicotaxajuros.IsNull then
        qryCopiarContratotaxajuros.AsFloat    := qryOrdemServicotaxajuros.AsFloat;
      if not qryOrdemServicoplano.IsNull then
        qryCopiarContratoplano.AsInteger      := qryOrdemServicoplano.AsInteger;
      if not qryOrdemServicoconsideracoes.IsNull then
        qryCopiarContratoconsideracoes.AsString:= qryOrdemServicoconsideracoes.AsString;
      qryCopiarContratoconsideracoes.AsString  := qryCopiarContratoconsideracoes.AsString +
                                                  ' Copia do Contrato: ' + qryOrdemServiconumero.AsString;
      if not qryOrdemServicoentrua.IsNull then
        qryCopiarContratoentrua.AsString      := qryOrdemServicoentrua.AsString;

      if not qryOrdemServicoentnumero.IsNull then
        qryCopiarContratoentnumero.AsString      := qryOrdemServicoentnumero.AsString;
      if not qryOrdemServicoentcomplemento.IsNull then
        qryCopiarContratoentcomplemento.AsString      := qryOrdemServicoentcomplemento.AsString;

      if not qryOrdemServicoentestado.IsNull then
        qryCopiarContratoentestado.AsString   := qryOrdemServicoentestado.AsString;
      if not qryOrdemServicoentcidade.IsNull then
        qryCopiarContratoentcidade.AsInteger  := qryOrdemServicoentcidade.AsInteger;
      if not qryOrdemServicoentbairro.IsNull then
        qryCopiarContratoentbairro.AsInteger     := qryOrdemServicoentbairro.AsInteger;
      if not qryOrdemServicoentcep.IsNull then
        qryCopiarContratoentcep.AsInteger        := qryOrdemServicoentcep.AsInteger;
      if not qryOrdemServicoentfoneddd.IsNull then
        qryCopiarContratoentfoneddd.AsInteger    := qryOrdemServicoentfoneddd.AsInteger;
      if not qryOrdemServicoentfonenumero.IsNull then
        qryCopiarContratoentfonenumero.AsInteger := qryOrdemServicoentfonenumero.AsInteger;
      if not qryOrdemServicoentfoneramal.IsNull then
        qryCopiarContratoentfoneramal.AsString   := qryOrdemServicoentfoneramal.AsString;
      if not qryOrdemServicomontagemobs.IsNull then
        qryCopiarContratomontagemobs.AsString    := qryOrdemServicomontagemobs.AsString;
      if not qryOrdemServicomontagemfilial.IsNull then
        qryCopiarContratomontagemfilial.AsInteger:= qryOrdemServicomontagemfilial.AsInteger;
      if not qryOrdemServicosituacao.IsNull then
        qryCopiarContratosituacao.AsString       := qryOrdemServicosituacao.AsString;
      if not qryOrdemServiconome.IsNull then
        qryCopiarContratonome.AsString           := qryOrdemServiconome.AsString;
      if not qryOrdemServiconascto.IsNull then
        qryCopiarContratonascto.AsDateTime       := qryOrdemServiconascto.AsDateTime;
      if not qryOrdemServicoapelido.IsNull then
        qryCopiarContratoapelido.AsString        := qryOrdemServicoapelido.AsString;
      if not qryOrdemServicosexo.IsNull then
        qryCopiarContratosexo.AsString           := qryOrdemServicosexo.AsString;
      if not qryOrdemServicocivil.IsNull then
        qryCopiarContratocivil.AsString          := qryOrdemServicocivil.AsString;
      if not qryOrdemServicocivildata.IsNull then
        qryCopiarContratocivildata.AsDateTime    := qryOrdemServicocivildata.AsDateTime;
      if not qryOrdemServicoiddocumento.IsNull then
        qryCopiarContratoiddocumento.AsString    := qryOrdemServicoiddocumento.AsString;
      if not qryOrdemServicoidorgao.IsNull then
        qryCopiarContratoidorgao.AsString        := qryOrdemServicoidorgao.AsString;
      if not qryOrdemServicoiddata.IsNull then
        qryCopiarContratoiddata.AsDateTime       := qryOrdemServicoiddata.AsDateTime;
      if not qryOrdemServicoidestado.IsNull then
        qryCopiarContratoidestado.AsString       := qryOrdemServicoidestado.AsString;
      if not qryOrdemServicopessoatipo.IsNull then
        qryCopiarContratopessoatipo.AsString     := qryOrdemServicopessoatipo.AsString;

      if not qryOrdemServicopessoanumero.IsNull then
        qryCopiarContratopessoanumero.AsString   := qryOrdemServicopessoanumero.AsString;

      if not qryOrdemServicoinscricaomunicipal.IsNull then
        qryCopiarContratoinscricaomunicipal.AsString   := qryOrdemServicoinscricaomunicipal.AsString;

      if not qryOrdemServicomae.IsNull then
        qryCopiarContratomae.AsString            := qryOrdemServicomae.AsString;
      if not qryOrdemServicopai.IsNull then
        qryCopiarContratopai.AsString            := qryOrdemServicopai.AsString;
      if not qryOrdemServicoconceito.IsNull then
        qryCopiarContratoconceito.AsInteger      := qryOrdemServicoconceito.AsInteger;
      if not qryOrdemServiconaturalcidade.IsNull then
        qryCopiarContratonaturalcidade.AsInteger := qryOrdemServiconaturalcidade.AsInteger;
      if not qryOrdemServiconaturalestado.IsNull then
        qryCopiarContratonaturalestado.AsString  := qryOrdemServiconaturalestado.AsString;
      if not qryOrdemServicorua.IsNull then
        qryCopiarContratorua.AsString            := qryOrdemServicorua.AsString;

      if not qryOrdemServicoendnumero.IsNull then
        qryCopiarContratoendnumero.AsString      := qryOrdemServicoendnumero.AsString;
      if not qryOrdemServicoendcomplemento.IsNull then
        qryCopiarContratoendcomplemento.AsString      := qryOrdemServicoendcomplemento.AsString;

      if not qryOrdemServicoestado.IsNull then
        qryCopiarContratoestado.AsString         := qryOrdemServicoestado.AsString;
      if not qryOrdemServicocidade.IsNull then
        qryCopiarContratocidade.AsInteger        := qryOrdemServicocidade.AsInteger;
      if not qryOrdemServicobairro.IsNull then
        qryCopiarContratobairro.AsInteger        := qryOrdemServicobairro.AsInteger;
      if not qryOrdemServicocep.IsNull then
        qryCopiarContratocep.AsInteger           := qryOrdemServicocep.AsInteger;
      if not qryOrdemServicofonetipo.IsNull then
        qryCopiarContratofonetipo.AsString       := qryOrdemServicofonetipo.AsString;
      if not qryOrdemServicofoneddd.IsNull then
        qryCopiarContratofoneddd.AsInteger       := qryOrdemServicofoneddd.AsInteger;
      if not qryOrdemServicofonenumero.IsNull then
        qryCopiarContratofonenumero.AsInteger    := qryOrdemServicofonenumero.AsInteger;
      if not qryOrdemServicofoneramal.IsNull then
        qryCopiarContratofoneramal.AsString      := qryOrdemServicofoneramal.AsString;
      if not qryOrdemServicofone2ddd.IsNull then
        qryCopiarContratofone2ddd.AsInteger      := qryOrdemServicofone2ddd.AsInteger;
      if not qryOrdemServicofone2numero.IsNull then
        qryCopiarContratofone2numero.AsInteger   := qryOrdemServicofone2numero.AsInteger;
      if not qryOrdemServicofone2ramal.IsNull then
        qryCopiarContratofone2ramal.AsString     := qryOrdemServicofone2ramal.AsString;
      if not qryOrdemServicorestipo.IsNull then
        qryCopiarContratorestipo.AsString        := qryOrdemServicorestipo.AsString;
      if not qryOrdemServicoresonus.IsNull then
        qryCopiarContratoresonus.AsCurrency      := qryOrdemServicoresonus.AsCurrency;
      if not qryOrdemServicorestempo.IsNull then
        qryCopiarContratorestempo.AsDateTime     := qryOrdemServicorestempo.AsDateTime;
      if not qryOrdemServicoempresa.IsNull then
        qryCopiarContratoempresa.AsString        := qryOrdemServicoempresa.AsString;
      if not qryOrdemServicoempadmissao.IsNull then
        qryCopiarContratoempadmissao.AsDateTime  := qryOrdemServicoempadmissao.AsDateTime;
      if not qryOrdemServicoempcomprovado.IsNull then
        qryCopiarContratoempcomprovado.AsBoolean := qryOrdemServicoempcomprovado.AsBoolean;
      if not qryOrdemServicoempfoneddd.Isnull then
        qryCopiarContratoempfoneddd.AsInteger    := qryOrdemServicoempfoneddd.AsInteger;
      if not qryOrdemServicoempfonenumero.IsNull then
        qryCopiarContratoempfonenumero.AsInteger := qryOrdemServicoempfonenumero.AsInteger;
      if not qryOrdemServicoempfoneramal.IsNull then
        qryCopiarContratoempfoneramal.AsString   := qryOrdemServicoempfoneramal.AsString;
      if not qryOrdemServicoempoutrasdescricao.IsNull then
        qryCopiarContratoempoutrasdescricao.AsString:= qryOrdemServicoempoutrasdescricao.AsString;
      if not qryOrdemServicoempoutrasfaixa.IsNull then
        qryCopiarContratoempoutrasfaixa.AsInteger:= qryOrdemServicoempoutrasfaixa.AsInteger;
      if not qryOrdemServicoempoutrasvalor.IsNull then
        qryCopiarContratoempoutrasvalor.AsCurrency := qryOrdemServicoempoutrasvalor.AsCurrency;
      if not qryOrdemServicoemprendafaixa.IsNull then
        qryCopiarContratoemprendafaixa.AsInteger := qryOrdemServicoemprendafaixa.AsInteger;
      if not qryOrdemServicoemprendavalor.IsNull then
        qryCopiarContratoemprendavalor.AsCurrency:= qryOrdemServicoemprendavalor.AsCurrency;
      if not qryOrdemServicoemprua.IsNull then
        qryCopiarContratoemprua.AsString         := qryOrdemServicoemprua.AsString;

      if not qryOrdemServicoempnumero.IsNull then
        qryCopiarContratoempnumero.AsString      := qryOrdemServicoempnumero.AsString;
      if not qryOrdemServicoempcomplemento.IsNull then
        qryCopiarContratoempcomplemento.AsString      := qryOrdemServicoempcomplemento.AsString;

      if not qryOrdemServicoempestado.IsNull then
        qryCopiarContratoempestado.AsString      := qryOrdemServicoempestado.AsString;
      if not qryOrdemServicoempcidade.IsNull then
        qryCopiarContratoempcidade.AsInteger     := qryOrdemServicoempcidade.AsInteger;
      if not qryOrdemServicoempbairro.IsNull then
        qryCopiarContratoempbairro.AsInteger     := qryOrdemServicoempbairro.AsInteger;
      if not qryOrdemServicoempcep.IsNull then
        qryCopiarContratoempcep.AsInteger        := qryOrdemServicoempcep.AsInteger;
      if not qryOrdemServicoempcargo.IsNull then
        qryCopiarContratoempcargo.AsInteger      := qryOrdemServicoempcargo.AsInteger;
      if not qryOrdemServicoconjuge.IsNull then
        qryCopiarContratoconjuge.AsInteger       := qryOrdemServicoconjuge.AsInteger;
      if not qryOrdemServicoconnome.IsNull then
        qryCopiarContratoconnome.AsString        := qryOrdemServicoconnome.AsString;
      if not qryOrdemServicoconadmissao.IsNull then
        qryCopiarContratoconadmissao.AsDateTime  := qryOrdemServicoconadmissao.AsDateTime;
      if not qryOrdemServicoconempresa.IsNull then
        qryCopiarContratoconempresa.AsString     := qryOrdemServicoconempresa.AsString;
      if not qryOrdemServicoconfoneddd.IsNull then
        qryCopiarContratoconfoneddd.AsInteger    := qryOrdemServicoconfoneddd.AsInteger;
      if not qryOrdemServicoconfonenumero.IsNull then
        qryCopiarContratoconfonenumero.AsInteger := qryOrdemServicoconfonenumero.AsInteger;
      if not qryOrdemServicoconfoneramal.IsNull then
        qryCopiarContratoconfoneramal.AsString   := qryOrdemServicoconfoneramal.AsString;
      if qryOrdemServicoconnascto.IsNull then
        qryCopiarContratoconnascto.AsDateTime    := qryOrdemServicoconnascto.AsDateTime;
      if not qryOrdemServicoconrendafaixa.IsNull then
        qryCopiarContratoconrendafaixa.AsInteger := qryOrdemServicoconrendafaixa.AsInteger;
      if not qryOrdemServicoconrendavalor.IsNull then
        qryCopiarContratoconrendavalor.AsCurrency:= qryOrdemServicoconrendavalor.AsCurrency;
      if not qryOrdemServicoconrua.IsNull then
        qryCopiarContratoconrua.AsString         := qryOrdemServicoconrua.AsString;

      if not qryOrdemServicoconnumero.IsNull then
        qryCopiarContratoconnumero.AsString      := qryOrdemServicoconnumero.AsString;
      if not qryOrdemServicoconcomplemento.IsNull then
        qryCopiarContratoconcomplemento.AsString      := qryOrdemServicoconcomplemento.AsString;

      if not qryOrdemServicoconestado.IsNull then
        qryCopiarContratoconestado.AsString      := qryOrdemServicoconestado.AsString;
      if not qryOrdemServicoconcidade.IsNull then
        qryCopiarContratoconcidade.AsInteger     := qryOrdemServicoconcidade.AsInteger;
      if not qryOrdemServicoconbairro.IsNull then
        qryCopiarContratoconbairro.AsInteger     := qryOrdemServicoconbairro.AsInteger;
      if not qryOrdemServicoconcep.IsNull then
        qryCopiarContratoconcep.AsInteger        := qryOrdemServicoconcep.AsInteger;
      if not qryOrdemServicoconcargo.IsNull then
        qryCopiarContratoconcargo.AsInteger      := qryOrdemServicoconcargo.AsInteger;
      if not qryOrdemServicoreferencia.IsNull then
        qryCopiarContratoreferencia.AsString     := qryOrdemServicoreferencia.AsString;
      if not qryOrdemServicoreftipo.IsNull then
        qryCopiarContratoreftipo.AsString        := qryOrdemServicoreftipo.AsString;
      if not qryOrdemServicorefrua.IsNull then
        qryCopiarContratorefrua.AsString         := qryOrdemServicorefrua.AsString;

      if not qryOrdemServicorefnumero.IsNull then
        qryCopiarContratorefnumero.AsString      := qryOrdemServicorefnumero.AsString;
      if not qryOrdemServicorefcomplemento.IsNull then
        qryCopiarContratorefcomplemento.AsString      := qryOrdemServicorefcomplemento.AsString;

      if not qryOrdemServicorefestado.IsNull then
        qryCopiarContratorefestado.AsString      := qryOrdemServicorefestado.AsString;
      if not qryOrdemServicorefcidade.IsNull then
        qryCopiarContratorefcidade.AsInteger     := qryOrdemServicorefcidade.AsInteger;
      if not qryOrdemServicorefbairro.IsNull then
        qryCopiarContratorefbairro.AsInteger     := qryOrdemServicorefbairro.AsInteger;
      if not qryOrdemServicorefcep.IsNull then
        qryCopiarContratorefcep.AsInteger        := qryOrdemServicorefcep.AsInteger;
      if not qryOrdemServicoreffoneddd.IsNull then
        qryCopiarContratoreffoneddd.AsInteger    := qryOrdemServicoreffoneddd.AsInteger;
      if not qryOrdemServicoreffonenumero.IsNull then
        qryCopiarContratoreffonenumero.AsInteger := qryOrdemServicoreffonenumero.AsInteger;
      if not qryOrdemServicoreffoneramal.IsNull then
        qryCopiarContratoreffoneramal.AsString   := qryOrdemServicoreffoneramal.AsString;
      if not qryOrdemServicoreffone2ddd.IsNull then
        qryCopiarContratoreffone2ddd.AsInteger   := qryOrdemServicoreffone2ddd.AsInteger;
      if not qryOrdemServicoreffone2numero.IsNull then
        qryCopiarContratoreffone2numero.AsInteger:= qryOrdemServicoreffone2numero.AsInteger;
      if not qryOrdemServicoreffone2ramal.IsNull then
        qryCopiarContratoreffone2ramal.AsString  := qryOrdemServicoreffone2ramal.AsString;
      if not qryOrdemServicoobservacoes.IsNull then
        qryCopiarContratoobservacoes.AsString    := qryOrdemServicoobservacoes.AsString;
      if not qryOrdemServicoemail.IsNull then
        qryCopiarContratoemail.AsString          := qryOrdemServicoemail.AsString;
      qryCopiarContratoautomovel.AsBoolean     := qryOrdemServicoautomovel.AsBoolean;
      qryCopiarContratocartaocredito.AsBoolean := qryOrdemServicocartaocredito.AsBoolean;
      qryCopiarContratocartaoloja.AsBoolean    := qryOrdemServicocartaoloja.AsBoolean;
      qryCopiarContratocheque.AsBoolean        := qryOrdemServicocheque.AsBoolean;
      qryCopiarContratochequeespecial.AsBoolean:= qryOrdemServicochequeespecial.AsBoolean;
      if not qryOrdemServicodependentes.IsNull then
        qryCopiarContratodependentes.AsInteger   := qryOrdemServicodependentes.AsInteger;
      if not qryOrdemServicoonus.IsNull then
        qryCopiarContratoonus.AsCurrency         := qryOrdemServicoonus.AsCurrency;

      if not qryOrdemServicopedidocliente.IsNull then
        qryCopiarContratopedidocliente.AsString  := qryOrdemServicopedidocliente.AsString;
      if not qryOrdemServicocreditotroca.IsNull then
        qryCopiarContratocreditotroca.AsString  := qryOrdemServicocreditotroca.AsString;
      if not qryOrdemServicodatareservado.IsNull then
        qryCopiarContratodatareservado.AsDateTime := qryOrdemServicodatareservado.AsDateTime;

      qryCopiarContrato.Post;

      MensagemAviso('O novo contrato gerado é o número: ' + qryCopiarContratonumero.AsString);
      if not (qryOrdemServico.State in [dsEdit, dsInsert]) then begin
        qryOrdemServico.Edit;
        qryOrdemServicovalorvista.AsCurrency:= qryOrdemServicovalorvista.AsCurrency - Total;
        qryOrdemServicovalorprazo.AsCurrency:= qryOrdemServicovalorprazo.AsCurrency - Total;
      end;
      FOperacaoCopia:= True;
      Result:= True;
    end;
  end
  else
    MensagemAviso('Para efetuar a cópia do contrato é necessário selecionar um produto.');
end;

procedure Tdtmordemservico.MarcarProdutosBrinde(Todos, marcando: Boolean);
  procedure marcar;
  begin
    if qryprodutosOrdemServico.RecordCount > 0 then
    begin
      qryprodutosOrdemServico.Edit;
      if todos then
        qryProdutosOrdemServicobrinde.AsBoolean := marcando
      else
        qryProdutosOrdemServicobrinde.AsBoolean := not qryProdutosOrdemServicobrinde.AsBoolean;
      qryprodutosOrdemServico.Post;
      if not (qryOrdemServico.State in [dsedit, dsinsert]) then
        qryOrdemServico.Edit;
    end;
  end;

begin
  if parsistema.PermitirAlterarBrindenoContrato then
    if SituacaoOrdemServico <= scRESERVADO then
    begin
      if not todos then
      begin
        marcar;
        CalcularTotais;
//        CalcularValorTotalProdutos;
        CalcularValorAVista;
      end
      else
      begin
        GuardarRegistroAtual(qryprodutosOrdemServico, true);
        qryprodutosOrdemServico.First;
        while not qryprodutosOrdemServico.eof do
        begin
          marcar;
          qryprodutosOrdemServico.Next;
        end;
        VoltarRegistroAtual(qryprodutosOrdemServico);
        CalcularTotais;
//        CalcularValorTotalProdutos;
        CalcularValorAVista;
      end;
    end;
end;

function Tdtmordemservico.GetTotalIPI: Currency;
begin
  result := qryordemservicototalipi.AsCurrency;
end;

function Tdtmordemservico.getContratoInserindo: Boolean;
begin
  Result:= (qryOrdemServico.State = dsInsert);
end;

function Tdtmordemservico.GetContratosRecordCount: Integer;
begin
  Result:= qryOrdemServico.RecordCount;
end;

procedure Tdtmordemservico.SelecionarProdutoContratoConsulta;
begin
  if (ParSistema.FiliaisIndependentes) then
  begin
    qryProdutosOrdemServicofilial.AsInteger   := qryConsultaProdutosfilial.AsInteger;
    qryProdutosOrdemServicoproduto.AsLargeInt := qryConsultaProdutosproduto.AsLargeInt;
    qryProdutosOrdemServicoprodutovisual.AsString := qryConsultaProdutosprodutovisual.AsString;
    qryProdutosOrdemServicoprodutodigitado.AsString := qryConsultaProdutosprodutovisual.AsString;

    qryProcuraProduto.ParamByname('FilialSaida').AsInteger     := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
    qryProcuraProduto.ParamByname('FilialPreco').AsInteger     := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);
  end
  else
  begin
    qryProdutosOrdemServicofilial.AsInteger   := qryConsultaProdutosfilial.AsInteger;
    qryProdutosOrdemServicoproduto.AsLargeInt := qryConsultaProdutosproduto.AsLargeInt;
    qryProdutosOrdemServicoprodutovisual.AsString := qryConsultaProdutosprodutovisual.AsString;
    qryProdutosOrdemServicoprodutodigitado.AsString := qryConsultaProdutosprodutovisual.AsString;

    qryProcuraProduto.ParamByname('FilialSaida').AsInteger := qryConsultaProdutosfilial.Asinteger; {liberado o comentario em 26/07/12 devido ao facto q n~stva trocando a filial}
    if ParSistema.UtilizarPrecoFilialBase then
      qryProcuraProduto.ParamByname('FilialPreco').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual)
    else
      qryProcuraProduto.ParamByname('FilialPreco').AsInteger := qryConsultaProdutosfilial.AsInteger;
  end;

end;

procedure Tdtmordemservico.qryProcuraClienteAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if qryProcuraClientecodigo.AsInteger > 0 then
    ReFazConsulta(qryContatos,[0],[qryProcuraClientecodigo.AsVariant]);

  if Assigned(OnscrollClientes) then
    OnscrollClientes(qryClientes);
    
end;

procedure Tdtmordemservico.MarcarProdutos(Marcar: Boolean);
var
 RegistroAtual : TBookMark;
begin
  RegistroAtual := qryProdutosOrdemServico.GetBookmark;
  qryProdutosOrdemServico.First;
  while not qryProdutosOrdemServico.Eof do
  begin
   if (SituacaoOrdemServico > scRESERVADO) and
      not (ProdutoNotaEmitida or ProdutoCancelado or(qryProdutosOrdemServicoentrega.AsString='S')) then
     IncluirNaNotaFiscal := Marcar
   else if SituacaoOrdemServico = scORCADO then
        MarcarProdutoCopiar := Marcar
   else if SituacaoOrdemServico = scRESERVADO then
        if not Alterado or (RegistrosMarcados > 0) then
          MarcarProdutoCopiar := Marcar
        else
        begin
          MensagemAviso('O Produto não pode ser selecionado para cópia,' + #13#10 + 'estando a Ordem de Serviço em edição.');
          break;
        end;
   qryProdutosOrdemServico.Next;
  end;
  qryProdutosOrdemServico.GotoBookmark(RegistroAtual);
  qryProdutosOrdemServico.FreeBookmark(RegistroAtual);
end;

function Tdtmordemservico.GetQtdadeServicos: Integer;
begin
  Result := qryServicosOrdemServico.RecordCount
end;

function Tdtmordemservico.getServicoCancelado: Boolean;
begin
  Result := qryServicosOrdemServicoquantidade.asFloat = qryServicosOrdemServicocancelado.AsCurrency
end;

procedure Tdtmordemservico.qryOrdemServicoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryOrdemServicoTipoEquipamento.asinteger = 4 then
    qryOrdemServicoDescricaoTipoEquipamento.asString := 'PRODUTO'
  else
    qryOrdemServicoDescricaoTipoEquipamento.asString := 'EQUIPAMENTO / VEÍCULO';

//  qryOrdemServicoTotalLiquidoServicos.AsCurrency := qryOrdemServicototalservicos.AsCurrency - qryOrdemServicoimpostoretido.AsCurrency;

end;


function Tdtmordemservico.GeteHCortesia: boolean;
begin
  feHCortesia := qryOrdemServicoos_cortesia.asBoolean;
  Result := feHCortesia;
end;

function Tdtmordemservico.GeteHGarantia: boolean;
begin
  feHGarantia := (qryOrdemServicoos_garantia.asboolean and (qryOrdemServicoos_garantia_status.asString = 'A'));
  Result := feHGarantia;
end;

procedure Tdtmordemservico.qryOrdemServicoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryOrdemServicoos_garantia_status.asstring = '' then
    qryOrdemServicoos_garantia_status.clear;
end;

procedure Tdtmordemservico.AtualizarDadosLog;
begin
  RefazConsultaPorNome(qryOrdemServico_log, ['numero'], [qryOrdemServiconumero.asvariant]);

end;

procedure Tdtmordemservico.qryOrdemServico_logCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qryOrdemServico_logtrigger_mode.asstring = 'INSERT' then
    qryOrdemServico_logtrigger_mode_d.asstring := 'I'
  else
  if qryOrdemServico_logtrigger_mode.asstring = 'UPDATE' then
    qryOrdemServico_logtrigger_mode_d.asstring := 'A';
end;

procedure Tdtmordemservico.ApagarParcelas;
begin
  LimparTabela(qryparcelas);
end;

procedure Tdtmordemservico.qryParcelasNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryParcelaspagamentoextracaixa.AsBoolean := false;
end;

function Tdtmordemservico.GetTipoDocumento: String;
begin
  result := '1';
end;

procedure Tdtmordemservico.dsrOrdemServico_logDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field = qryOrdemServicoplano then
  begin
    if not qryOrdemServicoplano.IsNull then
    begin
      ReFazConsulta(qryPlanoPagamento, [0], [qryOrdemServicoplano.AsInteger]);
      if not qryPlanoPagamentoagente.IsNull then
      begin
        if qryOrdemServicoagente.IsNull then
          qryOrdemServicoagente.AsInteger := qryPlanoPagamentoagente.AsInteger;
      end;
    end;
  end
  else
  if field = qryOrdemServicocreditotroca then
      if qryOrdemServicocreditotroca.AsCurrency <> CreditoTrocaAnt then
        PrecisaRecalcularParcelasOrdemServico := true;

end;

procedure Tdtmordemservico.qryProcuraCFPSBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryProcuraCFPS.ParamByName('pcidadeibgeemitente').AsInteger := strtoint(CodigoCidadeIBGEFilialBase);
  qryProcuraCFPS.ParambyName('pcidadeibgedestinatario').AsInteger :=  qryProcuraClientecidadeibge.AsInteger;
end;

procedure Tdtmordemservico.qryConsultaCFPSBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryConsultaCFPS.ParamByName('pcidadeibgeemitente').AsInteger := strtoint(CodigoCidadeIBGEFilialBase);
  qryConsultaCFPS.ParambyName('pcidadeibgedestinatario').AsInteger :=  qryProcuraClientecidadeibge.AsInteger;
end;

procedure Tdtmordemservico.qryProcuraServicoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryProcuraServico.ParamByName('filialemissao').asInteger := {qryOrdemServicofilialvenda.AsInteger;} FilialBase;
end;

procedure Tdtmordemservico.ImprimirCarne(SomenteAbertas: Boolean);
var
  dtmImprimeCarne: TdtmImprimeCarne;
begin
  dtmImprimeCarne := TdtmImprimeCarne.Create(Self);
  try
    dtmImprimeCarne.ImprimirCarnesContrato(NumeroOrdemServico, SomenteAbertas)
  finally
    if assigned(dtmImprimeCarne) then
      freeandnil(dtmImprimeCarne);
//    dtmImprimeCarne.Free;
  end
end;

procedure Tdtmordemservico.ImprimirCarne(NumeroParcelas: vString);
var
  dtmImprimeCarne: TdtmImprimeCarne;
begin
  dtmImprimeCarne := TdtmImprimeCarne.Create(Self);
  try
    dtmImprimeCarne.ImprimirCarnesContrato(NumeroOrdemServico, NumeroParcelas)
  finally
    if assigned(dtmImprimeCarne) then
      freeandnil(dtmImprimeCarne);
//      dtmImprimeCarne.Free;
  end
end;

procedure Tdtmordemservico.ImprimirBoleto(NumeroParcelas: vString);
var
  dtmImprimeBoleto: TdtmImprimeBoleto;
begin
  if VerificarParametrosImpressaoBoletos then
  begin
    dtmImprimeBoleto := TdtmImprimeBoleto.Create(Self);
    try
      dtmImprimeBoleto.ImprimirBoletoContrato(NumeroOrdemServico, NumeroParcelas)
    finally

      if assigned(dtmImprimeBoleto) then
        freeandnil(dtmImprimeBoleto);

//      dtmImprimeBoleto.Free;
    end
  end;

end;

function Tdtmordemservico.VerificarParametrosImpressaoBoletos: Boolean;
begin

  result := true;

  if Parsistema.Permitir_a_impressa_de_boleto_somente_se_o_contrato_estiver_como_NF and
     not (SituacaoOrdemServico in [scNOTAPARCIAL, scNOTAFISCAL]) then
  begin
    MensagemAviso('O contrato não está com a situação "NOTA FISCAL" ou "NOTA PARCIAL".'+chr(13)+
                  'Veja O parâmetro "Permitir a impressão de boleto somente se o contrato estiver como NF"');
    result := false;
  end
  else
  if ParSistema.Bloquear_a_impressao_de_boleto_se_a_filial_logada_nao_foi_a_que_gerou_a_nota and
     not qryNotasContrato.Locate('filial', filialbase,[]) then
  begin
    MensagemAviso('Documento fiscal de outra filial ou inexistente.'+chr(13)+
                  'Veja O parâmetro "Bloquear a impressão de boleto se a filial logada não foi a que gerou a nota"');
    result := false;
  end
  else
  begin
//    ReFazConsultaPorNome(qryPlanoPagamento, ['codigo'], [qryContratosplano.AsInteger]);
    if not qryPlanoPagamentopermitirimpressaodoboleto.asBoolean then
    begin
      MensagemAviso(Format('Existe uma restrição neste plano que não permite a impressão do boleto.'+chr(13)+
                    'Veja a opção "Permitir Impressão do Boleto" em Cadastro, Tabelas, Plano de Pagamentos, Código %s.',
                    [qryOrdemServicoplano.asString]));

      result := false;
    end;
  end;



end;

procedure Tdtmordemservico.EnviarPDFBoletoViaEmail(
  NumeroParcelas: vString);
var
  vListaBoletos : TStringList;
begin

   if VerificarParametrosImpressaoBoletos then
   begin

     try
       vListaBoletos := TSTringList.create;

       frmEnviarEmail := TfrmEnviarEmail.Create(frmEnviarEmail,UsuarioLogin.HostSmtp,
           ListadeEmailsContrato(qryOrdemServiconumero.asString),
                           qryOrdemServiconome.asString,
                           'NFe em formato pdf',
                           'Ordem de Serviço '+ dtmordemservico.qryOrdemServiconumero.asString,
                           EnvioNFeEmail);
        try

          with frmEnviarEmail do
          begin
            Data        := DataServidor;
            Empresa     := PrimeiraLetraEmMaiuscula(NomeFilialBase);
            ShowModal;
            if frmEnviarEmail.modalresult = mrOk then
            begin

              try

                NFe := TTecNotaFiscalEletronica.Create;

                if (frmEnviarEmail.vListaEmailValidos <> '')      and
                   (UsuarioLogin.PortaSmtp               <> '')      and
                   (UsuarioLogin.HostSmtp                <> '')      and
                   (UsuarioLogin.Email                   <> '')      and
                   (UsuarioLogin.SenhaEmail              <> '')      then
                begin
                  ShowProcessando('Enviando email do boleto para o cliente');
                  sleep(500);
                  try
                    VerificarDadosFilial(qryordemServicofilialvenda.AsString);

                    TdtmImprimeBoleto.GerarBoletoPDF(qryOrdemServiconumero.AsString, NumeroParcelas, vListaBoletos);

                    if not NFe.EnviarEmail(UsuarioLogin.Email,
                    frmEnviarEmail.vListaEmailValidos,
                    qryOrdemServiconumero.AsString,
                    '',
                    qryordemServicofilialvenda.AsString,
                    '',

                    qryDadosFilial_.fieldbyname('nome').AsString,
                    qryDadosFilial_.fieldbyname('razao').asString,
                    qryDadosFilial_.fieldbyname('cnpj').asString,
                    qryDadosFilial_.fieldbyname('foneddd').asString,
                    qryDadosFilial_.fieldbyname('fonenumero').asString,
                    qryDadosFilial_.fieldbyname('faxddd').asString,
                    qryDadosFilial_.fieldbyname('faxnumero').asString,

                    UsuarioLogin.NomeUsuario, UsuarioLogin.PortaSMTP,
                    UsuarioLogin.HostSMTP, UsuarioLogin.UsuarioEmail, UsuarioLogin.SenhaEmail,
                    qryOrdemServicodata.AsDateTime, qryOrdemServicoValorprazo.AsCurrency,
                    UsuarioLogin.AutenticarSMTP, qryOrdemServicodata.AsDateTime,
                    vListaBoletos, true, true
                    ) then
                      MensagemAviso('Ocorreu um erro inesperado no envio do boleto do contrato por email')

                  finally
                    ShowProcessando;
                  end;

                end;

              finally

                freeandnil(nfe);

              end;




            end;

          end;

        finally
          frmEnviarEmail.Free;
        end;

     finally
       vListaBoletos.free;
     end;
   end;

end;

procedure Tdtmordemservico.ImprimirSaldo;
var
  ImprimeSaldo: TdtmImprimeSaldoCliente;
begin
  ImprimeSaldo:= TdtmImprimeSaldoCliente.Create(Self);
  try
    ImprimeSaldo.ImprimirSaldo(qryOrdemServicocliente.AsInteger, qryOrdemServicotipocliente.AsString);
  finally
    if assigned(ImprimeSaldo) then
      freeandnil(ImprimeSaldo);
//    ImprimeSaldo.Free;
  end;
end;

procedure Tdtmordemservico.ImprimirEtiquetasListaCasamento;
begin
  if not assigned(frmListaCasamento) then
    frmListaCasamento := TfrmListaCasamento.Create(frmListaCasamento);
  with frmListaCasamento do
  begin
    BringToFront;
    pgcCadastroLista.ActivePage := tstetiquetas;
    pgcSelecionarNotasCupons.ActivePage := tstContratoEtiquetas;
    fraConsultaContratoEtiquetas.edfCodigo.Text := NumeroOrdemServico;
    fraConsultaContratoEtiquetas.edfCodigo.Exist;
    frmListaCasamento.sbnGerar.Click;
    ckbSelecionarTodos.Checked := true;
    actHabilitarBotaoUpdate(frmListaCasamento);
    if frmListaCasamento.sbnImprimir.Enabled then
      frmListaCasamento.sbnImprimir.Click
  end;

end;

procedure Tdtmordemservico.AbrirDadosCreditoCliente;
begin
  if not assigned(dtmVisualizarSaldoTroca) then
     dtmVisualizarSaldoTroca := TdtmVisualizarSaldoTroca.Create(Self);
  dtmVisualizarSaldoTroca.AbrirDadosCliente(CodigoCliente,TipoCliente);

end;

function Tdtmordemservico.GetTabelaSaldoCredito: TZDataset;
begin
  result := dtmVisualizarSaldoTroca.qrySaldoTroca;

end;

function Tdtmordemservico.GetTabelaSaldoCreditoAtual: TZDataset;
begin
  result := dtmVisualizarSaldoTroca.qrySaldoAtual;
end;

function Tdtmordemservico.GetCreditoTroca: Currency;
begin
  result := qryOrdemServicocreditotroca.AsCurrency;
end;

procedure Tdtmordemservico.SetCreditoTroca(const Value: Currency);
begin
   EditarOrdemServico;
   qryOrdemServicocreditotroca.AsCurrency := Value;
end;

function Tdtmordemservico.GetSaldoCreditoAtual: Currency;
begin
  result := dtmVisualizarSaldoTroca.SaldoAtual;
end;

function Tdtmordemservico.SugerirCreditoTroca(Perguntar,
  Atribuir: Boolean): Boolean;
var
  msg : String;
begin
  result := false;
  if ParSistema.utilizarcreditotrocacontrato then
  begin
    if SaldoCreditoAtual <> 0 then
    begin
      if saldoCreditoAtual >0 then
        msg:= 'crédito'
     {
      else
        msg:= 'débito'};
      if not Perguntar or
         (MensagemConfirmacao(format(ctCLIENTEPOSSUIDEBITOCREDITO,[msg,saldocreditoatual])) = smbOK) then
      begin

        if not (qryOrdemServico.State in [dsedit,dsinsert]) then
          qryOrdemServico.Edit;

        qryOrdemServicocreditotroca.AsCurrency := 0;
        if Atribuir or not Perguntar then
          if (SaldoCreditoAtual > 0) then
          begin
            if TotalOrdemServico >= SaldoCreditoAtual then
              qryOrdemServicocreditotroca.AsCurrency := SaldoCreditoAtual
            else
              qryOrdemServicocreditotroca.AsCurrency := TotalOrdemServico;
          end;
        result := true;
      end;
    end;
  end;
end;

function Tdtmordemservico.ValidarCreditoTroca: Boolean;
begin

  result := true;
  if creditotroca > 0 then
  begin
    if creditotroca > SaldoCreditoAtual then
    begin
       MensagemErro(format(ctVALORCREDITOFORAINTERVALO,[creditotroca,SaldoCreditoAtual]));
       result := false;
    end
    else
    begin
      if creditotroca > TotalordemServico then
      begin
        MensagemErro(format(ctVALORCREDITOMAIORPRODUTOS,[creditotroca,TotalOrdemServico]));
        result := false;
      end;
    end;
  end;

end;

procedure Tdtmordemservico.AbrirConsultaAtendimentos;
begin
  RefazConsultaPorNome(qryAtendimentos,['ordemservico'],[qryOrdemServiconumero.asstring]);
end;

function Tdtmordemservico.getdtmCadastroContratos: TdtmCadastroContratos;
begin
  if not assigned(fdtmCadastroContratos) then
  begin
    fdtmCadastroContratos := TdtmCadastroContratos.Create(self, false, True);
//    fdtmCadastroContratos.OnComplementarNota := ComplementarNota;
  end;

  Result := fdtmCadastroContratos;
end;

procedure Tdtmordemservico.qryServicosOrdemServicoBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryServicosOrdemServico.ParamByname('FilialBase').asInteger := FilialBase;
end;

end.
