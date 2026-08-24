unit DataSetList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, dbtables;

type
  TDataSetEntry = class(TCollectionItem)
  private
    FSelected : Boolean;
    FTable : TDataSet;
  protected
    function GetSelected : Boolean;
    procedure SetSelected(what: Boolean);
    function GetTable : TDataSet;
    procedure SetTable(tbl: TDataSet);
  public
    constructor Create(Collection: TCollection); override;
  published
    property Selected: Boolean read GetSelected write SetSelected;
    property Table: TDataSet read GetTable write SetTable;
  end;

  TDataSetEntryProc=procedure(var T : TDataSetEntry);

  TDataSetEntries = class(TCollection)
  private
      FOwner: TComponent;
   protected
      function GetOwner: TPersistent; override;
   public
      function Add: TDataSetEntry;
      function Insert( Index: Integer): TDataSetEntry;
      function FindItemID( ID: Integer): TDataSetEntry;
      function GetItem( Index: Integer): TDataSetEntry;
      procedure SetItem( Index: Integer; src: TDataSetEntry);
      constructor Create( Owner: TComponent);
      destructor Destroy; override;
      property Items[ Index: Integer]: TDataSetEntry read GetItem write SetItem;
 end;

  TDataSetList = class(TComponent)
  private
    { Private Declarations }
    FItems : TDataSetEntries;
    FUseSubset: Boolean;
  protected
    { Protected Declarations }
    procedure Loaded; override;
  public
    { Public Declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearFields;
    procedure Close;
    procedure DisableControls;
    procedure Edit;
    procedure EnableControls;
    procedure First;
    procedure Last;
    procedure MoveBy(Distance: Integer);
    procedure Next;
    procedure Open;
    procedure Post;
    procedure Prior;
    procedure Refresh;
  published
    { Published Declarations }
    property Items : TDataSetEntries read FItems write FItems;
    property UseSubset : Boolean read FUseSubset write FUseSubset;

  end;

procedure Register;

implementation

{ TRegEntries }

function TDataSetEntries.Add: TDataSetEntry;
begin
   Result := TDataSetEntry( inherited Add);
end;

constructor TDataSetEntries.Create(Owner: TComponent);
begin
   inherited Create(TDataSetEntry);
   FOwner := Owner;
end;

destructor TDataSetEntries.Destroy;
begin
   FOwner := nil;
   inherited Destroy;
end;

function TDataSetEntries.FindItemID(ID: Integer): TDataSetEntry;
begin
   Result := TDataSetEntry( inherited FindItemID( ID));
end;

function TDataSetEntries.GetItem(Index: Integer): TDataSetEntry;
begin
   Result := TDataSetEntry( inherited GetItem( Index));
end;

function TDataSetEntries.GetOwner: TPersistent;
begin
   Result := FOwner;
end;

function TDataSetEntries.Insert(Index: Integer): TDataSetEntry;
begin
   Result := TDataSetEntry( inherited Insert( Index));
end;

procedure TDataSetEntries.SetItem(Index: Integer; src: TDataSetEntry);
begin
   inherited SetItem( Index, src);
end;

constructor TDataSetEntry.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FSelected := False;
end;

function TDataSetEntry.GetSelected : Boolean;
begin
  Result := FSelected;
end;

procedure TDataSetEntry.SetSelected(what: Boolean);
begin
  FSelected := what;
end;

function TDataSetEntry.GetTable : TDataSet;
begin
  Result := FTable;
end;

procedure TDataSetEntry.SetTable(tbl: TDataSet);
begin
  FTable := tbl;
end;

procedure TDataSetList.Loaded;
begin
  inherited Loaded;
  {component specific initialization code, etc.}
end;{Loaded}

constructor TDataSetList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  {Add any other initialization code here}
  FItems := TDataSetEntries.Create(Self);
end;{Create}

destructor TDataSetList.Destroy;
begin
  FItems.Free;
  {Add any cleanup code here}
  inherited Destroy;
end;{Destroy}

procedure TDataSetList.ClearFields;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.ClearFields;
   end;
end;

procedure TDataSetList.Close;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.Close;
   end;
end;

procedure TDataSetList.DisableControls;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.DisableControls;
   end;
end;

procedure TDataSetList.EnableControls;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.EnableControls;
   end;
end;

procedure TDataSetList.Edit;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.Edit;
   end;
end;

procedure TDataSetList.First;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.First;
   end;
end;

procedure TDataSetList.Last;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.Last;
   end;
end;

procedure TDataSetList.MoveBy(Distance:Integer);
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.MoveBy(Distance);
   end;
end;

procedure TDataSetList.Next;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.Next;
   end;
end;

procedure TDataSetList.Open;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.Open;
   end;
end;

procedure TDataSetList.Post;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.Post;
   end;
end;

procedure TDataSetList.Prior;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.Prior;
   end;
end;

procedure TDataSetList.Refresh;
var i : Integer;
begin
   for i := 0 to FItems.Count - 1 do
   begin
     if ((FUseSubset and FItems.Items[i].FSelected) or (not FUseSubset)) then
        FItems.Items[i].FTable.Refresh;
   end;
end;
procedure Register;
begin
  {Register component and add to Samples page in VCL}
  RegisterComponents('Samples', [TDataSetList]);
end;{Register}


end.
