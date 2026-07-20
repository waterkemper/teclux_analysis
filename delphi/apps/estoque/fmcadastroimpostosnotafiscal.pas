unit fmcadastroimpostosnotafiscal;

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
  TfrmCadastroImpostosNotaFiscal = class(TfrmCadastroPadrao)
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
  frmCadastroImpostosNotaFiscal: TfrmCadastroImpostosNotaFiscal;

implementation

uses dmcadastronotasfiscais, dmgerarnotafiscal;

{$R *.dfm}

{ TfrmCadastroImpostosNotaFiscal }

constructor TfrmCadastroImpostosNotaFiscal.Create(AOwner: TComponent);
begin
  inherited;
//  DataSet := dtmCadastroNotasFiscais.TabelaImpostosNotaFiscal;
  cmbTipo.SetFocus;
  cmbTipo.SelectAll;
//  cmbtipo.HideItems.Clear;
  cmbtipo.Items.Clear;

  if dtmCadastroNotasFiscais.ContribICMS then
  begin
//    cmbtipo.HideItems.Add('M');
    cmbtipo.Items.Add('ICMS');
  end;

  if dtmCadastroNotasFiscais.ContribIPI then
  begin
//    cmbtipo.HideItems.Add('P');
    cmbtipo.Items.Add('IPI');
  end;

  if dtmCadastroNotasFiscais.ContribISS then
  begin
//    cmbtipo.HideItems.Add('S');
    cmbtipo.Items.Add('ISS');
  end;

{  edtAliquota.SetFocus;
  edtAliquota.SelectAll;}
end;

destructor TfrmCadastroImpostosNotaFiscal.Destroy;
begin
  inherited;
  frmCadastroImpostosNotaFiscal := nil
end;


function TfrmCadastroImpostosNotaFiscal.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    //dtmCadastroNotasFiscais.ExcluirImpostoNotaFiscal
end;

function TfrmCadastroImpostosNotaFiscal.InternoGravar: Boolean;
{var
  Editando: Boolean; }
begin
//  Editando := dtmCadastroNotasFiscais.EditandoTabelaImpostosNota;
  Result:= inherited InternoGravar;
  if Result then
//    Result   := dtmCadastroNotasFiscais.GravarImpostosNotaFiscal;
    if result then
      self.SetFocus;
//  if Result then begin
//    if Editando then
//         Close
//    else InternoIncluir;
//  end;
end;

function TfrmCadastroImpostosNotaFiscal.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
//    dtmCadastroNotasFiscais.IncluirImpostosNotaFiscal(False);
    edtAliquota.SetFocus;
  end;
end;

end.
