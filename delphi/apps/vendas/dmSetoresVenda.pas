unit dmSetoresVenda;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft,
  cpdatasource, biblio, ctconstantes, Forms, ZTransact;

type
  TdtmSetoresVenda = class(TdtmBasico)
    qrySetoresVenda: TtecQuery;
    spcSetoresVendaProximo: TtecQuery;
    spcSetoresVendaProximocodigo: TIntegerField;
    dsrSetoresVenda: TtecDataSource;
    qrySetoresVendacodigo: TIntegerField;
    qrySetoresVendanome: TStringField;
    procedure qrySetoresVendaSetoresProducaoAfterDelete(DataSet: TDataSet);
    procedure qrySetoresVendaSetoresProducaoAfterEdit(DataSet: TDataSet);
    procedure qrySetoresVendaSetoresProducaoAfterPost(DataSet: TDataSet);
  private
    FListaSetoresProducaoSelecionadas: String;
    { Private declarations }
    procedure EditarSetoresVenda;

    function ProximoCodigo: Integer;

  public
    { Public declarations }

    constructor Create(Aowner: TComponent); override;
    function ExcluirSetoresVenda: Boolean;
    function GravarSetoresVenda: Boolean;

    function IncluirSetoresVenda: Boolean;
    property ListaSetoresProducaoSelecionadas: String read FListaSetoresProducaoSelecionadas write FListaSetoresProducaoSelecionadas;


  end;

var
  dtmSetoresVenda: TdtmSetoresVenda;

implementation

{$R *.dfm}

{ TdtmSetoresVenda }


constructor TdtmSetoresVenda.Create(Aowner: TComponent);
begin
  inherited;
  qrySetoresVenda.Tag := ctTabelas;
  FListaSetoresProducaoSelecionadas := '''''';
end;

procedure TdtmSetoresVenda.EditarSetoresVenda;
begin
  if not (qrySetoresVenda.State in [dsedit, dsinsert]) then
    qrySetoresVenda.Edit;
end;


function TdtmSetoresVenda.ExcluirSetoresVenda: Boolean;
begin
  Result := False;
  if not qrySetoresVenda.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o SETOR DE VENDA'])) = smbOk) then
    begin
       qrySetoresVenda.Delete;
       Result := Perpetrar([qrySetoresVenda]);
    end;
end;


function TdtmSetoresVenda.GravarSetoresVenda: Boolean;

begin
  result := false;
  if (qrySetoresVenda.CheckRequiredFields) then
  begin
    if qrySetoresVenda.State = dsinsert then
      qrySetoresVendacodigo.AsInteger := ProximoCodigo;

    qrySetoresVenda.Post;
    result := Perpetrar([qrySetoresVenda]);
  end;
end;


function TdtmSetoresVenda.IncluirSetoresVenda: Boolean;
begin
  Result := True;
  try
    qrySetoresVenda.Insert;
  except
    Result := False;
  end;
end;

function TdtmSetoresVenda.ProximoCodigo: Integer;
begin
 spcSetoresVendaProximo.Open;
 result := spcSetoresVendaProximocodigo.AsInteger;
 spcSetoresVendaProximo.Close;
end;

procedure TdtmSetoresVenda.qrySetoresVendaSetoresProducaoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarSetoresVenda;
end;

procedure TdtmSetoresVenda.qrySetoresVendaSetoresProducaoAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  EditarSetoresVenda;

end;

procedure TdtmSetoresVenda.qrySetoresVendaSetoresProducaoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarSetoresVenda;

end;



end.
