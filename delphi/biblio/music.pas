unit MUSIC;
Interface
Uses Windows, Classes, Forms;

Procedure PlaySong (TuneString:string);
Const BaseOctave: Integer = 0;
Implementation
Const SharpOffset = 60; { Frequencias das notas }
Const PitchArray: Array[1..120] of Word = ( 28, 31, 33, 37, 41, 44, 49, 55,
62, 65, 73, 82, 87, 98, 110, 123, 131, 147,
165, 175, 196, 220, 247, 262, 294, 330, 349, 392, 440, 494, 523, 587, 659,
698, 784, 880, 988, 1047, 1175, 1319, 1397,
1568, 1760, 1976, 2093, 2349, 2637, 2794, 3136, 3520, 3951, 4186, 4699,
5274, 5588, 6272, 32139, 9738, 1934,
39659, 29, 33, 35, 39, 44, 46, 52, 58, 65, 69, 78, 87, 92, 104, 117, 131,
139, 156, 175, 185, 208, 233, 262, 277, 311,
349, 370, 415, 466, 523, 554, 622, 698, 740, 831, 932, 1047, 1109, 1245,
1397, 1480, 1661, 1865, 2093, 2217, 2489,
2794, 2960, 3322, 3729, 4186, 4435, 4978, 5588, 5920, 6645, 35669, 33772,
1772, 18119);
Const Octave: Integer = 3; {Teceira Oitava - Inicia com meio C}
GenNoteType: Integer = 4; {Quartas da nota}
Tempo: Integer = 120; {120 batidas por minuto}
PlayFrac: Byte = 7; {Normal - nota dura 7/8 do tempo}
Var vq: LongInt; TmpPitch: LongInt;
{ Grava um valor na porta de som }

procedure SetPort(address, value: Word);
var bValue: Byte;
begin
bValue := trunc(value and 255);
asm
MOV DX, address
MOV AL, bValue
OUT DX, AL
end;
end;


{ Pega o valor na porta de som }
function GetPort(address: Word): Word;
var bValue: Byte;
begin
asm
MOV DX, address
in AL, DX
MOV bValue, AL
end;
result := bValue;
end;
{ Encerra o som }
procedure NoSound;
var wValue: Word;
begin
wValue := GetPort($61);
wValue := wValue and $FC;
SetPort($61, wValue);
end;
{Gera um som com a frequencia informada }
procedure Sound(Freq: Word);
var B: Word;
begin
if Freq > 18 then
begin
Freq := Word(1193181 div LongInt(Freq));
B := GetPort($61);
if (B and 3) = 0 then
begin
SetPort($61, B or 3);
SetPort($43, $B6);
end;
SetPort($42, Freq);
SetPort($42, (Freq SHR Cool);
end;
end;
{Da uma pausa por x msegundos }
procedure Delay(MSecs: Integer);
var FirstTickCount : LongInt;
begin
FirstTickCount:=GetTickCount;
repeat
Application.ProcessMessages;
until ((GetTickCount-FirstTickCount) >= LongInt(MSecs));
end;
{Executa uma string no padrão musical PLAY do basic }
Procedure PlaySong (TuneString:string);
Var PlayTime: LongInt; IdleTime: LongInt; DotTime: LongInt; NoteTime :
LongInt; NoteType: Integer; PitchIndex: Integer;
Position: Integer; Number : Integer; Code: Integer; TuneStrLen: Integer;
Character: Char; PlayDone: Boolean;
Procedure NVal(Pos:integer; var v, code: integer);
Var Posn:integer;
Begin
v := 0;
posn := Pos;
while (posn <= TuneStrLen) and (TuneString[posn] in [\'0\'..\'9\']) do
Begin
v := v*10 + ord(TuneString[posn]) - ord (\'0\');
Inc(posn);
End;
code := posn - Pos + 1;
End;
Procedure CheckDots; {Existe ponto apos a nota?}
Begin
While (Position <= TuneStrLen) and (TuneString[Position] = \'.\') do
Begin
DotTime := DotTime + DotTime div 2;
inc(Position)
End;
End;
Begin
PlayDone := False;
TuneStrLen := length(TuneString);
Position := 1;
Repeat NoteType := GenNoteType;
DotTime := 1000;
Character := upcase(TuneString[Position]);
Case Character Of
\'A\'..\'G\' :
Begin PitchIndex := (ord(Character)-64)+Octave*7;
If (Character=\'A\') or (Character=\'B\') Then
PitchIndex := PitchIndex + 7;
inc(Position); {Bemol ou sustenido?}
if Position <= TuneStrLen then
case TuneString[Position] of
\'#\',\'+\':
begin
PitchIndex := PitchIndex+SharpOffset;
inc(Position);
end;
\'-\':
begin
PitchIndex :=PitchIndex+SharpOffset - 1;
inc(Position);
end;
End;
if (Position <= TuneStrLen) and (TuneString[Position] in
[\'0\'..\'9\']) then
begin
NVal(Position,NoteType,Code);
inc(Position, Code - 1)
end;
CheckDots; {Toca a nota}
NoteTime := Round(DotTime/Tempo/NoteType*240);
PlayTime := Round(NoteTime*PlayFrac/Cool;
IdleTime := NoteTime-PlayTime;
Sound(PitchArray[PitchIndex]);
Delay(PlayTime);
if IdleTime <> 0 then
begin
NoSound;
Delay(IdleTime)
end;
End;
\'L\' :{Duracao 1 - 64 }
Begin
NVal (Position+1,GenNoteType,Code);
if (GenNoteType < 1) or (GenNoteType > 64) then
GenNoteType := 4;
inc(Position, Code);
End;
\'M\' : {"S" staccato,"L" legato,"N" normal.}
Begin
if Position < TuneStrLen then
begin
Case upcase(TuneString[Position+1]) Of
\'S\' : PlayFrac := 6;
\'N\' : PlayFrac := 7;
\'L\' : PlayFrac := 8;
End;
inc(Position,2);
end;
End;
\'O\' :
Begin
NVal (Position+1,Octave,Code);
Octave := Octave+BaseOctave;
if Octave > 7 then
Octave := 3;
inc(Position, Code);
End;
\'P\' :
Begin
NoSound;
NVal (Position+1,NoteType,Code);
if (NoteType < 1) or (NoteType > 64)then
NoteType := GenNoteType;
inc(Position, Code);
CheckDots;
IdleTime := DotTime Div Tempo * (240 Div NoteType);
Delay (IdleTime);
End;
\'T\' : {Tempo - number de batidas por minuto (32 - 255)}
Begin
NVal (Position+1,Tempo,Code);
if(Tempo < 32) or (Tempo > 255) then
Tempo := 120;
inc(Position, Code);
End;
Else
inc(Position); {Ignora caracteresespurios}
End;
Until ((Position > TuneStrLen) Or (PlayDone));
NoSound;
End;
End.
