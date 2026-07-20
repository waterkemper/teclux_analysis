unit frintervalodata;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask;

type
  TfraIntervaloData = class(TFrame)
    gbxIntervaloData: TGroupBox;
    mkeDataInicio: TMaskEdit;
    lblDataInicio: TLabel;
    lblDataFinal: TLabel;
    mkeDataFinal: TMaskEdit;
  private
    function GetDataFinal: String;
    function GetDataInicial: String;
    procedure SetDataFinal(const Value: String);
    procedure SetDataInicial(const Value: String);
  public
    property DataInicial: String read GetDataInicial write SetDataInicial;
    property DataFinal: String read GetDataFinal write SetDataFinal;
  end;

implementation

{$R *.dfm}

{ TfraIntervaloData }

function TfraIntervaloData.GetDataFinal: String;
begin
  Result := mkeDataFinal.Text;
end;

function TfraIntervaloData.GetDataInicial: String;
begin
  Result := mkeDataInicio.Text;
end;

procedure TfraIntervaloData.SetDataFinal(const Value: String);
begin
  if mkeDataFinal.Text <> Value then
    mkeDataFinal.Text := Value
end;

procedure TfraIntervaloData.SetDataInicial(const Value: String);
begin
  if mkeDataInicio.Text <> Value then
    mkeDataInicio.Text := Value
end;

end.
