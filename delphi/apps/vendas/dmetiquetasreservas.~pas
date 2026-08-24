unit dmetiquetasreservas;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB,
  //Terceiros
  FR_Class, FR_DSet, FR_DBSet, ZQuery, ZPgSqlQuery,
  //Biblio
  ctconstantes, biblio,
  //Repositorio
  dmbasico, dmtecsoft,
  //Componentes
  cpquery, cpdatasource,
  clparametrossistema,
  fmpreviewpadrao, ZTransact;

type
  TdtmEtiquetasReservas = class(TdtmBasico)
    qryEtiquetasReservas: TtecQuery;
    dsrEtiquetasReservas: TtecDataSource;
    fdsEtiquetas: TfrDBDataSet;
    frpEtiquetas: TfrReport;
    qryAtualizaEtiquetasReservas: TtecQuery;
    qryEtiquetasReservasreserva: TIntegerField;
    qryEtiquetasReservascodigofilial: TIntegerField;
    qryEtiquetasReservasdata: TDateTimeField;
    qryEtiquetasReservascodigoproduto: TLargeintField;
    qryEtiquetasReservasdescricaoproduto: TStringField;
    qryEtiquetasReservasdescricaomarca: TStringField;
    qryEtiquetasReservascodigovendedor: TIntegerField;
    qryEtiquetasReservasnomevendedor: TStringField;
    qryEtiquetasReservascliente: TStringField;
    qryEtiquetasReservasendereco: TStringField;
    procedure frpEtiquetasPrintReport;
  private
    FParametroFilial: String;
    FParametroVendedor: String;
    FParametroDataFinal: String;
    FParametroDataInicial: String;
    FParametroImpressas: Boolean;
    procedure SetParametroDataFinal(const Value: String);
    procedure SetparametroDataInicial(const Value: String);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    procedure AbreEtiquetasReserva;
    property ParametroImpressas: Boolean read FParametroImpressas write FParametroImpressas;
    property ParametroDataInicial: String read FParametroDataInicial write SetparametroDataInicial;
    property ParametroDataFinal: String read FParametroDataFinal write SetParametroDataFinal;
    property ParametroFilial: String read FParametroFilial write FParametroFilial;
    property ParametroVendedor: String read FParametroVendedor write FParametroVendedor;
  end;
var
  dtmEtiquetasReservas: TdtmEtiquetasReservas;

implementation

{$R *.dfm}

constructor TdtmEtiquetasReservas.Create(AOwner: TComponent);
begin
  inherited;
  qryEtiquetasReservas.Tag := ctEtiquetasReservas;
end;

procedure TdtmEtiquetasReservas.AbreEtiquetasReserva;
var
  Linha: string;
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  Fecha(ctEtiquetasReservas);
  Linha := ' ';
  if FParametroFilial <> '' then
    Linha := Linha + ' AND (pr.filial = ' + FParametroFilial + ') ';
  if FParametroVendedor <> '' then
    Linha := Linha + ' AND (u.codigo = ' + FParametroVendedor + ') ';
  if not DataEmBranco(FParametroDataInicial) then
    Linha := Linha + ' AND (cast(r.data as date) >= ''' + FParametroDataInicial + ''') ';
  if not DataEmBranco(FParametroDataFinal) then
    Linha := Linha + ' AND (cast(r.data as date) <= ''' + FParametroDataFinal + ''') ';
  qryAtualizaEtiquetasReservas.Sql[9] := Linha + ' ) ';
  if FParametroImpressas then
    Linha := Linha + ' AND (not pr.etiqueta) '
  else
    Linha := Linha + '';
  qryEtiquetasReservas.Sql[19] := Linha;
  Abre(ctEtiquetasReservas);
  if not qryEtiquetasReservas.IsEmpty then
  begin
   frmPreview := TfrmPreviewPadrao.create(self);
   try
    Relatorio := frmPreview.frCompositeReport;
    frmPreview.frCompositeReport.Reports.Clear;
    frmPreview.frCompositeReport.Reports.Add(frpEtiquetas);
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
   finally
    frmPreview.Free
   end;
   if frVariables['Imprimido'] and not FParametroImpressas then
     qryAtualizaEtiquetasReservas.ExecSql;
  end
  else
    MensagemAviso(ctSEMETIQUETASPARAIMPRIMIR);
end;

procedure TdtmEtiquetasReservas.frpEtiquetasPrintReport;
begin
  frVariables['Imprimido'] := True;
end;

procedure TdtmEtiquetasReservas.SetParametroDataFinal(const Value: String);
begin
  FParametroDataFinal := Value;
  if Value<>'' then
  begin
   if FParametroDataInicial='' then
     ParametroDataInicial:=FParametroDataFinal;
  end
  else
    ParametroDataFinal:=FParametroDataInicial;
end;

procedure TdtmEtiquetasReservas.SetparametroDataInicial(
  const Value: String);
begin
  FParametroDataInicial := Value;
end;

end.
