unit ceeditioncontrolvalidationeditor;

interface

Uses
  //CLX
  DesignEditors, Forms,
  //Componentes
  dfeditioncontrolvalidation, cpeditioncontrolvalidation;

type

  TtecEditionControlValidationEditor = Class(TComponentEditor)
  protected
    FForm: TdfmEditionControlValidation;
  public
    procedure Edit; override;
  end;

implementation

Uses
  //CLX
  classes, Controls;

{ TtecEditionControlValidationEditor }

procedure TtecEditionControlValidationEditor.Edit;
var
  a: Integer;
  CompOwner: TWinControl;
  Comp: TtecEditionControlValidation;
  FormControllist, CompControlList: TStringList;

  procedure FillControlList(Control: TWinControl);
  var
    a: Integer;
  begin
    for a := 0 to Control.ControlCount - 1 do
      if (Control.Controls[a] is TWinControl) and (Control.Controls[a].Name <> '') then begin
        if Comp.IndexOfObject(TWinControl(Control.Controls[a])) = -1 then
          FormControllist.AddObject(Control.Controls[a].Name, Control.Controls[a]);
        if Control.Controls[a] is TWinControl then
          FillControlList(TWinControl(Control.Controls[a]));
      end
  end;

begin
  FForm := TdfmEditionControlValidation.Create(Application);
  FForm.Caption := Component.Name + ' - ' + FForm.Caption;
  Comp := TtecEditionControlValidation(Component);
  CompOwner := TWinControl(Comp.Owner);
  FormControllist := TStringList.Create;
  CompControlList := TStringList.Create;
  try
    for a := 0 to Comp.ControlCount - 1 do
      CompControllist.AddObject(Comp.Controls[a].Name, Comp.Controls[a]);
    FillControlList(CompOwner);
    if FForm.ShowModal(FormControllist, CompControlList) = mrOK then begin
      Comp.Add(CompControlList);
      Comp.Remove(FormControllist)
    end
  finally
    FormControllist.Free;
    CompControlList.Free;
    FForm.Free
  end
end;

end.
