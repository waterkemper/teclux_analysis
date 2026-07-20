
unit frtelefone;

interface

uses
  //CLX
  Classes, StdCtrls, Mask, DBCtrls, Controls, Forms, cpnumero, cpfone;

type
  TfraTelefone = class(TFrame)
    gbxFone: TGroupBox;
    edtDDD: TDBEditNumero;
    edtNumero: TDBEditFone;
    lblDDD: TLabel;
    lblNumero: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
