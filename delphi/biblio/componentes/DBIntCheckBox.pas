// -------------------------------------------------
// DBIntCheckbox 0.7
// Checkbox for integer field
// if Checked then value=1 else value=0
// it's useful for Interbase 6.x. it's like boolean field
//
// author: Jaroslaw Filipowicz
// website: http://www.filipowicz.info
// -------------------------------------------------

unit DBIntCheckBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, DbCtrls, Db, StdCtrls;

type
  TDBIntCheckBox = class(TCheckBox)
  private
    { private declarations }

    // ...
    FDataLink: TFieldDataLink;

    procedure StateChange(Sender: TObject);
    procedure updateData(Sender: TObject);
//  procedure ProcedimentoaoClicar(Sender: TObject);

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

  public
    { public declarations }

    // constructor & distructor
    CMEntersetado : boolean;
//    ExitExecutado : boolean;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

   // change
    procedure Click; override;

    // field linked to the control
    property Field      : TField      read getField;

  published
    { published declarations }

    // data field
    property DataField  : string      read getDataField  write setDataField;
    // data source
    property DataSource : TDataSource read getDataSource write setDataSource;
  end;

{procedure Register;}

implementation


constructor TDBIntCheckBox.create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDataLink                 := TFieldDataLink.Create;
  FDataLink.Control         := Self;
  FDataLink.OnDataChange    := StateChange;
  FDataLink.OnUpdateData    := UpdateData;

//  self.OnClick := ProcedimentoaoClicar;
end;

destructor TDBIntCheckBox.destroy;
begin
  FDataLink.free;
  FDataLink := nil;

  inherited destroy;
end;

procedure TDBIntCheckBox.StateChange(Sender: TObject);
begin
  if fDataLink.field <> nil then
  begin

    case fDataLink.field.DataType of
      ftInteger :
      begin
          if (fDataLink.field.asInteger>0) then
            Checked:= true
          else
            Checked:= false;
      end;

      ftBoolean : Checked := fDataLink.field.asBoolean;
    end;

//    self.Refresh;

  end;
end;

procedure TDBIntCheckBox.UpdateData(Sender: TObject);
var
  vValorChecked : Boolean;

begin
  if fDataLink.field <> nil then
  begin

    vValorChecked := checked;
    fDataLink.datasource.dataset.edit;
    checked := vValorChecked ;


    case fDataLink.field.datatype of
      ftinteger :
      begin
          if (Checked) then
            fDataLink.field.asInteger := 1
          else
            fDataLink.field.asInteger := 0;
      end;
      ftboolean : fDataLink.field.asBoolean := checked;
    end;
//    fDataLink.datasource.dataset.edit;
  end;
end;

function TDBIntCheckBox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBIntCheckBox.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBIntCheckBox.GetDataField: string;
begin
  result := fDataLink.FieldName;
end;

procedure TDBIntCheckBox.SetDataField(const Value: string);
begin
  fDataLink.FieldName := Value;
end;

function TDBIntCheckBox.getField : TField;
begin
  result := FDataLink.field;
end;


procedure TDBIntCheckBox.Click;
var
  vValorChecked : Boolean;
begin
  inherited Click;

  if CMEntersetado then
  begin

    try
                 {
      if not ExitExecutado then
        self.checked := not self.checked;
        }

//      vValorChecked := checked;
//      fDataLink.datasource.dataset.edit;
//    checked := vValorChecked;

      UpdateData(self);

//      ExitExecutado := false;


    except
      SetFocus;
      raise;
    end;



  end;

end;

{
procedure TDBIntCheckBox.CMEnter(var Message: TCMEnter);
begin
  inherited;
  if FDataLink.CanModify then
  begin
    fDataLink.datasource.dataset.edit;
    checked := not checked;

    try
      UpdateData(self);
    except
      SetFocus;
      raise;
    end;

  end;

end;


procedure TDBIntCheckBox.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;

  inherited;
end;
}

{
procedure TDBIntCheckBox.Click;
begin

/  if fDataLink.edit then begin
    inherited Click;

//    fDataLink.modified;
//  end;
end;

}

procedure TDBIntCheckBox.CMEnter(var Message: TCMEnter);
begin
  inherited;

  if FDataLink.CanModify then
  begin
//    self.checked := not self.checked;
//    fDataLink.edit;
    CMEntersetado := true;
//    ExitExecutado := true;
    self.click;
  end;
end;

procedure TDBIntCheckBox.CMExit(var Message: TCMExit);
begin
  try
//    ExitExecutado := true;
    CMEntersetado := false;
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;

  inherited;
end;



{
procedure Register;
begin
  RegisterComponents('Data Controls', [TDBIntCheckBox]);
end;
}

(*
procedure TDBIntCheckBox.ProcedimentoaoClicar(Sender: TObject);
begin
 //if fDataLink.datasource.dataset.state in [dsinsert, dsedit]) then

{
  if fDataLink.edit then
    self.click;
 }

 {
  fDataLink.modified;

  if FDataLink.CanModify then
  begin
    fDataLink.datasource.dataset.edit;
    try
      UpdateData(self);
    except
      SetFocus;
      raise;
    end;

  end;

  }
end;
*)

end.
