unit dfeditioncontrolvalidation;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, ComCtrls, StdCtrls, Windows;


type
  TdfmEditionControlValidation = class(TForm)
    lbxSource: TListBox;
    lbxTarget: TListBox;
    btnOK: TBitBtn;
    pnlEdition: TPanel;
    btnCancel: TBitBtn;
    lblNaoVerificados: TLabel;
    lblVerificados: TLabel;
    procedure lbxSourceKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lbxTargetKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lbxSourceDblClick(Sender: TObject);
    procedure lbxTargetDblClick(Sender: TObject);
  protected
    procedure MoveSourceToTarget;
    procedure MoveTargetToSource;
  public
    function ShowModal(Ori, Dest: TStringList): Integer; reintroduce;
  end;

var
  dfmEditionControlValidation: TdfmEditionControlValidation;

implementation

//Uses
  //CLX
  {QeTe;}

{$R *.dfm}

{ TTdfmEditionControlValidationForm }


function TdfmEditionControlValidation.ShowModal(Ori, Dest: TStringList): Integer;
begin
  lbxSource.Items.Assign(Ori);
  lbxTarget.Items.Assign(Dest);
  Result := inherited ShowModal;
  if Result = mrOK then begin
    Ori.Assign(lbxSource.Items);
    Dest.Assign(lbxTarget.Items)
  end
end;

procedure TdfmEditionControlValidation.lbxSourceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_Return then
    MoveSourceToTarget
end;

procedure TdfmEditionControlValidation.lbxTargetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_Return then
    MoveTargetToSource
end;

procedure TdfmEditionControlValidation.lbxSourceDblClick(Sender: TObject);
begin
  MoveSourceToTarget
end;

procedure TdfmEditionControlValidation.lbxTargetDblClick(Sender: TObject);
begin
  MoveTargetToSource
end;

procedure TdfmEditionControlValidation.MoveSourceToTarget;
var
  a: Integer;
begin
  a := 0;
  while a < lbxSource.Items.Count do
    if lbxSource.Selected[a] then begin
      lbxTarget.Items.AddObject(lbxSource.Items[a], lbxSource.Items.Objects[a]);
      lbxSource.Items.Delete(a)
    end else
      Inc(a)
end;

procedure TdfmEditionControlValidation.MoveTargetToSource;
var
  a: Integer;
begin
  a := 0;
  while a < lbxTarget.Items.Count do
    if lbxTarget.Selected[a] then begin
      lbxSource.Items.AddObject(lbxTarget.Items[a], lbxTarget.Items.Objects[a]);
      lbxTarget.Items.Delete(a)
    end else
      Inc(a)
end;

end.
