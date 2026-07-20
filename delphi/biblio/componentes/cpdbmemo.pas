unit cpdbmemo;

interface

uses
  {Qete,} DBCtrls, Controls, StdCtrls, Graphics, Classes, ctconstantes, cpquery, Db, SysUtils, Windows, biblio;

{ Const Validos = ['0'..'9','A'..'Z','a'..'z','&','@','*',',','.','-','(',')','[',']',':','/',' '];}

type
  TtecDBMemo = class(TDBMemo)
    constructor Create(AOwner: TComponent); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  end;

implementation

{ TtecDBMemo }

constructor TtecDBMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  {CLX_TO_VCL WrapBreak:= wbWhitespace;}
end;

procedure TtecDBMemo.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
end;

procedure TtecDBMemo.DoExit;
begin
  inherited;
  Color:= clWindow;
end;

procedure TtecDBMemo.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Assigned(Field) then
  begin
    if Field.CanModify then
    begin
      try
        if (GetCharFromVirtualKey(Key)<>'') then
          if not (GetCharFromVirtualKey(Key)[1] in CharSemAcentos + CharComAcentos) then
          begin
            Key := 0;
            messageBeep(0);
          end;
      except
      end;    

      if Length(Text) > Field.Size then
      begin
        Key := 0;
        messageBeep(0);
      end;
      
      inherited;
    end;
  end;
end;

procedure TtecDBMemo.KeyPress(var Key: Char);
begin
  if not CtrlOn then
    if key = chr(VK_RETURN) then
      key :=  #0;

  inherited;

end;

end.
