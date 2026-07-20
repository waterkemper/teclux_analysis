unit dmgeral;

interface

uses
  SysUtils, Classes, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  ctconstantes, dmbasico;
type
  TTipoPesquisaCodigo = (Nenhuma, Produtos, Cliente, marca);

type
  TdtmGeral = class(TdtmBasico)
    qryProcuraProdutos: TtecQuery;
    qryProcuraProdutoscodigo: TLargeintField;
    qryProcuraProdutosdescricao: TStringField;
    dsrProcuraProdutos: TtecDataSource;
    qryProcuraGrupoProdutos: TtecQuery;
    qryProcuraGrupoProdutoscodigo: TStringField;
    qryProcuraGrupoProdutosdescricao: TStringField;
    dsrProcuraGrupoProdutos: TtecDataSource;
    qryProcuraClasses: TtecQuery;
    qryProcuraClassescodigo: TStringField;
    qryProcuraClassesdescricao: TStringField;
    dsrProcuraClasses: TtecDataSource;
    qryConsultaProdutos: TtecQuery;
    qryConsultaProdutosdescricao: TStringField;
    qryConsultaProdutoscodigo: TLargeintField;
    qryConsultaGrupoProdutos: TtecQuery;
    qryConsultaGrupoProdutoscodigo: TStringField;
    qryConsultaGrupoProdutosdescricao: TStringField;
    qryConsultaClasses: TtecQuery;
    qryConsultaClassescodigo: TStringField;
    qryConsultaClassesdescricao: TStringField;
    qryProcuraMarca: TtecQuery;
    qryProcuraMarcacodigo: TIntegerField;
    qryProcuraMarcadescricao: TStringField;
    dsrProcuraMarca: TtecDataSource;
    qryConsultaMarcas: TtecQuery;
    qryConsultaMarcasdescricao: TStringField;
    qryConsultaMarcascodigo: TIntegerField;
    qryProcuraItemProdutos: TtecQuery;
    qryProcuraItemProdutoscodigo: TLargeintField;
    qryProcuraItemProdutosdescricao: TStringField;
    qryProcuraItemProdutosvalorgrade1: TStringField;
    qryProcuraItemProdutosvalorgrade2: TStringField;
    qryProcuraItemProdutosdescricaolc: TStringField;
    dsrProcuraItemProdutos: TtecDataSource;
    qryConsultaItemProdutos: TtecQuery;
    qryConsultaItemProdutosdescricao: TStringField;
    qryConsultaItemProdutoscodigo: TLargeintField;
    qryConsultaItemProdutosvalorgrade1: TStringField;
    qryConsultaItemProdutosvalorgrade2: TStringField;
    qryProcuraCliente: TtecQuery;
    qryProcuraClientenome: TStringField;
    qryProcuraClientecodigo: TIntegerField;
    qryProcuraClientetipo: TStringField;
    dsrProcuraCliente: TtecDataSource;
    qryConsultaClientes: TtecQuery;
    qryConsultaClientesnome: TStringField;
    qryConsultaClientespessoanumero: TStringField;
    qryConsultaClientesnomecidade: TStringField;
    qryConsultaClientesestado: TStringField;
    qryConsultaClientescodigo: TIntegerField;
    qryConsultaClientestipo: TStringField;
    qryConsultaClientestipoorig: TStringField;
    qryConsultaClientescivil: TStringField;
    procedure qryProcuraItemProdutosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AbreTabelaConsulta(TipoPesquisa: TtecPesquisa);
    procedure AbreTabelaProcura(TipoPesquisa: TtecPesquisa);
    procedure AbreTabelaTipoPesquisacodigo(TipoPesquisaCodigo: TTipoPesquisaCodigo);

    procedure FechaTabelaPesquisa(TipoPesquisa: TtecPesquisa);
    function ExisteItemProduto(Campo, Codigo: string): Boolean;
    function ExisteProduto(Campo, Codigo: string): Boolean;
    function ExisteGrupo(Campo, Codigo: string): Boolean;
    function ExisteClasse(Campo, Codigo: string): Boolean;
    function ExisteMarca(Campo, Codigo: String): Boolean;
    function ExisteCliente(NomeCampo: String; Value: Variant): Boolean;
    procedure Selecionar(TipoPesquisa: TTecPesquisa);
  end;
  {
var
  dtmGeral: TdtmGeral;
  }
implementation

{$R *.dfm}

{ TdtmGeral }

procedure TdtmGeral.AbreTabelaConsulta(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
     pesITEMPRODUTOS      : begin
                             qryConsultaItemProdutos.Sql[03]:= 'Where (p.codigo = 0)';
                             Abre(ctPesquisaItemProdutos);
                            end;
     pesPRODUTOS          : begin
                             qryConsultaProdutos.Sql[03]:= 'Where (c.codigo = 0)';
                             Abre(ctPesquisaProdutos);
                           end;
     pesGRUPOS            : Abre(ctPesquisaGrupo);
     pesCLASSES           : Abre(ctPesquisaClasse);
     pesMARCAS            : Abre(ctPesquisaMarca);
     pesFORNECEDORES      : Abre(ctPesquisaFornecedor);
     pesVENDEDORES        : Abre(ctPesquisaVendedor);
     pesCLIENTES          : Abre(ctPesquisaClientes);
  end;
end;

procedure TdtmGeral.AbreTabelaTipoPesquisacodigo(
  TipoPesquisaCodigo: TTipoPesquisaCodigo);
begin
  case TipoPesquisaCodigo of
     Produtos : begin
                  refazconsulta(qryProcuraItemProdutos,[],[]);
                  refazconsulta(qryProcuraProdutos,[],[]);
                  refazconsulta(qryProcuraGrupoProdutos,[0],[0]);
                  refazconsulta(qryProcuraClasses,[],[]);
                  refazconsulta(qryProcuraMarca,[],[]);
                end;
     Cliente: refazconsulta(qryProcuraCliente,[],[]);
  end;
end;


procedure TdtmGeral.AbreTabelaProcura(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
     pesITEMPRODUTOS      : refazconsulta(qryProcuraItemProdutos,[],[]);
     pesPRODUTOS          : refazconsulta(qryProcuraProdutos,[],[]);
     pesGRUPOS            : refazconsulta(qryProcuraGrupoProdutos,[0],[0]);
     pesCLASSES           : refazconsulta(qryProcuraClasses,[],[]);
     pesMARCAS            : refazconsulta(qryProcuraMarca,[],[]);
     pesCLIENTES          : refazconsulta(qryProcuraCliente,[],[]);
  end;
end;

constructor TdtmGeral.Create(AOwner: TComponent);
begin
  Inherited;
  qryConsultaItemProdutos.Tag   := ctPesquisaItemProdutos;
  qryConsultaProdutos.Tag       := ctPesquisaProdutos;
  qryconsultaGrupoProdutos.Tag  := ctPesquisaGrupo;
  qryConsultaClasses.Tag        := ctPesquisaClasse;
  qryConsultaMarcas.Tag         := ctPesquisaMarca;
  qryConsultaClientes.Tag       := ctPesquisaClientes;
  qryProcuraCliente.Params[1].AsString    := 'C';
end;

function TdtmGeral.ExisteClasse(Campo, Codigo: string): Boolean;
begin
  Result := ExisteCodigo(qryConsultaClasses, campo, codigo);
end;

function TdtmGeral.ExisteGrupo(Campo, Codigo: string): Boolean;
begin
  Result := ExisteCodigo(qryConsultaGrupoProdutos, campo, codigo);
end;

function TdtmGeral.ExisteItemProduto(Campo, Codigo: string): Boolean;
const
  SQL = 'Where (to_ascii(p.%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  qryConsultaItemProdutos.Sql[03]:= Format(SQL, [Campo, Codigo, '%']);
  qryConsultaItemProdutos.Open;
  Result := (qryConsultaItemProdutos.RecordCount > 0);
end;

function TdtmGeral.ExisteMarca(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaMarcas, campo, codigo);
end;

function TdtmGeral.ExisteProduto(Campo, Codigo: string): Boolean;
const
  SQL = 'Where (Maiusculo(c.%s) ilike Maiusculo(''%s%s''))';
begin
  qryConsultaProdutos.Sql[03]:= Format(SQL, [Campo, Codigo, '%']);
  qryConsultaProdutos.Open;
  Result := (qryConsultaProdutos.RecordCount > 0);
end;

procedure TdtmGeral.FechaTabelaPesquisa(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
     pesITEMPRODUTOS      : fecha(ctPesquisaItemProdutos);
     pesPRODUTOS          : fecha(ctPesquisaProdutos);
     pesGRUPOS            : fecha(ctPesquisaGrupo);
     pesCLASSES           : fecha(ctPesquisaClasse);
     pesMARCAS            : fecha(ctPesquisaMarca);
     pesFORNECEDORES      : fecha(ctPesquisaFornecedor);
     pesVENDEDORES        : fecha(ctPesquisaVendedor);
     pesCLIENTES          : fecha(ctPesquisaClientes);
  end;
end;


procedure TdtmGeral.Selecionar(TipoPesquisa: TTecPesquisa);
begin
  case TipoPesquisa of
    pesITEMPRODUTOS : RefazConsulta(qryProcuraitemProdutos,[0],[qryConsultaItemProdutoscodigo.AsVariant]);
    pesPRODUTOS     : RefazConsulta(qryProcuraProdutos,[0],[qryConsultaProdutoscodigo.AsVariant]);
    pesGRUPOS       : RefazConsulta(qryProcuraGrupoProdutos,[0],[qryConsultaGrupoProdutoscodigo.AsVariant]);
    pesCLASSES      : RefazConsulta(qryProcuraClasses,[0],[qryConsultaClassescodigo.AsVariant]);
    pesMARCAS       : RefazConsulta(qryProcuraMarca, [0], [qryConsultaMarcascodigo.AsVariant]);
    pesCLIENTES   : begin
                     if qryConsultaClientes.RecordCount > 0 then
                       RefazConsulta(qryProcuraCliente,[0,1],[qryConsultaClientescodigo.AsVariant,
                                                       qryConsultaClientestipoorig.AsVariant]);

                       qryProcuraCliente.Params[1].AsString:=qryConsultaClientestipoorig.AsString;
                    end;
  end;
end;

procedure TdtmGeral.qryProcuraItemProdutosCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryProcuraItemProdutosdescricaolc.AsString :=
    qryProcuraItemProdutosdescricao.AsString+' '+
    qryProcuraItemProdutosvalorgrade1.AsString+' '+
    qryProcuraItemProdutosvalorgrade2.AsString;
end;

function TdtmGeral.ExisteCliente(NomeCampo: String;
  Value: Variant): Boolean;
const
  SQL = 'and (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if NomeCampo = 'nomecidade' then
       NomeCampo:= 'c.nome'
  else NomeCampo:= 'v.' + NomeCampo;
  qryConsultaClientes.Sql[12]:= Format(SQL, [NomeCampo, ANSIUpperCase(Value), '%']);
  qryConsultaClientes.Open;
  Result := qryConsultaClientes.RecordCount > 0
end;

end.
