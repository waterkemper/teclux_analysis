unit clecf_epson;

interface

uses
  //CLX
  clecf;

type

  TtecECFEpson = class(TtecECF)
  public
    procedure IniciarImpressora(Porta: String); override;
    procedure PagamentoCupom(FormaPagto, Valor: String); override;
    procedure IniciarVinculado(FormaPagto, Valor, Cupom: String); override;
end;

implementation

procedure TtecECFEpson.IniciarImpressora(Porta: String);
begin
//  ECFPadrao.Modelo := 6;
  inherited IniciarImpressora(Porta);
end;

procedure TtecECFEpson.PagamentoCupom(FormaPagto, Valor: String);
begin
  FormaPagto := ConverteFormaPagto(FormaPagto,0);
  inherited PagamentoCupom(FormaPagto,Valor);
end;

procedure TtecECFEpson.IniciarVinculado(FormaPagto, Valor, Cupom: String);
begin
  FormaPagto := ConverteFormaPagto(FormaPagto,0);
  inherited IniciarVinculado(FormaPagto,Valor,Cupom);
end;

end.
