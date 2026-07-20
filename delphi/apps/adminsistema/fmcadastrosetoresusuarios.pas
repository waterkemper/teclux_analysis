unit fmcadastrosetoresusuarios;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, StdCtrls, ComCtrls, Buttons, ExtCtrls, DBCtrls, biblio,
  cpdbtext, Mask, cpdbfindcontrols, dmcadastrosinternos, fmconsultabasica,
  fmconsultaporcampo, ZQuery, ctconstantes, ToolWin;

type
  TfrmCadastroSetoresUsuarios = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxUsuariosSetores: TGroupBox;
    lblSetor: TLabel;
    flkSetor: TtecDBFindLookup;
    sbnSetor: TSpeedButton;
    dtxSetor: TtecDBText;
    procedure sbnSetorClick(Sender: TObject);
  protected
    dtmCadastrosInternos: TdtmCadastrosInternos;
  public
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer;    override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    procedure SetDataModulo(Dtm: TdtmCadastrosInternos);
    destructor Destroy; override;
  end;

var
  frmCadastroSetoresUsuarios: TfrmCadastroSetoresUsuarios;

implementation

{$R *.dfm}

{ TfrmCadastroSetoresUsuarios }

destructor TfrmCadastroSetoresUsuarios.Destroy;
begin
  inherited;
  frmCadastroSetoresUsuarios:= nil;
end;

function TfrmCadastroSetoresUsuarios.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmCadastrosInternos.ExisteFilial(NomeCampo, Value);
end;

function TfrmCadastroSetoresUsuarios.InternoExcluir: Boolean;
begin
 Result := inherited InternoExcluir;
 if Result then
   dtmCadastrosInternos.ExcluirSetoresUsuarios;
end;

function TfrmCadastroSetoresUsuarios.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastrosInternos.GravarSetoresUsuarios;
end;

function TfrmCadastroSetoresUsuarios.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    dtmCadastrosInternos.IncluirSetoresUsuarios(False);
end;

function TfrmCadastroSetoresUsuarios.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    dtmCadastrosInternos.AbreTabelasUsuarios(tpSETORES);
    Result := inherited InternoPesquisar('Setores');
    if Result  = mrok then
      dtmCadastrosInternos.SelecionarUsuario(tpSETORES);
    dtmCadastrosInternos.FechaTabelasUsuarios(tpSETORES);
  end;
end;

function TfrmCadastroSetoresUsuarios.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmCadastroSetoresUsuarios.SetDataModulo(Dtm: TdtmCadastrosInternos);
begin
  dtmCadastrosInternos:= Dtm;
end;

function TfrmCadastroSetoresUsuarios.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCadastrosInternos.TabelaConsultaSetores;
end;

procedure TfrmCadastroSetoresUsuarios.sbnSetorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkSetor.SetFocus;
  InternoPesquisar('');
end;

end.
 