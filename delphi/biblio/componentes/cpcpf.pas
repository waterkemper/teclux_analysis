unit cpcpf;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, cpnumero, biblio, ctconstantes;

type
  TDBEditCPF = class(TDBEditNumero)
  protected
     procedure DoEnter; override;
     procedure DoExit; override;
     procedure Resize; override;
  public
    constructor  Create(AOwner: TComponent); override;
    function  Criticar: Boolean;
  published
    { Published declarations }
  end;

implementation

procedure TDBEditCPF.DoExit;
Begin
   inherited;
   Color:= clWindow;
   if (Text <> '') and not (Criticar) Then
      if CanFocus then
        SetFocus;
End;

function TDBEditCPF.Criticar: Boolean;
Var Texto:     Array[1..11] of Byte;
    Digito,ND: Byte;
    CPF:       Int64;
Begin
   CPF := StrToInt64(Text);
   For ND:=11 downto 1 do Begin
      Texto[ND] := CPF mod 10;
      CPF := CPF div 10;
   End;
   Digito := (10 * Texto[01] + 9 * Texto[02] + 8 * Texto[03] +
               7 * Texto[04] + 6 * Texto[05] + 5 * Texto[06] +
               4 * Texto[07] + 3 * Texto[08] + 2 * Texto[09]) mod 11;
   If Digito in [0,1] Then
      Digito := 0
   Else
      Digito := 11 - Digito;
   If Digito = Texto[10] Then Begin
      Digito := (11 * Texto[01] + 10 * Texto[02] + 9 * Texto[03] +
                  8 * Texto[04] +  7 * Texto[05] + 6 * Texto[06] +
                  5 * Texto[07] +  4 * Texto[08] + 3 * Texto[09] +
                  2 * Texto[10]) mod 11;
      If Digito in [0,1] Then
         Digito := 0
      Else
         Digito := 11 - Digito;
      If Digito = Texto[11] Then
         Result := True
      Else Begin
         MensagemAviso('CPF Inválido !');
         Result := False;
      End;
   End
   Else Begin
      MensagemAviso('CPF Inválido !');
      Result := False;
   End;
End;

constructor TDBEditCPF.Create(AOwner: TComponent);
Begin
  inherited;
  MaxLength := 11;
  Height := 23;  
End;

procedure TDBEditCPF.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

procedure TDBEditCPF.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
end;

end.
