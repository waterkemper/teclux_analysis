unit fmlerdatanumero;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, 
  ExtCtrls, Buttons, StdCtrls, DBCtrls, Mask, Grids, DBGrids,
  ComCtrls,
  //Terceiros
  ZQuery,
  //Biblio
  ctconstantes,
  //Componentes
  cpnumero,  cpdata,
  //Repositorio
  fmlerdata, fmnavcontroles;

type
  TfrmLerDataNumero = class(TfrmLerData)
    lblNumero: TLabel;
    edtNumero: TEditNumero;
  protected
    function GetNumero: String;
  public
    constructor Create(AOwner: TComponent; Caption, LabelNumero: String); reintroduce;
    destructor Destroy; override;

    property Numero: String read GetNumero;
  end;

var
  frmLerDataNumero : TfrmLerDataNumero;


implementation

{$R *.dfm}

{ TfrmLerDataNumero }

constructor TfrmLerDataNumero.Create(AOwner: TComponent; Caption, LabelNumero: String);
begin
  inherited Create(AOwner, Caption);
  lblNumero.Caption := LabelNumero;
end;

destructor TfrmLerDataNumero.Destroy;
begin
  inherited;
  frmLerDataNumero := nil;
end;

function TfrmLerDataNumero.GetNumero: String;
begin
  Result := edtNumero.ValorSemFormatacao;
end;

end.
