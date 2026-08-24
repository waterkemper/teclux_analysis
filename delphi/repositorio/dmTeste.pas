unit dmTeste;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, cpQuery, ZPgSqlQuery, cpquery;

type
  TdtmTeste = class(TDataModule)
    qryProdutos: TtecQuery;
    qryProdutoscodigonota: TIntegerField;
    qryProdutosproduto: TLargeintField;
    qryProdutosdescricao: TStringField;
    qryProdutosdescricaoteste: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmTeste: TdtmTeste;

implementation

{$R *.dfm}

end.
