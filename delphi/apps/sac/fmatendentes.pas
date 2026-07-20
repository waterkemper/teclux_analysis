unit fmatendentes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, dmatendentes, ctconstantes, Grids, DBGrids, cpdbgrid,
  StdCtrls, ZQuery, {Qete,} fmconsultabasica, fmconsultaporcampo, fmajudabt,
  ExtCtrls, Buttons, ComCtrls;

type
  TfrmAtendentes = class(TfrmAjudaBt)
    dbgUsuarios: TtecDBGrid;
    procedure dbgUsuariosDblClick(Sender: TObject);
  protected
    dtmAtendentes: TdtmAtendentes;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmAtendentes: TfrmAtendentes;
  tipoPesquisa: TtecPesquisa;

implementation

{$R *.dfm}

{ TfrmAtendentes }

function TfrmAtendentes.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  if tipoPesquisa = pesFILTROSAC then
     Result := dtmAtendentes.ExisteFiltroSac(NomeCampo,Value)
  else if tipoPesquisa = pesSHADOW then
     Result := dtmAtendentes.ExisteShadow(NomeCampo,Value)
  else Result := False;
end;

function TfrmAtendentes.InternoPesquisar(Titulo: String): Integer;
begin
  if TipoPesquisa <> pesNENHUMA then begin
    if TipoPesquisa = pesFILTROSAC then Titulo:='FiltroSac';
    if TipoPesquisa = pesSHADOW then Titulo:='Shadow';
    dtmAtendentes.Abre(ctAtendentesConsulta);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
       if tipoPesquisa = pesFILTROSAC then begin
          dtmAtendentes.AtualizaFiltroSac(dtmAtendentes.CodigoFiltroSac);
          dbgUsuarios.Refresh;
       end;
       if tipoPesquisa = pesSHADOW then begin
          dtmAtendentes.AtualizaShadow(dtmAtendentes.CodigoShadow);
          dbgUsuarios.Refresh;
       end;
  dtmAtendentes.Fecha(ctAtendentesConsulta);
  tipoPesquisa:=pesNENHUMA;
  end else Result := mrNone;
end;

function TfrmAtendentes.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmAtendentes.TabelaDePesquisa: TZDataSet;
begin
  if tipoPesquisa = pesFILTROSAC then
     Result := dtmAtendentes.ConsultaFiltroSac
  else if tipoPesquisa = pesSHADOW then
     Result := dtmAtendentes.ConsultaShadow
  else Result := nil
end;

function TfrmAtendentes.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  if tipoPesquisa = pesFILTROSAC then
     Result := dtmAtendentes.ConsultaFiltroSac
  else if tipoPesquisa = pesSHADOW then
     Result := dtmAtendentes.ConsultaShadow
  else Result := nil
end;

constructor TfrmAtendentes.Create(AOwner: TComponent);
begin
  dtmAtendentes := TdtmAtendentes.Create(Self);
  inherited;
  dtmAtendentes.Abre(ctAtendentes);
end;

destructor TfrmAtendentes.Destroy;
begin
  dtmAtendentes.Fecha(ctAtendentes);
  inherited;
  frmAtendentes := nil;
end;

procedure TfrmAtendentes.dbgUsuariosDblClick(Sender: TObject);
begin
  inherited;
  if dbgUsuarios.Columns[dbgUsuarios.SelectedIndex].FieldName = 'filtrosac' then tipoPesquisa := pesFILTROSAC;
  if dbgUsuarios.Columns[dbgUsuarios.SelectedIndex].FieldName = 'shadow'    then tipoPesquisa := pesSHADOW;
  InternoPesquisar('');
end;

procedure TfrmAtendentes.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F9 : if CtrlOn then begin
                CtrlOn:=false;
                if dbgUsuarios.Columns[dbgUsuarios.SelectedIndex].FieldName = 'filtrosac' then tipoPesquisa := pesFILTROSAC;
                if dbgUsuarios.Columns[dbgUsuarios.SelectedIndex].FieldName = 'shadow'    then tipoPesquisa := pesSHADOW;
                InternoPesquisar('');
             end;
  end;
end;

end.
