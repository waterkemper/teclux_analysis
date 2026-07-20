unit frcmc7;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cpnumero, biblio, ctconstantes;

type
  TfraCMC7 = class(TFrame)
    gbxCMC7: TGroupBox;
    gbxLeitura: TGroupBox;
    gbxBanco: TGroupBox;
    edtCMC7: TEdit;
    edtBanco: TEditNumero;
    edtAgencia: TEditNumero;
    edtConta: TEditNumero;
    edtCheque: TEditNumero;
    gbxLeituraManual: TGroupBox;
    edtManual1: TEdit;
    edtManual2: TEdit;
    edtManual3: TEdit;
    gbxAgencia: TGroupBox;                                         
    gbxNrCheque: TGroupBox;
    gbxConta: TGroupBox;
    procedure edtCMC7Exit(Sender: TObject);
    procedure edtManual1Exit(Sender: TObject);
    procedure edtManual2Exit(Sender: TObject);
    procedure edtManual3Exit(Sender: TObject);
  protected
    FValido: Boolean;
    FNumero_1: String;
    FNumero_3: String;
    FNumero_2: String;
    function  GetChequeValido: Boolean;
    function  DigitoOk: Boolean;
    function  GetNumeroCheque: String;
  public
    procedure Desmembrar;
    procedure LimparCampos;
    function  ValidarCMC7: Boolean;
    property  NumeroCheque: String read GetNumeroCheque;
    property  ChequeValido: Boolean read GetChequeValido;
    property  Numero_1: String read FNumero_1 write FNumero_1;
    property  Numero_2: String read FNumero_2 write FNumero_2;
    property  Numero_3: String read FNumero_3 write FNumero_3;
  end;

implementation

{$R *.dfm}

procedure TfraCMC7.Desmembrar;
begin
  edtBanco.Text  := Copy(FNumero_1,1,03);
  edtAgencia.Text:= Copy(FNumero_1,4,04);
  edtConta.Text  := Copy(FNumero_3,2,10);
  edtCheque.Text := Copy(FNumero_2,4,06);
end;

function TfraCMC7.DigitoOk: Boolean;
var
  D1,D2,D3: Byte;
  Str: String;

  function Calculado(Numero: String): Byte;
  Var
    Fator,
    Digito,
    Mult,I : Byte;
    Soma   : Integer;
  begin
    Soma:= 0;
    Mult:= 2;
    for I:= Length(Numero) downto 1 do begin
      Fator:= Mult * (Ord(Numero[I]) and $0F);
      if Fator > 9 then Dec(Fator,9);
      Inc(Soma,Fator);
      if Mult = 2 then Mult:= 1
      else             Mult:= 2;
    end;
    Digito:= Soma mod 10;
    Digito:= 10 - Digito;
    if Digito = 10 then Digito:= 0;
    Calculado:= Digito;
  end;

begin
  Str:= FNumero_1;
  D2:= Ord(Str[08]) and $0F;
  Str:= FNumero_3;
  D1:= Ord(Str[01]) and $0F;
  D3:= Ord(Str[12]) and $0F;

  Result:= ((Calculado(Copy(FNumero_1,1,07)) <> D1) or
            (Calculado(Copy(FNumero_2,1,10)) <> D2) or
            (Calculado(Copy(FNumero_3,2,10)) <> D3));
  if Result then begin
    MensagemAviso(ctCHEQUEINVALIDO);
    edtCMC7.SetFocus
  end
  else
    Desmembrar;
end;

procedure TfraCMC7.edtCMC7Exit(Sender: TObject);
begin
  if (edtCMC7.Text <> '') then begin
    if (Length(edtCMC7.Text) = 34) then begin
      try
        if (Length(edtCMC7.Text) = 34) then begin
          FNumero_1:= Copy(edtCMC7.Text,2,8);
          FNumero_2:= Copy(edtCMC7.Text,11,10);
          FNumero_3:= Copy(edtCMC7.Text,22,12);
        end;
      finally
      end;
      if not ValidarCMC7 then begin
        FValido:= False;
        edtCMC7.SetFocus
      end;
    end
    else begin
      FValido:=False;
      edtCMC7.SetFocus;
    end;
  end;
//  else FValido:= False;
end;

procedure TfraCMC7.edtManual1Exit(Sender: TObject);
begin
  if (edtManual1.Text <> '') then begin
    if (Length(edtManual1.Text) = 8)  then
         FNumero_1:= edtManual1.Text
    else edtManual1.SetFocus;
  end
  else FValido:= False;
end;

procedure TfraCMC7.edtManual2Exit(Sender: TObject);
begin
  if (edtManual2.Text <> '') then begin
    if (Length(edtManual2.Text) = 10) then
         FNumero_2:= edtManual2.Text
    else edtManual2.SetFocus;
  end
  else FValido:= False;
end;

procedure TfraCMC7.edtManual3Exit(Sender: TObject);
begin
  if ((edtManual1.Text = '') and (edtManual2.Text = '') and (edtManual3.Text = '') and (edtCMC7.Text = '')) then
    edtCMC7.SetFocus
  else if (edtManual1.Text = '') then edtManual1.SetFocus
  else if (edtManual2.Text = '') then edtManual2.SetFocus
  else if (edtManual3.Text = '') then edtManual3.SetFocus
  else if (Length(edtManual3.Text) = 12) then begin
    FNumero_3:= edtManual3.Text;
    if not ValidarCMC7 then
      edtManual1.SetFocus;
  end
  else edtManual3.SetFocus;
end;

function TfraCMC7.GetChequeValido: Boolean;
begin
  Result := FValido;
end;

function TfraCMC7.GetNumeroCheque: String;
begin
  Result:= FNumero_1 + FNumero_2 + FNumero_3;
end;

procedure TfraCMC7.LimparCampos;
begin
  FNumero_1:= '';
  FNumero_2:= '';
  FNumero_3:= '';
  edtCMC7.Clear;
  edtManual1.Clear;
  edtManual2.Clear;
  edtManual3.Clear;
  edtBanco.Clear;
  edtAgencia.Clear;
  edtConta.Clear;
  edtCheque.Clear;
  FValido:= False;
//  if edtCMC7.CanFocus then
//    edtCMC7.SetFocus;
end;

function TfraCMC7.ValidarCMC7: Boolean;
begin
  if Length(NumeroCheque) > 0 then
       Result:= not DigitoOK
  else Result:= False;
  FValido:= Result;
end;



end.
