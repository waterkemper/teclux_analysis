unit dmcadastrocategorias;

interface

uses
  SysUtils, Types, Classes, Variants, Controls, Forms, Dialogs, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpquery, cpdatasource,
  //Repositorio
  dmbasico, ZTransact;


type
  TdtmCadastroCategorias = class(TdtmBasico)
    qryCategorias: TtecQuery;
    dsrCategorias: TtecDataSource;
    qryCategoriasCodigo: TIntegerField;
    qryCategoriasHierarquia: TStringField;
    qryCategoriasDescricao: TStringField;
    qryCategoriasInativo: TDateField;

    qryConsultaCategorias: TtecQuery;
    qryConsultaCategoriasDescricao: TStringField;
    qryConsultaCategoriasHierarquia: TStringField;
    qryConsultaCategoriasCodigo: TIntegerField;
    spcCategoriaProximo: TtecQuery;
    spcCategoriaProximoCodigo: TIntegerField;
    procedure qryCategoriasNewRecord(DataSet: TDataSet);

  protected
    function  GetTabelaConsultarCategoria: TTecQuery;
    function  GetTabelaCategorias: TZDataSet;
  public
    procedure RefazConsultaCategoria(Codigo: Integer);
    procedure SelecionarCategorias;
    function  ExisteCategoria(campo, codigo: string): boolean;
    function  PosicionarRegistroCategoria: Boolean;
    function  IncluirCategorias: Boolean;
    function  ExcluirCategorias: Boolean;
    function  GravarCategoria: Boolean;
    constructor Create(AOwner: TComponent); override;
    property TabelaConsultarCategoria: TtecQuery read GetTabelaConsultarCategoria;
    property TabelaCategorias: TZDataset read GetTabelaCategorias;
  end;

var
  dtmCadastroCategorias: TdtmCadastroCategorias;
  Listar : tStringlist;
implementation

Uses
  //CLX
  ctconstantes, biblio;

{$R *.dfm}

constructor TdtmCadastroCategorias.Create(AOwner: TComponent);
begin
  inherited;
  qryCategorias.        Tag:= ctCaixaCadastroHistoricos; //ctTabelas;
  qryConsultaCategorias.Tag:= ctConsultaCategorias;
end;

function TdtmCadastroCategorias.ExcluirCategorias: Boolean;
begin
  Result:= False;
  if not qryCategorias.IsEmpty then begin
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a categoria'])) = smbok then begin
      qryCategorias.Delete;
      Perpetrar([qryCategorias]);
      Result:= True;
    end
  end;
end;

function TdtmCadastroCategorias.ExisteCategoria(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaCategorias, campo, codigo);
end;

function TdtmCadastroCategorias.GetTabelaConsultarCategoria: TTecQuery;
begin
  Result := qryConsultaCategorias;
end;

function TdtmCadastroCategorias.GetTabelaCategorias: TZDataSet;
begin
  Result:= qryCategorias;
end;

function TdtmCadastroCategorias.GravarCategoria: Boolean;
begin
  if qryCategorias.CheckRequiredFields then begin
    if qryCategorias.State in [dsInsert] then begin
       spcCategoriaProximo.Open;
       qryCategoriascodigo.AsInteger := spcCategoriaProximoCodigo.AsInteger;
       spcCategoriaProximo.Close;
    end;

    if qryCategorias.State in [dsEdit,dsInsert] then begin
      qryCategorias.Post;
      Perpetrar([qryCategorias]);
    end;
    Result := True
  end else
    Result := False
end;

function TdtmCadastroCategorias.IncluirCategorias: Boolean;
begin
  qryCategorias.Insert;
  Result := True;
end;

procedure TdtmCadastroCategorias.qryCategoriasNewRecord(DataSet: TDataSet);
begin
  inherited;
//  qryHistoricoscaixa.AsBoolean    := False;
//  qryHistoricospagar.AsBoolean    := False;
//  qryHistoricoscontabil.AsBoolean := False;
end;

function TdtmCadastroCategorias.PosicionarRegistroCategoria: Boolean;
begin
  Result:= ExisteCategoria(qryCategoriascodigo.FieldName, qryCategoriascodigo.asString);
end;


procedure TdtmCadastroCategorias.RefazConsultaCategoria(Codigo: Integer);
begin
  ReFazConsulta(qryCategorias, [0], [Codigo]);
end;

procedure TdtmCadastroCategorias.SelecionarCategorias;
begin
   ReFazConsulta(qryCategorias,[0],[qryConsultaCategoriasCodigo.AsInteger]);
end;

end.
