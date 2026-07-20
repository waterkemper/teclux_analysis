unit fmanaliseeconomicacompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  frintervalodatas, frselecaoaleatoriagruposfornecedores,
  frselecaoaleatoriaclientes, StdCtrls, frmultiplaselecaoaleatoria,
  frlistafiliais, dmanaliseeconomicacompras, cpeditioncontrolvalidation;

type
  TfrmAnaliseEconomicaCompras = class(TfrmRelatorioPadrao)
    fraIntervaloDatas: TfraIntervaloDatas;
    fraListaFiliais: TfraListaFiliais;
    fraMultiplaSelecaoAleatoriAProdutos: TfraMultiplaSelecaoAleatoria;
    gbxSelecoesAleatorias: TGroupBox;
    pgcMultiplasSelecoes: TPageControl;
    tstMultiplasSelecoesProdutos: TTabSheet;
    tstMultiplasSelecoesFornecedores: TTabSheet;
    fraSelecaoAleatoriaFornecedores: TfraSelecaoAleatoriaClientes;
    tstMultiplasSelecoesGrupoFornecedores: TTabSheet;
    fraSelecaoAleatoriagruposfornecedores: TfraSelecaoAleatoriagruposfornecedores;
    ecvValida: TtecEditionControlValidation;
    Timer1: TTimer;
    rgpSituacaoCadastramentoNFe: TRadioGroup;
    StaticText1: TStaticText;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure InternoImpressao; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmAnaliseEconomicaCompras: TfrmAnaliseEconomicaCompras;
  
  ControleValido : TWinControl;

implementation

{$R *.dfm}

{ TfrmAnaliseEconomicaCompras }

constructor TfrmAnaliseEconomicaCompras.Create(AOwner: TComponent);
begin
  inherited;
  dtmAnaliseEconomicaCompras := TdtmAnaliseEconomicaCompras.Create(Self);
  fraIntervaloDatas.edtDataInicial.text := datetimetostr(incMonth(dtmAnaliseEconomicaCompras.DataServidor, -4));
  fraIntervaloDatas.edtDataFinal.text := datetimetostr(dtmAnaliseEconomicaCompras.DataServidor);

  fraSelecaoAleatoriaFornecedores.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.TipoCliente := 'F';

end;

destructor TfrmAnaliseEconomicaCompras.Destroy;
begin
  dtmAnaliseEconomicaCompras := nil;
  inherited;
  frmAnaliseEconomicaCompras := nil;
end;

procedure TfrmAnaliseEconomicaCompras.InternoImpressao;
begin
  inherited;
  if ecvValida.Verify(fraIntervaloDatas.gbxPeriodo, ControleValido) then
    dtmAnaliseEconomicaCompras.ImprimirRelatorio(strtodatetime(fraIntervaloDatas.edtDataInicial.text),
                                                 strtodatetime(fraIntervaloDatas.edtDataFinal.text),
             fraListaFiliais.ListaSelecionada,
             fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoAleatoriaItemdeProdutos.ListaCondicional,
             fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoAleatoriaprodutos.ListaCondicional,
             fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoaleatoriagruposprodutos.ListaCondicional,
             fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoaleatoriaclassesprodutos.ListaCondicional,
             fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoAleatoriamarcasProdutos.ListaCondicional,
             fraSelecaoAleatoriaFornecedores.ListaCondicional,
             fraSelecaoAleatoriaGruposFornecedores.ListaCondicional,
             fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoaleatoriapromocoes.ListaCondicional)
end;

procedure TfrmAnaliseEconomicaCompras.Timer1Timer(Sender: TObject);
begin
  inherited;
  tstMultiplasSelecoesProdutos.Highlighted := fraMultiplaSelecaoAleatoriaProdutos.tstItemdeProduto.Highlighted or
                                              fraMultiplaSelecaoAleatoriaProdutos.tstProduto.Highlighted or
                                              fraMultiplaSelecaoAleatoriaProdutos.tstSelecaoAleatoriaGrupoProduto.Highlighted or
                                              fraMultiplaSelecaoAleatoriaProdutos.tstSelecaoAleatoriaClasseProduto.Highlighted or
                                              fraMultiplaSelecaoAleatoriaProdutos.tstSelecaoAleatoriaMarcaProduto.Highlighted or
                                              fraMultiplaSelecaoAleatoriaProdutos.tstSelecaoAleatoriaPromocoes.Highlighted;

  tstMultiplasSelecoesFornecedores.Highlighted := (fraSelecaoAleatoriaFornecedores.fraSelecaoAleatoriaCliente.qryselecaoaleatoria.recordcount <> 0);
  tstMultiplasSelecoesGrupoFornecedores.Highlighted := (fraSelecaoAleatoriagruposfornecedores.fraSelecaoAleatoriaGruposFornecedores.qryselecaoaleatoria.recordcount <> 0);



end;

end.
