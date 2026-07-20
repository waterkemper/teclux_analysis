unit fmcadastrofatoresprecosfilial;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, StdCtrls, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols, cpnumero, dmcadastrosinternos, biblio,
  fmConsultaBasica, fmconsultaporcampo, ZQuery, ZPgSqlQuery, ctconstantes,
  ToolWin;

type
  TfrmCadastroFatoresPrecos = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxFatoresPrecos: TGroupBox;
    lblFatorPreco: TLabel;
    flkFatorPreco: TtecDBFindLookup;
    sbnFatorPreco: TSpeedButton;
    dtxFatorPreco: TtecDBText;
    edtFator: TDBEditNumero;
    lblFator: TLabel;
    procedure sbnFatorPrecoClick(Sender: TObject);
  public
    function InternoIncluir: boolean; override;
    function InternoExcluir: boolean; override;
    function InternoGravar: boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    constructor Create(AOwner: TComponent); Override;
    destructor destroy; override;
  end;

var
  frmCadastroFatoresPrecos: TfrmCadastroFatoresPrecos;

implementation

{$R *.dfm}

{ TfrmCadastroFatoresPrecos }

constructor TfrmCadastroFatoresPrecos.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmCadastrosInternos.TabelaFatoresPrecos;
end;

destructor TfrmCadastroFatoresPrecos.destroy;
begin
  inherited;
  frmCadastroFatoresPrecos:= nil;
end;

function TfrmCadastroFatoresPrecos.InternoExcluir: boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    dtmCadastrosInternos.ExcluirFatoresPrecosFilial;
end;

function TfrmCadastroFatoresPrecos.InternoGravar: boolean;
begin
  Result:= Inherited InternoGravar;
  if Result then
    dtmCadastrosInternos.GravarFatoresPrecosFilial;
end;

function TfrmCadastroFatoresPrecos.InternoIncluir: boolean;
begin
  Result:= Inherited InternoIncluir;
  if Result then
    dtmCadastrosInternos.IncluirFatoresPrecosFilial(True);
end;

function TfrmCadastroFatoresPrecos.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  if CtrlOn then begin
    dtmCadastrosInternos.Abre(ctConsultaFatoresPreco);
    Result := inherited InternoPesquisar('Fatores Preços');
    if Result = mrOK then
      dtmCadastrosInternos.SelecionarFatorPreco;
    dtmCadastrosInternos.Fecha(ctConsultaFatoresPreco);
  end;
end;

function TfrmCadastroFatoresPrecos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroFatoresPrecos.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastrosInternos.TabelaConsultaFatorPreco;
end;

procedure TfrmCadastroFatoresPrecos.sbnFatorPrecoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkFatorPreco.SetFocus;
  InternoPesquisar('');
end;

end.
