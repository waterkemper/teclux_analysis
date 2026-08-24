unit fmConsultaProdutosNotasSefaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource, dmtecsoft,
  Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, DBGrids, cpdbgrid, fmajuda;

type
  TfrmConsultaProdutosNotasSefaz = class(TFrmAjuda)
    dsrProdutosPedidosNfePendentes: TtecDataSource;
    qryProdutosPedidosNfePendentes: TtecQuery;
    qryProdutosPedidosNfePendenteschnfe: TStringField;
    qryProdutosPedidosNfePendentesxnome: TStringField;
    qryProdutosPedidosNfePendentesdhemi: TStringField;
    qryProdutosPedidosNfePendentesdhrecbto: TStringField;
    qryProdutosPedidosNfePendentescprod: TStringField;
    qryProdutosPedidosNfePendentescean: TStringField;
    qryProdutosPedidosNfePendentesxprod: TStringField;
    qryProdutosPedidosNfePendentesncm: TStringField;
    qryProdutosPedidosNfePendentesucom: TStringField;
    qryProdutosPedidosNfePendentesqcom: TFloatField;
    qryProdutosPedidosNfePendentesvuncom: TFloatField;
    qryProdutosPedidosNfePendentesprodutovisual: TStringField;
    qryProdutosPedidosNfePendentesdescricaoproduto: TStringField;
    qryProdutosPedidosNfePendentespp_quantidade: TFloatField;
    qryProdutosPedidosNfePendentespp_preco_pedido: TFloatField;
    qryProdutosPedidosNfePendentespe_numero: TIntegerField;
    qryProdutosPedidosNfePendentespe_emissao: TDateField;
    qryProdutosPedidosNfePendentespe_fornecedor: TIntegerField;
    dbgProdutosPedidosNfePendentes: TtecDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure OperacaoPadrao(Value: Array of Variant); override;

  end;

var
  frmConsultaProdutosNotasSefaz: TfrmConsultaProdutosNotasSefaz;

implementation

{$R *.dfm}

{ TfrmConsultaProdutosNotasSefaz }

constructor TfrmConsultaProdutosNotasSefaz.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfrmConsultaProdutosNotasSefaz.Destroy;
begin

  inherited;
end;

procedure TfrmConsultaProdutosNotasSefaz.OperacaoPadrao(
  Value: array of Variant);
begin
  inherited;
  if Length(Value) > 0 then
  begin
    if Value[0] = 'Abrir' then
    begin
      qryProdutosPedidosNfePendentes.ParamByName('produto').asString := Value[1];
      qryProdutosPedidosNfePendentes.close;
      qryProdutosPedidosNfePendentes.open;
    end;
  end;
end;

end.
