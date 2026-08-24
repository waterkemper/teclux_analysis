unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ECXMLParser, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    XML: TECXMLParser;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    TreeView1: TTreeView;
    Edit1: TEdit;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DrawXML;
    procedure DrawXMLItem( XMLItem : TXMLItem; Node : TTreeNode );
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  x, y, z : Integer;
  a : TXMLItem;
begin
  XML.Clear;
  XML.Root.Name := 'Test';
  for x := 0 to 3 do
    begin
      a := XML.Root.New;
      a.Name := 'XItem' + IntToStr(x);
      a.Text := 'XItemText' + IntToStr(x) + #13#10 + 'more test text';
      for y := 0 to 2 do
        a.Params.Values['Param' + IntToStr(y)] := 'Value ' + IntToStr(y);
      for z := 0 to 1 do
        a.New.Name := 'z' + IntToStr(z);
    end;
  XML.SaveToFile(ChangeFileExt(ParamStr(0), '.xml'));
  Memo1.Lines.LoadFromFile(ChangeFileExt(ParamStr(0), '.xml'));
  DrawXML;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  XML.LoadFromFile(ChangeFileExt(ParamStr(0), '.xml'));
  DrawXML;
  XML.SaveToFile(ChangeFileExt(ParamStr(0), '1.xml'));
  Memo1.Lines.LoadFromFile(ChangeFileExt(ParamStr(0), '1.xml'));
end;

procedure TForm1.DrawXML;
begin
  TreeView1.Items.Clear;
  DrawXMLItem(XML.Root, nil);
  TreeView1.FullExpand;
  Edit1.Text := '';
  Memo2.Lines.Clear;
end;

procedure TForm1.DrawXMLItem(XMLItem: TXMLItem; Node: TTreeNode);
var
  n : TTreeNode;
  i : Integer;
begin
  n := TreeView1.Items.AddChild(Node, XMLItem.Name);
  n.Data := XMLItem;
  for i := 0 to XMLItem.SubItemCount -1 do
    DrawXMLItem(XMLItem.SubItems[i], n);
end;

procedure TForm1.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if Node <> nil then
    begin
      Edit1.Text := TXMLItem(Node.Data).Text;
      Memo2.Lines.Text := TXMLItem(Node.Data).Params.Text;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Button1.Click;
end;

end.
