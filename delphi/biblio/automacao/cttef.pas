unit cttef;

interface

type

  TtecDadosTEF = record
    DataNSU,
    HoraNSU,
    NomeRedeNSU,
    NSUTEF: String;
    NroParcela: Integer;
    Valor: Currency;
    Parcelas: Array of Integer;
  end;

implementation

end.
 