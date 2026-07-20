unit fmcadastrocomissoesusuariosclasses;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, StdCtrls, ComCtrls, Buttons, ExtCtrls, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols, cpnumero, cpdbradiogroup, biblio,
  //projeto
  dmcadastrosinternos, frcomissao,
  //biblio
  fmconsultabasica,
  fmconsultaporcampo, ctconstantes,
  //terceiros
  zquery, ToolWin;

type
  TfrmCadastroComissoesUsuariosClasses = class(TfrmCadastroPadrao)
    gbxComissoesUsuarios: TGroupBox;
    flkClasse: TtecDBFindLookup;
    sbnProcurarClasses: TSpeedButton;
    dtxGrupo: TtecDBText;
    fraComissao1: TfraComissao;
    procedure sbnProcurarClassesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer;    override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure SetDataModulo(Dtm: TdtmCadastrosInternos);
    destructor Destroy; override;
  end;

var
  frmCadastroComissoesUsuariosClasses: TfrmCadastroComissoesUsuariosClasses;

implementation

{$R *.dfm}

{ TfrmCadastroComissoesUsuariosGrupos }

destructor TfrmCadastroComissoesUsuariosClasses.Destroy;
begin
  inherited;
  frmCadastroComissoesUsuariosClasses:= nil;
end;

function TfrmCadastroComissoesUsuariosClasses.InternoExcluir: Boolean;
begin
 Result := inherited InternoExcluir;
 if Result then
   dtmCadastrosInternos.ExcluirComissoesUsuariosClasses;
end;

function TfrmCadastroComissoesUsuariosClasses.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastrosInternos.GravarComissoesUsuariosClasses;
end;

function TfrmCadastroComissoesUsuariosClasses.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    dtmCadastrosInternos.IncluirComissoesUsuariosClasses(False);
end;

procedure TfrmCadastroComissoesUsuariosClasses.SetDataModulo(
  Dtm: TdtmCadastrosInternos);
begin
  dtmCadastrosInternos:= Dtm;
end;

procedure TfrmCadastroComissoesUsuariosClasses.sbnProcurarClassesClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkClasse.SetFocus;
  InternoPesquisar('');
end;

function TfrmCadastroComissoesUsuariosClasses.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmCadastrosInternos.ExisteClasses(NomeCampo, Value);
end;

function TfrmCadastroComissoesUsuariosClasses.InternoPesquisar(
  Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    dtmCadastrosInternos.AbreTabelasUsuarios(tpCOMISSOESCLASSES);
    Result := inherited InternoPesquisar(ctCLASSES);
    if Result  = mrok then
      dtmCadastrosInternos.SelecionarUsuario(tpCOMISSOESCLASSES);
    dtmCadastrosInternos.FechaTabelasUsuarios(tpCOMISSOESCLASSES);
  end;
end;

function TfrmCadastroComissoesUsuariosClasses.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroComissoesUsuariosClasses.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCadastrosInternos.TabelaConsultaClasses;
end;

end.
