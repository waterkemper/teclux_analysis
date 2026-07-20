unit cpmascaracontabil;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, idGlobal,
  StdCtrls, Mask, DB, DBCtrls, biblio, ctconstantes, clparametrossistema;


  Const Validos = ['0'..'9','A'..'Z','a'..'z','&','@','"','*',',','.','-','(',')','[',']',':','/',' ', '_', '%', '+'];

type
  TDBEditmascaracontabil = class(TDBEdit)
  private
    Fdigitado: String;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Change; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Resize; override;
  public
    constructor  Create(AOwner: TComponent); override;
    function  Criticar(Mostrar: Boolean): Boolean;
    property digitado: String read Fdigitado write Fdigitado;

  published
  end;


implementation

{ TDBEditmascaracontabil }

procedure TDBEditmascaracontabil.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  If (Key in [32..255]) and
     ((GetCharFromVirtualKey(Key)<>'') and
      not (GetCharFromVirtualKey(Key)[1] in ['0'..'9'])) Then
  begin
    Key := 0;
//    MessageBeep(0);
    beep;
  End;
end;

constructor TDBEditmascaracontabil.Create(AOwner: TComponent);
Begin
  inherited;
  MaxLength := -1;
  CharCase := ecUpperCase;
  Height := 23;
End;

procedure TDBEditmascaracontabil.Change;
var
  Nivel: integer;
begin
   inherited;
   if datasource.state in [dsedit, dsinsert] then
     if field.value<>text then
       field.value := text;

   if PossuiNumero(text) then
   begin
     if Assigned(Field) then begin
       if (Field.EditMask = '') or
          (length(SomenteNumero(Text))=1) then
       begin
//         Nivel := parsistema.mascaracontabil[1].indexof(copy(text,1,pos('.',text)-1));
         Nivel := parsistema.mascaracontabil[1].indexof(inttostr(strtoint(copy(text,1,pos('.',text)-1))));
         if nivel<>-1 then
           if field.EditMask <> ParSistema.mascaracontabil[2].Strings[nivel] then
           begin
             digitado := SomenteNumero(text);
             MaxLength := length(ParSistema.mascaracontabil[2].Strings[nivel]);
             field.EditMask := ParSistema.mascaracontabil[2].Strings[nivel];
           end;
       end;
     end;
   end;
end;

{
var NC:    byte;
    Novo:  string;
begin
   inherited;
   NC:=1;
   Novo := '';
   While NC <= Length(Text) do begin
      If Text[NC] in Validos Then
         Novo := Novo + Text[NC];
      Inc(NC);
   end;
   Text := Novo;
end;
}

procedure TDBEditmascaracontabil.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

procedure TDBEditmascaracontabil.DoEnter;
begin
  inherited;
  if Self.Focused then
    Color:= CorFundoControle;
end;

procedure TDBEditmascaracontabil.DoExit;
begin
  inherited;
  Color:= clWindow;
end;


function TDBEditmascaracontabil.Criticar(Mostrar: Boolean): Boolean;
begin

end;

end.
