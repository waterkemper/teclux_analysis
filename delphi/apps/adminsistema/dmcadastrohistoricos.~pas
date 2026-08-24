unit dmcadastrohistoricos;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Controls, Forms, Dialogs, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpquery, cpdatasource,
  //Repositorio
  dmbasico, FR_DSet, FR_DBSet, FR_Class,
  fmpreviewpadrao;
type
  TdtmCadastroHistoricos = class(TdtmBasico)
    qryHistoricos: TtecQuery;
    dsrHistoricos: TtecDataSource;
    spcHistoricoProximo: TtecQuery;
    qryConsultaHistoricos: TtecQuery;
    qryConsultaHistoricosdescricao: TStringField;
    qryConsultaHistoricoscodigo: TIntegerField;
    qryHistoricoscodigo: TIntegerField;
    qryHistoricosdescricao: TStringField;
    qryHistoricosinativo: TDateField;
    qryHistoricoscaixa: TBooleanField;
    qryHistoricospagar: TBooleanField;
    qryHistoricoscontabil: TBooleanField;
    spcHistoricoProximocodigo: TIntegerField;
    qryImprimirHistoricos: TtecQuery;
    frpImpressaoHistoricos: TfrReport;
    fdsImpressaoHistoricos: TfrDBDataSet;
    qryImprimirHistoricoscodigo: TIntegerField;
    qryImprimirHistoricosdescricao: TStringField;
    qryImprimirHistoricosinativo: TDateField;
    qryImprimirHistoricoscaixa: TBooleanField;
    qryImprimirHistoricospagar: TBooleanField;
    qryImprimirHistoricoscontabil: TBooleanField;
    procedure qryHistoricosNewRecord(DataSet: TDataSet);
    procedure frpImpressaoHistoricosBeforePrint(Memo: TStringList;
      View: TfrView);
  protected
    function  GetTabelaConsultarHistorico: TTecQuery;
    function  GetTabelaHistoricos: TZDataSet;
  public
    procedure RefazConsultaHistorico(Codigo: Integer);
    procedure SelecionarHistoricos;
    function  ExisteHistorico(campo, codigo: string): boolean;
    function  PosicionarRegistroHistorico: Boolean;
    function  IncluirHistoricos: Boolean;
    function  ExcluirHistoricos: Boolean;
    function  GravarHistorico: Boolean;
    constructor Create(AOwner: TComponent); override;
    property TabelaConsultarHistorico: TtecQuery read GetTabelaConsultarHistorico;
    property TabelaHistoricos: TZDataset read GetTabelaHistoricos;
    procedure ImprimirHistoricos(Ordenacao, Inativo: integer;
                              caixa, Contasapagar, contabil: Boolean);
  end;

var
  dtmCadastroHistoricos: TdtmCadastroHistoricos;

implementation

Uses
  //CLX
  ctconstantes, biblio;

{$R *.dfm}

constructor TdtmCadastroHistoricos.Create(AOwner: TComponent);
begin
  inherited;
  qryHistoricos.Tag         := ctCaixaCadastroHistoricos;
  qryConsultaHistoricos.Tag := ctCaixaConsultaHistoricos;
end;

function TdtmCadastroHistoricos.ExcluirHistoricos: Boolean;
begin
  Result:= False;
  if not qryHistoricos.IsEmpty then begin
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, [ctOHISTORICO])) = smbok then begin
      qryHistoricos.Delete;
      Perpetrar([qryHistoricos]);
      Result:= True;
    end
  end;
end;

function TdtmCadastroHistoricos.ExisteHistorico(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaHistoricos, campo, codigo);
end;

function TdtmCadastroHistoricos.GetTabelaConsultarHistorico: TTecQuery;
begin
  Result := qryConsultaHistoricos;
end;

function TdtmCadastroHistoricos.GetTabelaHistoricos: TZDataSet;
begin
  Result:= qryHistoricos;
end;

function TdtmCadastroHistoricos.GravarHistorico: Boolean;
begin
  if qryHistoricos.CheckRequiredFields then begin
    if qryHistoricos.State in [dsInsert] then begin
       spcHistoricoProximo.Open;
       qryHistoricoscodigo.AsInteger := spcHistoricoProximoCodigo.AsInteger;
       spcHistoricoProximo.Close;
    end;

    if qryHistoricos.State in [dsEdit,dsInsert] then begin
      qryHistoricos.Post;
      Perpetrar([qryHistoricos]);
    end;
    Result := True
  end else
    Result := False
end;

procedure TdtmCadastroHistoricos.ImprimirHistoricos(Ordenacao,
  Inativo: integer; caixa, Contasapagar, contabil: Boolean);
var
  condicaotipo: String;
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  with qryImprimirHistoricos do begin
     case ordenacao of
     0: MacroByName('Ordenacao').AsString:= 'ORDER BY Codigo';
     1: MacroByName('Ordenacao').AsString:= 'ORDER BY UPPER(TO_ASCII(Descricao,''LATIN1'')), Codigo';
     2: MacroByName('Ordenacao').AsString:= 'ORDER BY Inativo, UPPER(TO_ASCII(Descricao,''LATIN1'')), Codigo';
     end;

     case inativo of
     0: MacroByName('inativo').AsString := '';
     1: MacroByName('inativo').AsString := 'AND Inativo IS NULL';
     end;
  end;

  if Caixa        then CondicaoTipo:= 'AND Caixa'
                  else CondicaoTipo:= '';
  if ContasaPagar then CondicaoTipo:= CondicaoTipo + ' AND Pagar';
  if Contabil     then CondicaoTipo:= CondicaoTipo + ' AND Contabil';

  qryImprimirHistoricos.Close;
  qryImprimirHistoricos.Open;
  if (qryImprimirHistoricos.RecordCount > 0) then
  begin
    frVariables['Titulo']:= 'HISTÓRICOS';
    frVariables['subTitulo']:= '';
//    frpImpressaoHistoricos.DesignReport;
    frmPreview := TfrmPreviewPadrao.create(self);
    frmPreview.cmbZoom.ItemIndex := 3;
    try
     Relatorio := frmPreview.frCompositeReport;
     frmPreview.frCompositeReport.Reports.Clear;
     frmPreview.frCompositeReport.Reports.Add(frpImpressaoHistoricos);
     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
    finally
     frmPreview.Free;
    end;
  end
  else
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO, ['histórico']));
end;

function TdtmCadastroHistoricos.IncluirHistoricos: Boolean;
begin
  qryHistoricos.Insert;
  Result := True;
end;

function TdtmCadastroHistoricos.PosicionarRegistroHistorico: Boolean;
begin
  Result:= ExisteHistorico(qryHistoricoscodigo.FieldName, qryHistoricoscodigo.asString);
end;

procedure TdtmCadastroHistoricos.qryHistoricosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryHistoricoscaixa.AsBoolean    := False;
  qryHistoricospagar.AsBoolean    := False;
  qryHistoricoscontabil.AsBoolean := False;
end;

procedure TdtmCadastroHistoricos.RefazConsultaHistorico(Codigo: Integer);
begin
  ReFazConsulta(qryHistoricos, [0], [codigo]);
end;

procedure TdtmCadastroHistoricos.SelecionarHistoricos;
begin
   ReFazConsulta(qryHistoricos,[0],[qryConsultaHistoricoscodigo.AsInteger]);
end;

procedure TdtmCadastroHistoricos.frpImpressaoHistoricosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpImpressaoHistoricos,view);
end;

end.
