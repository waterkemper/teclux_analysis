unit fmcadastrofiliaisgrupofiliais;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, DB, {Qete,} StdCtrls, Mask, DBCtrls,
  // Terceiros
  ZQuery,
  // Biblio
  ctconstantes, biblio,
  // Componentes
  cpnumero, cptexto, cpdbfindcontrols, cpdbtext,
  // Repositorio
  fmconsultabasica, fmcadastropadrao, fmconsultaporcampo,
  // Outros
  dmcadastrogrupofiliais, ComCtrls, ToolWin;

type
  TfrmCadastroFiliaisGrupoFiliais = class(TfrmCadastroPadrao)
    gbxFilial: TGroupBox;
    lblCodigoFilial: TLabel;
    flkCodigo: TtecDBFindLookup;
    sbnPesquisarFilial: TSpeedButton;
    lblNomeFilial: TLabel;
    dtxFilial: TtecDBText;
    pnlFundoJanela: TPanel;
    procedure sbnPesquisarFilialClick(Sender: TObject);
    procedure flkCodigoMessage(var Msg: String);
    procedure flkCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    FCadastroGrupoFiliais: TdtmCadastroGrupoFiliais;
    FEditandoRegistro: Boolean;
    procedure SetEditandoRegistro(const Value: Boolean);
    function  PesquisaHabilitada: Boolean;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;  public
    procedure  SetDataModulo(Dtm: TdtmCadastroGrupoFiliais);
    destructor Destroy; override;
    property   CadastroGrupoFiliais: TdtmCadastroGrupoFiliais read FCadastroGrupoFiliais;
    property   EditandoRegistro: Boolean read FEditandoRegistro write SetEditandoRegistro;
  end;

var
  frmCadastroFiliaisGrupoFiliais: TfrmCadastroFiliaisGrupoFiliais;

implementation

{$R *.dfm}

procedure TfrmCadastroFiliaisGrupoFiliais.sbnPesquisarFilialClick(Sender: TObject);
begin
  CtrlOn:= True;
  ActiveControl:= flkCodigo;
  InternoPesquisar('Filiais');
end;

function TfrmCadastroFiliaisGrupoFiliais.PesquisaHabilitada: Boolean;
begin
  if (CtrlOn) and (ActiveControl = flkCodigo) then
       Result:= True  else Result:= False;
end;

procedure TfrmCadastroFiliaisGrupoFiliais.SetDataModulo(Dtm: TdtmCadastroGrupoFiliais);
begin
  FCadastroGrupoFiliais:= Dtm;
end;

destructor TfrmCadastroFiliaisGrupoFiliais.Destroy;
begin
  inherited;
  frmCadastroFiliaisGrupoFiliais:= nil;
end;

function TfrmCadastroFiliaisGrupoFiliais.InternoExcluir: Boolean;
begin  Result := inherited InternoExcluir;
  if not CtrlOn then begin
    if Result then
      CadastroGrupoFiliais.ExcluirFilialGrupoFilial;
  end;
end;

function TfrmCadastroFiliaisGrupoFiliais.InternoGravar: Boolean;begin
  Result:= True;
  if ActiveControl is TtecFindCustom then
    Result:= TtecFindCustom(ActiveControl).Exist;
  if Result then begin
    Result:= inherited InternoGravar;
    if Result then
      CadastroGrupoFiliais.GravarFilialGrupoFilial;
  end;
end;

function TfrmCadastroFiliaisGrupoFiliais.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then begin
    if Result then
      CadastroGrupoFiliais.IncluirFilialGrupoFilial(False);
  end;
end;

function TfrmCadastroFiliaisGrupoFiliais.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if PesquisaHabilitada then begin
    CadastroGrupoFiliais.Abre(ctCrediarioTabelaConsultaFiliais);
    Result:= inherited InternoPesquisar('Filiais');
    if Result = mrOK then
      CadastroGrupoFiliais.SelecionarFilial;
    CadastroGrupoFiliais.Fecha(ctCrediarioTabelaConsultaFiliais);
  end;
end;

function TfrmCadastroFiliaisGrupoFiliais.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

function TfrmCadastroFiliaisGrupoFiliais.TabelaDePesquisa: TZDataSet;
begin
  Result:= CadastroGrupoFiliais.ConsultarFiliais;
end;

function TfrmCadastroFiliaisGrupoFiliais.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= CadastroGrupoFiliais.ExisteFilial(NomeCampo, Value);
end;

procedure TfrmCadastroFiliaisGrupoFiliais.flkCodigoMessage(var Msg: String);
begin
  inherited;
  msg := Format(ctREGISTROINCLUIDO,[flkCodigo.Text, 'no Grupo de Filial'])
end;

procedure TfrmCadastroFiliaisGrupoFiliais.SetEditandoRegistro(const Value: Boolean);
begin
  if FEditandoRegistro <> Value then
    FEditandoRegistro:= Value;
end;

procedure TfrmCadastroFiliaisGrupoFiliais.flkCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) then
    if FEditandoRegistro or (flkCodigo.ForeignFound = stFound) then
      InternoGravar;
end;

end.
