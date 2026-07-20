unit dmlistaspadrao;

interface

uses
  SysUtils, Classes, dmbasico, Forms, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, ctconstantes, biblio, FR_DSet, FR_DBSet, FR_Class,
  fmpreviewpadrao, ZTransact, clusuario;

type
  TdtmListasPadrao = class(TdtmBasico)
    qryListasPadrao: TtecQuery;
    dsrListasPadrao: TtecDataSource;
    qryConsultaListasPadrao: TtecQuery;
    qryConsultaListasPadraodescricao: TStringField;
    qryConsultaListasPadraocodigo: TIntegerField;
    qryListasPadraocodigo: TIntegerField;
    qryListasPadraodescricao: TStringField;
    spcListaPadrao: TtecQuery;
    spcListaPadraocodigo: TIntegerField;
    qryProdutosListasPadrao: TtecQuery;
    dsrProdutosListasPadrao: TtecDataSource;
    qryProdutosListasPadraolistapadrao: TIntegerField;
    qryProdutosListasPadraoproduto: TLargeintField;
    qryProdutosListasPadraodescricao: TStringField;
    qryProdutosListasPadraoreferencia: TStringField;
    qryProdutosListasPadraogrupo: TStringField;
    frpListaPadrao: TfrReport;
    fdsListaPadrao: TfrDBDataSet;
    qryListasPadraofilial: TIntegerField;
    qryProdutosListasPadraoprodutovisual: TStringField;
    qryProdutosListasPadraodescricaogrupo: TStringField;
    qryProdutosListasPadraovalorgrade1: TStringField;
    qryProdutosListasPadraovalorgrade2: TStringField;
    qryProdutosListasPadraolinha: TStringField;
    qryProdutosListasPadraocoluna: TStringField;
    qryProdutosListasPadraodescricaoclasse: TStringField;
    qryProdutosListasPadraoclasse: TStringField;
    qryProdutosListasPadraoquantidade: TFloatField;
    qryListasPadraodatahora: TDateTimeField;
    qryProdutosListasPadraocodigodebarras: TStringField;
    qryProdutosListasPadraopreco: TFloatField;
    qryListasPadraousuario: TIntegerField;
    procedure qryListasPadraoAfterScroll(DataSet: TDataSet);
    procedure qryProdutosListasPadraoAfterDelete(DataSet: TDataSet);
    procedure qryListasPadraoAfterClose(DataSet: TDataSet);
    function GetQuantidadeProdutos: Integer;
    procedure qryProdutosListasPadraoNewRecord(DataSet: TDataSet);
    procedure qryListasPadraoBeforePost(DataSet: TDataSet);
    procedure frpListaPadraoGetValue(const ParName: String;
      var ParValue: Variant);
  private
    FImprimirPrecos: Boolean;
    FImprimirCodigoDeBarras: Boolean;
  protected
    function GetTabelaListasPadrao: TtecQuery;
    function GetTabelaConsultaListas: TtecQuery;
    function GetTabelaProdutosLista: TtecQuery;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecListaPadrao);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecListaPadrao);
    procedure SelecionaTabelaPesquisa(TipoPesquisa: TtecListaPadrao);
    procedure ImprimirListaPadrao(ListaPreco, CodigoBarras: Boolean);
    function  IncluirListasPadrao: Boolean;
    function  IncluirProdutosLista(Editando: Boolean): Boolean;
    function  ExcluirListasPadrao: Boolean;
    function  ExcluirProdutosListas: Boolean;
    function  GravarListasPadrao: Boolean;
    function  GravarProdutosListas: Boolean;
    function  ExisteListaPadrao(Campo, Codigo: string): Boolean;
    property  TabelaListasPadrao: TtecQuery read GetTabelaListasPadrao;
    property  TabelaProdutosLista: TtecQuery read GetTabelaProdutosLista;
    property  TabelaConsultaListas: TtecQuery read GetTabelaConsultaListas;
    property  QuantidadeProdutos: Integer read GetQuantidadeProdutos;
    property ImprimirCodigoDeBarras: Boolean read FImprimirCodigoDeBarras write FImprimirCodigoDeBarras;
    property ImprimirPrecos: Boolean read FImprimirPrecos write FImprimirPrecos;
  end;

var
  dtmListasPadrao: TdtmListasPadrao;

implementation

{$R *.dfm}

{ TdtmListasPadrao }

procedure TdtmListasPadrao.AbreTabelaPesquisa(TipoPesquisa: TtecListaPadrao);
begin
  case TipoPesquisa of
      tlpLISTAS: qryConsultaListasPadrao.Open;
  end;
end;

constructor TdtmListasPadrao.Create(AOwner: TComponent);
begin
  inherited;
  qryListasPadrao.Tag := ctTabelas;
  
end;

function TdtmListasPadrao.ExcluirListasPadrao: Boolean;
var
  UsuarioAut: TtecUsuarios;

begin
  Result := MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['esta LISTA e todos os produtos relacionados'])) = smbOk;
  if Result then
  begin
    if not qryListasPadrao.IsEmpty then
    begin
      try
        UsuarioAut := ObterAutorizacao(taLOGIN, 'Exclusão de LISTA PADRÃO', ctUSUARIOS, '');
        if assigned(UsuarioAut) then
        begin
          qryListasPadrao.Delete;
          Perpetrar([qryProdutosListasPadrao, qryListasPadrao]);
        end;
      finally
        UsuarioAut.free;
      end;
    end;
  end;
end;

function TdtmListasPadrao.ExisteListaPadrao(Campo, Codigo: string): Boolean;
begin
  Result := ExisteCodigo(qryConsultaListasPadrao, Campo, Codigo);
end;

procedure TdtmListasPadrao.FechaTabelaPesquisa(TipoPesquisa: TtecListaPadrao);
begin
  case TipoPesquisa of
      tlpLISTAS: qryConsultaListasPadrao.Close;
  end;
end;

function TdtmListasPadrao.GetTabelaConsultaListas: TtecQuery;
begin
  Result:= qryConsultaListasPadrao;
end;

function TdtmListasPadrao.GetTabelaListasPadrao: TtecQuery;
begin
  Result:= qryListasPadrao;
end;

function TdtmListasPadrao.GravarListasPadrao: Boolean;
begin
  Result := False;
  if qryListasPadrao.CheckRequiredFields then begin
    if qryProdutosListasPadrao.IsEmpty then
      MensagemAviso(Format(ctNENHUMPRODUTONALISTA,['padrão']))
    else begin
      if qryListasPadrao.State = dsInsert then begin
        spcListaPadrao.Open;
        qryListasPadraocodigo.AsInteger := spcListaPadraocodigo.AsInteger;
        spcListaPadrao.Close;
      end;

      qryProdutosListasPadrao.DisableControls;
      try
        qryProdutosListasPadrao.First;
        while not qryProdutosListasPadrao.Eof do begin
          if (qryProdutosListasPadraolistapadrao.AsInteger = 0) then begin
            qryProdutosListasPadrao.Edit;
            qryProdutosListasPadraolistapadrao.AsInteger := qryListasPadraocodigo.AsInteger;
            qryProdutosListasPadrao.Post;
          end;
          qryProdutosListasPadrao.Next;
        end;
      finally
        qryProdutosListasPadrao.EnableControls;
      end;
      Perpetrar([qryListasPadrao, qryProdutosListasPadrao]);
      ReFazConsulta(qryProdutosListasPadrao,[0],[qryListasPadraocodigo.AsInteger]);
      Result:= True;
    end;
  end;
end;

function TdtmListasPadrao.IncluirListasPadrao: Boolean;
begin
  Result:= True;
  qryListasPadrao.Insert;
end;

procedure TdtmListasPadrao.SelecionaTabelaPesquisa(TipoPesquisa: TtecListaPadrao);
begin
  case TipoPesquisa of
      tlpLISTAS: ReFazConsulta(qryListasPadrao,[0],[qryConsultaListasPadraocodigo.AsInteger]);
  end;
end;

function TdtmListasPadrao.GetTabelaProdutosLista: TtecQuery;
begin
  Result:= qryProdutosListasPadrao;
end;

function TdtmListasPadrao.IncluirProdutosLista(Editando: Boolean): Boolean;

  procedure Produtos;
  var
    Campos : String;
    Produto: Int64;
    Pos    : TBookmark;
  begin
    Campos := '';
    Produto:= qryProdutosListasPadraoproduto.AsLargeInt;
    qryProdutosListasPadrao.DisableControls;
    Pos:= qryProdutosListasPadrao.GetBookmark;
    qryProdutosListasPadrao.First;
    try
      while not qryProdutosListasPadrao.Eof do begin
        if (qryProdutosListasPadraoproduto.AsLargeInt > 0) then begin
          if not Editando then
            Campos := Campos + '' + qryProdutosListasPadraoproduto.AsString + ','
          else if (qryProdutosListasPadraoproduto.AsLargeInt <> Produto) then
            Campos := Campos + '' + qryProdutosListasPadraoproduto.AsString + ',';
        end;
        qryProdutosListasPadrao.Next;
      end;
    finally
      qryProdutosListasPadrao.GotoBookmark(Pos);
      qryProdutosListasPadrao.FreeBookmark(Pos);
      qryProdutosListasPadrao.EnableControls;
      Delete(Campos,Length(Campos),1);
      if Campos = '' then Campos:= '0';
    end;
  end;

begin
  Produtos;
  qryProdutosListasPadrao.Params[0].AsInteger:= qryListasPadraocodigo.AsInteger;
  if Editando and not qryProdutosListasPadrao.IsEmpty then begin
    qryProdutosListasPadrao.DisableControls;
    qryProdutosListasPadrao.Edit;
    qryProdutosListasPadrao.Cancel;
    qryProdutosListasPadrao.EnableControls;
  end
  else begin
//    qryProdutosListasPadrao.Params[0].Clear;
    qryProdutosListasPadrao.Append;
  end;
  Result:= True;
end;


function TdtmListasPadrao.GravarProdutosListas: Boolean;
begin
  Result:= False;

  if qryProdutosListasPadrao.CheckRequiredFields(false, true, true, self, true, true) then
  begin
    Result:= True;
    qryProdutosListasPadrao.Post;
    if not (qryListasPadrao.State in [dsEdit, dsInsert]) then
      qryListasPadrao.Edit;
  end;
end;

function TdtmListasPadrao.ExcluirProdutosListas: Boolean;
begin

  Result := MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o PRODUTO DA LISTA PADRÃO'])) = smbOk;
  if Result then begin
    if not qryProdutosListasPadrao.IsEmpty then begin
      qryProdutosListasPadrao.Delete;
      if not (qryListasPadrao.State in[dsEdit, dsInsert]) then
        qryListasPadrao.Edit;
    end;
  end;
end;



procedure TdtmListasPadrao.qryListasPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryProdutosListasPadrao,[0],[qryListasPadraocodigo.AsInteger]);
end;

procedure TdtmListasPadrao.qryProdutosListasPadraoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if not (qryListasPadrao.State in[dsEdit, dsInsert]) then
    qryListasPadrao.Edit;
end;

procedure TdtmListasPadrao.qryListasPadraoAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryProdutosListasPadrao.Close;
end;

procedure TdtmListasPadrao.ImprimirListaPadrao(ListaPreco, CodigoBarras: Boolean);
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  ImprimirCodigoDeBarras := CodigoBarras;
  ImprimirPrecos := ListaPreco;

  frVariables['Rua']   := RuaFilialBase;
  frVariables['Bairro']:= BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade']:= CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Fone']  := FoneFilialBase;
  frmPreview := TfrmPreviewPadrao.create(self);
//  frpListaPadrao.DesignReport;
  try
    Relatorio := frmPreview.frCompositeReport;
    with frmPreview do begin
      frCompositeReport.Reports.Clear;
      frCompositeReport.Reports.Add(frpListaPadrao);
    end;
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
  finally
    frmPreview.Free
  end;
end;

function TdtmListasPadrao.GetQuantidadeProdutos: Integer;
begin
  Result:= qryProdutosListasPadrao.RecordCount;
end;

procedure TdtmListasPadrao.qryProdutosListasPadraoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosListasPadraoquantidade.asCurrency := 1;
end;

procedure TdtmListasPadrao.qryListasPadraoBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryListasPadraodatahora.asDateTime := DataHoraServidor;
end;

procedure TdtmListasPadrao.frpListaPadraoGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;

  if ParName = 'codigodoproduto' then
  begin
    if ImprimirCodigoDeBarras then
      Parvalue := qryProdutosListasPadraocodigodebarras.AsString
    else
      Parvalue := qryProdutosListasPadraoprodutovisual.AsString;
  end
  else
  if ParName = 'ImprimirPrecos' then
      Parvalue := ImprimirPrecos;
end;

end.
