unit fmFormacaoPrecoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, ComCtrls, Buttons, ToolWin, ExtCtrls, StdCtrls,
  dmFormacaoPrecoVenda, Mask, DBCtrls, cpnumero, cpdbfindcontrols, cpdbtext,
  cpdbdata;

type
  TfrmFormacaoPrecoVenda = class(TfrmAjudaBt)
    gbx_FormacaoPrecoVenda: TGroupBox;
    gbx_CustoOriginal: TGroupBox;
    GroupBox27: TGroupBox;
    GroupBox28: TGroupBox;
    GroupBox29: TGroupBox;
    GroupBox30: TGroupBox;
    GroupBox31: TGroupBox;
    GroupBox32: TGroupBox;
    gbx_PrecoVenda: TGroupBox;
    gbxPercMarkUp: TGroupBox;
    gbx_MarkUp: TGroupBox;
    GroupBox18: TGroupBox;
    GroupBox19: TGroupBox;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    gbx_DetalhamentoCustos: TGroupBox;
    gbx_PrecoUnitario: TGroupBox;
    gbxRateios: TGroupBox;
    gbx_Frete: TGroupBox;
    gbxDesp_Acessoria: TGroupBox;
    gbxImpImportacao: TGroupBox;
    gbxCustoSeguro: TGroupBox;
    gbxCustoAcrescimo: TGroupBox;
    gbx_Desconto: TGroupBox;
    gbx_IPI: TGroupBox;
    gbx_PercIPI: TGroupBox;
    gbx_MVA: TGroupBox;
    gbx_IcmsST: TGroupBox;
    gbx_PercPIS: TGroupBox;
    gbx_PIS: TGroupBox;
    gbx_PercCOFINS: TGroupBox;
    gbx_COFINS: TGroupBox;
    gbx_PercICMS: TGroupBox;
    gbx_ICMS: TGroupBox;
    gbx_CustoTotal: TGroupBox;
    gbx_ICMSFrete: TGroupBox;
    gbx_PercICMSFrete: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    edtPrecoUnitario: TDBEditNumero;
    edtdespesasacessorias: TDBEditNumero;
    edtfrete: TDBEditNumero;
    edtiivalor: TDBEditNumero;
    edtseguro: TDBEditNumero;
    edtacrescimo: TDBEditNumero;
    edtdesconto: TDBEditNumero;
    edtaliquotaicms: TDBEditNumero;
    edticmsvalor: TDBEditNumero;
    edtpcredsn: TDBEditNumero;
    edtvcredicmssn: TDBEditNumero;
    edtaliquotaicmsconhecimentofrete: TDBEditNumero;
    edticmsconhecimentofrete: TDBEditNumero;
    edticmsvalorstcusto: TDBEditNumero;
    edtfatorsubstituicao_custo: TDBEditNumero;
    edtaliquotaipi: TDBEditNumero;
    edtvaloripi: TDBEditNumero;
    edtpisaliquota: TDBEditNumero;
    edtpisvalor: TDBEditNumero;
    edtcofinsaliquota: TDBEditNumero;
    edtcofinsvalor: TDBEditNumero;
    edtprecocusto: TDBEditNumero;
    edtprecocusto2: TDBEditNumero;
    edtdescontoprecovenda: TDBEditNumero;
    edtcustoparavenda: TDBEditNumero;
    edtmarkup: TDBEditNumero;
    edtvalormarkup: TDBEditNumero;
    edtaliquotaicmsprecovenda: TDBEditNumero;
    edticmsvalorprecovenda: TDBEditNumero;
    edtpercentualreducaoicmsprecovenda: TDBEditNumero;
    edtbaseicmsparavenda: TDBEditNumero;
    edtpisaliquotaprecovenda: TDBEditNumero;
    edtpisvalorprecovenda: TDBEditNumero;
    edtcofinsaliquotaprecovenda: TDBEditNumero;
    edtcofinsvalorprecovenda: TDBEditNumero;
    edtprecovenda: TDBEditNumero;
    GroupBox1: TGroupBox;
    edtarredondamento: TDBEditNumero;
    gbxFornecedor_0: TGroupBox;
    dtxFornecedor: TtecDBText;
    flkFornecedor: TtecDBText;
    gbxUF: TGroupBox;
    dtxEstadoFornecedor: TtecDBText;
    gbxSerie0: TGroupBox;
    flkSerieNota: TtecDBText;
    gbxNrNota: TGroupBox;
    flkNotaFiscal: TtecDBText;
    gbxEmissao: TGroupBox;
    edtDataEmissao: TDBEditData;
    gbxItem: TGroupBox;
    dtxDescricaoProduto: TtecDBText;
    flkCodigoProduto: TtecDBText;
    gbxSitTributariaProduto: TGroupBox;
    Panel3: TPanel;
    pnlcstproduto: TPanel;
    lblcstProduto: TLabel;
    dtxcstproduto: TtecDBText;
    pnlcsosnproduto: TPanel;
    lblcsosnproduto: TLabel;
    dtxcsosnproduto: TtecDBText;
    gbxSitTributariaNFnaEmpresa: TGroupBox;
    pnlSituacaoTributaria: TPanel;
    pnlcstprodutonfe: TPanel;
    lblcst: TLabel;
    dtxcst: TtecDBText;
    pnlcsosnProdutonfe: TPanel;
    lblcsosn: TLabel;
    dtxcsosn: TtecDBText;
    GroupBox7: TGroupBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    tecDBText1: TtecDBText;
    Panel6: TPanel;
    Label5: TLabel;
    tecDBText2: TtecDBText;
    tecDBText3: TtecDBText;
    gbxNaturezaOriginal: TGroupBox;
    dtxCFOPDescricaoNfe: TtecDBText;
    dtxDescricaoCFOPNFe: TtecDBText;
    GroupBox2: TGroupBox;
    tecDBText4: TtecDBText;
    tecDBText5: TtecDBText;
    StaticText1: TStaticText;
    tecDBText6: TtecDBText;
    StaticText2: TStaticText;
    tecDBText7: TtecDBText;
    StaticText3: TStaticText;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
  end;

var
  frmFormacaoPrecoVenda: TfrmFormacaoPrecoVenda;
  AcionarTelaFormacaoPrecoVenda: procedure (CodigoNota, NumeroProduto: integer; produto, origem: string);

implementation

{$R *.dfm}

{ TfrmFormacaoPrecoVenda }

constructor TfrmFormacaoPrecoVenda.Create(AOwner: TComponent);
begin
  inherited;
  dtmFormacaoPrecoVenda := TdtmFormacaoPrecoVenda.Create(Self);
  try

  except
    on E: Exception do ShowMessage(E.Message);
  end;

end;                                           

destructor TfrmFormacaoPrecoVenda.Destroy;
begin

  inherited;
  frmFormacaoPrecoVenda := nil;

end;


procedure AcionarTelaFormacaoPrecoVenda_(CodigoNota, NumeroProduto: integer; produto, Origem: String);
begin
  if not assigned(frmFormacaoPrecoVenda) then
    frmFormacaoPrecoVenda := TfrmFormacaoPrecoVenda.create(frmFormacaoPrecoVenda);

  dtmFormacaoPrecoVenda.qryFormacaoPrecoVenda.close;
  dtmFormacaoPrecoVenda.qryFormacaoPrecoVenda.parambyname('codigonota').asInteger := CodigoNota;
  dtmFormacaoPrecoVenda.qryFormacaoPrecoVenda.parambyname('numeroproduto').asInteger := NumeroProduto;
  dtmFormacaoPrecoVenda.qryFormacaoPrecoVenda.parambyname('produto').asString := Produto;
  dtmFormacaoPrecoVenda.qryFormacaoPrecoVenda.parambyname('origem').asString := Origem;

  dtmFormacaoPrecoVenda.qryFormacaoPrecoVenda.open;
  frmFormacaoPrecoVenda.BringToFront;
  


end;

initialization
   AcionarTelaFormacaoPrecoVenda :=  AcionarTelaFormacaoPrecoVenda_;

end.
