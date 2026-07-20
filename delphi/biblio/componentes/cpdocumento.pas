unit cpdocumento;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, cptexto, ctconstantes;

type
  TTipoDocumento = (Identidade,InscricaoEstadual,InscricaoMunicipal);
  TEstado = String[2];
  TDBEditDocumento = class(TDBEditTexto)
  private
     pTipo:    TTipoDocumento;
     pEstado:  TEstado;
  protected
     function  CriticarInscricaoEstadual: Boolean;
     procedure DoEnter; override;
     procedure DoExit; override;
  public
     function  Criticar: Boolean;
  published
    property Tipo:   TTipoDocumento read pTipo   write pTipo;
    property Estado: TEstado        read pEstado write pEstado;
  end;

implementation

Uses
  //Biblio
  biblio;

procedure TDBEditDocumento.DoExit;
Begin
   Color:= clWindow;
   inherited;
//   If (Text <> '') and not Criticar Then
//      SetFocus;
End;

function TDBEditDocumento.CriticarInscricaoEstadual: Boolean;
Var HaErro:     Boolean;
    StrGeral:   String[25];
    Digito:     Array[0..25] of byte;
    Campo:      String[25] absolute Digito;
    Original:   String;
    Tamanho:    Byte;
    Digitos:    Byte;
    Limite:     Byte;
    Inicio:     Byte;
    Passo:      Integer;
    I,J:        Byte;
    Soma:       Integer;
    Multiplica: Integer;
Begin
   Limite := 0;
   Inicio := 0;
   Passo  := 0;
   Digitos:= 0;
   HaErro := False;
   If (Estado = 'SC') or
      (Estado = 'PR') or
      (Estado = 'RJ') or
      (Estado = 'ES') Then Begin
      Campo:= Trocar(Trocar(Trocar(Text,'.',''),'-',''),'/','');
      If Campo = 'ISENTO' Then Campo := '';
      Original := Campo;
      Tamanho := Length(Campo);
      If Tamanho <> 0 Then Begin
         HaErro := False;
         If (Estado = 'SC') Then Begin
            Digitos := 1; Limite := 10; Inicio := 9; Passo := -1;
            If (Tamanho <>  9) Then HaErro := True;
         End
         Else If (Estado = 'PR') Then Begin
            Digitos := 2; Limite := 7; Inicio := 2; Passo := 1;
            If (Tamanho <> 10) Then HaErro := True;
         End
         Else If (Estado = 'RJ') Then Begin
            Digitos:= 1; Limite:= 7; Inicio:= 2; Passo:= 1;
            If (Tamanho <> 8) Then HaErro:= True;
         End
         Else If (Estado = 'ES') Then Begin
            Digitos:= 1; Limite:= 9; Inicio:= 2; Passo:= 1;
            If (Tamanho <> 9) Then HaErro:= True;
         End;
         Dec(Tamanho,Digitos);

         If not HaErro Then For I:= 1 To Tamanho do Begin  {Converte para n£meros}
            Digito[I]:= Digito[I] and $0F;                 {e  verifica  se   sÆo}
            HaErro := HaErro or not (Digito[I] in [0..9]); {todos numerais.      }
         End;

         If not HaErro Then For I:= 1 To Digitos do Begin
            Soma       := 0;
            Multiplica := Inicio;
            For J:= Tamanho + I - 1 downto 1 do Begin
               Inc(Soma,Digito[J] * Multiplica);
               If Multiplica = Limite Then Multiplica := Inicio
               Else                        Inc(Multiplica,Passo);
            End;
            If Estado = 'SC' Then
               Soma := (Soma mod 11) mod 10
            Else
               If (Estado = 'PR') or (Estado = 'RJ') or
                  (Estado = 'ES') Then Begin
                  Soma := (11 - Soma mod 11);
                  If Soma > 9 Then
                     Soma := 0;
               End;
            Digito[Tamanho+I]:= Soma;
         End;

         If not HaErro Then Begin
            StrGeral := '';
            For I:=1 to Digitos do Begin
               StrGeral := StrGeral + Chr(Digito[Tamanho+I] or $30);
               HaErro := HaErro or
                         (Chr(Digito[Tamanho+I] or $30) <> Original[Tamanho+I]);
            End;
         End;
         If HaErro Then
         begin
            MensagemAviso('Inscrição Estadual Inválida!');
            if CanFocus then SetFocus;
         end;
      End;
   End;
   Result := not HaErro;
End;

function TDBEditDocumento.Criticar: Boolean;
Begin
   Case pTipo of
    Identidade:        Result := True;
    InscricaoMunicipal:Result := True;
    InscricaoEstadual: Result := CriticarInscricaoEstadual;
    Else               Result := False;
   End;
End;

procedure TDBEditDocumento.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
end;

end.
