unit fmcadastroRedes_Adquirentes;

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
  TfrmCadastroRedes_Adquirentes = class(TfrmCadastroPadrao)
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
    function  AcionaCadastroFiliaisRedes_Adquirentes(Editar: Boolean):boolean;
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
  frmCadastroRedes_Adquirentes: TfrmCadastroRedes_Adquirentes;

implementation

uses dmcadastroRedes_Adquirentes, fmcadastrofiliaisRedes_Adquirentes;

{$R *.dfm}

function TfrmCadastroRedes_Adquirentes.AcionaCadastroFiliaisRedes_Adquirentes(Editar: Boolean): boolean;
begin
  frmCadastroFiliaisRedes_Adquirentes:= TfrmCadastroFiliaisRedes_Adquirentes.Create(frmCadastroFiliaisRedes_Adquirentes);
  frmCadastroFiliaisRedes_Adquirentes.EditandoRegistro:= Editar;
  frmCadastroFiliaisRedes_Adquirentes.SetDataModulo(dtmCadastroRedes_Adquirentes);
  frmCadastroFiliaisRedes_Adquirentes.DataSet:= dtmCadastroRedes_Adquirentes.TabelaFiliaisRedes_Adquirentes;
  Result := dtmCadastroRedes_Adquirentes.IncluirFilialGrupoFilial(Editar);
  frmCadastroFiliaisRedes_Adquirentes.ShowModal;
  frmCadastroFiliaisRedes_Adquirentes.free;
  dbgFiliais.SetFocus;
end;

procedure TfrmCadastroRedes_Adquirentes.sbnIncluirFilialClick(Sender: TObject);
begin
  AcionaCadastroFiliaisRedes_Adquirentes(False);
end;

procedure TfrmCadastroRedes_Adquirentes.sbnExcluirFilialClick(Sender: TObject);
begin
  dtmCadastroRedes_Adquirentes.ExcluirFilialGrupoFilial;
end;

procedure TfrmCadastroRedes_Adquirentes.dbgFiliaisDblClick(Sender: TObject);
begin
  AcionaCadastroFiliaisRedes_Adquirentes(True);
end;

procedure TfrmCadastroRedes_Adquirentes.dbgFiliaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
    case key of
      TeclaEditarRegistro : AcionaCadastroFiliaisRedes_Adquirentes(True);
      TeclaInserirRegistro: AcionaCadastroFiliaisRedes_Adquirentes(False);
    end;
end;

constructor TfrmCadastroRedes_Adquirentes.Create(AOwner: TComponent);
begin
  dtmCadastroRedes_Adquirentes:= TdtmCadastroRedes_Adquirentes.Create(Self);
  inherited;
  DataSet:= dtmCadastroRedes_Adquirentes.TabelaRedes_Adquirentes;
end;

destructor TfrmCadastroRedes_Adquirentes.Destroy;
begin
  dtmCadastroRedes_Adquirentes:=nil;
  inherited;
  frmCadastroRedes_Adquirentes:= nil;
end;

function TfrmCadastroRedes_Adquirentes.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmCadastroRedes_Adquirentes.ExisteGrupoFilial(NomeCampo, Value);
end;

function TfrmCadastroRedes_Adquirentes.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if not CtrlOn then
    if Result then
      dtmCadastroRedes_Adquirentes.ExcluirGrupoFilial;
end;

function TfrmCadastroRedes_Adquirentes.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastroRedes_Adquirentes.GravarGrupoFilial;
end;

function TfrmCadastroRedes_Adquirentes.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then
    if Result then
      dtmCadastroRedes_Adquirentes.IncluirGrupoFilial;
end;

function TfrmCadastroRedes_Adquirentes.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if not CtrlOn then
  begin
    dtmCadastroRedes_Adquirentes.Abre(ctCrediarioTabelaConsultaRedes_Adquirentes);
    Result:= inherited InternoPesquisar('Grupos de Filial');
    if Result = mrOK then
      dtmCadastroRedes_Adquirentes.PosicionarRedes_Adquirentes;
    dtmCadastroRedes_Adquirentes.Fecha(ctCrediarioTabelaConsultaRedes_Adquirentes);
  end;
end;

function TfrmCadastroRedes_Adquirentes.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroRedes_Adquirentes.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCadastroRedes_Adquirentes.ConsultarRedes_Adquirentes;
end;

end.
