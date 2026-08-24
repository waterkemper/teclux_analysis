unit frVendasAnteriores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, DB, cpdatasource,
  ZQuery, ZPgSqlQuery, cpquery, dmTecSoft, dmbasico, clparametrossistema, biblio;

type
  TfraVendasAnteriores = class(TFrame)
    qryProdutosporCliente: TtecQuery;
    qryProdutosporClientecontrato: TStringField;
    qryProdutosporClientesituacao: TStringField;
    qryProdutosporClientefaturamento: TDateField;
    qryProdutosporClientefilial: TIntegerField;
    qryProdutosporClientequantidade: TFloatField;
    qryProdutosporClienteprecovenda: TFloatField;
    qryProdutosporClientetotalprecovenda: TFloatField;
    qryProdutosporClienteprecotabela: TFloatField;
    qryProdutosporClientetotalprecotabela: TFloatField;
    qryProdutosporClientedesconto: TFloatField;
    qryProdutosporClientefilialvenda: TIntegerField;
    qryProdutosporClienteserie: TStringField;
    qryProdutosporClientenumeronota: TIntegerField;
    qryProdutosporClientemaquina: TIntegerField;
    qryProdutosporClienteintervensao: TIntegerField;
    qryProdutosporClientenumerocupom: TIntegerField;
    qryProdutosporClienteproduto_cliente: TStringField;
    qryProdutosporClientepedidocliente: TStringField;
    dsrProdutosporCliente: TtecDataSource;
    DBAdvGridProdutosporCliente: TDBAdvGrid;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AbrirConsulta(cliente, tipocliente, produto: String);
  end;

implementation

{$R *.dfm}

{ TfraVendasAnteriores }

procedure TfraVendasAnteriores.AbrirConsulta(cliente, tipocliente,
  produto: String);
begin
  dtmBasico.RefazConsultaPorNome(qryProdutosporCliente,
    ['cliente', 'tipocliente', 'produto' ],
    [cliente, tipocliente, produto]);
end;

constructor TfraVendasAnteriores.Create(AOwner: TComponent);
begin
  inherited;
  DBAdvGridProdutosporCliente.Bands.active := true;
  DBAdvGridProdutosporCliente.Bands.PrimaryColor :=  TColor(strtoint(parsistema.CorZebradoRelatorio));

  qryProdutosporClientequantidade.DisplayFormat  := ParSistema.MascaraQuantidadeGrade;

  dtmBasico.AcertarCasasDecimais(qryProdutosporClienteprecovenda);
  dtmBasico.AcertarCasasDecimais(qryProdutosporClienteprecotabela);
  dtmBasico.AcertarCasasDecimais(qryProdutosporClientetotalprecovenda);
  dtmBasico.AcertarCasasDecimais(qryProdutosporClientetotalprecotabela);
  
end;

end.
