unit fmcadastroimpostosnotasaida;

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
  Tfrmcadastroimpostosnotasaida = class(TfrmCadastroPadrao)
    gbxImpostos: TGroupBox;
    edtAliquota: TDBEditNumero;
    edtValorBase: TDBEditNumero;
    edtValor: TDBEditNumero;
    edtIsentos: TDBEditNumero;
    edtOutros: TDBEditNumero;
    pnlFundoJanela: TPanel;
    cmbTipo: TtecDBComboBox;
    lblPercentual: TLabel;
    gbxTipoImposto: TGroupBox;
    gbxBaseCalculo: TGroupBox;
    gbxAliquota: TGroupBox;
    gbxValorImposto: TGroupBox;
    gbxIsentas: TGroupBox;
    gbxOutras: TGroupBox;
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
  frmcadastroimpostosnotasaida: Tfrmcadastroimpostosnotasaida;

implementation

uses dmemissaonotassaidaavulsas{, dmgerarnotafiscal};

{$R *.dfm}

{ Tfrmcadastroimpostosnotasaida }

constructor Tfrmcadastroimpostosnotasaida.Create(AOwner: TComponent);
begin
  inherited;
//  DataSet := dtmEmissaoNotaAvulsas.TabelaImpostosNotaFiscal;
  cmbTipo.SetFocus;
  cmbTipo.SelectAll;
{  edtAliquota.SetFocus;
  edtAliquota.SelectAll;}
end;

destructor Tfrmcadastroimpostosnotasaida.Destroy;
begin
  inherited;
  frmcadastroimpostosnotasaida := nil
end;

function Tfrmcadastroimpostosnotasaida.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
//    dtmEmissaoNotaAvulsas.ExcluirImpostoNotaFiscal
end;

function Tfrmcadastroimpostosnotasaida.InternoGravar: Boolean;
{var
  Editando: Boolean; }
begin
  Result:= inherited InternoGravar;
  if Result then
    Result   := dtmEmissaoNotaAvulsas.GravarImpostosNotaFiscal;
    if result then
      self.SetFocus;
end;

function Tfrmcadastroimpostosnotasaida.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
//    dtmEmissaoNotaAvulsas.IncluirImpostosNotaFiscal(False);
    edtAliquota.SetFocus;
  end;
end;

end.
