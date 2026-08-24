unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RollForms;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    mainRoller: TRollForms;
    topr: TRollForms;
    leftr: TRollForms;
    rightr: TRollForms;
    botr: TRollForms;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses demo;

{$R *.dfm}

procedure TForm1.Button4Click(Sender: TObject);
begin
topr._GetAppeared(Form2);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
botr._GetAppeared(Form2);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
leftr._GetAppeared(Form2);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
rightr._GetAppeared(Form2);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (KEY=VK_ESCAPE) then mainRoller._GetDisappeared(self);
end;

end.
