unit ParamaterEditorForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmEditParam = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edName: TEdit;
    edValue: TEdit;
    btnCancel: TButton;
    btnOk: TButton;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure edNameChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditParam: TfrmEditParam;

function  NewEditParam(var pName : String; var pValue : String) : Boolean;

implementation

{$R *.DFM}

function  NewEditParam(var pName : String; var pValue : String) : Boolean;
begin
  with TfrmEditParam.Create(nil) do
    begin
      edName.Text := pName;
      edValue.Text := pValue;
      Result := false;
      if ShowModal = mrOk then
        begin
          pName := edName.Text;
          pValue := edValue.Text;
          Result := True;
        end;
    end;
end;

procedure TfrmEditParam.edNameKeyPress(Sender: TObject; var Key: Char);
begin
  if key in ['<', '>', '&', ';'] then
    key := #0;
  if key = #32 then
    key := '_';
end;

procedure TfrmEditParam.edNameChange(Sender: TObject);
begin
  btnOk.Enabled := (Trim(edName.Text) <> '');
end;

procedure TfrmEditParam.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #27 : btnCancel.Click;
    #13 : begin
            if edName.Focused then
              edValue.SetFocus
            else
              begin
                if btnOk.Enabled then
                  btnOk.Click
                else
                  edName.SetFocus;
              end;
            Key := #0;
          end;
  end;
end;

end.
