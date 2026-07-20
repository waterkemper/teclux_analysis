unit DBDateTimePicker2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, DbCtrls, Db, ctconstantes;

type
  TDBDateTimePicker2 = class(TDateTimePicker)
  private
    { private declarations }

    // ...
    FDataLink: TFieldDataLink;

    procedure dataChange(Sender: TObject);
    procedure updateData(Sender: TObject);

    // datasource property
    procedure setDataSource(Value: TDataSource);
    function  getDataSource: TDataSource;

    // datafield property
    procedure setDataField(const value : string);
    function  getDataField : string;

    // field linked to the control
    function  getField : TField;

    // enter & exit
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;

  protected
    { protected declarations }
    procedure DoEnter; override;
    procedure DoExit; override;



  public
    { public declarations }

    // constructor & distructor
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    // change
    procedure Change; override;

    // field linked to the control
    property Field      : TField      read getField;

  published
    { published declarations }

    // data field
    property DataField  : string      read getDataField  write setDataField;
    // data source
    property DataSource : TDataSource read getDataSource write setDataSource;
  end;

//procedure Register;

implementation


constructor TDBDateTimePicker2.create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDataLink                 := TFieldDataLink.Create;
  FDataLink.Control         := Self;
  FDataLink.OnDataChange    := DataChange;
  FDataLink.OnUpdateData    := UpdateData;
end;

destructor TDBDateTimePicker2.destroy;
begin
  FDataLink.free;
  FDataLink := nil;

  inherited destroy;
end;

procedure TDBDateTimePicker2.dataChange(Sender: TObject);
begin
  // is it a valid field ?
  if fDataLink.field <> nil then begin
    // set database date time
    dateTime := fDataLink.field.asDateTime;
  end;
end;

procedure TDBDateTimePicker2.UpdateData(Sender: TObject);
begin
  // is it a valid field ?
  if fDataLink.field <> nil then begin
    // set current date to the database field 
    fDataLink.field.asDateTime := dateTime;
  end;
end;

function TDBDateTimePicker2.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBDateTimePicker2.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBDateTimePicker2.GetDataField: string;
begin
  result := fDataLink.FieldName;
end;

procedure TDBDateTimePicker2.SetDataField(const Value: string);
begin
  fDataLink.FieldName := Value;
end;

function TDBDateTimePicker2.getField : TField;
begin
  result := FDataLink.field;
end;

// change
procedure TDBDateTimePicker2.change;
begin
  // a change as been done to the field on database
  if fDataLink.edit then begin
    // call inherited change
    inherited Change;

    // set modifed status on data link
    fDataLink.modified;
  end;
end;

procedure TDBDateTimePicker2.CMEnter(var Message: TCMEnter);
begin
  // ...
  inherited;

  // ...
  FDataLink.CanModify;
end;

procedure TDBDateTimePicker2.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
    UpdateData(NIL);
  except
    SetFocus;
    raise;
  end;

  inherited;
end;

{
procedure Register;
begin
  RegisterComponents('Data Controls', [TDBDateTimePicker2]);
end;
}

procedure TDBDateTimePicker2.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;

end;

procedure TDBDateTimePicker2.DoExit;
begin
  inherited;
    Color:= clWindow;


end;

end.
