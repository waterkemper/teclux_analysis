unit fmlerdata;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Controls, Forms, ExtCtrls,
  Buttons, StdCtrls, Mask,
  //Biblio
  ctconstantes,
  //Componentes
  cpdata,
  //Repositorio
  fmnavcontroles;

type

  TfrmLerData = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    gbxData: TGroupBox;
    edtData: TEditData;
  protected
    function GetData: String;
  public
    constructor Create(AOwner: TComponent; Caption: String); reintroduce;
    destructor destroy; override;
    property  Data: String read GetData;
  end;

var
  frmLerData : tfrmLerData;  

implementation

{$R *.dfm}

constructor TfrmLerData.Create(AOwner: TComponent; Caption: String);
begin
  inherited Create(AOwner);
  Self.Caption := Caption;
  edtData.Text:=DateToStr(Date);
end;

destructor TfrmLerData.destroy;
begin
  inherited;
  frmLerData := nil;
end;

function TfrmLerData.GetData: String;
begin
  Result := edtData.Text
end;

end.
