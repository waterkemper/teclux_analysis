unit fmalterardata;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, cpdata, biblio, ctconstantes, fmajuda;

type
  Tfrmalterardata = class(TfrmAjuda)
    gbxCaption: TGroupBox;
    edtdata: TEditData;
    btncancelar: TBitBtn;
    btnOK: TBitBtn;
    procedure edtdataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnokClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    function getData: TDateTime;
    { Private declarations }
  protected
    function ControlesPreenchidos: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
    property Data : TDateTime read getData;
    { Public declarations }
  end;

var
  frmalterardata: Tfrmalterardata;

implementation

{$R *.dfm}

{ Tfrmalterardata }


constructor Tfrmalterardata.Create(AOwner: TComponent);
begin
  inherited;
//  Top  := (Screen.Height - Height) div 2;
//  Left := (Screen.Width - Width) div 2;
end;

procedure Tfrmalterardata.edtdataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
  if TeclaEnterOuReturn(Key) then
  begin
    if edtdata.Criticar(true) then
      btnokClick(Sender);
  end
  else
  if Key = VK_ESCAPE then
    ModalResult := mrAbort;
    }
end;

procedure Tfrmalterardata.btnokClick(Sender: TObject);
begin
  if edtdata.Criticar(true) and (edtdata.Text<>'') then
    ModalResult:= mrOk
  else
  begin
    Modalresult := mrNone;
    edtdata.SetFocus;
  end;
end;

procedure Tfrmalterardata.btncancelarClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

function Tfrmalterardata.ControlesPreenchidos: Boolean;
begin
  if Trim(edtdata.Text) = '' then
  begin
    MensagemAviso(ctDATAINVALIDA);
    edtdata.SetFocus;
    Result := False;
  end
  else
    Result:= True;
end;

function Tfrmalterardata.getData: TDateTime;
begin
  Result:= strtodate(edtdata.text);
end;

procedure Tfrmalterardata.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
{  CanClose := (ModalResult = mrOK) or
              (ModalResult = mrAbort);}
end;

destructor Tfrmalterardata.destroy;
begin
  inherited;
  frmalterardata := nil;
end;

procedure Tfrmalterardata.FormShow(Sender: TObject);
begin
  edtdata.SetFocus;
end;

end.
