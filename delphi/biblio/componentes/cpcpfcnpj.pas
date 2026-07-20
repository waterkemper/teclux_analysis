unit cpcpfcnpj;

interface

uses
  Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, biblio, ctconstantes, {Qete,} Windows,
  SysUtils, db;

type
  TDBEditCPFCNPJ = class(TDBEdit)
  private
    FTamanho: Word;
    FTipo: String;
    FOnChangeTipo: TNotifyEvent;
    FPressionadoEscape: Boolean;
    procedure SetTipo(const Value: String);
  protected
    procedure DoChangeTipo; virtual;
    procedure DoExit; override;
    procedure Resize; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Change; override;
    procedure Loaded; override;
    procedure DoEnter; override;
    property PressionadoEscape: Boolean read FPressionadoEscape write FPressionadoEscape;
  public
    constructor  Create(AOwner: TComponent); override;
    function  Criticar(Mostrar: Boolean): Boolean;
  published
    property Tamanho:     Word    read FTamanho  write FTamanho;
    property Tipo: String read FTipo write SetTipo;
    property OnChangeTipo: TNotifyEvent read FOnChangeTipo write FOnChangeTipo;
  end;


implementation

{ TDBEditCPFCNPJ }

procedure TDBEditCPFCNPJ.Change;
var
  NC:    byte;
  Novo:  string;
begin
   if Trim(Text) <> '' then begin
     if Assigned(Field) then begin
       if Field.EditMask = '' then
         if FTipo = 'F' then      Field.EditMask:= MascaraPessoaFisica_
         else if FTipo = 'J' then Field.EditMask:= MascaraPessoaJuridica_;
     end;
     NC:=1;
     Novo := '';
     While NC <= Length(Text) do begin
        If Text[NC] in ['0'..'9','-','.','/'] Then
           Novo := Novo + Text[NC];
        Inc(NC);
     end;
     if Novo<>Text then
       Text := Novo;
   end
   else
     Text := '';
  inherited;
end;

constructor TDBEditCPFCNPJ.Create(AOwner: TComponent);
begin
  inherited;
  FTipo:= 'J';
  MaxLength := 14;
  Height := 23;
end;

function TDBEditCPFCNPJ.Criticar(Mostrar: Boolean): Boolean;

  function CriticarCPF: Boolean;
  Var Texto:     Array[1..11] of Byte;
      Digito,ND: Byte;
      CPF:       Int64;
  begin
     CPF := StrToInt64(Text);
     for ND:=11 downto 1 do Begin
        Texto[ND] := CPF mod 10;
        CPF := CPF div 10;
     end;
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
           if Mostrar then
             MensagemAviso('CPF Inválido !');
           Result := False;
        End;
     End
     Else Begin
        if Mostrar then
          MensagemAviso('CPF Inválido !');
        Result := False;
     End;
  End;

  function CriticarCNPJ: Boolean;
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
           if Mostrar then
             MensagemAviso('CNPJ Inválido !');
           Result := False;
        End;
     End
     Else Begin
        if Mostrar then
          MensagemAviso('CNPJ Inválido !');
        Result := False;
     End;
  End;

begin
  Result:= True;
  if Length(Trim(Text)) > 0 then
  begin
    if FTipo = 'J' then
      Result:= CriticarCNPJ
    else if FTipo = 'F' then
      Result:= CriticarCPF;
  end
  else
    if DataSource.DataSet.FieldByName(Field.fieldName).required then
    begin
      result := false;
      if FTipo = 'J' then
        MensagemAviso('CNPJ Inválido !')
      else if FTipo = 'F' then
        MensagemAviso('CPF Inválido !')
    end;

end;

procedure TDBEditCPFCNPJ.DoChangeTipo;
begin
  if Assigned(OnChangeTipo) then
    OnChangeTipo(Self)
end;

procedure TDBEditCPFCNPJ.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;

//  If Tamanho = 0 Then
    Tamanho := Byte(MaxLength);

  self.SelStart := 0;
end;

procedure TDBEditCPFCNPJ.DoExit;
begin
  inherited;
  Color := clWindow;
  If not PressionadoEscape and
     (trim(Text) <> '') and not (Criticar(True)) Then
    if CanFocus then
      SetFocus;
  PressionadoEscape := false;
end;

procedure TDBEditCPFCNPJ.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  If (Key in [32..255])
     and (((Tamanho > 0) and (Length(text)-SelLength >= Tamanho)) or
          ((GetCharFromVirtualKey(Key)<>'') and
          not (GetCharFromVirtualKey(Key)[1] in ['0'..'9']))  ) Then
   Begin
     Key := 0;
     Beep;
   End;
   
   if key = VK_ESCAPE then
     PressionadoEscape := true;
end;

procedure TDBEditCPFCNPJ.Loaded;
begin
//  inherited Loaded;
//    Field.EditMask:= MascaraPessoaJuridica;
end;

procedure TDBEditCPFCNPJ.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

procedure TDBEditCPFCNPJ.SetTipo(const Value: String);
begin
{
  if Assigned(Field) then
    if (FTipo <> Value) or
       (Field.EditMask='') then
    begin
      FTipo:= Value;
      if Assigned(Field) then
      begin
        if FTipo = 'F' then
          Field.EditMask := MascaraPessoaFisica
        else
        if FTipo = 'J' then
          Field.EditMask := MascaraPessoaJuridica;
      end;
      DoChangeTipo;
    end;
    }

  if Assigned(DataSource) then
    if Assigned(DataSource.DataSet.FieldByName(DataField)) then
      if (FTipo <> Value) or
         (DataSource.DataSet.FieldByName(DataField).EditMask='') then
      begin
        FTipo:= Value;
        if Assigned(DataSource.DataSet.FieldByName(DataField)) then
        begin
          if FTipo = 'F' then
          begin
//            if DataSource.DataSet.FieldByName(DataField).EditMask <> MascaraPessoaFisica then
            if Field.EditMask <> MascaraPessoaFisica_ then
            begin
              Field.EditMask := MascaraPessoaFisica_;
            end;
{
              if (DataSource.DataSet.state in [dsedit, dsinsert]) then
                DataSource.DataSet.FieldByName(DataField).EditMask := MascaraPessoaFisica
}

          end
          else
          if FTipo = 'J' then
          begin
//            if DataSource.DataSet.FieldByName(DataField).EditMask <> MascaraPessoaJuridica then
            if Field.EditMask <> MascaraPessoaJuridica_ then
            begin
//              TStringField(self.Field).EditFormat := '';
//              TStringField(self.Field).DisplayFormat := '00000000000000';
              Field.EditMask := MascaraPessoaJuridica_;
            end;
{              if DataSource.DataSet.state in [dsedit, dsinsert] then
                DataSource.DataSet.FieldByName(DataField).EditMask := MascaraPessoaJuridica;
                }
          end;
        end;
        DoChangeTipo;
      end;

end;

end.
