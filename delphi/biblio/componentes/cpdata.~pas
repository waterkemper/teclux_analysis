unit cpdata;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ctconstantes, clparametrossistema, Windows;


type
  TEditData = class(TEdit)
  private
    DataAlterada: Boolean;
    FMinimo: Word;
    FMaximo: Word;
    FDataBase: TDateTime;
    FDataValida: Boolean;
    FMensagemPadronizada: TtecProcedure;
    FMensagemPadronizadaRetorno: TTecBooleanRetorno;
    function  GetDataBase: TDateTime;
    procedure SetDataBase(const Value: TDateTime);
    function  GetDataValida: Boolean;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Resize; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Change; override;
    procedure Click; override;

  public
    function Criticar(Mensagem: Boolean): Boolean;
    constructor Create(AOwner: TComponent); override;
    property DataBase: TDateTime read GetDataBase write SetDataBase;
    property DataValida: Boolean read GetDataValida;
    property MensagemPadronizada: TtecProcedure read FMensagemPadronizada write FMensagemPadronizada;
    property MensagemPadronizadaRetorno: TTecBooleanRetorno read FMensagemPadronizadaRetorno write FMensagemPadronizadaRetorno;


  published
    property Minimo: Word read FMinimo write FMinimo;
    property Maximo: Word read FMaximo write FMaximo;
  end;

  type
  TEditMesAno = class(TMaskEdit)
  private
    FDataValida: Boolean;
    function Criticar: Boolean;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Click; override;

    procedure Change; override;
  public
    constructor  Create(AOwner: TComponent); override;
    property DataValida: Boolean read FDataValida;
  end;


  type
  TEditSemanaAno = class(TMaskEdit)
  private
    FDataValida: Boolean;
    function Criticar: Boolean;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Click; override;

    procedure Change; override;
  public
    constructor  Create(AOwner: TComponent); override;
    property DataValida: Boolean read FDataValida;
  end;



  type
  TEditDiaMes = class(TMaskEdit)
  private
    FDataValida: Boolean;
    function Criticar: Boolean;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Click; override;


    procedure Change; override;
  public
    constructor  Create(AOwner: TComponent); override;
    property DataValida: Boolean read FDataValida;
  end;

  type
  TEditDia = class(TMaskEdit)
  private
    FDataValida: Boolean;
    FDataFinal: String;
    function Criticar(Mensagem: boolean): Boolean;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Click; override;


    procedure Change; override;
  public
    constructor  Create(AOwner: TComponent); override;
    property DataValida: Boolean read FDataValida;
    property DataFinal: String read FDataFinal write FDataFinal;
  end;

  type
  TEditMes = class(TMaskEdit)
  private
    FDataValida: Boolean;
    FDataFinal: String;
    function Criticar(Mensagem: boolean): Boolean;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Click; override;


    procedure Change; override;
  public
    constructor  Create(AOwner: TComponent); override;
    property DataValida: Boolean read FDataValida;
    property DataFinal: String read FDataFinal write FDataFinal;
  end;


  type
  TEditHora = class(TMaskEdit)
  private
    FHoraValida: Boolean;
    function Criticar: Boolean;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Click; override;

    procedure Change; override;
  public
    constructor  Create(AOwner: TComponent); override;
    property HoraValida: Boolean read FHoraValida;
  end;

implementation

uses {Qete,} DateUtils, biblio;

{ TEditData }

function TEditData.GetDataBase: TDateTime;
begin
  Result := FDataBase;
end;

procedure TEditData.SetDataBase(const Value: TDateTime);
begin
  FDataBase := Value;
end;

function TEditData.Criticar(Mensagem: Boolean): Boolean;
var
  Data: TDateTime;
begin
  inherited;
  Result := True;
  Data := 0;
  if not DataEmBranco(Text) then
  begin
    try
      Data := StrToDate(Text);
    except
      on E: EConvertError do Result := False;
    end;

    if result then
      if Length(Text) < 8 then
        result := false;

    if not result then
    begin
      if Mensagem then
       MensagemAviso('Data inválida!');
    end
    else
    if Result and not self.ReadOnly then
    begin
      if (Data < FDataBase - FMinimo) then
      begin
        if mensagem then
          if assigned(MensagemPadronizada) then
            MensagemPadronizada
          else
            MensagemAviso(format('Data inferior ao(s) %d dia(s) permitido(s)!',[FMinimo+1]));
        Result := False;
      end
      else
        if (Data > FDataBase + FMaximo) then
        begin
          if mensagem then
            if assigned(MensagemPadronizada) then
              MensagemPadronizada
            else
              MensagemAviso(format('Data superior ao(s) %d dia(s) permitido(s)!',[FMaximo]));
          Result := False;
        end
        else
        if (Data > FDataBase) then
        begin

          if assigned(MensagemPadronizadaRetorno) and Mensagem then
            result := MensagemPadronizadaRetorno;
        end;
    end;
  end;
  FDataValida:= Result;
end;

procedure TEditData.DoExit;
begin
  Color := clWindow;
  GetDataValida ;
  inherited;
end;

procedure TEditData.KeyDown(var Key: Word; Shift: TShiftState);
var
  Novo: String;
begin
{
  if (Key >= 32) and (Key <= 255) and not
     (chr(Key) in ['0'..'9']) then}

  {48..57 = 0..9 }
  {96..105 = 0..9 lado numérico do teclado)
  {111 = / }



  if not (key in [48..57,96..105,111] + VK_LISTATECLAS) then
  begin
      Key := 0;
      MessageBeep(0)
  end
  else
  begin
    inherited KeyDown(Key, Shift);
    {
    if (chr(Key) in ['0'..'9']) then
    }
    if (key in [48..57,96..105,111]) then
    begin
      Novo:= Trim(Text);
      if Length(Novo) = 2 then
        Insert('/',Novo,3)
      else
      if Length(Novo) = 5 then
        Insert('/',Novo,6);

      if (Length(Novo) < 10) or ((Length(Novo) = 10) and (SelLength = 10)) then
      begin
        if text <> Novo then
        begin
          Text:= Novo;
          self.SelStart := length(Novo);
        end;
      end
      else
      begin
        Key:= 0;
        MessageBeep(0)
      end;
    end
    else
    if (Key = VK_Return) then
           if  not Criticar(False) then Key:= 0
           else                  inherited KeyDown(Key, Shift)
  end;


end;

procedure TEditData.Change;
var
  NC:    byte;
  Novo:  string;
begin
  Modified := true;
  inherited Change;

  NC := 1;
  Novo := '';
  while NC <= Length(Text) do begin
     if (Char(Text[NC]) in ['0'..'9',{DateSeparator} '/']) then
        Novo := Novo + Text[NC];
     Inc(NC);
  end;
  if DataAlterada or (Novo='') then
  begin
    if text <> Novo then
      Text := Novo
  end
  else
  begin
    try
      Text := FormatDateTime('dd/mm/yyyy',StrToDate(Novo));
    except
      Text := Novo;
    end;
    DataAlterada := True;
  end;

  Criticar(False);
end;

constructor TEditData.Create(AOwner: TComponent);
begin
  inherited;
  Minimo := 37353;
  Maximo := 0;
  FDataBase := Date;
  Height := 23;
end;

procedure TEditData.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;


//  AlignControls := taLeftJustify;
  // // //Alignment:=taLeftJustify;
end;

procedure TEditData.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

function TEditData.GetDataValida: Boolean;
var
  Data: String;
  Ano: String;
begin
  Data:= Trim(Text);
  if Length(Data) = 8 then begin
    Ano:= Copy(Data,07,02);
    try
//      if (StrToInt(Ano) > 50) then Insert('19',Data,7)
//      else                         Insert('20',Data,7);

    if (StrToInt(Ano) >= ParSistema.Seculo) then Insert('19',Data,7)
                                            else Insert('20',Data,7);
    except
    end;
    Text:= Data;
  end;
  if not ReadOnly and not Criticar(True) then begin
     if CanFocus then SetFocus;
  end;
  Result:= FDataValida;
end;

procedure TEditData.KeyPress(var Key: Char);
begin
  if key = #13 then
    key := #0;

  inherited;
end;

procedure TEditData.Click;
begin
  inherited;
  {
  if self.seltext='' then
    self.selectall;
    }

end;

{ TEditMesAno }

function TEditMesAno.Criticar: Boolean;

   function Vazio(Data: String): Boolean;
   var NP: Byte;
   begin
      NP := 1;
      while (NP <= Length(Data)) and
            not (Data[NP] in ['0'..'9']) do Inc(NP);
      Vazio := NP > Length(Data);
   end;

begin
  inherited;
  Result := True;
  if not Vazio(Text) then
    try
     if (trim(copy(Text,1,2))<>'0') or
        ((trim(copy(Text,1,2))<>'0') and (trim(copy(Text,4,4))<>'')) then
      if (trim(copy(Text,4,4))='') then
       StrToDate('01/'+copy(Text,1,3)+'2000')
      else
       StrToDate('01/' + Text);
    except on E: EConvertError do
    begin
      MessageDlg('Data Inválida !',mtWarning,[mbOk],0);
      Result := False;
    end;
    end
  else
    Result := True;
  FDataValida:= Result;
end;

procedure TEditMesAno.DoExit;
begin
  Color:= clWindow;
  if not ReadOnly and not Criticar then
  begin
    Reset;
//    SetFocus;
  end;
  inherited;

end;

procedure TEditMesAno.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not ReadOnly then
  begin

    {48..57 = 0..9 }
    {96..105 = 0..9 lado numérico do teclado)
    {111 = / }

    if not (key in [48..57,96..105,111] + VK_LISTATECLAS) then
    begin
      Key := 0;
      MessageBeep(0)
    end;
  end;
end;

procedure TEditMesAno.Change;
var
  NC:    byte;
  Novo:  String;
begin
  inherited;
  if not ReadOnly then begin
    NC := 1;
    Novo := '';
    while NC <= Length(Text) do begin
       if Text[NC] in ['0'..'9',{DateSeparator} '/'] then
          Novo := Novo + Text[NC];
       Inc(NC);
    end;
    Text := Novo;
    Criticar;
    inherited Change;
  end;
end;

constructor TEditMesAno.Create(AOwner: TComponent);
begin
  inherited;
  EditMask := '99/9999;1; ';
  Height := 23;
end;

procedure TEditMesAno.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
end;

procedure TEditMesAno.KeyPress(var Key: Char);
begin
  if key = #13 then
    key := #0;

  inherited;

end;

procedure TEditMesAno.Click;
begin
  inherited;
  {
  if self.seltext='' then
    self.selectall;
    }

end;


{ TEditSemanaAno }

function TEditSemanaAno.Criticar: Boolean;


   function Vazio(Data: String): Boolean;
   var NP: Byte;
   begin
      NP := 1;
      while (NP <= Length(Data)) and
            not (Data[NP] in ['0'..'9']) do Inc(NP);
      Vazio := NP > Length(Data);
   end;


begin
   inherited;
   Result := True;
   if not Vazio(Text)
   then if (trim(copy(Text,1,2)) <> '0') or
          ((trim(copy(Text,1,2)) <> '0') and (trim(copy(Text,4,4)) <> ''))
        then if not (FLVal(Copy(Text,1,2)) in [1..52])
             then raise ERangeError.CreateFmt('A semana "%d" tem que estar entre 1 e 52', [FLVal(Copy(Text,1,2))]);
   FDataValida:= Result;
end;



procedure TEditSemanaAno.DoExit;
begin
  Color:= clWindow;
  if not ReadOnly and not Criticar then
  begin
    Reset;
//    SetFocus;
  end;
  inherited;

end;

procedure TEditSemanaAno.KeyDown(var Key: Word; Shift: TShiftState);
begin
   inherited;
   if not ReadOnly then begin

      {48..57 = 0..9 }
      {96..105 = 0..9 lado numérico do teclado)
      {111 = / }

      if not (key in [48..57, 96..105, 111] + VK_LISTATECLAS)
      then begin
         Key := 0;
         MessageBeep(0)
      end;
   end;
end;


procedure TEditSemanaAno.Change;
var
  NC:   Byte;
  Novo: String;
begin
   inherited;
   if not ReadOnly then begin
      Novo:= '';
            NC := 1;
      while NC <= Length(Text) do begin
         if Text[NC] in ['0'..'9', {DateSeparator} '/']
         then Novo:= Novo + Text[NC];
         Inc(NC);
      end;
      Text:= Novo;
      Criticar;
      inherited Change;
   end;
end;


constructor TEditSemanaAno.Create(AOwner: TComponent);
begin
   inherited;
   EditMask := '99/9999;1; ';
   Height := 23;
end;

procedure TEditSemanaAno.DoEnter;
begin
   inherited;
   if Focused then
      Color:= CorFundoControle;
end;

procedure TEditSemanaAno.KeyPress(var Key: Char);
begin
   if key = #13 then
      key := #0;

   inherited;
end;

procedure TEditSemanaAno.Click;
begin
   inherited;
   {
   if self.seltext = '' then
      self.selectall;
      }
end;



{ TEditHora }

procedure TEditHora.Change;
var
  NC:    byte;
  Novo:  String;
begin
  inherited;
  if not ReadOnly then begin
    NC := 1;
    Novo := '';
    while NC <= Length(Text) do begin
       if Text[NC] in ['0'..'9',TimeSeparator] then
          Novo := Novo + Text[NC];
       Inc(NC);
    end;
    Text := Novo;
  end;
end;

procedure TEditHora.Click;
begin
  inherited;
  {
  if self.seltext='' then
    self.selectall;
  }
  

end;

constructor TEditHora.Create(AOwner: TComponent);
begin
  inherited;
  EditMask := '99:99;1; ';
  Height := 23;
end;

function TEditHora.Criticar: Boolean;

   function Vazio(Data: String): Boolean;
   var NP: Byte;
   begin
      NP := 1;
      while (NP <= Length(Data)) and
            not (Data[NP] in ['0'..'9']) do Inc(NP);
      Vazio := NP > Length(Data);
   end;

begin
  inherited;
  Result := True;
  if not Vazio(Text) then
    try StrToTime(Text);
    except on E: EConvertError do
    begin
      MessageDlg('Hora Inválida !',mtWarning,[mbOk],0);
      Result := False;
    end;
    end
  else
    Result := True;
  FHoraValida:= Result;
end;

procedure TEditHora.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
end;

procedure TEditHora.DoExit;
begin
  Color:= clWindow;
  if not ReadOnly and not Criticar then
   Reset;
  inherited;
end;

procedure TEditHora.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not ReadOnly then
  begin
    {48..57 = 0..9 }
    {96..105 = 0..9 lado numérico do teclado)
    {111 = / }
    if not (key in [48..57,96..105,111] + VK_LISTATECLAS) then
    begin
      Key := 0;
      MessageBeep(0)
    end;
  end;
end;

procedure TEditHora.KeyPress(var Key: Char);
begin
  if key = #13 then
    key := #0;

  inherited;

end;

{ TEditDiaMes }

procedure TEditDiaMes.Change;
var
  NC:    byte;
  Novo:  String;
begin
  inherited;
  if not ReadOnly then begin
    NC := 1;
    Novo := '';
    while NC <= Length(Text) do begin
       if Text[NC] in ['0'..'9',{DateSeparator} '/'] then
          Novo := Novo + Text[NC];
       Inc(NC);
    end;
    Text := Novo;
    Criticar;
    inherited Change;
  end;
end;

procedure TEditDiaMes.Click;
begin
  inherited;
  {
  if self.seltext='' then
    self.selectall;
    }

end;

constructor TEditDiaMes.Create(AOwner: TComponent);
begin
  inherited;
  EditMask := '99/99;1; ';
  Height := 18;
end;

function TEditDiaMes.Criticar: Boolean;

   function Vazio(Data: String): Boolean;
   var NP: Byte;
   begin
      NP := 1;
      while (NP <= Length(Data)) and
            not (Data[NP] in ['0'..'9']) do Inc(NP);
      Vazio := NP > Length(Data);
   end;

begin
  inherited;
  Result := True;
  if not Vazio(Text) then
    try
     if (trim(copy(Text,1,2))<>'0') or
        ((trim(copy(Text,1,2))<>'0') and (trim(copy(Text,4,2))<>'')) then
      if (trim(copy(Text,4,2))='') or (trim(copy(Text,4,2))='0') then
       StrToDate(copy(Text,1,3)+'01')
      else
       StrToDate(Text+'/2001');
    except on E: EConvertError do
    begin
      MessageDlg('Data Inválida !',mtWarning,[mbOk],0);
      Result := False;
    end;
    end
  else
    Result := True;
  FDataValida:= Result;
end;

procedure TEditDiaMes.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
end;

procedure TEditDiaMes.DoExit;
begin
  Color:= clWindow;
  if not ReadOnly and not Criticar then
  begin
    Reset;
//    SetFocus;
  end;
  inherited;
end;

procedure TEditDiaMes.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not ReadOnly then
  begin
    {48..57 = 0..9 }
    {96..105 = 0..9 lado numérico do teclado)
    {111 = / }
    if not (key in [48..57,96..105,111] + VK_LISTATECLAS) then
    begin
      Key := 0;
      MessageBeep(0)
    end;
  end;
end;

procedure TEditDiaMes.KeyPress(var Key: Char);
begin
  if key = #13 then
    key := #0;

  inherited;


end;

{ TEditDia }

procedure TEditDia.Change;
var
  NC:    byte;
  Novo:  String;
begin
  inherited;
  if not ReadOnly then begin
    NC := 1;
    Novo := '';
    while NC <= Length(Text) do begin
       if Text[NC] in ['0'..'9'] then
          Novo := Novo + Text[NC];
       Inc(NC);
    end;
    Text := Novo;
    Criticar((length(Novo)=2));
    inherited Change;
  end;
end;

procedure TEditDia.Click;
begin
  inherited;
  {
  if self.seltext='' then
    self.selectall;
    }

end;

constructor TEditDia.Create(AOwner: TComponent);
begin
  inherited;
  EditMask := '99;1; ';
  Height := 9;
  FDataFinal := datetostr(date());
end;

function TEditDia.Criticar(Mensagem: boolean): Boolean;
   function Vazio(Data: String): Boolean;
   var NP: Byte;
   begin
      NP := 1;
      while (NP <= Length(Data)) and
            not (Data[NP] in ['0'..'9']) do Inc(NP);
      Vazio := NP > Length(Data);
   end;

begin
  inherited;
  Result := True;
  if not Vazio(Text) then
    try
      strtodate(text+FormatDateTime('/mm/yyyy',strtodate(FDataFinal)));
    except on E: EConvertError do
    begin
      if Mensagem then
        MessageDlg('Dia Inválido !',mtWarning,[mbOk],0);
      Result := False;
    end;
    end
  else
    Result := True;
  FDataValida:= Result;
end;

procedure TEditDia.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
end;

procedure TEditDia.DoExit;
begin
  Color:= clWindow;
  if not ReadOnly and not Criticar(true) then
  begin
    Reset;
//    SetFocus;
  end;
  inherited;
end;

procedure TEditDia.KeyDown(var Key: Word; Shift: TShiftState);
begin

  inherited;

  if not ReadOnly then
  begin
    {48..57 = 0..9 }
    {96..105 = 0..9 lado numérico do teclado)
    {111 = / }
    if not (key in [48..57,96..105,111] + VK_LISTATECLAS) then
    begin
      Key := 0;
      MessageBeep(0)
    end;
  end;
end;

procedure TEditDia.KeyPress(var Key: Char);
begin
  if key = #13 then
    key := #0;

  inherited;

end;


{ TEditMes }

procedure TEditMes.Change;
var
  NC:    byte;
  Novo:  String;
begin
  inherited;
  if not ReadOnly then begin
    NC := 1;
    Novo := '';
    while NC <= Length(Text) do begin
       if Text[NC] in ['0'..'9'] then
          Novo := Novo + Text[NC];
       Inc(NC);
    end;
    Text := Novo;
    Criticar((length(Novo)=2));
    inherited Change;
  end;
end;

procedure TEditMes.Click;
begin
  inherited;
  {
  if self.seltext='' then
    self.selectall;
    }

end;

constructor TEditMes.Create(AOwner: TComponent);
begin
  inherited;
  EditMask := '99;1; ';
  Height := 9;
  FDataFinal := datetostr(date());
end;

function TEditMes.Criticar(Mensagem: boolean): Boolean;
   function Vazio(Data: String): Boolean;
   var NP: Byte;
   begin
      NP := 1;
      while (NP <= Length(Data)) and
            not (Data[NP] in ['0'..'9']) do Inc(NP);
      Vazio := NP > Length(Data);
   end;

begin
  inherited;
  Result := True;
  if not Vazio(Text) then
    try
      strtodate(FormatDateTime('dd/',strtodate(FDataFinal)) + text + FormatDateTime('/yyyy',strtodate(FDataFinal)));
    except on E: EConvertError do
    begin
      if Mensagem then
        MessageDlg('Mês incorreto !',mtWarning,[mbOk],0);
      Result := False;
    end;
    end
  else
    Result := True;
  FDataValida:= Result;
end;

procedure TEditMes.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
end;

procedure TEditMes.DoExit;
begin
  Color:= clWindow;
  if not ReadOnly and not Criticar(true) then
  begin
    Reset;
//    SetFocus;
  end;
  inherited;
end;

procedure TEditMes.KeyDown(var Key: Word; Shift: TShiftState);
begin

  inherited;

  if not ReadOnly then
  begin
    {48..57 = 0..9 }
    {96..105 = 0..9 lado numérico do teclado)
    {111 = / }
    if not (key in [48..57,96..105,111] + VK_LISTATECLAS) then
    begin
      Key := 0;
      MessageBeep(0)
    end;
  end;
end;

procedure TEditMes.KeyPress(var Key: Char);
begin
  if key = #13 then
    key := #0;

  inherited;

end;


end.
