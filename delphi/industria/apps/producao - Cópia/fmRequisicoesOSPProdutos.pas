unit fmRequisicoesOSPProdutos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  DBCtrls, Mask, ComCtrls, ExtCtrls, Buttons, Windows, DB,
  // Biblio
  biblio, ctconstantes,
  // Componentes
  cpdata, cpnumero, cptexto, cpdbfindcontrols, cpdbdata, cpdbtext,
  // Terceiros
  cpQuery,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  // Projeto
  dmRequisicoesOSP, clparametrossistema, cpdbcombobox, cpdblookupcombobox,
  ToolWin, cpdbradiogroup, fmcadastropadraonavegacao;

type

  TfrmRequisicoesOSPProdutos = class(TfrmCadastroPadraoNav)
    gbxConsulta: TGroupBox;
    pnlFundoJanela: TPanel;
    dtxCodigoProduto: TtecDBText;
    dtxProduto: TtecDBText;
    edtQuantidade: TDBEditNumero;
    gbxComposto: TGroupBox;
    gbxQuantidade: TGroupBox;
    gbxOrigem: TGroupBox;
    dtxOrigem: TtecDBText;
    gbxSolicitada: TGroupBox;
    dtxSolicitada: TtecDBText;
    gbxLiberada: TGroupBox;
    dtxLiberada: TtecDBText;
    gbxSaldo: TGroupBox;
    dtxSaldo: TtecDBText;
    rgbTipodeOperacao: TtecDBRadioGroup;
    tecRadioButton1: TtecRadioButton;
    tecRadioButton2: TtecRadioButton;
  private
  protected
    function  InternoGravar: Boolean; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmRequisicoesOSPProdutos: TfrmRequisicoesOSPProdutos;

implementation

uses dmbasico;

{$R *.dfm}

destructor TfrmRequisicoesOSPProdutos.Destroy;
begin
  inherited;
  frmRequisicoesOSPProdutos := nil;
end;

function TfrmRequisicoesOSPProdutos.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    if not CtrlOn then
      Result := dtmRequisicoesOSP.GravarRequisicoesOSPProdutos;

  if result then
    edtQuantidade.SetFocus;
end;


constructor TfrmRequisicoesOSPProdutos.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmRequisicoesOSP.qryRequisicoesOSP;
end;

end.
