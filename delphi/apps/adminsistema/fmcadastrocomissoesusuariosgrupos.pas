unit fmcadastrocomissoesusuariosgrupos;

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
  TfrmCadastroComissoesUsuariosGrupos = class(TfrmCadastroPadrao)
    gbxComissoesUsuarios: TGroupBox;
    flkGrupo: TtecDBFindLookup;
    sbnProcurarGrupos: TSpeedButton;
    dtxGrupo: TtecDBText;
    fraComissao1: TfraComissao;
    procedure sbnProcurarGruposClick(Sender: TObject);
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
  frmCadastroComissoesUsuariosGrupos: TfrmCadastroComissoesUsuariosGrupos;

implementation

{$R *.dfm}

{ TfrmCadastroComissoesUsuariosGrupos }

destructor TfrmCadastroComissoesUsuariosGrupos.Destroy;
begin
  inherited;
  frmCadastroComissoesUsuariosGrupos:= nil;
end;

function TfrmCadastroComissoesUsuariosGrupos.InternoExcluir: Boolean;
begin
 Result := inherited InternoExcluir;
 if Result then
   dtmCadastrosInternos.ExcluirComissoesUsuariosGrupos;
end;

function TfrmCadastroComissoesUsuariosGrupos.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastrosInternos.GravarComissoesUsuariosGrupos;
end;

function TfrmCadastroComissoesUsuariosGrupos.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    dtmCadastrosInternos.IncluirComissoesUsuariosGrupos(False);
end;

procedure TfrmCadastroComissoesUsuariosGrupos.SetDataModulo(
  Dtm: TdtmCadastrosInternos);
begin
  dtmCadastrosInternos:= Dtm;
end;

procedure TfrmCadastroComissoesUsuariosGrupos.sbnProcurarGruposClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkGrupo.SetFocus;
  InternoPesquisar('');
end;

function TfrmCadastroComissoesUsuariosGrupos.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmCadastrosInternos.ExisteGrupos(NomeCampo, Value);
end;

function TfrmCadastroComissoesUsuariosGrupos.InternoPesquisar(
  Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    dtmCadastrosInternos.AbreTabelasUsuarios(tpCOMISSOESGRUPOS);
    Result := inherited InternoPesquisar(ctGRUPOS);
    if Result  = mrok then
      dtmCadastrosInternos.SelecionarUsuario(tpCOMISSOESGRUPOS);
    dtmCadastrosInternos.FechaTabelasUsuarios(tpCOMISSOESGRUPOS);
  end;
end;

function TfrmCadastroComissoesUsuariosGrupos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroComissoesUsuariosGrupos.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCadastrosInternos.TabelaConsultaGrupos;
end;

end.
