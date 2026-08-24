unit RollForms;

{---                                                  Created by CompGen.exe

    TRollForms: TForm effects component
    Version   : 1.0 beta
    Copyright : 2009 Ghazali KERBADOU
    e-mail    : kerbadou.ghazali@yahoo.co.uk
    Date      : 29/06/2009 20:01:10

................  COMPLETELY FREE FOR USE      ..............
                  Please send me an email when you modify
                  the source code, also your comments are
                           W E L C O M E
---}

interface

uses
  Windows, Forms, Controls, Classes, Dialogs, mmSystem, SysUtils;



type

  {.......Appear/Desappear directions............}

  TDesappearDirection = (ddLeaveToRight, ddLeaveToLeft, ddLeaveToBottom, ddLeaveToTop);
  TAppearDirection    = (adFromLeft, adFromRight, adFromTop, adFromBottom);

  TRollForms = class(TComponent)
  private
    FAbout        : String;
    FDesappearTo  : TDesappearDirection;
    FAppearFrom   : TAppearDirection;
    FCollapsForm  : Boolean;
    FPlaySound    : Boolean;
    FEnterSound   : String;
    FLeaveSound   : String;
  protected


  public
    Constructor Create(AOwner: TComponent); override;
    Destructor  Destroy; override;

    {..... MY PROCEDURES..............}

    procedure _ShowAbout;
    procedure _GetDisappeared(frm: TForm);
    procedure _GetAppeared(frm: TForm);
//    procedure _FadeIn(frm: TForm; speed: FFadeSpeed)
    {.................................}

  published
    Property About        : string              read FAbout         write FAbout stored False;
    Property DesappearTo  : TDesappearDirection read FDesappearTo   write FDesappearTo;
    property AppearFrom   : TAppearDirection    read FAppearFrom    write FAppearFrom;
    property CollapsForm  : Boolean             read FCollapsForm   write FCollapsForm;
    property PlaySound    : Boolean             read FPlaySound     write FPlaySound;
    property EnterSound   : String              read FEnterSound    write FEnterSound;
    property LeaveSound   : String              read FLeaveSound    write FLeaveSound;

  end;

procedure Register;

resourcestring
  CompanyName = 'Ghazali KERBADOU';
  ProductName = 'TRollForms Component';
  Version     = 'Version 1.0 beta';
  Copyright   = 'Copyright © 2009 Ghazali KERBADOU';

var
frmTop, frmLeft: Integer;
implementation

procedure Register;
begin
  RegisterComponents('Axilus47', [TRollForms]);
end;

Constructor TRollForms.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FAbout     := 'Copyright © 2009 Ghazali KERBADOU';
  if (owner is TForm) then
  begin
       with (owner as TForm) do
       begin
       frmTop  := Top;
       frmLeft := Left;
       end;
  end;
end;

Destructor TRollForms.Destroy;
begin
  inherited Destroy;
end;

{//////////////////////////////////////////////////////////////////////////////}
{//////////////////////////////////////////////////////////////////////////////}


procedure TRollForms._GetAppeared(frm: TForm);
begin

CASE FAppearFrom OF

adFromRight:
begin
     frm.Show();

     frm.Top  := frmTop;
     frm.Left := 1100;
     if FPlaySound then
     sndPlaySound(PAnsiChar(FEnterSound), SND_ALIAS or SND_ASYNC);
     repeat
     frm.Left := frm.Left - 3;
     until frm.Left <= frmLeft;
end;

adFromLeft:
begin
     frm.Show();
     frm.Top  := frmTop;
     frm.Left := -760;
     if FPlaySound then
     sndPlaySound(PAnsiChar(FEnterSound), SND_ALIAS or SND_ASYNC);
     repeat
     frm.Left := frm.Left + 3;
     until frm.Left >= frmLeft;
end;

adFromTop:
begin
     frm.Top := -430;
     frm.Show();
     if FPlaySound then
     sndPlaySound(PAnsiChar(FEnterSound), SND_ALIAS or SND_ASYNC);
     repeat
     frm.Top := frm.Top + 3;
     until frm.Top >= frmLeft;
end;

adFromBottom:
begin
     frm.Top := 850;
     frm.Show();
     if FPlaySound then
     sndPlaySound(PAnsiChar(FEnterSound), SND_ALIAS or SND_ASYNC);
     repeat
     frm.Top := frm.Top - 3;
     until frm.Top <= frmLeft;
end;


END; {End of Case}
end;


procedure TRollForms._GetDisappeared(frm: TForm); // Close the Form
var i: Integer;
begin
i := 10;
CASE FDesappearTo OF

ddLeaveToRight: {Roll to Right}
     begin
     if CollapsForm then { Resize the TForm Height befor desappear}
           repeat
           frm.Height := frm.Height - 40;
           Sleep(5);
           until frm.Height <= 27;
     repeat {Roll inverse side and back}
     frm.Left := frm.Left - 52;
     i := i + 3;
     Sleep(2);
     until i >= 18;
     if FPlaySound then
     sndPlaySound(PAnsiChar(FLeaveSound), SND_ALIAS or SND_ASYNC);
     repeat  {Desappear}
     frm.Left := frm.Left + 52;
     Sleep(2);
     until frm.Left >= 1000;
     frm.Close();
     end;

ddLeaveToLeft: {Roll to LEFT}
     begin
     if CollapsForm then { Resize the TForm Height befor desappear}
           repeat
           frm.Height := frm.Height - 40;
           Sleep(5);
           until frm.Height <= 27;
     repeat {Roll inverse side and back}
     frm.Left := frm.Left + 52;
     i := i + 3;
     Sleep(2);
     until i >= 18;
     if FPlaySound then
     sndPlaySound(PAnsiChar(FLeaveSound), SND_ALIAS or SND_ASYNC);
     repeat
     frm.Left := frm.Left - 52;
     Sleep(2);
     until frm.Left <= -230;
     frm.Close();
     end;


ddLeaveToTop: {Roll to Top}
     begin
     if CollapsForm then { Resize the TForm Height befor desappear}
           repeat
           frm.Height := frm.Height - 52;
           Sleep(2);
           until frm.Height <= 27;
     repeat {Roll inverse side and back}
     frm.Top := frm.Top + 52;
     i := i + 3;
     Sleep(2);
     until i >= 18;
     if FPlaySound then
     sndPlaySound(PAnsiChar(FLeaveSound), SND_ALIAS or SND_ASYNC);
     repeat
     frm.Top := frm.Top - 52;
     Sleep(2);
     until frm.Top <= -300;
     frm.Close();
     end;

ddLeaveToBottom: {Roll to Bottom}
     begin
     if CollapsForm then { Resize the TForm Height befor desappear}
           repeat
           frm.Height := frm.Height - 40;
           Sleep(5);
           until frm.Height <= 27;
     repeat {Roll inverse side and back}
     frm.Top := frm.Top - 52;
     i := i + 3;
     Sleep(2);
     until i >= 18;
     if FPlaySound then
     sndPlaySound(PAnsiChar(FLEaveSound), SND_ALIAS or SND_ASYNC);
     repeat
     frm.Top := frm.Top + 52;
     Sleep(2);
     until frm.Top >= 750;
     frm.Close();
     end;

END; {end of case}
end;
{//////////////////////////////////////////////////////////////////////////////}procedure TRollForms._ShowAbout;


var
  Msg: string;
begin
  Msg := 'TRollForms version 1.0' + #10;
  Msg := Msg + 'Copyright © 2009 Ghazali KERBADOU' + #10;
  Msg := Msg + 'e-mail: kerbadou.ghazali@yahoo.co.uk' + #10;
  Msg := Msg + 'Build date: 29/06/2009 20:01:10' + #10;
  ShowMessage(Msg);
end;


end.

