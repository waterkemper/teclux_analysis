unit dmcentrodecusto;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft,
  cpdatasource, biblio, ctconstantes, Forms, ZTransact;

type
  TdtmCentrodeCusto = class(TdtmBasico)
    qryCentrodeCusto: TtecQuery;
    spcCentrodeCustoProximo: TtecQuery;
    spcCentrodeCustoProximocodigo: TIntegerField;
    qryCentrodeCustocodigo: TIntegerField;
    qryCentrodeCustodescricao: TStringField;
    dsrCentrodeCusto: TtecDataSource;
    qryCentrodeCustoSetoresProducao: TtecQuery;
    dsrCentrodeCustoSetoresProducao: TtecDataSource;
    qryCentrodeCustoSetoresProducaocentrodecusto: TIntegerField;
    qryCentrodeCustoSetoresProducaosetordeproducao: TStringField;
    qryCentrodeCustoSetoresProducaodescricaosetorproducao: TStringField;
    procedure qryCentrodeCustoAfterScroll(DataSet: TDataSet);
    procedure qryCentrodeCustoSetoresProducaoAfterDelete(DataSet: TDataSet);
    procedure qryCentrodeCustoSetoresProducaoAfterEdit(DataSet: TDataSet);
    procedure qryCentrodeCustoSetoresProducaoAfterOpen(DataSet: TDataSet);
    procedure qryCentrodeCustoSetoresProducaoAfterPost(DataSet: TDataSet);
    procedure qryCentrodeCustoSetoresProducaoNewRecord(DataSet: TDataSet);
  private
    FListaSetoresProducaoSelecionadas: String;
    { Private declarations }
    procedure EditarCentrodeCusto;

    procedure AtualizaListaSetoresdeProducao;
    function SalvarSetoresdeProducao: boolean;
    function ProximoCodigo: Integer;

  public
    { Public declarations }

    constructor Create(Aowner: TComponent); override;
    function ExcluirCentrodeCusto: Boolean;
    procedure ExcluirSetoresdeProducao;
    function GravarCentrodeCusto: Boolean;
    function GravarSetoresdeProducao: Boolean;

    function IncluirCentrodeCusto: Boolean;
    function IncluirSetoresdeProducao: Boolean;
    property ListaSetoresProducaoSelecionadas: String read FListaSetoresProducaoSelecionadas write FListaSetoresProducaoSelecionadas;
    procedure EditarSetoresdeProducao;


  end;

var
  dtmCentrodeCusto: TdtmCentrodeCusto;

implementation

{$R *.dfm}

{ TdtmCentrodeCusto }

procedure TdtmCentrodeCusto.AtualizaListaSetoresdeProducao;
var
  Pos: TBookmark;
begin
  Pos := qryCentrodeCustoSetoresProducao.GetBookmark;
  qryCentrodeCustoSetoresProducao.DisableControls;

  try
    ListaSetoresProducaoSelecionadas := '';

    qryCentrodeCustoSetoresProducao.AfterEdit := nil;
    qryCentrodeCustoSetoresProducao.AfterPost := nil;
    qryCentrodeCustoSetoresProducao.First;
    while Not qryCentrodeCustoSetoresProducao.Eof do
    begin
      if qryCentrodeCustoSetoresProducaosetordeproducao.AsString<>'' then
        if ListaSetoresProducaoSelecionadas <> '' then
          ListaSetoresProducaoSelecionadas := ListaSetoresProducaoSelecionadas + ', '+
                                       quotedstr(qryCentrodeCustoSetoresProducaosetordeproducao.AsString)
        else
          ListaSetoresProducaoSelecionadas := quotedstr(qryCentrodeCustoSetoresProducaosetordeproducao.AsString);


      qryCentrodeCustoSetoresProducao.Next;

    end;


  finally

    if ListaSetoresProducaoSelecionadas = '' then
      ListaSetoresProducaoSelecionadas := '''''';


    if ListaSetoresProducaoSelecionadas <> '''''' then
    begin
      if copy(ListaSetoresProducaoSelecionadas,Length(ListaSetoresProducaoSelecionadas),1)=',' then
        ListaSetoresProducaoSelecionadas := copy(ListaSetoresProducaoSelecionadas,0, Length(ListaSetoresProducaoSelecionadas)-1)
    end
    else
      ListaSetoresProducaoSelecionadas := '''''';


    qryCentrodeCustoSetoresProducao.AfterEdit := qryCentrodeCustoSetoresProducaoAfterEdit;
    qryCentrodeCustoSetoresProducao.AfterPost := qryCentrodeCustoSetoresProducaoAfterPost;

    qryCentrodeCustoSetoresProducao.GotoBookmark(Pos);
    qryCentrodeCustoSetoresProducao.FreeBookmark(Pos);

    qryCentrodeCustoSetoresProducao.EnableControls;
  end;
end;

constructor TdtmCentrodeCusto.Create(Aowner: TComponent);
begin
  inherited;
  qryCentrodeCusto.Tag := ctTabelas;
  FListaSetoresProducaoSelecionadas := '''''';
end;

procedure TdtmCentrodeCusto.EditarCentrodeCusto;
begin
  if not (qryCentrodeCusto.State in [dsedit, dsinsert]) then
    qryCentrodeCusto.Edit;
end;

procedure TdtmCentrodeCusto.EditarSetoresdeProducao;
begin
  if not (qryCentrodeCustoSetoresProducao.State in [dsedit, dsinsert]) then
    qryCentrodeCustoSetoresProducao.Edit;
end;

function TdtmCentrodeCusto.ExcluirCentrodeCusto: Boolean;
begin
  Result := False;
  if not qryCentrodeCusto.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o CENTRO DE CUSTO'])) = smbOk) then
    begin
       LimparTabela(qryCentrodeCustoSetoresProducao);
       qryCentrodeCusto.Delete;
       Result := Perpetrar([qryCentrodeCustoSetoresProducao,qryCentrodeCusto]);
    end;
end;

procedure TdtmCentrodeCusto.ExcluirSetoresdeProducao;
begin
  if not qryCentrodeCustoSetoresProducao.IsEmpty then
    if not qryCentrodeCustoSetoresProducao.ReadOnly then
      if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o SETOR DE PRODUÇÃO deste CENTRO DE CUSTO'])) = smbOk) then
         qryCentrodeCustoSetoresProducao.Delete;
end;

function TdtmCentrodeCusto.GravarCentrodeCusto: Boolean;
  function AtribuirCodigo: boolean;
  begin
    result := true;
    GuardarRegistroAtual(qryCentrodeCustoSetoresProducao,true);
    qryCentrodeCustoSetoresProducao.First;
    while not qryCentrodeCustoSetoresProducao.Eof do
    begin

      if qryCentrodeCustoSetoresProducaocentrodecusto.AsInteger <>
         qryCentrodeCustocodigo.AsInteger then
      begin
        qryCentrodeCustoSetoresProducao.Edit;
        qryCentrodeCustoSetoresProducaocentrodecusto.AsInteger := qryCentrodeCustocodigo.AsInteger;
        qryCentrodeCustoSetoresProducao.post;
      end;

      result := qryCentrodeCustoSetoresProducao.CheckRequiredFields;
      if not result then
        break;

      qryCentrodeCustoSetoresProducao.Next;
    end;
    VoltarRegistroAtual(qryCentrodeCustoSetoresProducao);
  end;

begin
  result := false;
  if (qryCentrodeCusto.CheckRequiredFields) then
  begin
    if SalvarSetoresdeProducao then
    begin
      if qryCentrodeCusto.State = dsinsert then
          qryCentrodeCustocodigo.AsInteger := ProximoCodigo;
      if AtribuirCodigo then
      begin
        qryCentrodeCusto.Post;
        result := Perpetrar([qryCentrodeCusto, qryCentrodeCustoSetoresProducao]);
      end;
    end;
  end;
end;

function TdtmCentrodeCusto.GravarSetoresdeProducao: Boolean;
begin
  if (qryCentrodeCustoSetoresProducao.State in [dsedit, dsinsert]) then
     qryCentrodeCustoSetoresProducao.Post;
end;

function TdtmCentrodeCusto.IncluirCentrodeCusto: Boolean;
begin
  Result := True;
  try
    qryCentrodeCusto.Insert;
  except
    Result := False;
  end;
end;

function TdtmCentrodeCusto.IncluirSetoresdeProducao: Boolean;
begin
  qryCentrodeCustoSetoresProducao.Insert;
end;

function TdtmCentrodeCusto.ProximoCodigo: Integer;
begin
 spcCentrodeCustoProximo.Open;
 result := spcCentrodeCustoProximocodigo.AsInteger;
 spcCentrodeCustoProximo.Close;
end;

procedure TdtmCentrodeCusto.qryCentrodeCustoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryCentrodeCustoSetoresProducao,['centrodecusto'],[qryCentrodeCustocodigo.AsInteger]);
end;

procedure TdtmCentrodeCusto.qryCentrodeCustoSetoresProducaoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarCentrodeCusto;
  AtualizaListaSetoresdeProducao;
end;

procedure TdtmCentrodeCusto.qryCentrodeCustoSetoresProducaoAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  EditarCentrodeCusto;

end;

procedure TdtmCentrodeCusto.qryCentrodeCustoSetoresProducaoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtualizaListaSetoresdeProducao;

end;

procedure TdtmCentrodeCusto.qryCentrodeCustoSetoresProducaoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarCentrodeCusto;
  AtualizaListaSetoresdeProducao;

end;

procedure TdtmCentrodeCusto.qryCentrodeCustoSetoresProducaoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCentrodeCustoSetoresProducaocentrodecusto.AsInteger := qryCentrodeCustocodigo.AsInteger;
end;

function TdtmCentrodeCusto.SalvarSetoresdeProducao: boolean;
begin
  result := true;
  if (qryCentrodeCustoSetoresProducao.State in [dsedit, dsinsert]) then
  begin
    if qryCentrodeCustoSetoresProducao.CheckRequiredFields then
      qryCentrodeCustoSetoresProducao.Post
    else
      result := false;
  end;
end;


end.
