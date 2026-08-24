unit fmvisualizarlogparcelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmnavcontroles, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource,
  Grids, DBGrids, cpdbgrid, biblio, dmtecsoft;

type
  TfrmVisualizarLogParcelas = class(TfrmNavControles)
    dbgVisualizarLogParcelas: TtecDBGrid;
    dsrVisualizarLogParcelas: TtecDataSource;
    qryVisualizarLogParcelas: TtecQuery;
    qryVisualizarLogParcelascontrato: TStringField;
    qryVisualizarLogParcelasnumero: TIntegerField;
    qryVisualizarLogParcelasdatavencto: TDateField;
    qryVisualizarLogParcelasvalorvencto: TFloatField;
    qryVisualizarLogParcelasdatapagto: TDateField;
    qryVisualizarLogParcelasvalorpagto: TFloatField;
    qryVisualizarLogParcelasdescontosugerido: TFloatField;
    qryVisualizarLogParcelasfilialpagto: TIntegerField;
    qryVisualizarLogParcelastipopagto: TStringField;
    qryVisualizarLogParcelasformapagamento: TStringField;
    qryVisualizarLogParcelasdeventrada: TDateField;
    qryVisualizarLogParcelasdevcaixa: TDateField;
    qryVisualizarLogParcelasdevfilial: TIntegerField;
    qryVisualizarLogParcelasincobravel: TDateField;
    qryVisualizarLogParcelasorigempagto: TIntegerField;
    qryVisualizarLogParcelascopiapagto: TIntegerField;
    qryVisualizarLogParcelascontaboleto: TIntegerField;
    qryVisualizarLogParcelassequencia: TIntegerField;
    qryVisualizarLogParcelasevento: TIntegerField;
    qryVisualizarLogParcelasparcelaorigem: TStringField;
    qryVisualizarLogParcelasparcelaadicional: TBooleanField;
    qryVisualizarLogParcelaspagamentoextracaixa: TBooleanField;
    qryVisualizarLogParcelasparcelaoriginal: TIntegerField;
    qryVisualizarLogParcelasusuarioextracaixa: TStringField;
    qryVisualizarLogParcelasdataestorno: TDateTimeField;
    qryVisualizarLogParcelasusuarioestorno: TStringField;
    qryVisualizarLogParcelastiporecebimento: TIntegerField;
    qryVisualizarLogParcelastransacao: TIntegerField;
    qryVisualizarLogParcelasnossonumero: TLargeintField;
    qryVisualizarLogParcelasboleto_emitido: TBooleanField;
    qryVisualizarLogParcelastrigger_mode: TStringField;
    qryVisualizarLogParcelastrigger_tuple: TStringField;
    qryVisualizarLogParcelastrigger_changed: TDateTimeField;
    qryVisualizarLogParcelastrigger_user: TStringField;
    qryVisualizarLogParcelastrigger_id: TLargeintField;
    qryVisualizarLogParcelasdigverificadornossonumero: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
    
  end;

var
  frmVisualizarLogParcelas: TfrmVisualizarLogParcelas;
  AcionarTelaVisualizarLogParcelas: procedure (Owner: TComponent; Contrato: String);


implementation

{$R *.dfm}


procedure AcionarTelaVisualizarLogParcelas_(Owner: TComponent; Contrato: String);
begin
  if not assigned(frmVisualizarLogParcelas) or (frmVisualizarLogParcelas.Owner <> Owner) then
  begin
    if assigned(frmVisualizarLogParcelas) then
      frmVisualizarLogParcelas.free;

    frmVisualizarLogParcelas := TfrmVisualizarLogParcelas.create(Owner);

    frmVisualizarLogParcelas.qryVisualizarLogParcelas.parambyname('contrato').asString := Contrato;
    frmVisualizarLogParcelas.qryVisualizarLogParcelas.close;
    frmVisualizarLogParcelas.qryVisualizarLogParcelas.open;

    if frmVisualizarLogParcelas.qryVisualizarLogParcelas.isempty then
      MensagemAviso('Log não encontrada.')
    else
      frmVisualizarLogParcelas.showmodal;
  end;
  frmVisualizarLogParcelas.free;
//  frmVisualizarImageURL.BringToFront;
end;


{ TfrmVisualizarLogParcelas }

destructor TfrmVisualizarLogParcelas.Destroy;
begin
  frmVisualizarLogParcelas := nil;
  inherited;
end;

initialization
   AcionarTelaVisualizarLogParcelas :=  AcionarTelaVisualizarLogParcelas_;


end.
