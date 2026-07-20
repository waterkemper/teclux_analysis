unit dmquitacaoromaneios;

interface

uses
  SysUtils, Types, Classes, Variants, Controls, Forms, DB,
  // Terceiros
  ZQuery, ZPgSqlQuery, FR_DSet, FR_DBSet, FR_Class,
  //Componentes
  cpquery,cpdatasource,
  // Biblio
  ctconstantes, biblio,
  // Repositorio
  dmbasico, dmtecsoft, ZTransact;

type
  TdtmQuitacaoRomaneios = class(TdtmBasico)
    qryFornecedores: TtecQuery;
    dsrFornecedores: TtecDataSource;
    qryConsultaFornecedores: TtecQuery;
    qryConsultafornecedoresrazao: TStringField;
    qryfornecedorescodigo: TIntegerField;
    qryfornecedoresrazao: TStringField;
    qryRomaneios: TtecQuery;
    dsrRomaneios: TtecDataSource;
    qryConsultafornecedorescodigo: TIntegerField;
    qryRomaneiosnumero: TIntegerField;
    qryRomaneiostipo: TStringField;
    qryRomaneiosfornecedor: TIntegerField;
    qryRomaneiosemissao: TDateField;
    qryRomaneiosnomefornecedor: TStringField;
    qryRomaneiostotalromaneio: TFloatField;
    qryRomaneiosquitar: TBooleanField;
    qryRomaneiosprevisao: TFloatField;
    qryQuitarRomaneios: TtecQuery;
    procedure qryRomaneiosAfterInsert(DataSet: TDataSet);
    procedure qryRomaneiosAfterScroll(DataSet: TDataSet);
  private
    FEmissaoFinal: String;
    FEmissaoInicial: String;
    function GetConsultafornecedores: TtecQuery;
    procedure SetEmissaoFinal(const Value: String);
    procedure SetEmissaoInicial(const Value: String);
    procedure SetTipo(const Value: String);
    procedure Setfornecedora(const Value: String);
    procedure MontaDataEmissao;
    function GetCampoSelecionar: TBooleanField;
    function GetCampoTotalizar: TFloatField;
    function GetQtdeRomaneios: Integer;
    function GetTotalRomaneios: Real;

    { Private declarations }
  public
    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    procedure QuitarRomaneios(DataQuitacao: TDateTime);
    constructor Create(AOwner: TComponent); Override;
    property Consultafornecedores: TtecQuery read GetConsultafornecedores;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecQuitacaoRomaneios);
    procedure Selecionar(TipoPesquisa: TtecQuitacaoRomaneios);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecQuitacaoRomaneios);
    function  Existefornecedor(campo, codigo: string): boolean;

    property EmissaoInicial: String read FEmissaoInicial write SetEmissaoInicial;
    property EmissaoFinal: String read FEmissaoFinal write SetEmissaoFinal;
    property fornecedora: String write Setfornecedora;
    property Tipo: String write SetTipo;

    function  GerarRomaneios: Boolean;
    property CampoSelecionar: TBooleanField read GetCampoSelecionar;
    property CampoTotalizar: TFloatField read GetCampoTotalizar;
    property QtdeRomaneios: Integer read GetQtdeRomaneios;
    property TotalRomaneios: Real read GetTotalRomaneios;

  end;

var
  dtmQuitacaoRomaneios: TdtmQuitacaoRomaneios;

implementation
const
      WhereBase = 19;
      WhereEmissao        = WhereBase + 1;
      Wherefornecedora = WhereBase + 2;
      WhereTipo           = WhereBase + 3;

{$R *.dfm}

{ TdtmQuitacaoRomaneios }

procedure TdtmQuitacaoRomaneios.AbreTabelaPesquisa(TipoPesquisa: TtecQuitacaoRomaneios);
begin
  case TipoPesquisa of
      romFORNECEDOR : Abre(ctConsultaQuitacaoRomaneios);
  end;
end;

constructor TdtmQuitacaoRomaneios.Create(AOwner: TComponent);
begin
  inherited;
  qryfornecedores.Tag         := ctTabelas;
  qryConsultafornecedores.Tag := ctConsultaQuitacaoRomaneios;
end;

function TdtmQuitacaoRomaneios.Existefornecedor(campo,
  codigo: string): boolean;
begin
  result:=ExisteCodigo(qryConsultafornecedores, campo, codigo)
end;

procedure TdtmQuitacaoRomaneios.FechaTabelaPesquisa(
  TipoPesquisa: TtecQuitacaoRomaneios);
begin
  case TipoPesquisa of
      romFORNECEDOR : Fecha(ctConsultaQuitacaoRomaneios);
  end;
end;

function TdtmQuitacaoRomaneios.GerarRomaneios: Boolean;
begin
   if qryRomaneios.Active then
    qryRomaneios.Close;
  qryRomaneios.Open;
  Result:= qryRomaneios.IsEmpty;
end;

function TdtmQuitacaoRomaneios.GetCampoSelecionar: TBooleanField;
begin
  result := qryRomaneiosquitar;
end;

function TdtmQuitacaoRomaneios.GetCampoTotalizar: TFloatField;
begin
  result := qryRomaneiosprevisao;
end;

function TdtmQuitacaoRomaneios.GetConsultafornecedores: TtecQuery;
begin
  result := qryConsultafornecedores;
end;

procedure TdtmQuitacaoRomaneios.MontaDataEmissao;
const
  Data_1: String = 'and (r.emissao = ';
  Data_2: String = 'and (r.emissao between (';
begin
  if not DataEmBranco(FEmissaoInicial) then begin
    if DataEmBranco(FEmissaoFinal) then
         qryRomaneios.Sql[WhereEmissao]:= Data_1 + quotedstr(FEmissaoInicial)+')'
    else
      qryRomaneios.Sql[WhereEmissao]:= Data_2 + quotedstr(FEmissaoInicial) +') and ('+quotedstr(FEmissaoFinal)+'))';
  end
  else begin
    if not DataEmBranco(FEmissaoFinal) then
      qryRomaneios.Sql[WhereEmissao]:= Data_1 + quotedstr(FEmissaoFinal) +')'
    else qryRomaneios.Sql[Wherefornecedora]:= '';
  end;
end;

procedure TdtmQuitacaoRomaneios.Selecionar(
  TipoPesquisa: TtecQuitacaoRomaneios);
begin
  case TipoPesquisa of
      romFORNECEDOR : ReFazConsulta(qryfornecedores,[0],[qryConsultafornecedorescodigo.AsInteger]);
  end;
end;

procedure TdtmQuitacaoRomaneios.SetEmissaoFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
       FEmissaoFinal := Value
  else FEmissaoFinal := '';
  MontaDataEmissao;
end;

procedure TdtmQuitacaoRomaneios.SetEmissaoInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
       FEmissaoInicial := Value
  else FEmissaoInicial := '';
  MontaDataEmissao;
end;

procedure TdtmQuitacaoRomaneios.SetTipo(const Value: String);
begin
  case Value[1] of
    'N' : qryRomaneios.Sql[WhereTipo]:= 'and (r.tipo='+quotedstr(value[1])+')';
    'T' : qryRomaneios.Sql[WhereTipo]:= 'and (r.tipo='+quotedstr(value[1])+')';
    'A' : qryRomaneios.Sql[WhereTipo]:= '';
    else
  end;

end;

procedure TdtmQuitacaoRomaneios.Setfornecedora(const Value: String);
begin
  if (Value <> '') then
       qryRomaneios.Sql[Wherefornecedora]:= 'and (r.fornecedor = ' + Value + ')'
  else qryRomaneios.Sql[Wherefornecedora]:= '';
end;

procedure TdtmQuitacaoRomaneios.qryRomaneiosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryRomaneios.Cancel;
end;

procedure TdtmQuitacaoRomaneios.qryRomaneiosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryRomaneiosprevisao.Value=0 then
  begin
    qryRomaneios.Edit;
    qryRomaneiosprevisao.AsCurrency:= qryRomaneiostotalromaneio.AsCurrency ;
     qryRomaneios.Post;
  end;
end;

procedure TdtmQuitacaoRomaneios.QuitarRomaneios(DataQuitacao: TDateTime);
begin
  try
    qryRomaneios.DisableControls;
    qryRomaneios.First;
    while not qryRomaneios.Eof do
    begin
     if qryRomaneiosquitar.AsBoolean then
     begin
      qryQuitarRomaneios.Close;
      qryQuitarRomaneios.Sql[0]:=
          'update romaneios set datapagto = '+ quotedstr(DateToStr(DataQuitacao)) +
          ' , valorpagto = ' + convertevalor(qryRomaneiosprevisao.AsString)+
          ' where numero = ' + IntToStr(qryRomaneiosnumero.AsInteger);
      qryQuitarRomaneios.ExecSql;

     end;
     qryRomaneios.Next;
    end;
    perpetrar([qryQuitarRomaneios]);
  finally
    qryRomaneios.EnableControls;
    FQtdeMarcados:=0;
    FTotalMarcados:=0;
  end;
end;

function TdtmQuitacaoRomaneios.GetQtdeRomaneios: Integer;
begin
  Result:= qryRomaneios.RecordCount;
end;

function TdtmQuitacaoRomaneios.GetTotalRomaneios: Real;
var
total: real;
begin
   qryRomaneios.AfterScroll:=nil;
   Total:= TotalizarValores[qryRomaneios, qryRomaneiostotalromaneio, nil];
   qryRomaneios.AfterScroll:=qryRomaneiosAfterScroll;
   Result:=Total;
end;

procedure TdtmQuitacaoRomaneios.MarcarSelecionados(Marcando, Todos: Boolean);
begin
  MarcarRegistros(qryRomaneios,
                  qryRomaneiosquitar,
                  qryRomaneiostotalromaneio,
                  Marcando,
                  Todos);
end;

end.
