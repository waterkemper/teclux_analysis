unit fmcadastrousuariosfiliais;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols,dmcadastrosinternos, fmconsultabasica,
  fmconsultaporcampo, ctconstantes, zquery, biblio, cpnumero, ToolWin;

type
  TfrmCadastroUsuariosFiliais = class(TfrmCadastroPadrao)
    gbxUsuariosFiliais: TGroupBox;
    sbnFilial: TSpeedButton;
    flkFilial: TtecDBFindLookup;
    dtxFilial: TtecDBText;
    gbxFilial_UsuariosFiliais: TGroupBox;
    gbxPercGerenteFilial_UsuariosFiliais: TGroupBox;
    edtPercGerenteFilial_UsuariosFiliais: TDBEditNumero;
    gbxPercSupervisorFilial_UsuariosFiliais: TGroupBox;
    DBEditNumero1: TDBEditNumero;
    procedure sbnFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer;    override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure SetDataModulo(Dtm: TdtmCadastrosInternos);
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmCadastroUsuariosFiliais: TfrmCadastroUsuariosFiliais;

implementation

uses fmnavcontroles;

{$R *.dfm}

destructor TfrmCadastroUsuariosFiliais.Destroy;
begin
  inherited;
  frmCadastroUsuariosFiliais := nil;
end;

function TfrmCadastroUsuariosFiliais.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastrosInternos.ExisteFilial(NomeCampo, Value);
end;

function TfrmCadastroUsuariosFiliais.InternoExcluir: Boolean;
begin
  Result := inherited InternoExcluir;
  if Result then
    dtmCadastrosInternos.ExcluirUsuariosFiliais;
end;

function TfrmCadastroUsuariosFiliais.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastrosInternos.GravarUsuariosFiliais;
  flkFilial.SetFocus;
end;

function TfrmCadastroUsuariosFiliais.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    dtmCadastrosInternos.IncluirUsuariosFiliais(False);
end;

function TfrmCadastroUsuariosFiliais.InternoPesquisar(
  Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    dtmCadastrosInternos.AbreTabelasUsuarios(tpFILIAL);
    Result := inherited InternoPesquisar(ctFILIAIS);
    if Result  = mrok then
      dtmCadastrosInternos.SelecionarUsuario(tpFILIAL);
    dtmCadastrosInternos.FechaTabelasUsuarios(tpFILIAL);
  end;
end;

function TfrmCadastroUsuariosFiliais.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmCadastroUsuariosFiliais.SetDataModulo(
  Dtm: TdtmCadastrosInternos);
begin
  dtmCadastrosInternos:= Dtm;
end;

function TfrmCadastroUsuariosFiliais.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCadastrosInternos.TabelaConsultaFilial;
end;

procedure TfrmCadastroUsuariosFiliais.sbnFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  InternoPesquisar('');
end;

end.
