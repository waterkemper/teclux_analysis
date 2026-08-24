unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ECXMLParser;

type
  TForm1 = class(TForm)
    ECXMLParser1: TECXMLParser;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Memo3: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ECXMLParser1.Root.Name := 'Test';
  ECXMLParser1.Root.Text := Memo1.Lines.Text;
  Memo2.Lines.Text := ECXMLParser1.Root.AsString;
  ECXMLParser1.SaveToFile('Test.xml');
  ECXMLParser1.Root.Clear;
  ECXMLParser1.LoadFromFile('Test.xml');
  Memo3.Lines.Text := ECXMLParser1.Root.Text;
end;

end.
