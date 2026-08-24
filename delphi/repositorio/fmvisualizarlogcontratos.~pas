unit fmvisualizarlogcontratos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmnavcontroles, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource,
  Grids, DBGrids, cpdbgrid, biblio, dmtecsoft;

type
  Tfrmvisualizarlogcontratos = class(TfrmNavControles)
    dbgvisualizarlogcontratos: TtecDBGrid;
    qryvisualizarlogcamposcontratos: TtecQuery;
    dsrvisualizarlogcamposcontratos: TtecDataSource;
    qryvisualizarlogcamposcontratoscampoalterado: TStringField;
    qryvisualizarlogcamposcontratosvaloranterior: TStringField;
    qryvisualizarlogcamposcontratosvaloralterado: TStringField;
    qryHistoricoContrato: TtecQuery;
    dsrHistoricoContrato: TtecDataSource;
    qryHistoricoContrato_Anterior: TtecQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    qryHistoricoContratonumero: TStringField;
    qryHistoricoContratoos_garantia: TBooleanField;
    qryHistoricoContratoos_garantia_status: TStringField;
    qryHistoricoContratoos_garantia_processo: TStringField;
    qryHistoricoContratoos_cortesia: TBooleanField;
    qryHistoricoContratotrigger_mode: TStringField;
    qryHistoricoContratotrigger_tuple: TStringField;
    qryHistoricoContratotrigger_changed: TDateTimeField;
    qryHistoricoContratotrigger_user: TStringField;
    qryHistoricoContratotrigger_id: TLargeintField;
    qryHistoricoContratodata: TDateField;
    qryHistoricoContratofaturamento: TDateField;
    qryHistoricoContratorenegociacao: TDateField;
    qryHistoricoContratoavalista: TIntegerField;
    qryHistoricoContratocliente: TIntegerField;
    qryHistoricoContratotipocliente: TStringField;
    qryHistoricoContratovendedor: TIntegerField;
    qryHistoricoContratofilialvenda: TIntegerField;
    qryHistoricoContratovalorvista: TFloatField;
    qryHistoricoContratovalorprazo: TFloatField;
    qryHistoricoContratocreditotroca: TFloatField;
    qryHistoricoContratodesconto: TFloatField;
    qryHistoricoContratofrete: TFloatField;
    qryHistoricoContratoseguro: TFloatField;
    qryHistoricoContratoagente: TIntegerField;
    qryHistoricoContratoanalista: TIntegerField;
    qryHistoricoContratoorigem: TStringField;
    qryHistoricoContratoprimogenito: TStringField;
    qryHistoricoContratoplano: TIntegerField;
    qryHistoricoContratotaxajuros: TFloatField;
    qryHistoricoContratoconsideracoes: TStringField;
    qryHistoricoContratosituacao: TStringField;
    qryHistoricoContratoempcargo: TIntegerField;
    qryHistoricoContratoobservacoes: TStringField;
    qryHistoricoContratoquitado: TBooleanField;
    qryHistoricoContratocan_data: TDateField;
    qryHistoricoContratocan_usuariologado: TIntegerField;
    qryHistoricoContratocan_usuarioautorizacao: TIntegerField;
    qryHistoricoContratodatareservado: TDateField;
    qryHistoricoContratocontribicms: TBooleanField;
    qryHistoricoContratovendaconsumidorfinal: TBooleanField;
    qryHistoricoContratousuariologadoalteracao: TIntegerField;
    qryHistoricoContratousuarioalteracao: TIntegerField;
    qryHistoricoContratosuframa: TStringField;
    qryHistoricoContratoentrua: TStringField;
    qryHistoricoContratoentnumero: TIntegerField;
    qryHistoricoContratoentbairro: TIntegerField;
    qryHistoricoContratoentcep: TIntegerField;
    qryHistoricoContratoentcomplemento: TStringField;
    qryHistoricoContratoentcidade: TIntegerField;
    qryHistoricoContratoentestado: TStringField;
    qryHistoricoContratoentrada: TDateField;
    qryHistoricoContratonomesituacao: TStringField;
    procedure qryvisualizarlogcontratosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;

  end;

var
  frmvisualizarlogcontratos: Tfrmvisualizarlogcontratos;
  AcionarTelavisualizarlogcontratos: procedure (Owner: TComponent; Contrato: String);


implementation

{$R *.dfm}


procedure AcionarTelavisualizarlogcontratos_(Owner: TComponent; Contrato: String);
begin
  if not assigned(frmvisualizarlogcontratos) or (frmvisualizarlogcontratos.Owner <> Owner) then
  begin
    if assigned(frmvisualizarlogcontratos) then
      frmvisualizarlogcontratos.free;

    frmvisualizarlogcontratos := Tfrmvisualizarlogcontratos.create(Owner);

    frmvisualizarlogcontratos.qryHistoricoContrato.parambyname('contrato').asString := Contrato;
    frmvisualizarlogcontratos.qryHistoricoContrato.close;
    frmvisualizarlogcontratos.qryHistoricoContrato.open;

    if frmvisualizarlogcontratos.qryHistoricoContrato.isempty then
      MensagemAviso('Log não encontrada.')
    else
      frmvisualizarlogcontratos.showmodal;
  end;
  frmvisualizarlogcontratos.free;
//  frmVisualizarImageURL.BringToFront;
end;


{ Tfrmvisualizarlogcontratos }

destructor Tfrmvisualizarlogcontratos.Destroy;
begin
  frmvisualizarlogcontratos := nil;
  inherited;
end;

procedure Tfrmvisualizarlogcontratos.qryvisualizarlogcontratosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
                                                                                                     {
  qryvisualizarlogcamposcontratos.parambyname('contrato').asString := qryvisualizarlogcontratosnumero.asString;
  qryvisualizarlogcamposcontratos.parambyname('id1').asString := qryvisualizarlogcontratostrigger_id.asString;
  qryvisualizarlogcamposcontratos.parambyname('id2').asString := qryvisualizarlogcontratostrigger_id2.asString;
  qryvisualizarlogcamposcontratos.close;
  qryvisualizarlogcamposcontratos.open;
}
end;

initialization
   AcionarTelavisualizarlogcontratos :=  AcionarTelavisualizarlogcontratos_;


end.
