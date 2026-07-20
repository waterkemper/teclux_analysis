unit FldFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DBTables, DB;

type
  TfmFieldsEdit = class(TForm)
    lbFieldQuery: TListBox;
    lbStoredField: TListBox;
    butAdd: TButton;
    butDel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure butAddClick(Sender: TObject);
    procedure butDelClick(Sender: TObject);
  private
    FQuery : TDataSet;
    function CompareField( NameField : string): boolean;
  public
    constructor CreateForm(AOwner : TComponent; Query : TDataSet );
    procedure AddStoredField(Name : string);
    procedure FillList;
  end;

var
  fmFieldsEdit: TfmFieldsEdit;

implementation

{$R *.DFM}

constructor TfmFieldsEdit.CreateForm(AOwner : TComponent; Query : TDataSet );
begin
  inherited Create(AOwner);
  FQuery := Query;
end;

procedure TfmFieldsEdit.butAddClick(Sender: TObject);
begin
  lbStoredField.Items.Add( lbFieldQuery.Items[lbFieldQuery.ItemIndex]);
  lbFieldQuery.Items.Delete(lbFieldQuery.ItemIndex);
end;

procedure TfmFieldsEdit.butDelClick(Sender: TObject);
begin
  lbFieldQuery.Items.Add( lbStoredField.Items[lbStoredField.ItemIndex]);
  lbStoredField.Items.Delete(lbStoredField.ItemIndex);
end;


procedure TfmFieldsEdit.FillList();
var
  FActive : boolean;
  I : integer;
begin
  FActive := FQuery.Active;
  if not FActive then FQuery.Active := True;
  for I := 0 to FQuery.Fields.Count - 1 do
    if not (CompareField( FQuery.Fields[I].FieldName )) then
      lbFieldQuery.Items.Add(FQuery.Fields[I].FieldName);
  FQuery.Active := FActive;
end;

procedure TfmFieldsEdit.AddStoredField(Name : string);
begin
  lbStoredField.Items.Add(Name);
end;

function TfmFieldsEdit.CompareField( NameField : string): boolean;
var
  I : integer;
begin
  Result := false;
  for I := 0 to lbStoredField.items.Count - 1 do begin
    if ( lbStoredField.Items[I] = NameField ) then begin
      Result := true;
      Exit;
    end;
  end;
end;


end.
