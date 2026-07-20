unit fmalteraremessa;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, 
  ExtCtrls, Buttons, StdCtrls, DBCtrls, Mask, Grids, DBGrids,
  ComCtrls,
  ZQuery,
  ctconstantes,
  cpnumero,  cpdata,
  fmlerdata,
  dmmanutencaocheques, fmnavcontroles;

type
  TfrmAlteraRemessa = class(TfrmLerData)
    lblNumero: TLabel;
    edtNumero: TEditNumero;
  protected
    function GetNumero: String;
  public
    constructor Create(AOwner: TComponent; Caption, LabelNumero: String); reintroduce;
    property Numero: String read GetNumero;
  end;

var
  frmAlteraRemessa: TfrmAlteraRemessa;
  AlterarRemessa:boolean;

implementation

{$R *.dfm}

{ TfrmAlteraRemessa }

constructor TfrmAlteraRemessa.Create(AOwner: TComponent; Caption, LabelNumero: String);
begin
  inherited Create(AOwner, Caption);
  lblNumero.Caption := LabelNumero;
end;

function TfrmAlteraRemessa.GetNumero: String;
begin
  Result := edtNumero.Text
end;

end.
