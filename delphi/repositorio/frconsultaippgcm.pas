unit frconsultaippgcm;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, cpdbtext, Mask, cpdbfindcontrols, Buttons,
  ComCtrls, cppagecontrol, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  fmnavcontroles, frconsulta, fmconsultabasica, ctconstantes,
  fmconsultaporcampo, {Qete,} frconsultacodigo;

type
  TfraConsultaIPPGCM = class(Tframe)
    pgcProdutos: TtecPageControl;
    tstItemProduto: TTabSheet;
    tstProdutos: TTabSheet;
    tstGrupodeProdutos: TTabSheet;
    tstClasses: TTabSheet;
    tstMarcas: TTabSheet;
    fraConsultaItemProduto: TfraConsultaCodigo;
    fraConsultaProduto: TfraConsultaCodigo;
    fraConsultaGrupo: TfraConsultaCodigo;
    fraConsultaClasse: TfraConsultaCodigo;
    fraConsultaMarcas: TfraConsultaCodigo;
    procedure pgcProdutosChange(Sender: TObject);
    procedure fraConsultaItemProdutoedfCodigoExit(Sender: TObject);
    procedure fraConsultaProdutoedfCodigoExit(Sender: TObject);
    procedure fraConsultaGrupoedfCodigoExit(Sender: TObject);
    procedure fraConsultaClasseedfCodigoExit(Sender: TObject);
    procedure fraConsultaMarcasedfCodigoExit(Sender: TObject);
  private
    FMultiplosFiltros: boolean;
    { Private declarations }
  protected

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property MultiplosFiltros: boolean read FMultiplosFiltros write FMultiplosFiltros;
  end;

var
  TipoPesquisa: TTecPesquisa;


implementation

{$R *.dfm}


constructor TfraConsultaIPPGCM.Create(AOwner: TComponent);
begin
  inherited;
  MultiplosFiltros := false;
  fraConsultaItemProduto.edfCodigo.Group := 'ItemProduto';
  fraConsultaItemProduto.edfCodigo.denyinsert := True;
  fraConsultaItemProduto.edfCodigo.ActiveSetControls := false;

  fraConsultaProduto.edfCodigo.Group :=  'Produto';
  fraConsultaProduto.edfCodigo.denyinsert := True;
  fraConsultaProduto.edfCodigo.ActiveSetControls := false;

  fraConsultaGrupo.edfCodigo.Group :=  'Grupo';
  fraConsultaGrupo.edfCodigo.denyinsert := True;
  fraConsultaGrupo.edfCodigo.ActiveSetControls := false;

  fraConsultaClasse.edfCodigo.Group :=  'Classe';
  fraConsultaClasse.edfCodigo.denyinsert := True;
  fraConsultaClasse.edfCodigo.ActiveSetControls := false;

  fraConsultaMarcas.edfCodigo.Group :=  'Marca';
  fraConsultaMarcas.edfCodigo.denyinsert := True;
  fraConsultaMarcas.edfCodigo.ActiveSetControls := false;

end;

procedure TfraConsultaIPPGCM.pgcProdutosChange(Sender: TObject);

 procedure LimparControles(Controle: TTecFindCustom);
 begin
   if (controle = fraConsultaItemProduto.edfCodigo) and
      (controle.Text <> '') then
   begin

     if tstProdutos.TabVisible and fraConsultaProduto.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaProduto.edfCodigo.Clear;
       fraConsultaProduto.dtxDescricao.Field.Clear;
     end;

     if tstGrupodeProdutos.TabVisible and fraConsultaGrupo.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaGrupo.edfCodigo.Clear;
       fraConsultaGrupo.dtxDescricao.Field.Clear;
     end;

     if tstClasses.TabVisible and fraConsultaClasse.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaClasse.edfCodigo.Clear;
       fraConsultaClasse.dtxDescricao.Field.Clear;
     end;

     if tstMarcas.TabVisible and fraConsultaMarcas.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaMarcas.edfCodigo.Clear;
       fraConsultaMarcas.dtxDescricao.Field.Clear;
     end;

   end
   else
   if (controle = fraConsultaProduto.edfCodigo) and
      (controle.Text <> '') then
   begin
     if tstItemProduto.TabVisible and fraConsultaItemProduto.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaItemProduto.edfCodigo.clear;
       fraConsultaItemProduto.dtxDescricao.Field.Clear;
     end;

     if tstGrupodeProdutos.TabVisible and fraConsultagrupo.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaGrupo.edfCodigo.Clear;
       fraConsultaGrupo.dtxDescricao.Field.Clear;
     end;

     if tstClasses.TabVisible and fraConsultaclasse.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaClasse.edfCodigo.Clear;
       fraConsultaClasse.dtxDescricao.Field.Clear;
     end;

     if tstMarcas.TabVisible and fraConsultamarcas.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaMarcas.edfCodigo.Clear;
       fraConsultaMarcas.dtxDescricao.Field.Clear;
     end;
   end
   else
   if (controle = fraConsultaGrupo.edfCodigo) and 
      (controle.Text <> '') then
   begin
     if tstItemProduto.TabVisible and fraConsultaItemProduto.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaItemProduto.edfCodigo.clear;
       fraConsultaItemProduto.dtxDescricao.Field.Clear;
     end;
     if tstProdutos.TabVisible and fraConsultaProduto.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaProduto.edfCodigo.Clear;
       fraConsultaProduto.dtxDescricao.Field.Clear;
     end;
     if tstClasses.TabVisible and fraConsultaclasse.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaClasse.edfCodigo.Clear;
       fraConsultaClasse.dtxDescricao.Field.Clear;
     end;
     if tstMarcas.TabVisible and fraConsultamarcas.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaMarcas.edfCodigo.Clear;
       fraConsultaMarcas.dtxDescricao.Field.Clear;
     end;
   end
   else
   if (controle = fraConsultaClasse.edfCodigo) and
      (controle.Text <> '') then
   begin
     if tstItemProduto.TabVisible and fraConsultaItemProduto.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaItemProduto.edfCodigo.clear;
       fraConsultaItemProduto.dtxDescricao.Field.Clear;
     end;
     if tstProdutos.TabVisible and fraConsultaProduto.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaProduto.edfCodigo.Clear;
       fraConsultaProduto.dtxDescricao.Field.Clear;
     end;
     if tstGrupodeProdutos.TabVisible and fraConsultagrupo.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaGrupo.edfCodigo.Clear;
       fraConsultaGrupo.dtxDescricao.Field.Clear;
     end;
     if tstMarcas.TabVisible and fraConsultamarcas.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaMarcas.edfCodigo.Clear;
       fraConsultaMarcas.dtxDescricao.Field.Clear;
     end;
   end
   else
   if (controle = fraConsultaMarcas.edfCodigo) and
      (controle.Text <> '') then
   begin
     if tstItemProduto.TabVisible and fraConsultaItemProduto.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaItemProduto.edfCodigo.clear;
       fraConsultaItemProduto.dtxDescricao.Field.Clear;
     end;
     if tstProdutos.TabVisible and fraConsultaProduto.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaProduto.edfCodigo.Clear;
       fraConsultaProduto.dtxDescricao.Field.Clear;
     end;
     if tstGrupodeProdutos.TabVisible and fraConsultagrupo.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaGrupo.edfCodigo.Clear;
       fraConsultaGrupo.dtxDescricao.Field.Clear;
     end;
     if tstClasses.TabVisible and fraConsultaclasse.edfCodigo.datasource.dataset.active then
     begin
       fraConsultaClasse.edfCodigo.Clear;
       fraConsultaClasse.dtxDescricao.Field.Clear;
     end;
   end;
 end;

begin
  inherited;
  if not MultiplosFiltros then
  begin
    if pgcProdutos.ActivePage = tstItemProduto then
      LimparControles(fraConsultaItemProduto.edfCodigo)
    else
    if pgcProdutos.ActivePage = tstProdutos then
      LimparControles(fraConsultaProduto.edfCodigo)
    else
    if pgcProdutos.ActivePage = tstGrupodeProdutos then
      LimparControles(fraConsultaGrupo.edfCodigo)
    else
    if pgcProdutos.ActivePage = tstClasses then
      LimparControles(fraConsultaClasse.edfCodigo)
    else
    if pgcProdutos.ActivePage = tstMarcas then
      LimparControles(fraConsultaMarcas.edfCodigo);
  end;
end;

procedure TfraConsultaIPPGCM.fraConsultaItemProdutoedfCodigoExit(
  Sender: TObject);
begin
  fraConsultaItemProduto.edfCodigoExit(Sender);
  pgcProdutosChange(self);
end;

procedure TfraConsultaIPPGCM.fraConsultaProdutoedfCodigoExit(
  Sender: TObject);
begin
  fraConsultaProduto.edfCodigoExit(Sender);
  pgcProdutosChange(self);
end;

procedure TfraConsultaIPPGCM.fraConsultaGrupoedfCodigoExit(
  Sender: TObject);
begin
  fraConsultaGrupo.edfCodigoExit(Sender);
  pgcProdutosChange(self);
end;

procedure TfraConsultaIPPGCM.fraConsultaClasseedfCodigoExit(
  Sender: TObject);
begin
  fraConsultaClasse.edfCodigoExit(Sender);
  pgcProdutosChange(self);
end;

procedure TfraConsultaIPPGCM.fraConsultaMarcasedfCodigoExit(
  Sender: TObject);
begin
  fraConsultaMarcas.edfCodigoExit(Sender);
  pgcProdutosChange(self);
end;

end.



