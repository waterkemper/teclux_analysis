unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, ToolWin, ECXMLParser, StdCtrls, ParamaterEditorForm,
  Registry, ShellApi, Menus, Clipbrd, ActnList, IniFiles;

const
  Max_History_Items = 10;

type
  TfrmMain = class(TForm)
    XML: TECXMLParser;
    tbMain: TToolBar;
    btnNew: TToolButton;
    ilMenu: TImageList;
    sbXML: TStatusBar;
    Splitter1: TSplitter;
    pnlItemProperties: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbItemParamaters: TListBox;
    edItemTitle: TEdit;
    edItemValue: TEdit;
    OpenDialog1: TOpenDialog;
    btnOpen: TToolButton;
    btnSave: TToolButton;
    SaveDialog1: TSaveDialog;
    pnlXML: TPanel;
    tvXML: TTreeView;
    tbXML: TToolBar;
    btnDeleteNode: TToolButton;
    btnNewNode: TToolButton;
    ilXML: TImageList;
    ToolBar3: TToolBar;
    btnNewProperty: TToolButton;
    btnDeleteProperty: TToolButton;
    Label4: TLabel;
    edXSLStyleSheet: TEdit;
    Bevel1: TBevel;
    ToolButton1: TToolButton;
    btnMoveDown: TToolButton;
    btnMoveUp: TToolButton;
    ToolButton2: TToolButton;
    btnPreview: TToolButton;
    puXMLTree: TPopupMenu;
    DeleteElement1: TMenuItem;
    NewElement1: TMenuItem;
    XMLGhost: TXMLGhost;
    CopyElement1: TMenuItem;
    PasteElementBelow1: TMenuItem;
    ActionList1: TActionList;
    actOpen: TAction;
    actNew: TAction;
    actSave: TAction;
    actPreview: TAction;
    N1: TMenuItem;
    ToolButton3: TToolButton;
    btnCrLf: TToolButton;
    PasteOverElement1: TMenuItem;
    dmOpenHistory: TPopupMenu;
    HistoryItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tvXMLChange(Sender: TObject; Node: TTreeNode);
    procedure XMLLoaded(Sender: TObject);
    procedure XMLXMLItemChanged(Sender: TECXMLParser; XMLItem: TXMLItem);
    procedure btnNewNodeClick(Sender: TObject);
    procedure btnDeleteNodeClick(Sender: TObject);
    procedure edItemTitleChange(Sender: TObject);
    procedure edItemValueChange(Sender: TObject);
    procedure edItemTitleKeyPress(Sender: TObject; var Key: Char);
    procedure lbItemParamatersClick(Sender: TObject);
    procedure btnNewPropertyClick(Sender: TObject);
    procedure lbItemParamatersDblClick(Sender: TObject);
    procedure btnDeletePropertyClick(Sender: TObject);
    procedure edXSLStyleSheetChange(Sender: TObject);
    procedure btnMoveUpClick(Sender: TObject);
    procedure btnMoveDownClick(Sender: TObject);
    procedure NewElement1Click(Sender: TObject);
    procedure DeleteElement1Click(Sender: TObject);
    procedure puXMLTreePopup(Sender: TObject);
    procedure CopyElement1Click(Sender: TObject);
    procedure PasteElementBelow1Click(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure lbItemParamatersKeyPress(Sender: TObject; var Key: Char);
    procedure btnCrLfClick(Sender: TObject);
    procedure PasteOverElement1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HistoryItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDoChangeEvents: Boolean;
    FFileName: String;
    FModified: Boolean;
    HistoryList : TStringList;
    procedure PopulateHistoryMenu;
    procedure LoadIniSettings;
    procedure SaveIniSettings;
    procedure SetDoChangeEvents(const Value: Boolean);
    procedure SetFileName(const Value: String);
    procedure SetModified(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property Modified : Boolean read FModified write SetModified;
    property FileName : String read FFileName write SetFileName;
    procedure DrawXML( Data : Pointer = nil );
    function  DrawXMLItem( XMLItem : TXMLItem; Node : TTreeNode; Data : Pointer ) : Pointer;

    property DoChangeEvents : Boolean read FDoChangeEvents write SetDoChangeEvents;
  end;

var
  frmMain: TfrmMain;
  Ini    : TIniFile;

implementation

{$R *.DFM}

{ TForm1 }

procedure TfrmMain.DrawXML( Data : Pointer = nil );
var
  p : Pointer;
begin
  p := Data;
  if (tvXML.Selected <> nil) and
     (p = nil) then
    p := tvXML.Selected.Data;

  tvXML.Items.Clear;
  p := DrawXMLItem(XML.Root, nil, p);
  tvXML.FullExpand;

  if p = nil then
    tvXML.Selected := tvXML.Items[0]
  else
    tvXML.Selected := p;
end;

function TfrmMain.DrawXMLItem(XMLItem: TXMLItem; Node: TTreeNode; Data : Pointer) : Pointer;
var
  n : TTreeNode;
  i : Integer;
  p : Pointer;
begin
  Result := nil;
  p := nil;
  n := tvXML.Items.AddChild(Node, XMLItem.Name);
  n.Data := XMLItem;
  if Integer(n.Data) = Integer(Data) then
    p := n;

  for i := 0 to XMLItem.SubItemCount -1 do
    if p = nil then
      p := DrawXMLItem(XMLItem.SubItems[i], n, Data)
    else
      DrawXMLItem(XMLItem.SubItems[i], n, Data);

  if p <> nil then
    Result := p;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  HistoryList := TStringList.Create;
  XML.CrLfInAsString := btnCrLf.Down;
  FileName := '';
  XML.Clear;
  if FileExists(ParamStr(1)) then
    begin
      FileName := ParamStr(1);
      XML.LoadFromFile(FileName);
    end;
  DrawXML;
end;

procedure TfrmMain.tvXMLChange(Sender: TObject; Node: TTreeNode);
var
  xmlItem : TXMLItem;
begin
  DoChangeEvents := false;
  try
    btnNewNode.Enabled := Assigned(Node);
    btnDeleteNode.Enabled := Assigned(Node) and (Node.Level > 0);
    edItemTitle.ReadOnly := not Assigned(Node);
    edItemValue.ReadOnly := not Assigned(Node);
    btnNewProperty.Enabled := Assigned(Node);
    btnDeleteProperty.Enabled := false;
    btnMoveDown.Enabled := btnDeleteNode.Enabled;
    btnMoveUp.Enabled   := btnDeleteNode.Enabled;

    if Assigned(Node) then
      begin
        xmlItem := Node.Data;
        edItemTitle.Text := xmlItem.Name;
        edItemValue.Text := xmlItem.Text;
        lbItemParamaters.Items.Assign(xmlItem.Params);
      end;
  finally
    DoChangeEvents := true;
  end;
end;

procedure TfrmMain.XMLLoaded(Sender: TObject);
begin
  if Trim(FileName) = '' then
    sbXML.SimpleText := 'Viewing file: [NONE]'
  else
    sbXML.SimpleText := 'Viewing file: ' + FileName;

  edXSLStyleSheet.Text := XML.StyleSheet;
  Modified := false;
  DrawXML;
end;

procedure TfrmMain.XMLXMLItemChanged(Sender: TECXMLParser;
  XMLItem: TXMLItem);
begin
  Modified := true;
  DrawXML;
end;

procedure TfrmMain.btnNewNodeClick(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  xmlItem := nil;
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    xmlItem := xmlItem.New;
    Modified := true;
  finally
    DoChangeEvents := true;
    DrawXML(xmlItem);
  end;
end;

procedure TfrmMain.btnDeleteNodeClick(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  xmlItem := tvXML.Selected.Data;
  xmlItem.Parent.Delete(xmlItem.Parent.IndexOf(xmlItem));
  Modified := true;
end;

procedure TfrmMain.edItemTitleChange(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    xmlItem.Name := edItemTitle.Text;
    tvXML.Selected.Text := edItemTitle.Text;
    Modified := true;
  finally
    DoChangeEvents := true;
  end;
end;

procedure TfrmMain.SetDoChangeEvents(const Value: Boolean);
begin
  FDoChangeEvents := Value;
  if Value then
    begin
      edItemTitle.OnChange := edItemTitleChange;
      edItemValue.OnChange := edItemValueChange;
      XML.XMLItemChanged := XMLXMLItemChanged;
    end
  else
    begin
      edItemTitle.OnChange := nil;
      edItemValue.OnChange := nil;
      XML.XMLItemChanged := nil;
    end;
end;

procedure TfrmMain.edItemValueChange(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    xmlItem.Text := edItemValue.Text;
    Modified := true;
  finally
    DoChangeEvents := true;
  end;
end;

procedure TfrmMain.edItemTitleKeyPress(Sender: TObject; var Key: Char);
begin
  if key in ['<', '>', '&', ';'] then
    key := #0;
  if key = #32 then
    key := '_';
end;

procedure TfrmMain.lbItemParamatersClick(Sender: TObject);
begin
  btnDeleteProperty.Enabled := lbItemParamaters.ItemIndex > -1;
end;

procedure TfrmMain.btnNewPropertyClick(Sender: TObject);
var
  pName,
  pVal : String;
  xmlItem : TXMLItem;
begin
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    pName := '';
    pVal  := '';
    if NewEditParam(pName, pVal) then
      begin
        xmlItem.Params.Values[pName] := pVal;
        lbItemParamaters.Items.Assign(xmlItem.Params);
        lbItemParamaters.ItemIndex := lbItemParamaters.Items.IndexOfName(pName);
        Modified := true;
      end;
    lbItemParamatersClick(lbItemParamaters);
  finally
    DoChangeEvents := true;
  end;
end;

procedure TfrmMain.lbItemParamatersDblClick(Sender: TObject);
var
  pName,
  pVal : String;
  xmlItem : TXMLItem;
begin
  if lbItemParamaters.ItemIndex = -1 then
    exit;
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    pName := xmlItem.Params.Names[lbItemParamaters.ItemIndex];
    pVal  := xmlItem.Params.Values[pName];
    if NewEditParam(pName, pVal) then
      begin
        xmlItem.Params.Values[pName]:= pVal;
        lbItemParamaters.Items.Assign(xmlItem.Params);
        lbItemParamaters.ItemIndex := lbItemParamaters.Items.IndexOfName(pName);
      end;
  finally
    DoChangeEvents := true;
  end;
end;

procedure TfrmMain.btnDeletePropertyClick(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  if lbItemParamaters.ItemIndex = -1 then
    exit;
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    xmlItem.Params.Delete(lbItemParamaters.ItemIndex);
    lbItemParamaters.Items.Assign(xmlItem.Params);
    lbItemParamatersClick(lbItemParamaters);
    Modified := true;
  finally
    DoChangeEvents := true;
  end;
end;

procedure TfrmMain.edXSLStyleSheetChange(Sender: TObject);
begin
  XML.StyleSheet := edXSLStyleSheet.Text;
  Modified := true;
end;

procedure TfrmMain.btnMoveUpClick(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    if xmlItem.Parent.IndexOf(XMLItem) > 0 then
      xmlItem.Parent.Move(XMLItem, xmlItem.Parent.IndexOf(XMLItem) -1);
    DrawXML;
    Modified := true;
  finally
    DoChangeEvents := true;
  end;
end;

procedure TfrmMain.btnMoveDownClick(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    if xmlItem.Parent.IndexOf(XMLItem) < xmlItem.Parent.Count -1 then
      xmlItem.Parent.Move(XMLItem, xmlItem.Parent.IndexOf(XMLItem) +1);
    DrawXML;
    Modified := true;
  finally
    DoChangeEvents := true;
  end;
end;

procedure OpenURL(Url: string);
var
  ts: string;
begin
  with TRegistry.Create do
    try
      rootkey := HKEY_CLASSES_ROOT;
      OpenKey('\htmlfile\shell\open\command', False);
      try
        ts := ReadString('');
      except
        ts := '';
      end;
      CloseKey;
    finally
      Free;
    end;
  if ts = '' then Exit;
  // remove quotes and commandline parameters
  ts := Copy(ts, Pos('"', ts) + 1, Length(ts));
  ts := Copy(ts, 1, Pos('"', ts) - 1);
  ShellExecute(0, 'open', PChar(ts), PChar(url), nil, SW_SHOW); 
end; 

procedure TfrmMain.SetFileName(const Value: String);
var
  i : Integer;
begin
  FFileName := Value;
  btnPreview.Enabled := Trim(Value) <> '';
  if Value <> '' then
    begin
      i := HistoryList.IndexOf(Value);
      if i = -1 then
        begin
          i := HistoryList.Add(Value);
          HistoryList.Move(i, 0);
        end
      else
        begin
          HistoryList.Move(i, 0);
        end;
      if HistoryList.Count > Max_History_Items then
        while HistoryList.Count > Max_History_Items do
          HistoryList.Delete(HistoryList.Count -1);
      PopulateHistoryMenu;
    end;
end;

procedure TfrmMain.NewElement1Click(Sender: TObject);
begin
  btnNewNode.Click;
end;

procedure TfrmMain.DeleteElement1Click(Sender: TObject);
begin
  btnDeleteNode.Click;
end;

procedure TfrmMain.puXMLTreePopup(Sender: TObject);
begin
  NewElement1.Enabled := btnNewNode.Enabled;
  DeleteElement1.Enabled := btnDeleteNode.Enabled;
  PasteElementBelow1.Enabled := Clipboard.HasFormat(CF_TEXT);
  PasteOverElement1.Enabled := Clipboard.HasFormat(CF_TEXT);
end;

procedure TfrmMain.CopyElement1Click(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  if Assigned(tvXML.Selected) then
    begin
      xmlItem := tvXML.Selected.Data;
      Clipboard.AsText := xmlItem.AsString;
    end;
end;

procedure TfrmMain.PasteElementBelow1Click(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  xmlItem := nil;
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    xmlItem := xmlItem.New;
    xmlItem.AsString := Clipboard.AsText;
    Modified := true;
  finally
    DoChangeEvents := true;
    DrawXML(xmlItem);
  end;
end;

procedure TfrmMain.actOpenExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      FileName := OpenDialog1.FileName;
      XMLGhost.LoadFromFile(FileName);
    end;
end;

procedure TfrmMain.actNewExecute(Sender: TObject);
begin
  FileName := '';
  XMLGhost.Clear;
  Modified := false;
end;

procedure TfrmMain.actSaveExecute(Sender: TObject);
var
  ext : String;
begin
  SaveDialog1.FileName := FileName;

  if FileName <> '' then
    begin
      ext := UpperCase(ExtractFileExt(FileName));
      SaveDialog1.FilterIndex := 1;
      if ext = '.XSLT' then
        SaveDialog1.FilterIndex := 2;
      if ext = '.XSL' then
        SaveDialog1.FilterIndex := 2;
    end;

  if SaveDialog1.Execute then
    begin
      FileName := SaveDialog1.FileName;
      XML.CrLfInAsString := true;
      XMLGhost.SaveToFile(FileName);
      XML.CrLfInAsString := btnCrLf.Down;
    end;
end;

procedure TfrmMain.actPreviewExecute(Sender: TObject);
begin
  OpenURL(FileName);
end;

procedure TfrmMain.lbItemParamatersKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
    lbItemParamatersDblClick(Sender);
end;

procedure TfrmMain.btnCrLfClick(Sender: TObject);
begin
  XML.CrLfInAsString := btnCrLf.Down;
end;

procedure TfrmMain.PasteOverElement1Click(Sender: TObject);
var
  xmlItem : TXMLItem;
begin
  xmlItem := nil;
  DoChangeEvents := false;
  try
    xmlItem := tvXML.Selected.Data;
    xmlItem.AsString := Clipboard.AsText;
    Modified := true;
  finally
    DoChangeEvents := true;
    DrawXML(xmlItem);
  end;
end;

procedure TfrmMain.SetModified(const Value: Boolean);
begin
  btnSave.Enabled := Value;
  FModified := Value;
end;

procedure TfrmMain.LoadIniSettings;
var
  i : Integer;
begin
  Ini.ReadSection('HISTORY', HistoryList);
  HistoryList.Sort;
  for i := 0 to HistoryList.Count -1 do
    HistoryList[i] := Ini.ReadString('HISTORY', 'File' + IntToStr(i), HistoryList.Values[HistoryList.Names[i]]);
  i := 0;
  while i < HistoryList.Count do
    begin
      if trim(HistoryList[i]) = '' then
        HistoryList.Delete(i)
      else
        inc(i);
    end;
  PopulateHistoryMenu;
end;

procedure TfrmMain.SaveIniSettings;
var
  i : Integer;
begin
  Ini.WriteInteger('POSITION', 'Top', Top);
  Ini.WriteInteger('POSITION', 'Left', Left);
  Ini.WriteInteger('POSITION', 'Height', Height);
  Ini.WriteInteger('POSITION', 'Width', Width);
  for i := 0 to HistoryList.Count -1 do
    Ini.WriteString('HISTORY', 'File' + IntToStr(i), HistoryList[i]);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  SaveIniSettings;
  HistoryList.Free;
end;

procedure TfrmMain.PopulateHistoryMenu;
var
  mnu : TMenuItem;
  i   : Integer;
begin
  if HistoryList.Count > 0 then
    begin
      btnOpen.Style := tbsDropDown;
      dmOpenHistory.Items.Clear;
      for i := 0 to HistoryList.Count -1 do
        begin
          mnu := TMenuItem.Create(Self);
          mnu.Caption := HistoryList[i];
          mnu.OnClick := HistoryItemClick;
          dmOpenHistory.Items.Add(mnu);
        end;
      btnOpen.DropdownMenu := dmOpenHistory;
    end
  else
    begin
      btnOpen.Style := tbsButton;
      btnOpen.DropdownMenu := nil;
    end;
end;

procedure TfrmMain.HistoryItemClick(Sender: TObject);
begin
  FileName := StringReplace((Sender as TMenuItem).Caption, '&', '', []);
  XMLGhost.LoadFromFile(FileName);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  LoadIniSettings;
end;

initialization
  Ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));

finalization
  Ini.Free;

end.
