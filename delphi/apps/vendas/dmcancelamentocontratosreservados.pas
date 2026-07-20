unit dmcancelamentocontratosreservados;

interface

uses
  SysUtils, Classes, DB,
  // Constantes
  ctconstantes, biblio,
  // Componentes
  cpquery, cpdatasource,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Repositorio
  dmbasico, dmtecsoft, dmcancelamentocontratosaberto;

type
  TdtmCancelamentoContratosReservados = class(TdtmCancelamentoContratosAberto)
    spcMovimentosProximo: TtecQuery;
    qryMovimentos: TtecQuery;
    qryMovimentosnumero: TIntegerField;
    qryMovimentosdata: TDateField;
    qryMovimentosproduto: TIntegerField;
    qryMovimentosfilial: TIntegerField;
    qryMovimentosquantidade: TIntegerField;
    qryMovimentosreferencia: TStringField;
    qryMovimentostipomovimento: TStringField;
    spcMovimentosProximonumero: TIntegerField;
    qryProdutosContratos: TtecQuery;
    qryProdutosContratoscontrato: TStringField;
    qryProdutosContratosproduto: TIntegerField;
    qryProdutosContratosfilial: TIntegerField;
    qryProdutosContratosquantidade: TIntegerField;
    qryProdutosContratosmovimento: TIntegerField;
    qryProdutosContratosfuturo: TIntegerField;
    qryProdutosContratosreserva: TIntegerField;
  public
    procedure CancelarReservados;
    procedure GerarMovimento(Tipo: String);
  end;

var
  dtmCancelamentoContratosReservados: TdtmCancelamentoContratosReservados;

implementation

{$R *.dfm}

procedure TdtmCancelamentoContratosReservados.CancelarReservados;
begin
  qryContratos.DisableControls;
  try
    qryContratos.First;
    while not qryContratos.Eof do
    begin
      if  (qryContratosdata.AsDateTime <= LimiteData)
      and (qryContratosselecionar.AsBoolean) then
      begin
        RefazConsulta(qryProdutosContratos,[0],[qryContratosnumero.Value]);
        qryProdutosContratos.First;
        with qryProdutosContratos do
          while not Eof do
          begin
            if FieldByName('quantidade').Value = FieldByName('futuro').Value then
              GerarMovimento('CCF')
            else
              GerarMovimento('CCR');
            Next;
          end;
      end;
      qryContratos.Next;
    end;
  finally
    Perpetrar([qryContratos]);
    qryContratos.EnableControls;
  end;
end;

procedure TdtmCancelamentoContratosReservados.GerarMovimento(Tipo: String);
begin
  qryMovimentos.Open;
  qryMovimentos.Insert;
  RefazConsulta(spcMovimentosProximo,[0, 1],[qryProdutosContratosproduto.Value,
                                             qryProdutosContratosfilial.Value]);
  qryMovimentostipomovimento.AsString:= Tipo;
  qryMovimentosreferencia.AsString:= qryProdutosContratosmovimento.AsString;
  qryMovimentosnumero.AsInteger := spcMovimentosProximonumero.Value;
  qryMovimentosproduto.AsInteger:= qryProdutosContratosproduto.Value;
  qryMovimentosfilial.AsInteger := qryProdutosContratosfilial.Value;
  qryMovimentosquantidade.AsInteger:= qryProdutosContratosquantidade.Value;
  qryMovimentosdata.Value := DataLocal;
  qryMovimentos.Post;
end;

end.
