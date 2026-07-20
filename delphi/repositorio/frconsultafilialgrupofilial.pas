unit frconsultafilialgrupofilial;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  frconsulta, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  frconsultacodigo, ComCtrls, ctconstantes, cpdbfindcontrols;

type
  TfraConsultaFilialGrupoFilial = class(Tframe)
    pgcFiliaisGruposFiliais: TPageControl;
    tstFilial: TTabSheet;
    tstGrupodeFilial: TTabSheet;
    fraConsultaFilial: TfraConsultaCodigo;
    fraConsultaGrupoFilial: TfraConsultaCodigo;
    procedure pgcFiliaisGruposFiliaisChange(Sender: TObject);
    procedure fraConsultaFilialedfCodigoExit(Sender: TObject);
    procedure fraConsultaGrupoFilialedfCodigoExit(Sender: TObject);
    procedure fraConsultaFilialsbnProcuraClick(Sender: TObject);
  private
    FMultiplosFiltros: boolean;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    property MultiplosFiltros: boolean read FMultiplosFiltros write FMultiplosFiltros;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfraConsultaFilialGrupoFilial }

constructor TfraConsultaFilialGrupoFilial.Create(AOwner: TComponent);
begin
  inherited;
  MultiplosFiltros := false;

  fraConsultaFilial.edfcodigo.group := 'Filial';
  fraConsultaFilial.edfcodigo.ActiveSetControls := false;
  fraConsultaFilial.edfcodigo.denyinsert := true;

  fraConsultaGrupoFilial.edfcodigo.group := 'GrupoFilial';
  fraConsultaGrupoFilial.edfcodigo.ActiveSetControls := false;
  fraConsultaGrupoFilial.edfcodigo.denyinsert := true;
  
end;

procedure TfraConsultaFilialGrupoFilial.pgcFiliaisGruposFiliaisChange(
  Sender: TObject);

 procedure LimparControles(Controle: TTecFindCustom);
 begin
   if (controle = fraConsultaFilial.edfCodigo) and
      (controle.Text<>'') then
   begin
     if fraConsultaGrupoFilial.edfcodigo.datasource.dataset.active then
     begin
       fraConsultaGrupoFilial.edfcodigo.clear;
       fraconsultagrupofilial.dtxDescricao.field.clear;
     end;
   end
   else
   if (controle = fraConsultaGrupoFilial.edfCodigo) and
      (controle.Text<>'') then
   begin
     if fraConsultaFilial.edfcodigo.datasource.dataset.active then
     begin
       fraConsultaFilial.edfcodigo.clear;
       fraconsultafilial.dtxDescricao.field.clear;
     end;  
   end;
 end;

begin
  if not MultiplosFiltros then
  begin
    if pgcFiliaisGruposFiliais.ActivePage = tstFilial then
      LimparControles(fraConsultaFilial.edfcodigo)
    else
      LimparControles(fraConsultaGrupoFilial.edfcodigo);
  end;
end;

procedure TfraConsultaFilialGrupoFilial.fraConsultaFilialedfCodigoExit(
  Sender: TObject);
begin
  fraConsultaFilial.edfCodigoExit(Sender);
  pgcFiliaisGruposFiliaisChange(self);
end;

procedure TfraConsultaFilialGrupoFilial.fraConsultaGrupoFilialedfCodigoExit(
  Sender: TObject);
begin
  fraConsultaGrupoFilial.edfCodigoExit(Sender);
  pgcFiliaisGruposFiliaisChange(self);
end;

procedure TfraConsultaFilialGrupoFilial.fraConsultaFilialsbnProcuraClick(
  Sender: TObject);
begin
  fraConsultaFilial.sbnProcuraClick(Sender);

end;

end.
