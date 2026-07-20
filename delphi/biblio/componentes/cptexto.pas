unit cptexto;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows, biblio,
  StdCtrls, Mask, DBCtrls, {Qete,} ctconstantes, clparametrossistema, DB, variants;

type
  TDBEditTexto = class(TDBEdit)
  private
    vSelStart : byte;
    FDeletePressed: Boolean;
    fCharCasenoDefault: Boolean;
    FAlignment: TAlignment;
    fCharValidos: String;
    fListadeChaves: TStringList;
    function GetAlignment: TAlignment;
    procedure SetAlignment(const Value: TAlignment);

  protected
    CorOriginal: tcolor;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;

    procedure Change; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Resize; override;
    procedure Loaded; override;
    procedure AutorizarMinusculo;
    property DeletePressed: Boolean read FDeletePressed write FDeletePressed;
    procedure CreateParams(var Params: TCreateParams); override;

  public
    constructor   Create(AOwner: TComponent); override;
  published
    property CharCasenoDefault : Boolean read fCharCasenoDefault write fCharCasenoDefault;
    property Alignment: TAlignment read GetAlignment write SetAlignment default taRightJustify;
    property CharValidos: String read fCharValidos write fCharValidos;
    property ListadeChaves: TStringList read fListadeChaves write fListadeChaves;


  end;


type
  TEditTexto = class(TEdit)
  private
    { Private declarations }
    vSelStart : byte;
    FDeletePressed: Boolean;
    fCharCasenoDefault: Boolean;
    FAlignment: TAlignment;
    fCharValidos: String;
    function GetAlignment: TAlignment;
    procedure SetAlignment(const Value: TAlignment);

  protected
    CorOriginal: tcolor;
    procedure     KeyDown(var Key: Word; Shift: TShiftState); override;

    procedure KeyPress(var Key: Char); override;

    procedure     Change; override;
    procedure     DoEnter; override;
    procedure     DoExit; override;
    procedure Loaded; override;
    procedure AutorizarMinusculo;
    property DeletePressed: Boolean read FDeletePressed write FDeletePressed;
    procedure CreateParams(var Params: TCreateParams); override;

  public
    constructor Create(AOwner: TComponent); override;
  published
    property CharCasenoDefault : Boolean read fCharCasenoDefault write fCharCasenoDefault;
    property Alignment: TAlignment read GetAlignment write SetAlignment default taRightJustify;
    property CharValidos: String read fCharValidos write fCharValidos;
  end;


implementation



{ TDBEditTexto }

procedure TDBEditTexto.KeyDown(var Key: Word; Shift: TShiftState);
(*var
  posicao: byte; *)
begin
  {qdo pressionado delete retorna 0 e nao 4103  - clx}

  inherited;

//  if MaxLength = -1 then
    if Assigned(field) then
      Maxlength := datasource.dataset.fieldbyname(datafield).size;

  if (key = VK_Delete) {or
     (key = VK_SPACE)} then
    DeletePressed := True
  else
    DeletePressed := false;
end;

constructor TDBEditTexto.Create(AOwner: TComponent);
Begin
  inherited;
  MaxLength := -1;
  Height := 23;
  vSelStart := 0;
  AutorizarMinusculo;
  FAlignment := taLeftJustify;
  CharCase := ecNormal;

End;



procedure TDBEditTexto.Change;
var NC:    byte;
    vText, Novo:  string;
    posicao: byte;
    condicao: boolean;

  procedure VerificarPronomes;
  var
   i,j: byte;
  begin
   for i:=1 to 6 do
   begin
     J:=pos(pronomes[i],Novo);
     if j<>0 then
      Novo := copy(Novo, 1, j)+
              ansiLowerCase(copy(novo, j+1, 1))+
              copy(Novo, j+2,length(novo)-j-1);
   end;
  end;


begin
   inherited;

  if Assigned(field) then
  begin
    if Field.CanModify then
    begin
       if not CharCasenoDefault then
       begin
         if (self.SelStart=0) then
         begin
           if (vSelStart <> 0) and not deletePressed then
             self.SelStart := vSelStart;
         end
         else
         begin
           condicao := False;
           case field.DataType of
             ftString, ftUnknown:
               condicao := (self.Text <> field.OldValue) or (DataSource.State = dsinsert);
             ftLargeint, ftInteger :
             begin
               if field.OldValue = null then
                 condicao := (self.Text <> '') or (DataSource.State = dsinsert)
               else
                 condicao := (self.Text <> inttostr(field.oldvalue)) or (DataSource.State = dsinsert);
             end;
           end;

           if condicao then
           begin
             posicao := self.SelStart;
             vText := Text;
             if not InsertLigado and not deletePressed then
             begin
               vText := copy(vtext,1,selstart) +
                       copy(vtext,selstart+2,length(vtext)-selstart);
             end;

             NC:=1;
             Novo := '';
             While NC <= Length(vText) do
             begin
               If vText[NC] in CharSemAcentos + CharComAcentos Then
               begin
                 if not ParSistema.DigitacaodecaracteresemMAIUSCULO then
                 begin
                   if (nc=1) then
                     Novo := ansiuppercase(vText[NC])
                   else
                   if (vText[NC-1]=' ') then
                     Novo := Novo + ansiUppercase(vText[NC])
                   else
                     Novo := Novo + vText[NC];

                   VerificarPronomes;
                 end
                 else
                  Novo := Novo + AnsiUpperCase(vText[NC]);
               end;
               Inc(NC);
             end;

             if Novo <> Text then
             begin
               vSelStart := posicao;
               Text := Novo;
             end;
           end;
         end;
       end;
    end;
  end;
end;


procedure TDBEditTexto.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

procedure TDBEditTexto.DoEnter;
begin
  inherited;
  CorOriginal := color;
  if Self.Focused and Not ReadOnly then
    Color:= CorFundoControle
end;

procedure TDBEditTexto.DoExit;
begin
  inherited;
  Color:= CorOriginal;
end;

procedure TDBEditTexto.AutorizarMinusculo;
begin
//  if Assigned(field) then
//  begin
    if not CharCasenoDefault then
    begin
      if ParSistema.DigitacaodecaracteresemMAIUSCULO then
        CharCase := ecUpperCase
      else
        CharCase := ecNormal;
    end;
//  end;
end;

procedure TDBEditTexto.KeyPress(var Key: Char);
begin
  inherited;

  if (Key in [#32..#255]) and
     ((not (Key in CharSemAcentos + CharComAcentos )) or
         ((CharValidos<>'') and (pos(key,CharValidos)=0))) and
        (key <> chr(vk_back)) then
     Key := #0;

end;

procedure TDBEditTexto.CreateParams(var Params: TCreateParams);
begin
  inherited;
  case FAlignment of
    taLeftJustify  : Params.Style := Params.Style or ES_LEFT;
    taRightJustify : Params.Style := Params.Style or ES_RIGHT;
    taCenter       : Params.Style := Params.Style or ES_CENTER;
  end;
end;

function TDBEditTexto.GetAlignment: TAlignment;
begin
  Result := FAlignment
end;

procedure TDBEditTexto.SetAlignment(const Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd
  end
end;


{ TEditTexto }

procedure TEditTexto.KeyDown(var Key: Word; Shift: TShiftState);
begin

  inherited;

  if (key = VK_Delete) {or
     (key = VK_SPACE)} then
    DeletePressed := True
  else
    DeletePressed := false;



end;

constructor TEditTexto.Create(AOwner: TComponent);
Begin
  inherited Create(AOwner);
  MaxLength := -1;
  Height := 23;
  vSelStart := 0;
  FAlignment := taLeftJustify;
  CharCase := ecNormal;
  AutorizarMinusculo;
End;

procedure TEditTexto.Change;
var NC:    byte;
    Novo, vText:  string;
    posicao: byte;

  procedure VerificarPronomes;
  var
   i,j: byte;
  begin
   for i:=1 to 5 do
   begin
     J:=pos(pronomes[i],Novo);
     if j<>0 then
      Novo := copy(Novo, 1, j)+
              ansiLowerCase(copy(novo, j+1, 1))+
              copy(Novo, j+2,length(novo)-j-1);
   end;
  end;

begin
   if CanFocus  then
   begin
     if not CharCasenoDefault then
     begin
       if (self.SelStart=0) then
       begin
         if (vSelStart <> 0) then
           self.SelStart := vSelStart
       end
       else
       begin

         NC:=1;
         Novo := '';

         vText := Text;

         posicao := self.SelStart;
         if not InsertLigado and not deletepressed then
           vText := copy(vtext,1,selstart) +
                   copy(vtext,selstart+2,length(vtext)-selstart);

         While NC <= Length(vText) do
         begin
           If Char(vText[NC]) in CharSemAcentos + CharComAcentos {Validos} Then
           begin
             if not ParSistema.DigitacaodecaracteresemMAIUSCULO then
             begin
               if (nc=1) then
                 Novo := ansiuppercase(vText[NC])
               else
               if (vText[NC-1]=' ') then
                 Novo := Novo + ansiUppercase(vText[NC])
               else
                 Novo := Novo + vText[NC];

               VerificarPronomes;
             end
             else
              Novo := Novo + AnsiUpperCase(vText[NC]);
           end;
           Inc(NC);
         end;

         if Novo <> Text then
         begin
           vSelStart := posicao;
           Text := Novo;
         end;
       end;
     end;
     self.Modified := true;
   end;
   inherited;

end;

procedure TEditTexto.DoEnter;
begin
  inherited;
  CorOriginal := color;
  if Self.Focused and Not ReadOnly then
    Color:= CorFundoControle
end;

procedure TEditTexto.DoExit;
begin
  inherited;
  Color:= CorOriginal;
end;


procedure TDBEditTexto.Loaded;
begin
  inherited;
  AutorizarMinusculo;
end;

procedure TEditTexto.Loaded;
begin
  inherited;
  AutorizarMinusculo;
end;

procedure TEditTexto.AutorizarMinusculo;
begin
  if not CharCasenoDefault then
  begin
    if ParSistema.DigitacaodecaracteresemMAIUSCULO then
      CharCase := ecUpperCase
    else
      CharCase := ecNormal;
  end;
end;

procedure TEditTexto.KeyPress(var Key: Char);
begin
  inherited;
  if ((not (Key in CharSemAcentos + CharComAcentos )) or
      ((CharValidos<>'') and (pos(key,CharValidos)=0))) and
     (key <> chr(vk_back)) then
     Key := #0;
end;

procedure TEditTexto.CreateParams(var Params: TCreateParams);
begin
  inherited;
  case FAlignment of
    taLeftJustify  : Params.Style := Params.Style or ES_LEFT;
    taRightJustify : Params.Style := Params.Style or ES_RIGHT;
    taCenter       : Params.Style := Params.Style or ES_CENTER;
  end;
end;

function TEditTexto.GetAlignment: TAlignment;
begin
  Result := FAlignment
end;

procedure TEditTexto.SetAlignment(const Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd
  end
end;

end.
