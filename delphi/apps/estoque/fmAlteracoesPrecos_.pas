unit fmAlteracoesPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, ComCtrls, Buttons, ToolWin, ExtCtrls, dmAlteracoesPrecos,
  Grids, {FxGrid, FxPivSrc,} ActnList, ImgList, ValEdit, StdCtrls, CheckLst,
  {fxmap, FxGraph, FxCommon, FxDimPager, FxHtml,} ShellAPI, MXGRID;

type
  TfrmAlteracoesPrecos = class(TfrmAjudaBt, IFxProgress)
    panBar: TPanel;
    lbDims: TCheckListBox;
    vlProps: TValueListEditor;
    tbDims: TToolBar;
    btnUpdateMap: TToolButton;
    ImageList: TImageList;
    ActionList: TActionList;
    actActive: TAction;
    actChartDlg: TAction;
    actSparceCols: TAction;
    actSparseRows: TAction;
    actExportHtml: TAction;
    actMemoryUsage: TAction;
    actUpdateMap: TAction;
    PageControl: TPageControl;
    tabGrid: TTabSheet;
    DecisionGrid: TDecisionGrid;
    tabChart: TTabSheet;
    StatusBar: TStatusBar;
    ToolBar1: TToolBar;
    btnOpen: TToolButton;
    btnDiv1: TToolButton;
    btnBar: TToolButton;
    ToolButton1: TToolButton;
    btnDiv2: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    btnGrid: TToolButton;
    btnChart: TToolButton;
    btnHtml: TToolButton;
    ToolButton5: TToolButton;
    cbBin: TComboBox;
    procedure actUpdateMapExecute(Sender: TObject);
    procedure lbDimsClickCheck(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure btnOpenClick(Sender: TObject);
    procedure btnBarClick(Sender: TObject);
    procedure actChartDlgExecute(Sender: TObject);
    procedure actMemoryUsageExecute(Sender: TObject);
    procedure actExportHtmlExecute(Sender: TObject);
    procedure actExportHtmlUpdate(Sender: TObject);
    procedure actSparseRowsExecute(Sender: TObject);
    procedure actSparceColsExecute(Sender: TObject);
    procedure actChartDlgUpdate(Sender: TObject);
    procedure actActiveExecute(Sender: TObject);
    procedure cbBinSelect(Sender: TObject);
  private
    { Private declarations }
    FActiveDim:TFxMapItem;
    FCancel:Boolean;
    FCancelBtn:TSpeedButton;
    FProgressBar:TProgressBar;
    FBlock:Boolean;
    FFixedRows:Integer;
    FChart:TFxChart;
    function GetCancel:Boolean;
    procedure CancelClick(Sender:TObject);
    procedure FinishProgress;
    procedure StartProgress(Max:Integer);
    procedure SetActiveDim(const Value: TFxMapItem);
    procedure SetText(const Value:WideString);
    procedure UpdateProgress;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property ActiveDim:TFxMapItem read FActiveDim write SetActiveDim;
    
  end;

var
  frmAlteracoesPrecos: TfrmAlteracoesPrecos;

implementation

{$R *.dfm}

uses StrUtils, ChartDlg;

const
  SAlignment:array [0..2] of string=('Left','Right','Center');

function SafeInt(const Str:string; Default:Integer=10):Integer;
begin
  if Str='' then
    Result:=Default
  else
    try
      Result:=StrToInt(Str);
    except
      Result:=Default;
    end;
end;

procedure AddCombo(Prop:TItemProp; const S:array of string);
var
  I:Integer;
begin
  Prop.EditStyle:=esPickList;
  for I:=0 to High(S)do
    Prop.PickList.Add(S[I]);
end;


{ TfrmAlteracoesPrecos }

constructor TfrmAlteracoesPrecos.Create(AOwner: TComponent);
var
  I:Integer;

begin
  inherited;
  dtmAlteracoesPrecos := TdtmAlteracoesPrecos.Create(Self);

  dtmAlteracoesPrecos.qryAlteracoesPrecos.open;
  dtmAlteracoesPrecos.FxCube1.active := true;

  // you can uncomment this and line in destructor TDecisionChart.Destroy
  // then you can save runtime settings for TDecisionChart;
  {
  if FileExists('chart.dat')then
    try
      FChart:=ReadComponentResFile('chart.dat',nil) as TDecisionChart;
      //Memo.Lines.Text :=ComponentToString(Chart);
    except
      FChart:=nil;
      DeleteFile('chart.dat');
    end;
  }
  if FChart=nil then
    FChart:=TFxChart.Create(tabChart);

  with FChart do
  begin
    Align:=alClient;
    Parent:=tabChart;
    FxProgress:=Self;
  end;
  FProgressBar:=TProgressBar.Create(StatusBar);
  with FProgressBar do begin
    Parent:=StatusBar;
    Min:=0;
    Step:=1;
    Smooth:=True;
  end;
  FCancelBtn:=TSpeedButton.Create(StatusBar);
  with FCancelBtn do begin
    Parent:=StatusBar;
    Caption:='Cancel';
    Flat:=True;
    Visible:=False;
    OnClick:=CancelClick;
  end;
  // Init controls
  cbBin.ItemIndex:=Ord(dtmAlteracoesPrecos.FxCube1.DimensionMap[0].BinType);
  with dtmAlteracoesPrecos.FxCube1 do
  begin
    DimensionMap.GetDimList(lbDims.Items);
    for I:=0 to lbDims.Count-1 do
      lbDims.Items[i] := DimensionMap.Items[i].Caption;

    for I:=0 to lbDims.Count-1 do
      lbDims.Checked[I]:=DimensionMap[I].ActiveFlag<>diInactive;
  end;

  for I:=0 to lbDims.Count-1 do
    lbDims.Checked[I]:=(lbDims.Items.Objects[I]as TFxMapItem).ActiveFlag<>diInactive;

  FFixedRows:=0;
  if doColumnTitles in vlPRops.DisplayOptions then
    Inc(FFixedRows);

  vlProps.ItemProps[0].EditStyle:=esPickList;
//  dtmAlteracoesPrecos.FxCube1.DimensionMap.GetDimList(vlProps.ItemProps[0].PickList);

  for I:=0 to lbDims.Count-1 do
    vlProps.ItemProps[0].PickList.Add(lbDims.Items[i]);

  AddCombo(vlProps.ItemProps[1],SAlignment);


end;

destructor TfrmAlteracoesPrecos.Destroy;
begin

  inherited;
end;

procedure TfrmAlteracoesPrecos.actUpdateMapExecute(Sender: TObject);
begin
  inherited;
  case (Sender as TAction).Checked of
  False: dtmAlteracoesPrecos.FxCube1.DimensionMap.EndUpdate;
  True : dtmAlteracoesPrecos.FxCube1.DimensionMap.BeginUpdate;
  end;

end;

procedure TfrmAlteracoesPrecos.lbDimsClickCheck(Sender: TObject);
var
  MapItem:TDimensionItem;
begin
  inherited;
  with dtmAlteracoesPrecos.FxCube1,Sender as TCheckListBox do
  begin
    MapItem:=DimensionMap.Find(Items[ItemIndex]);
//    if MapItem=nil then Exit;
    if Checked[ItemIndex]then
      MapItem.ActiveFlag:=diAsNeeded
    else
      MapItem.ActiveFlag:=diInactive;
  end;

end;

function TfrmAlteracoesPrecos.GetCancel: Boolean;
begin
  Result:=FCancel;
end;

procedure TfrmAlteracoesPrecos.SetText(const Value: WideString);
begin
  StatusBar.Panels[0].Text:=Value;
  Application.ProcessMessages;

end;

procedure TfrmAlteracoesPrecos.CancelClick(Sender: TObject);
begin
  FCancel:=True;
end;

procedure TfrmAlteracoesPrecos.FinishProgress;
begin
  FProgressBar.Position:=0;
  FCancelBtn.Visible:=False;
  SetText('');
  btnGrid.Enabled:=True;

end;

procedure TfrmAlteracoesPrecos.SetActiveDim(const Value: TFxMapItem);
begin
  if Value<>FActiveDim then
  begin
    FActiveDim := Value;
    with vlProps do begin
      FBlock:=True;
      try
        if ActiveDim<>nil then begin
          Values['Alignment']:=SAlignment[Ord(FActiveDim.Alignment)];
          Values['Format'   ]:=FActiveDim.Format;
          Values['Width'    ]:=IntToStr(FActiveDim.Width);
          Values['Caption'  ]:=FActiveDim.Caption;
        end;
      finally
        FBlock:=False;
      end;
    end;
  end;

end;

procedure TfrmAlteracoesPrecos.StartProgress(Max: Integer);
begin
  btnGrid.Enabled:=False;
  FProgressBar.Max:=Max;
  FProgressBar.Position:=0;
  FCancel:=False;
  FCancelBtn.Visible:=True;

end;

procedure TfrmAlteracoesPrecos.UpdateProgress;
begin
  FProgressBar.StepIt;
  Application.ProcessMessages;

end;

procedure TfrmAlteracoesPrecos.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  inherited;
  if Panel.Index=1 then
    FProgressBar.BoundsRect:=Rect
  else if Panel.Index=2 then
    FCancelBtn.BoundsRect:=Rect;

end;

procedure TfrmAlteracoesPrecos.btnOpenClick(Sender: TObject);
begin
  inherited;
  with Sender as TAction,dtmAlteracoesPrecos.FxCube1 do begin
    Active:=not Checked;
    Checked:=Active;
    ImageIndex:=Ord(Checked);
  end;

end;

procedure TfrmAlteracoesPrecos.btnBarClick(Sender: TObject);
begin
  inherited;
  with Sender as TToolButton do
    panBar.Visible:=Down;

end;

procedure TfrmAlteracoesPrecos.actChartDlgExecute(Sender: TObject);
begin
  inherited;
  dlgChartOpt.Execute(FChart);

end;

procedure TfrmAlteracoesPrecos.actMemoryUsageExecute(Sender: TObject);
var
  I:Integer;
begin
  I:=dtmAlteracoesPrecos.FxCube1.DataCache.GetMemoryUsage;
  MessageDlg(IntToStr(I div 1024)+'kb',mtInformation,[mbOk],0);
end;

procedure TfrmAlteracoesPrecos.actExportHtmlExecute(Sender: TObject);
var
  S:TStringStream;
  F:TFileStream;
begin
  S:=TStringStream.Create(FxHtml.PageContent);
  try
    F:=TFileStream.Create('demo.html',fmCreate);
    try
      F.CopyFrom(S,0);
    finally
      F.Free;
    end;
  finally
    S.Free;
  end;
  ShellExecute(0, nil, PChar('demo.html'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmAlteracoesPrecos.actExportHtmlUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled:= Assigned(dtmAlteracoesPrecos.FxSource1) and dtmAlteracoesPrecos.FxSource1.Ready;

end;

procedure TfrmAlteracoesPrecos.actSparseRowsExecute(Sender: TObject);
begin
  inherited;
  with Sender as TAction do
    dtmAlteracoesPrecos.FxSource1.SparseRows:=Checked;

end;

procedure TfrmAlteracoesPrecos.actSparceColsExecute(Sender: TObject);
begin
  with Sender as TAction do
   dtmAlteracoesPrecos.FxSource1.SparseCols:=Checked;

end;

procedure TfrmAlteracoesPrecos.actChartDlgUpdate(Sender: TObject);
begin
  inherited;
  with Sender as TAction do
    Enabled:= PageControl.ActivePage=tabChart;

end;

procedure TfrmAlteracoesPrecos.actActiveExecute(Sender: TObject);
begin
  inherited;
  with Sender as TAction,dtmAlteracoesPrecos.FxCube1 do begin
    Active:=not Checked;
    Checked:=Active;
    ImageIndex:=Ord(Checked);
  end;

end;

procedure TfrmAlteracoesPrecos.cbBinSelect(Sender: TObject);
begin
  inherited;
  dtmAlteracoesPrecos.FxCube1.DimensionMap[0].BinType:=TBinType(cbBin.ItemIndex);
end;

end.
