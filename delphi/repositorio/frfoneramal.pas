unit frfoneramal;

interface

uses
  //CLX
  StdCtrls, Mask, DBCtrls, Classes, Controls,
  //Repositorio
  frtelefone, cpnumero, cpfone, cptexto;

type
  TfraFoneRamal = class(TfraTelefone)
    edtFoneRamal: TDBEditTexto;
    lblRamal: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
