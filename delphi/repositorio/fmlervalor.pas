unit fmlervalor;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, ExtCtrls,
  //Repositorio
  fmlernumero,
  //Componentes
  cpnumero;

type
  TfrmLerValor = class(TfrmLerNumero)
  public
   destructor Destroy; override;
  end;

var
frmLerValor: TfrmLerValor;

implementation

{$R *.dfm}

{ TfrmLerValor }

destructor TfrmLerValor.Destroy;
begin
  inherited;
  frmLerValor := nil;
end;

end.
