{ ************************************************************************* }
{                                                                           }
{ Delphi and Kylix Cross-Platform Visual Component Library                  }
{                                                                           }
{ Calendar and clendar combo box components                                 }
{                                                                           }
{ This file may be distributed and/or modified under the terms of the GNU   }
{ General Public License (GPL) version 2 as published by the Free Software  }
{ Foundation.                                                               }
{                                                                           }
{ This file has no warranty and is used at the users own peril              }
{                                                                           }
{ Please report any bugs to jplevene@netscape.net or contact me if you want }
{ to contribute to this component.  It will be deemed a breach of copywrite }
{ if you publish any source code herein under your own name without the     }
{ authors consent!!!!!                                                      }
{                                                                           }
{ Designers:- Justin Levene (jplevene@netscape.net)                         }
{ Contribution:- Andre Valadas (andrevaladas@superig.com.br)
{ ************************************************************************* }

{
TMonthCalendar:-
A calendar component that enables mouse selection of a date.  Resembles the
Linux Calendar component with enhancements.  Uses current system colours.

Date = READ/WRITE date in calendar
ShowToday = READ/WRITE show today at bottom as quick click

OnBoldDays : BoldDays is an array[1..31] of Boolean.  Setting an array item
             to TRUE makes the corresponding day bold.  Date corresponds to a
             date in the new month.  To get the start of the month call
             StartOfTheMonth(Date) and EndOfTheMonth(Date) to get 23.59:59 of
             the last day in the shown month.

OnDateChange : Called when a new date in the calendar is made manually or
               automatically.  Call Date to get the new date the calendar has
               been set to.  THIS IS NOT NECESSARILLY THE USER'S CHOSEN DATE!!!

OnDateSelect : Notifies when the user manually clicks the mouse on a day in the
               Calendar and has SELECTED a date.

OnMonthChange : Called when the month is changed.  Date is a date within the
                newly selected month thus StartOfTheMonth(Date) is the first
                second of the new month.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
KNOWN ISSUES / BUGS :-

1) On designing scroll bars appear in the fStringGrid but do not appear on
   running the application, posible CLX bug outside this component.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BUG FIXES :-

4th Sep 03   Fixed the double line when selecting 1st of month when 1st of month
             is the first day of the week.  Fixed the FirstDayOfWeek in Combo.
             Did a few code enhancements.

25th Aug 03  New variable added, TMonthCalendarCombo2.DateInCalendar to establish
             date in the calendar for bolding dates.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}

unit QMonthCalendar;

interface

uses
  SysUtils, Classes, Variants, Types, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls, Buttons, {Qete,} DBCtrls, Mask, windows;

type
  TBoldDays = ARRAY[1..31] OF BOOLEAN;
  TDaysToBoldEvent = procedure(Sender: TObject; mStart, mEnd, mFeriado : TDateTime;
                               var SituacaoFeriado: boolean; Setar: Boolean;
                               var BoldDays: TBoldDays) of object;

  TCalDayOfWeek = (dowSunday, dowMonday, dowTuesday, dowWednesday, dowThursday,
                   dowFriday, dowSaturday);

  { TMonthCalendar }
  TMonthCalendar2 = class(TWinControl)
  private
    { Controls }
    fStringGrid : TStringGrid;  { Calendar grid }
    fTopPanel : TPanel;         { Top panel contains month, year & buttons }
    fBottomPanel : TPanel;      { Bottom panel holds TodayText and circle }
    fMonthText : TLabel;        { Month label }
    fYearText : TLabel;         { Year label }
    fMonthDownBtn : TSpeedButton;  { Buttons... }
    fMonthUpBtn : TSpeedButton;
    fYearDownBtn : TSpeedButton;
    fYearUpBtn : TSpeedButton;
    fTodayShape : TShape;        { Year circle }
    fTodayText : TLabel;         { Today's date text }
//    fFeriadoShape : TShape;
//    fFeriadoText : TLabel;         { Today's date text }
    { Component private variables }
    fDate : TDateTime;    { Date of Calendar }
    fDaysToBold : TBoldDays;  { Array of days in month to bold on calendar }
    fNoSelect : BOOLEAN;  { Flag while changing cells to stop indefinate cycle }
    fShowToday : BOOLEAN; { Flag whether to show date or not }
    fFirstDayOfWeek : TCalDayOfWeek;  { First day of the week }
    fFirstOffset : INTEGER;           { Column offset of 1st of month }
    { Events }
    fOnBoldDays : TDaysToBoldEvent;  { On Bold days external proc pointer }
    fOnDateChange : TNotifyEvent;    { On date chnaged notification }
    fOnDateSelect : TNotifyEvent;    { On date SELECTED notification }
    fOnMonthChange : TNotifyEvent;   { On month change notification }
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    function DateInCell(x , y : INTEGER) : TDateTime;
    procedure GotoDate(NewDate : TDateTime);
    procedure StringGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure MonthBtnClick(Sender: TObject);
    procedure YearBtnClick(Sender: TObject);
    procedure TodayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    procedure SetShowToday(Value : BOOLEAN);
    procedure SetFirstDayOfWeek(Value : TCalDayOfWeek);
    procedure StringGridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure StringGridDblClick(Sender: TObject);
    procedure FillTheGrid;
    procedure GetBolds(Todas: Boolean);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    procedure Repaint; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  published
    property Date : TDateTime read fDate write GotoDate;
    property FirstDayOfWeek : TCalDayOfWeek read fFirstDayOfWeek write SetFirstDayOfWeek
              default dowSunday;
    property ShowToday : BOOLEAN read fShowToday write SetShowToday;
    property OnBoldDays: TDaysToBoldEvent read fOnBoldDays write fOnBoldDays;
    property OnDateChange: TNotifyEvent read fOnDateChange write fOnDateChange;
    property OnDateSelect: TNotifyEvent read fOnDateSelect write fOnDateSelect;
    property OnMonthChange: TNotifyEvent read fOnMonthChange write fOnMonthChange;
    property Anchors;
{    property BorderStyle;}
    property DragMode;
    property Enabled;
    property Font;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property Left;
{    property LineWidth;}
    property Name;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Tag;
    property Top;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
{    property OnKeyString;}
    property OnMouseUp;
    property OnStartDrag;
  end;

  { TMonthCalendarCombo }
  TMonthCalendarCombo2 = class(TWinControl)
  private
    fButton: TSpeedButton;
    fEditorEnabled: Boolean;
    fOnDaysToBold : TDaysToBoldEvent;
    fDate : TDateTime;
    fDateFormat : STRING;
    fEdit : TMaskEdit;
    fOldEditValue : STRING;
    MyTempForm: TForm;                { popup form containing calendar }
    MyTempCalendar: TMonthCalendar2;   { calendar }
    fFirstDayOfWeek : TCalDayOfWeek;
    FOnKeyDown: TKeyEvent;
    procedure EditOnEnter(Sender: TObject);
    procedure EditOnExit(Sender: TObject);
    procedure DateSelected(Sender: TObject);
    procedure SetDateFormat(Value: STRING);
    procedure SetEditorEnabled(Value: BOOLEAN);
    procedure fOnResize(Sender: TObject);
    procedure SetFirstDayOfWeek(Value : TCalDayOfWeek);
  protected
    procedure DoOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DownClick(Sender: TObject); virtual;
    procedure SetDate(Value : TDateTime);
  public
    function DateInCalendar : TDateTime;  { Selected date in calendar }
    constructor Create(AOwner: TComponent); override;
  published
    property Date: TDateTime read fDate write SetDate;
    property DateFormat: STRING read fDateFormat write SetDateFormat;
    property EditorEnabled: Boolean read FEditorEnabled write SetEditorEnabled default True;
    property FirstDayOfWeek : TCalDayOfWeek read fFirstDayOfWeek write SetFirstDayOfWeek
                 default dowSunday;
    property OnBoldDays: TDaysToBoldEvent read fOnDaysToBold write fOnDaysToBold;
    property Anchors;
{    property BorderStyle;}
    property DragMode;
    property Enabled;
    property Font;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property Left;
{    property LineWidth;}
    property Name;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Tag;
    property Top;
    property Visible;
    property Width;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

procedure Register;

implementation

{$R *.res}

USES DateUtils, Dates;

{ TMonthCalendar }{ Create the component }
constructor TMonthCalendar2.Create(AOwner: TComponent);
begin
     { Call Inherited }
     INHERITED Create(AOwner);
     { Goto today as default }
     fFirstDayOfWeek := dowSunday;
     { Default enable tab stop }
     TabStop := True;
{     BorderStyle := bsRaisedPanel;}
     fShowToday := TRUE;
     { Set the size and size contraints }
     Width := 220;
     Height := 175;
     Constraints.MinWidth := 200;
     Constraints.MinHeight := 140;
     { Set flag to false }
     fNoSelect := FALSE;
     { Create fTopPanel }
     fTopPanel := TPanel.Create(Self);
     fTopPanel.Parent := Self;
     fTopPanel.Height := 25;
     fTopPanel.Align := alTop;
     fTopPanel.BevelOuter := bvLowered;
     fTopPanel.Color := clBtnFace;
     { Create fBottomPanel }
     fBottomPanel := TPanel.Create(Self);
     fBottomPanel.Parent := Self;
     fBottomPanel.Height := 27;
     fBottomPanel.Align := alBottom;
     fBottomPanel.BevelOuter := bvNone;
     fBottomPanel.Color := clWindow;
     { Setup the String Grid }
     fStringGrid := TStringGrid.Create(Self);
     fStringGrid.ScrollBars := ssNone;
     fStringGrid.Parent := Self;
     fStringGrid.FixedCols := 0;
     fStringGrid.FixedRows := 1;
     fStringGrid.ColCount := 7;
     fStringGrid.RowCount := 7;
     fStringGrid.ParentFont := TRUE;
     fStringGrid.GridLineWidth := 0;
     fStringGrid.Align := alClient;
     fStringGrid.BorderStyle := bsNone;
     fStringGrid.Options := [goDrawFocusSelected, goThumbTracking];
     fStringGrid.DefaultColWidth := fStringGrid.Width DIV 7;
     fStringGrid.DefaultRowHeight := fStringGrid.Height DIV 7;
     fStringGrid.DefaultDrawing := FALSE;
     fStringGrid.OnDrawCell := StringGridDrawCell;
     fStringGrid.OnSelectCell := StringGridSelectCell;
     fStringGrid.OnMouseUp := StringGridMouseUp;
     fStringGrid.OnKeyUp := StringGridKeyUp;
     fStringGrid.OnDblClick := StringGridDblClick;
     { Setup fShape (today elipse) }
     fTodayShape := TShape.Create(fBottomPanel);
     fTodayShape.Parent := fBottomPanel;
     fTodayShape.SetBounds(6, 1, 27, 19);
     fTodayShape.Shape := stEllipse;
     fTodayShape.Pen.Width := 2;
     fTodayShape.Pen.Color := clRed;
     fTodayShape.Hint := 'Data de hoje';
     fTodayShape.OnMouseDown := TodayMouseDown;
     { Setup fTodayText }
     fTodayText := TLabel.Create(fBottomPanel);
     fTodayText.Parent := fBottomPanel;
     fTodayText.Transparent := TRUE;
     fTodayText.SetBounds(38, 4, 64, 13);
     fTodayText.OnMouseDown := TodayMouseDown;
     fTodayText.Hint := 'Data de hoje';
{
     fFeriadoShape := TShape.Create(fBottomPanel);
     fFeriadoShape.Parent := fBottomPanel;
     fFeriadoShape.SetBounds(12, 5, 27, 19);
     fFeriadoShape.Shape := stRectangle;
     fFeriadoShape.Pen.Width := 2;
     fFeriadoShape.Pen.Color := clRed;
     fFeriadoShape.Hint := 'Feriados';
     fFeriadoShape.OnMouseDown := TodayMouseDown;
     fFeriadoText := TLabel.Create(fBottomPanel);
     fFeriadoText.Parent := fBottomPanel;
     fFeriadoText.Transparent := TRUE;
     fFeriadoText.SetBounds(50, 10, 64, 13);
     fFeriadoText.OnMouseDown := TodayMouseDown;
     fFeriadoText.Hint := 'Feriados';
 }
     { Setup fMonthText }
     fMonthText := TLabel.Create(fTopPanel);
     fMonthText.Parent := fTopPanel;
     fMonthText.Alignment := taCenter;
     fMonthText.AutoSize := FALSE;
     fMonthText.Hint := 'Mês';
     fMonthText.SetBounds(18, 6, 73, 13);
     { Setup fYearText }
     fYearText := TLabel.Create(fTopPanel);
     fYearText.Parent := fTopPanel;
     fYearText.Alignment := taCenter;
     fYearText.AutoSize := FALSE;
     fYearText.Hint := 'Ano';
     fYearText.SetBounds(fTopPanel.Width - 64, 6, 41, 13);
     fYearText.Anchors := [akTop, akRight];
     { Setup fMonthDownBtn }
     fMonthDownBtn := TSpeedButton.Create(fTopPanel);
     fMonthDownBtn.SetBounds(4, 3, 14, 19);
     fMonthDownBtn.Parent := fTopPanel;
     fMonthDownBtn.Tag := -1;   { Decrease by 1 month }
     fMonthDownBtn.Hint := 'Mês anterior';
     fMonthDownBtn.Glyph.LoadFromResourceName(HInstance, 'CALBUTTONLEFT');
     fMonthDownBtn.OnClick := MonthBtnClick;
     fMonthDownBtn.OnDblClick := MonthBtnClick;
     { Setup fMonthUpBtn }
     fMonthUpBtn := TSpeedButton.Create(fTopPanel);
     fMonthUpBtn.SetBounds(94, 3, 14, 19);
     fMonthUpBtn.Parent := fTopPanel;
     fMonthUpBtn.Tag := 1;      { Increase by 1 month }
     fMonthUpBtn.Hint := 'Próximo mês';
     fMonthUpBtn.Glyph.LoadFromResourceName(HInstance, 'CALBUTTONRIGHT');
     fMonthUpBtn.OnClick := MonthBtnClick;
     fMonthUpBtn.OnDblClick := MonthBtnClick;
     { Setup fYearDownBtn }
     fYearDownBtn := TSpeedButton.Create(fTopPanel);
     fYearDownBtn.SetBounds(fTopPanel.Width - 81, 3, 14, 19);
     fYearDownBtn.Parent := fTopPanel;
     fYearDownBtn.Tag := -1;     { Decrease by 1 year }
     fYearDownBtn.Hint := 'Ano anterior';
     fYearDownBtn.Glyph.LoadFromResourceName(HInstance, 'CALBUTTONLEFT');
     fYearDownBtn.OnClick := YearBtnClick;
     fYearDownBtn.OnDblClick := YearBtnClick;
     fYearDownBtn.Anchors := [akTop, akRight];
     { Setup fYearUpBtn }
     fYearUpBtn := TSpeedButton.Create(fTopPanel);
     fYearUpBtn.SetBounds(fTopPanel.Width - 20, 3, 14, 19);
     fYearUpBtn.Parent := fTopPanel;
     fYearUpBtn.Tag := 1;        { Increase by 1 year }
     fYearUpBtn.Hint := 'Próximo ano';
     fYearUpBtn.Glyph.LoadFromResourceName(HInstance, 'CALBUTTONRIGHT');
     fYearUpBtn.OnClick := YearBtnClick;
     fYearUpBtn.OnDblClick := YearBtnClick;
     fYearUpBtn.Anchors := [akTop, akRight];
     { Setup and draw }
     fDate := 0;  { Ensures grid redraw }
     GotoDate(SysUtils.Date);
//     GetBolds(true);
end;

procedure TMonthCalendar2.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
     INHERITED;

     IF fStringGrid <> NIL THEN
     BEGIN
          fStringGrid.DefaultColWidth := fStringGrid.Width DIV 7;
          fStringGrid.DefaultRowHeight := fStringGrid.Height DIV 7
     END;
     FillTheGrid

end;

{ Enable grid to be refreshed }
procedure TMonthCalendar2.Repaint;
begin
     INHERITED Repaint;
     FillTheGrid;
end;

procedure TMonthCalendar2.SetFirstDayOfWeek(Value : TCalDayOfWeek);
begin
     fFirstDayOfWeek := Value;
     { Now redraw }
     FillTheGrid;
     GotoDate(fDate);
end;

{ Show today or not }
procedure TMonthCalendar2.SetShowToday(Value : BOOLEAN);
begin
     fShowToday := Value;
     { Set the size and size contraints }
     fBottomPanel.Visible := fShowToday;
     { Can't hide panel while designing so shrink it's height }
     IF csDesigning	IN ComponentState THEN
     BEGIN
          IF fShowToday THEN
            fBottomPanel.Height := 21
          ELSE
            fBottomPanel.Height := 0
     END;
     SetBounds(Left, Top, Width, Height);
end;

{ Fills the dates in the grid, and draws month, year and today's date }
procedure TMonthCalendar2.FillTheGrid;
var Col, Row : BYTE;
    s : STRING;
begin
     IF NOT(Assigned(fStringGrid)) THEN EXIT;
     { Get the days to Bold }
     GetBolds(true);
     { Get the offset first }
     fFirstOffset := (DayOfWeek(StartOfTheMonth(fDate)) - 1) - Ord(fFirstDayOfWeek);
     IF fFirstOffSet < 0 THEN INC(fFirstOffSet, 7);
     { Now get strings for cells }
     FOR Row := 0 TO 7 DO
     BEGIN
          fStringGrid.Rows[Row].BeginUpdate;
          FOR Col := 0 TO 7 DO
          BEGIN
               { Get ShortDate if top row }
               IF Row = 0 THEN s := ShortDayNames[((Col + ORD(fFirstDayOfWeek)) MOD 7) + 1]
               { Else get date }
               ELSE  s := IntToStr(DayOf(DateInCell(Col, Row)));
               fStringGrid.Cells[Col, Row] := s;
          END;
          fStringGrid.Rows[Row].EndUpdate;
     END;
     { Draw the month and year }
     fMonthText.Caption := LongMonthNames[MonthOf(fDate)];
     fYearText.Caption := IntToStr(YearOf(fDate));
     { Just update incase past midnight }
     fTodayText.Caption := 'Hoje: ' + DateToStr(SysUtils.Date);
end;

{ Clear all bolds and get new ones }
procedure TMonthCalendar2.GetBolds(Todas: Boolean);
var
   Loop : BYTE;

begin
     if Todas then
     begin
      { Empty days to bold }
      FOR Loop := 1 TO 31 DO fDaysToBold[Loop] := FALSE;
       { Get Bold days }
       IF Assigned(fOnBoldDays) THEN
                 fOnBoldDays(Self, StartOfTheMonth(fDate), EndOfTheMonth(fDate), fdate, fDaysToBold[Dayof(fdate)], false, fDaysToBold);
     end
     else
       IF Assigned(fOnBoldDays) THEN
            fOnBoldDays(Self, StartOfTheMonth(fDate), EndOfTheMonth(fDate), fdate, fDaysToBold[Dayof(fdate)], true, fDaysToBold );
end;

{ Draw cells in the StringGrid }
procedure TMonthCalendar2.StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
begin
     { Set to default font }
     fStringGrid.Canvas.Font.Assign(Font);
     { If row is header }
     IF ARow = 0 THEN
     BEGIN
          { Draw the days of the week }
          fStringGrid.Canvas.Brush.Color := clRed;
          fStringGrid.Canvas.FillRect(Rect);
          fStringGrid.Canvas.Font.Color := clWhite;
     END
     ELSE  { Not header, a number }
     BEGIN  { Draw the numbers }
          { Eclipse colour }
          fStringGrid.Canvas.Pen.Color := clRed;
          fStringGrid.Canvas.Pen.Width := 2;
          { Is cell selected }
          IF gdSelected IN State THEN
          BEGIN    { yes }
               fStringGrid.Canvas.Brush.Color := clHighlight;
               fStringGrid.Canvas.Font.Color := clHighlightText
          END
          ELSE
          BEGIN   { No }
               fStringGrid.Canvas.Brush.Color := clWindow;
               fStringGrid.Canvas.Font.Color := clBlack
          END;
          { Is date in current month }
          IF MonthOf(DateInCell(ACol, ARow)) <> MonthOf(fDate) THEN
          BEGIN  { No then shade text gray }
               fStringGrid.Canvas.Font.Color := clGreen;
          END
          ELSE
          BEGIN   { Yes, then test to see if it should be bold }
               { Test for Bold, if so make date bold }
               IF fDaysToBold[DayOf(DateInCell(ACol, ARow))] THEN
               BEGIN
                  fStringGrid.Canvas.Font.Color := clRed;
                  fStringGrid.Canvas.Font.Style := [fsBold];
//                  fStringGrid.Canvas.Font.height := 75
               END
          END;
          { Fill the cell with brush color }
          fStringGrid.Canvas.FillRect(Rect);
          { Drawing today then draw eclipse }
          IF DateOf(DateInCell(ACol, ARow)) = DateOf(SysUtils.Date) THEN
             fStringGrid.Canvas.Ellipse(Rect);
     END;
     { Draw the cell text }
     fStringGrid.Canvas.TextRect(Rect, Rect.Left, Rect.Top,
                                    fStringGrid.Cells[ACol, ARow]) { 36 = AlignHCenter 4 + AlignVCenter 32 }
end;

{ Calculate the date in a cell }
function TMonthCalendar2.DateInCell(x , y : INTEGER) : TDateTime;
var Day : INTEGER;
begin
     IF y = 0 THEN
     BEGIN
          Result := 0;
          EXIT
     END;
     { Get cell count from the offset cell in first row, ie, days into month }
     Day := ((y - 1) * 7) + x - fFirstOffset;
     { Get the date = First day in month +/- Day }
     Result := DateOf(IncDay(StartOfTheMonth(fDate), Day))
end;

{ Set fDate and goto grid position }
procedure TMonthCalendar2.GotoDate(NewDate : TDateTime);
var CellCount : INTEGER;
    OldDate : TDateTime;
begin
     { Remember old date }
     OldDate := fDate;
     { Set New date }
     fDate := NewDate;
     { Has a new month been selected }
     IF StartOfTheMonth(fDate) <> StartOfTheMonth(OldDate) THEN
     BEGIN
          { Fill cells as new month }
         FillTheGrid;
          { Notify month has changed }
          IF Assigned(fOnMonthChange) THEN fOnMonthChange(Self);
     END;
     { Now select cell containing date }
     { cell count from 1st cell }
     CellCount := DayOf(fDate) + fFirstOffset - 1;
{ Do not process cell selection, stops endless loop }
     fNoSelect := TRUE;
     { Set the Row }
     fStringGrid.Row := (CellCount DIV 7) + 1;
     { Set the Col }
     fStringGrid.Col := CellCount MOD 7;
{ Enable processes when cell selected manually }
     fNoSelect := FALSE;
     { Notify date has changed }
     IF Assigned(fOnDateChange) THEN fOnDateChange(Self);
end;

{ Acts when a cell is selected }
procedure TMonthCalendar2.StringGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
     { If fNoSelect = TRUE then not process cell changes as cell
       has been automatically changed in GotoDate and will cause
       an endless loop }
     IF fNoSelect THEN EXIT;
     { Set the new date }
     GotoDate(DateInCell(ACol, ARow));
end;

procedure TMonthCalendar2.StringGridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     { Make sure selected cell shows proper change, auto month
       change can cause wrong cell selection }
     IF DateInCell(fStringGrid.Col, fStringGrid.Row) <> fDate THEN
        GotoDate(fDate);
     { Notify date selected }
     IF (Y > fStringGrid.DefaultRowHeight) AND Assigned(fOnDateSelect) THEN
            fOnDateSelect(Self);
end;

procedure TMonthCalendar2.StringGridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     IF ((Key = VK_Return)) AND Assigned(fOnDateSelect) THEN
            fOnDateSelect(Self);
end;

{ Decrease/Increase the month, increment held as button's Tab value }
procedure TMonthCalendar2.MonthBtnClick(Sender: TObject);
begin
     GotoDate(IncMonth(fDate, TSpeedButton(Sender).Tag))
end;

{ Decrease/Increase the year, increment held as button's Tab value }
procedure TMonthCalendar2.YearBtnClick(Sender: TObject);
begin
     GotoDate(IncYear(fDate, TSpeedButton(Sender).Tag))
end;

procedure TMonthCalendar2.TodayMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  GotoDate(SysUtils.Date)
end;

{ ****************************************************************** }

{ TMonthCalendarCombo }
constructor TMonthCalendarCombo2.Create(AOwner: TComponent);
begin
     INHERITED Create(AOwner);
     MyTempForm := NIL;
     fDateFormat := ShortDateFormat;
     fDate := SysUtils.Date;
     TabStop := True;
     Height := 25;
     Width := 100;
{     BorderStyle := bsSunken3d;}
     { Create & setup button }
     fButton := TSpeedButton.Create(Self);
     fButton.Parent := Self;        { Compatibility bug work around }
     fButton.Visible := True;       { Make it visible }
     fButton.OnClick := DownClick;  { Asign click event }
     fButton.Glyph.LoadFromResourceName(HInstance, 'CALBUTTONDOWN');  { Asign grphic }
     fButton.Transparent := FALSE;
     { Create Edit }
     FEdit := TMaskEdit.Create(Self);
     FEdit.Parent := Self;
     FEdit.BorderStyle := bsNone;
     FEdit.AutoSize := False;
     fEdit.EditMask := '!99/99/9999;1; ';
     FEdit.Text := FormatDateTime(FDateFormat, FDate);
     fOldEditValue := FEdit.Text;   { Bad date entry revert mem }
     fEdit.OnEnter := EditOnEnter;
     FEdit.OnExit := EditOnExit;
     fEdit.OnKeyDown := doOnKeyDown;
     fEditorEnabled := TRUE;
     fFirstDayOfWeek := dowMonday;
     OnResize := fOnResize
end;

procedure TMonthCalendarCombo2.fOnResize(Sender: TObject);
const SBWidth = 16;  { Button width }
begin
     IF Height < 16 THEN Height := 16;
     { Edit }
     fEdit.Left := 2*Width;
     fEdit.Top := 2*Width;
     fEdit.Width := Width - (4*Width);
     fEdit.Height := Height - (4*Width);
     { Button }
     fButton.Width := SBWidth;
     fButton.Left := FEdit.Left + FEdit.Width;
     fButton.Top := 2 * Width;
     fButton.Height := Height - (4 * Width);
end;

{ Speed button pressed }
procedure TMonthCalendarCombo2.DownClick(Sender: TObject);
var MyPoint: TPoint;
begin
   { Create temp drop down form }
   MyTempForm := TForm.Create(Application);
   try
      { Set parent, bug fix for Windows CLX without unofficial CLX patch }
       {$IFDEF MSWINDOWS}
       MyTempForm.Parent := Self;
       {$ENDIF}
      { No scroll bars }
      MyTempForm.VertScrollBar.Visible := False;
      MyTempForm.HorzScrollBar.Visible := False;
      {No Border }
      MyTempForm.BorderStyle := bsNone;
      { Set pos }
      MyPoint.X := 0;
      MyPoint.Y := Height;
      MyTempForm.Left := ClientToScreen(MyPoint).X-2;
      MyTempForm.Top := ClientToScreen(MyPoint).Y-2;
      { Create calendar }
      MyTempCalendar := TMonthCalendar2.Create(MyTempForm);
      { Set date and first day of week }
      MyTempCalendar.FirstDayOfWeek := fFirstDayOfWeek;
      IF Self.fDate <> 0 THEN MyTempCalendar.Date := Self.fDate
      ELSE MyTempCalendar.Date := SysUtils.Date;
      MyTempCalendar.fStringGrid.SetFocus;
      { First day of week }
      MyTempCalendar.Parent := MyTempForm;
      MyTempCalendar.Name := 'Calendar';
      { Set pos }
      MyTempCalendar.Left := 0;
      MyTempCalendar.Top := 0;
      { Set MyTempForm width & height so calendar fits }
      MyTempForm.Width := MyTempCalendar.Width;
      MyTempForm.Height := MyTempCalendar.Height;
      { Set call back procs }
      MyTempCalendar.OnDateSelect := DateSelected;
      MyTempCalendar.OnBoldDays := fOnDaysToBold;
      { Set widget style as a popup window }

{
      QOpenWidget_setWFlags(QOpenWidgetH(MyTempForm.Handle),
                            Cardinal(WidgetFlags_WType_Popup));
                            }
      { Show form modal }
      MyTempForm.ShowModal;
   finally
     { Destry form if it exists }
     IF Assigned(MyTempForm) THEN FreeAndNil(MyTempForm);
     MyTempCalendar := NIL;
     self.SetFocus;
     if Self.fEdit.CanFocus then
       self.fEdit.SetFocus;
   end;
end;

{ Date was selecetd in calendar }
procedure TMonthCalendarCombo2.DateSelected(Sender: TObject);
begin
     SetDate(TMonthCalendar2(Sender).Date);
     IF Assigned(MyTempForm) THEN MyTempForm.Close
end;


{ Set the date }

procedure TMonthCalendarCombo2.SetDate(Value: TDateTime);
begin
     { Set the date }
     fDate := Value;
     { Is it set }
     IF fDate <> 0 THEN { Yes, set the text and the Calendar }
     BEGIN
          fEdit.Text := FormatDateTime(fDateFormat, fDate);
          fOldEditValue := fEdit.Text;
     END
     ELSE fEdit.Text := '';
end;

{Edit box entered (selecetd) }
procedure TMonthCalendarCombo2.EditOnEnter(Sender: TObject);
begin
  SetDate(DateTimeTranslate(fEdit.Text));
 fEdit.SelectAll;
  fOldEditValue := FEdit.Text;
end;

{ Edit box exited }
procedure TMonthCalendarCombo2.EditOnExit(Sender: TObject);
var d : TDateTime;
begin
     d := DateTimeTranslate(FEdit.Text);
     IF d <> 0 THEN SetDate(d)
     ELSE
     BEGIN
          FEdit.Text := fOldEditValue;
          fDate := DateTimeTranslate(FEdit.Text);
     END;
end;

{ Allow editing of fEdit or not }
procedure TMonthCalendarCombo2.SetEditorEnabled(Value: BOOLEAN);
begin
    fEditorEnabled := Value;
    FEdit.ReadOnly := NOT(Value)
end;


procedure TMonthCalendarCombo2.SetDateFormat(Value: STRING);

begin
     { Set the format }
     fDateFormat := Value;
     { Redraw the date }
     SetDate(fDate)
end;

procedure TMonthCalendarCombo2.SetFirstDayOfWeek(Value : TCalDayOfWeek);
begin
     fFirstDayOfWeek := Value;
end;

function TMonthCalendarCombo2.DateInCalendar : TDateTime;
begin
  IF Assigned(MyTempCalendar) THEN
    Result := MyTempCalendar.Date
  ELSE Result := fDate;
end;

procedure Register;
begin
  RegisterComponents('tecSOFT', [TMonthCalendar2, TMonthCalendarCombo2]);
end;

procedure TMonthCalendarCombo2.DoOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then begin
    Key := 0;
   DownClick(Self);
 end else if Assigned(FOnKeyDown) then
   FOnKeyDown(Self, Key, Shift);
end;

procedure TMonthCalendar2.StringGridDblClick(Sender: TObject);
begin
  GetBolds(false);
  Repaint;
end;

end.