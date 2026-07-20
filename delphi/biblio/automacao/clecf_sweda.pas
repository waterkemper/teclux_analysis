unit clecf_sweda;

interface

uses
  //CLX
  clecf;

type

  TtecECFSweda = class(TtecECF)
  public
    procedure IniciarImpressora(Porta: String); override;
    procedure PagamentoCupom(FormaPagto, Valor: String); override;
    procedure IniciarVinculado(FormaPagto, Valor, Cupom: String); override;
end;

implementation

procedure TtecECFSweda.IniciarImpressora(Porta: String);
begin
//  ECFPadrao.Modelo := 5;
  inherited IniciarImpressora(Porta);
end;

procedure TtecECFSweda.PagamentoCupom(FormaPagto, Valor: String);
begin
  FormaPagto := ConverteFormaPagto(FormaPagto,0);
  inherited PagamentoCupom(FormaPagto,Valor);
end;

procedure TtecECFSweda.IniciarVinculado(FormaPagto, Valor, Cupom: String);
begin
  FormaPagto := ConverteFormaPagto(FormaPagto,0);
  inherited IniciarVinculado(FormaPagto,Valor,Cupom);
end;

end.
