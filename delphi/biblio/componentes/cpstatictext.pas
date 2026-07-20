unit cpstatictext;

interface

uses
  Classes, Controls, ExtCtrls, Graphics, DBCtrls, {Qete,} DB;

type
  TtecDBStaticText = class(TCustomControl)
  private
    FDataLink: TFieldDataLink;
    FBorderStyle: TBevelCut;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetFieldText: string;
    procedure DataChange(Sender: TObject);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetBorderStyle(const Value: TBevelCut);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property BorderStyle: TBevelCut read FBorderStyle write SetBorderStyle default bvLowered;
  end;

implementation

Uses
  //CLX
  Types;

{ TtecStaticText }

constructor TtecDBStaticText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height := 23;
  FBorderStyle := bvLowered;
  FDataLink := TFieldDataLink.Create;
  FDataLink.OnDataChange := DataChange;
end;

destructor TtecDBStaticText.Destroy;
begin
  inherited;
  FDataLink.Free;
end;

procedure TtecDBStaticText.DataChange(Sender: TObject);
begin
  Caption := GetFieldText;
end;

function TtecDBStaticText.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TtecDBStaticText.GetDataSource: TDataSource;
begin
  if(Assigned(FDataLink.DataSource)) then
	Result := FDataLink.DataSource
  else
    Result:=nil;

end;

procedure TtecDBStaticText.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TtecDBStaticText.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TtecDBStaticText.SetBorderStyle(const Value: TBevelCut);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    Invalidate;
  end;
end;

function TtecDBStaticText.GetFieldText: string;
begin
  if FDataLink.Field <> nil then
    Result := FDataLink.Field.DisplayText
  else
    if csDesigning in ComponentState then Result := Name else Result := '';
end;

procedure TtecDBStaticText.Paint;
var
  Rect: TRect;
begin
  Rect := GetClientRect;
  with Canvas do
  begin
    case FBorderStyle of
      bvLowered: Frame3D(Canvas, Rect, clBtnShadow, clBtnHighlight, 2);
      bvRaised : Frame3D(Canvas, Rect, clBtnHighlight, clBtnShadow, 2);
    end;
    Pen.Color := clWindowText;
    {CLX_TO_VCL
    if FBorderStyle <> bvNone then
      TextRect(ClientRect, 2, 0, Caption, Integer(AlignmentFlags_ExpandTabs)   or
                                          Integer(AlignmentFlags_AlignVCenter) or
                                          Integer(AlignmentFlags_AlignLeft))
    else
      TextRect(ClientRect, 0, 0, Caption, Integer(AlignmentFlags_ExpandTabs)   or
                                          Integer(AlignmentFlags_AlignVCenter) or
                                          Integer(AlignmentFlags_AlignLeft));
    }                                          
  end;
end;

end.
