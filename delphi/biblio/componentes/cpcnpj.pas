unit cpcnpj;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, biblio, ctconstantes;

type
  TDBEditCNPJ = class(TDBEdit)
  private
    FDecimais: Boolean;
    FNegativo: Boolean;
    FTamanho: Word;
  protected
    procedure DoExit; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Change; override;
    procedure DoEnter; override;
    procedure Resize; override;
  public
    constructor  Create(AOwner: TComponent); override;
    function  Criticar: Boolean;
  published
    property Tamanho:     Word    read FTamanho  write FTamanho;
    property Decimais:    Boolean read FDecimais write FDecimais;
    property Negativo:    Boolean read FNegativo write FNegativo;
  end;


implementation

procedure TDBEditCNPJ.DoExit;
Begin
   inherited;
   Color:= clWindow;
   If (Text <> '') and not (Criticar) Then
      if CanFocus then
         SetFocus;
End;

function TDBEditCNPJ.Criticar: Boolean;
Var Texto:     Array[1..14] of Byte;
    Digito,ND: Byte;
    CNPJ:      Int64;
Begin
   CNPJ := StrToInt64(Text);
   For ND:=14 downto 1 do Begin
      Texto[ND] := CNPJ mod 10;
      CNPJ := CNPJ div 10;
   End;
   Digito := (5 * Texto[01] + 4 * Texto[02] + 3 * Texto[03] +
              2 * Texto[04] + 9 * Texto[05] + 8 * Texto[06] +
              7 * Texto[07] + 6 * Texto[08] + 5 * Texto[09] +
              4 * Texto[10] + 3 * Texto[11] + 2 * Texto[12]) mod 11;
   If Digito in [0,1] Then
      Digito := 0
   Else
      Digito := 11 - Digito;
   If Digito = Texto[13] Then Begin
      Digito := (6 * Texto[01] + 5 * Texto[02] + 4 * Texto[03] +
                 3 * Texto[04] + 2 * Texto[05] + 9 * Texto[06] +
                 8 * Texto[07] + 7 * Texto[08] + 6 * Texto[09] +
                 5 * Texto[10] + 4 * Texto[11] + 3 * Texto[12] +
                 2 * Texto[13]) mod 11;
      If Digito in [0,1] Then
         Digito := 0
      Else
         Digito := 11 - Digito;
      If Digito = Texto[14] Then
         Result := True
      Else Begin
         MensagemAviso('CNPJ Inválido !');
         Result := False;
      End;
   End
   Else Begin
      MensagemAviso('CNPJ Inválido !');
      Result := False;
   End;
End;

constructor TDBEditCNPJ.Create(AOwner: TComponent);
Begin
  inherited;
  MaxLength := 14;
  Height := 23;  
End;

procedure TDBEditCNPJ.Change;
var NC:    byte;
    Novo:  string;
begin
   inherited;
   NC:=1;
   Novo := '';
   While NC <= Length(Text) do begin
      If Text[NC] in ['0'..'9','-','.','/'] Then
         Novo := Novo + Text[NC];
      Inc(NC);
   end;
   Text := Novo;
end;

procedure TDBEditCNPJ.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
  If Tamanho = 0 Then Tamanho := Byte(MaxLength);
end;

procedure TDBEditCNPJ.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;

  If (Key in [32..255])
     and (((Tamanho > 0) and (Length(text)-SelLength >= Tamanho)) or
          ((GetCharFromVirtualKey(Key)<>'') and
          not (GetCharFromVirtualKey(Key)[1] in ['0'..'9']))  ) Then
  begin
    Key := 0;
    Beep;
  End;
end;

procedure TDBEditCNPJ.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

end.
