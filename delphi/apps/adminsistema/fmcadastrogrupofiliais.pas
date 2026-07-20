unit fmcadastrogrupofiliais;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, DBCtrls, Grids,
  DBGrids, {Qete,} DB,
 // Terceiros
  ZQuery,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  // Biblio
  ctconstantes, biblio, 
  // Componentes
  cptexto, cpdbfindcontrols, cpdbgrid, ComCtrls, ToolWin;

type
  TfrmCadastroGrupoFiliais = class(TfrmCadastroPadrao)
    edfCodigo: TtecDbEditFind;
    edtDescricao: TDBEditTexto;
    edtMneumonico: TDBEditTexto;
    ckbEstoque: TDBCheckBox;
    gbxFiliais: TGroupBox;
    sbnExcluirFilial: TSpeedButton;
    sbnIncluirFilial: TSpeedButton;
    dbgFiliais: TtecDBGrid;
    pnlFundoJanela: TPanel;
    gbxCodigo: TGroupBox;
    gbxSigla: TGroupBox;
    gbxDescricao: TGroupBox;
    procedure sbnExcluirFilialClick(Sender: TObject);
    procedure sbnIncluirFilialClick(Sender: TObject);
    procedure dbgFiliaisDblClick(Sender: TObject);
    procedure dbgFiliaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    function  AcionaCadastroFiliaisGrupoFiliais(Editar: Boolean):boolean;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroGrupoFiliais: TfrmCadastroGrupoFiliais;

implementation

uses dmcadastrogrupofiliais, fmcadastrofiliaisgrupofiliais;

{$R *.dfm}

function TfrmCadastroGrupoFiliais.AcionaCadastroFiliaisGrupoFiliais(Editar: Boolean): boolean;
begin
  frmCadastroFiliaisGrupoFiliais:= TfrmCadastroFiliaisGrupoFiliais.Create(frmCadastroFiliaisGrupoFiliais);
  frmCadastroFiliaisGrupoFiliais.EditandoRegistro:= Editar;
  frmCadastroFiliaisGrupoFiliais.SetDataModulo(dtmCadastroGrupoFiliais);
  frmCadastroFiliaisGrupoFiliais.DataSet:= dtmCadastroGrupoFiliais.TabelaFiliaisGrupoFiliais;
  Result := dtmCadastroGrupoFiliais.IncluirFilialGrupoFilial(Editar);
  frmCadastroFiliaisGrupoFiliais.ShowModal;
  frmCadastroFiliaisGrupoFiliais.free;
  dbgFiliais.SetFocus;
end;

procedure TfrmCadastroGrupoFiliais.sbnIncluirFilialClick(Sender: TObject);
begin
  AcionaCadastroFiliaisGrupoFiliais(False);
end;

procedure TfrmCadastroGrupoFiliais.sbnExcluirFilialClick(Sender: TObject);
begin
  dtmCadastroGrupoFiliais.ExcluirFilialGrupoFilial;
end;

procedure TfrmCadastroGrupoFiliais.dbgFiliaisDblClick(Sender: TObject);
begin
  AcionaCadastroFiliaisGrupoFiliais(True);
end;

procedure TfrmCadastroGrupoFiliais.dbgFiliaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
    case key of
      TeclaEditarRegistro : AcionaCadastroFiliaisGrupoFiliais(True);
      TeclaInserirRegistro: AcionaCadastroFiliaisGrupoFiliais(False);
    end;
end;

constructor TfrmCadastroGrupoFiliais.Create(AOwner: TComponent);
begin
  dtmCadastroGrupoFiliais:= TdtmCadastroGrupoFiliais.Create(Self);
  inherited;
  DataSet:= dtmCadastroGrupoFiliais.TabelaGruposFiliais;
end;

destructor TfrmCadastroGrupoFiliais.Destroy;
begin
  dtmCadastroGrupoFiliais:=nil;
  inherited;
  frmCadastroGrupoFiliais:= nil;
end;

function TfrmCadastroGrupoFiliais.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmCadastroGrupoFiliais.ExisteGrupoFilial(NomeCampo, Value);
end;

function TfrmCadastroGrupoFiliais.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if not CtrlOn then
    if Result then
      dtmCadastroGrupoFiliais.ExcluirGrupoFilial;
end;

function TfrmCadastroGrupoFiliais.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastroGrupoFiliais.GravarGrupoFilial;
end;

function TfrmCadastroGrupoFiliais.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then
    if Result then
      dtmCadastroGrupoFiliais.IncluirGrupoFilial;
end;

function TfrmCadastroGrupoFiliais.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if not CtrlOn then
  begin
    dtmCadastroGrupoFiliais.Abre(ctCrediarioTabelaConsultaGrupoFiliais);
    Result:= inherited InternoPesquisar('Grupos de Filial');
    if Result = mrOK then
      dtmCadastroGrupoFiliais.PosicionarGrupoFiliais;
    dtmCadastroGrupoFiliais.Fecha(ctCrediarioTabelaConsultaGrupoFiliais);
  end;
end;

function TfrmCadastroGrupoFiliais.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroGrupoFiliais.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCadastroGrupoFiliais.ConsultarGruposFiliais;
end;

end.
