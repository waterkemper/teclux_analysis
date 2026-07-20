unit fmcadastroimpostosnotacomplementar;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Buttons,
  Mask, DBCtrls,
  //Componentes
  cpnumero,
  // Constantes
  biblio,
  //Repositorio
  fmcadastropadrao, cpdbcombobox, ComCtrls, cpdbtext, ToolWin;

type
  TfrmCadastroImpostoNotaComplementar = class(TfrmCadastroPadrao)
    gbxImpostos: TGroupBox;
    gbxTipoImposto: TGroupBox;
    cmbTipo: TtecDBComboBox;
    gbxBaseCalculo: TGroupBox;
    edtValorBase: TDBEditNumero;
    gbxAliquota: TGroupBox;
    edtAliquota: TDBEditNumero;
    lblPercentual: TLabel;
    gbxValorImposto: TGroupBox;
    edtValor: TDBEditNumero;
    gbxIsentas: TGroupBox;
    edtIsentos: TDBEditNumero;
    gbxOutras: TGroupBox;
    edtOutros: TDBEditNumero;
    gbxTotal: TGroupBox;
    dtxTotalImposto: TtecDBText;
  protected
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
var
  frmCadastroImpostoNotaComplementar: TfrmCadastroImpostoNotaComplementar;

implementation

uses
  dmemissaonotacomplementar, dmgerarnotafiscal;
{$R *.dfm}

{ TfrmCadastroImpostoNotaComplementar }

constructor TfrmCadastroImpostoNotaComplementar.Create(AOwner: TComponent);
begin
  inherited;
  DataSet:= dtmEmissaoNotaComplementar.TabelaImpostosNotaFiscal;
  cmbTipo.SetFocus;
  cmbTipo.SelectAll;
end;

destructor TfrmCadastroImpostoNotaComplementar.Destroy;
begin
  inherited;
  frmCadastroImpostoNotaComplementar:= nil;
end;

function TfrmCadastroImpostoNotaComplementar.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
  dtmEmissaoNotaComplementar.ExcluirImpostoNotaFiscal;
end;

function TfrmCadastroImpostoNotaComplementar.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    Result   := dtmEmissaoNotaComplementar.GravarImpostosNotaFiscal;
    if result then
      self.SetFocus;
end;

function TfrmCadastroImpostoNotaComplementar.InternoIncluir: Boolean;
begin
    Result:= inherited InternoIncluir;
  if Result then begin
    dtmEmissaoNotaComplementar.IncluirImpostosNotaFiscal(False);
    edtAliquota.SetFocus;
  end;
end;

end.
