unit cpmascara;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, idGlobal,
  StdCtrls, Mask, DB, DBCtrls, biblio, ctconstantes, clparametrossistema, variants,
  maskutils;

type
  TTipoMascara = (tMascaraContabil, tMascaraBanco);
type
  TDBEditmascara = class(TDBEdit)
  private
    FClassificacaoInvalida: Boolean;
    FSaindodoCampo: Boolean;
    FTipodeMascara: TTipoMascara;
  protected
    procedure DoExit; override;
    procedure Resize; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Change; override;
    procedure DoEnter; override;
    procedure Loaded; override;
  public
    constructor  Create(AOwner: TComponent); override;
    function  Criticar(Mostrar: Boolean): Boolean;
    property ClassificacaoInvalida: Boolean read FClassificacaoInvalida write FClassificacaoInvalida;
    property SaindodoCampo: Boolean read FSaindodoCampo write FSaindodoCampo;
  published
    property TipodeMascara: TTipoMascara read FTipodeMascara write FTipodeMascara;
  end;


implementation

{ TDBEditmascara }

procedure TDBEditmascara.Change;
var
  Nivel: integer;
  Valor: Variant;
begin
   Text := FormatMaskText(field.EditMask, text);
   if assigned(datasource) then
   begin
     if datasource.state in [dsedit, dsinsert] then
       if (field.value<>text) and
          (PossuiNumero(text)) then
       begin
         Valor := Field.value;
         field.value := text;
       end;
   end;

   if PossuiNumero(text) then
   begin
     if Assigned(Field) then
     begin
       case TipodeMascara of

         tMascaraContabil:
         begin
           Nivel := parsistema.mascaracontabil[1].indexof(copy(text,1,1));
           if nivel<>-1 then
           begin
             if field.EditMask <> ParSistema.mascaracontabil[2].Strings[nivel] then
             begin
               MaxLength := length(ParSistema.mascaracontabil[2].Strings[nivel]);
               field.EditMask := ParSistema.mascaracontabil[2].Strings[nivel];
             end;
           end
           else
           begin
             MensagemErro(format('Nível %s não cadastrado nas máscaras contábeis',[copy(text,1,1)]));
             text := Valor;
           end;
         end;

         tMascaraBanco:
         begin
           Nivel := parsistema.mascaraBancos[1].indexof(copy(text,1,1));
           if nivel<>-1 then
           begin
             if field.EditMask <> ParSistema.mascaraBancos[2].Strings[nivel] then
             begin
               MaxLength := length(ParSistema.mascaraBancos[2].Strings[nivel]);
               field.EditMask := ParSistema.mascaraBancos[2].Strings[nivel];
             end;
           end
           else
           begin
             MensagemErro(format('Nível %s não cadastrado nas máscaras bancárias',[copy(text,1,1)]));
             text := Valor;
           end;
         end;
       end;
     end;
     inherited;
   end;
end;

constructor TDBEditmascara.Create(AOwner: TComponent);
begin

  inherited;
  MaxLength := 25;
  Height := 23;
  FClassificacaoInvalida := False;
end;

function TDBEditmascara.Criticar(Mostrar: Boolean): Boolean;

  function Criticar: Boolean;
  Var I: integer;
      NovoTexto : String;
      NovoTextoTerminado : Boolean;
  begin
     result := true;
     NovoTextoTerminado := False;
     for I:=1 to length(field.EditMask)-4 do
     begin
       if isnumeric(text[i]) then
       begin
         if not NovoTextoTerminado then
           NovoTexto := NovoTexto+text[i]
         else
         begin
           result := false;
           break;
         end;
       end
       else
       if Text[i]='.' then
       begin
         if not NovoTextoTerminado then
           NovoTexto := NovoTexto+text[i];
       end
       else
       if i<>1 then
       begin
         if text[i-1]='.' then
         begin
           if not NovoTextoTerminado then
           begin
             NovoTexto := copy(NovoTexto,1,length(NovoTexto)-1);
             NovoTextoTerminado := true;
           end;
         end
         else
         begin
           if not NovoTextoTerminado then
           begin
             result := false;
             break;
           end;
         end;
       end
       else
       begin
         result := false;
         break;
       end
     end;

     if not result then
     begin
       FClassificacaoInvalida := true;
       if mostrar then
         MensagemAviso('Classificacao Inválida !');
     end
     else
       FClassificacaoInvalida := false;
  End;

begin
  Result:= True;

  if possuinumero(Text) then begin
    Result:= Criticar;
  end;
end;

procedure TDBEditmascara.DoEnter;
begin
  inherited;
  if self.Focused then
  begin
    Color:= CorFundoControle;
    SelectAll;
  end;

  if not (datasource.state in [dsedit, dsinsert]) then
    datasource.edit;
end;

procedure TDBEditmascara.DoExit;
begin
  SaindodoCampo := True;
  Color:= clWindow;
  If (Text <> '') and not (Criticar(True)) Then
    if CanFocus then
      SetFocus;
  SaindodoCampo := false;
  inherited;
end;

procedure TDBEditmascara.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  If (Key >= 32) and (Key <= 255) and
     not (chr(Key) in ['0'..'9']) Then Begin
     Key := 0;
     MessageBeep(0);
   End;
end;

procedure TDBEditmascara.Loaded;
begin
  inherited;
  if Assigned(field) then
  begin
    case TipodeMascara of
      tMascaraContabil : field.EditMask:= ParSistema.mascaracontabil[2].Strings[0];
      tMascaraBanco    : field.EditMask:= ParSistema.mascarabancos[2].Strings[0];
    end;
  end;
end;

procedure TDBEditmascara.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

end.
