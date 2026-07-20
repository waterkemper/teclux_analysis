{********************************************************}
{                                                        }
{                                                        }
{                Biblioteca das impressoras              }
{                 fiscais Mecaf para Linux               }
{                                                        }
{                                                        }
{********************************************************}

unit bbmecaf;

interface

uses Classes, SysUtils, Libc;

    procedure CloseCif; cdecl;
    function OpenCif(Port: PChar): Integer; cdecl;
    function ImprimeValidacao(Leg, LinhaOp: PChar): Integer; cdecl;
    function ModoChequeValidacao(Tipo, Load: Char): Integer; cdecl;
    function ImprimeCheque(l1, c1, l2, c2, l3, c3, l4, l5, c5, l6, l7, c8: Char;
                           Valor, Favorecido, Local: PChar;
                           Setano: Char;
                           Data, Coment1, Coment2: PChar): Integer; cdecl;
    function CancelaChequeValidacao: Integer; cdecl;
    function AbreCupomFiscal: Integer; cdecl;
    function VendaItem(Fmt: Char; Qtd, punit, Tributo: PChar;
                       TDesc: Char;
                       Valor, Unidade, Codigo: PChar;
                       Ex: Char;
                       Descricao, LegendaOP: PChar):Integer; cdecl;
    function DescontoItem(Toper: Char; Valor, Legop: PChar): Integer; cdecl;
    function TotalizarCupom(Oper, Toper: Char; Valor, LegendaOP: PChar): Integer; cdecl;
    function TotalizarCupomParcial: Integer; cdecl;
    function PagamentoA(Reg, Vpagto: PChar; Subtr: Char): Integer; cdecl;
    function CancelamentoItem(Numitem: PChar): Integer; cdecl;
    function FechaCupomFiscalA(Tam_msg, Msg: PChar): Integer; cdecl;
    function CancelaCupomFiscal: Integer; cdecl;
    function LeituraX(relGer: Char): Integer; cdecl;
    function ReducaoZ(relGer: Char): Integer; cdecl;
    function LeMemFiscalData(Datai, Dataf: PChar; Res: Char): Integer; cdecl;
    function LeMemFiscalReducaoA(Redi, Redf: PChar; Res: Char): Integer; cdecl;
    function AbreCupomVinculado: Integer; cdecl;
    function AbreCupomNaoVinculado: Integer; cdecl;
    function EncerraCupomNaoFiscal: Integer; cdecl;
    function CancelaCupomNaoFiscal: Integer; cdecl;
    function OperRegNaoVinculadoA(Reg, Valor: PChar; Oper, Toper: Char;
                                  ValorOp, LegOp: PChar): Integer; cdecl;
    function ImprimeLinhaNaoFiscalA(Par: Char; Msg: PChar): Integer; cdecl;
    function ImprimeNaoFiscal(Par: Char; Msg: PChar): Integer; cdecl;
    function ProgramaLegenda(Eg, Leg: PChar): Integer; cdecl;
    function AbrirGaveta(Tipo, Ton, Toff: Char): Integer; cdecl;
    function ProgramaHorarioVerao(hv: Char): Integer; cdecl;
    function ImprimeTotalizadores(reg: PChar): Integer; cdecl;
    function TransTabAliquotas: Integer; cdecl;
    function TransTotCont: Integer; cdecl;
    function TransStatus(bittest: Integer; var bufStat: PChar): Integer; cdecl;
    function TransDataHora: Integer; cdecl;
    function EcfPar(par: PChar): Integer; cdecl;
    function ProgLinhaAdicional(reg: PChar): Integer; cdecl;
    function AjusteHora(dir: Char; hora: PChar): Integer; cdecl;
    function EcfID: Integer; cdecl;
    function ObtemRetorno(var bufret: String):Integer; cdecl;
    function ProgRelogio(hora, data: PChar): Integer; cdecl;
    function GravaDados(cgc, ie, ccm: PChar):Integer; cdecl;
    function RecompoeDadosNOVRAM: Integer; cdecl;
    function ProgAliquotas(tot, aliq: PChar): Integer; cdecl;
    function ProgSimbolo(s1, s2, s3, s4, s5, s6,
                         s7, s8, s9, s10, s11: Char): Integer;  cdecl;
    function ProgRazaoSocial(razsoc: PChar; numseq: PChar): Integer; cdecl;
    function Prog_Moeda(sing, plur: PChar): Integer; cdecl;
    function ProgArredondamento(par: Char): Integer; cdecl;
    function OpenPort(Port: PChar): Integer;
    function WritePort(Cmd: PChar): Integer;
    function ReadPort(var Buffer: String): Integer;
    procedure ClosePort;

{***************** Constantes da biblioteca  ****************}

const
  COMs: Array[1..15] of Pchar = ('/dev/ttyS0',  '/dev/ttyS1',  '/dev/ttyS2',  '/dev/ttyS3',
                                 '/dev/ttyS4',  '/dev/ttyS5',  '/dev/ttyS6',  '/dev/ttyS7',
                                 '/dev/ttyS8',  '/dev/ttyS9',  '/dev/ttyS10', '/dev/ttyS11',
                                 '/dev/ttyS12', '/dev/ttyS13', '/dev/ttyS14');
  STX  = #2;
  ETX  = #3;

{***************** Handlers da porta serial  ****************}

var
  ComPort: Integer;
  ComAttr: termios;

implementation

{****************** Funcoes da biblioteca  *****************}

function ImprimeValidacao(Leg, LinhaOp: PChar): Integer;
begin
  Result := WritePort(PChar('03' + Leg + LinhaOp));
end;

function ModoChequeValidacao(Tipo, Load: Char): Integer;
begin
  Result := WritePort(PChar('01' + Tipo + Load));
end;

function ImprimeCheque(l1, c1, l2, c2, l3, c3, l4, l5, c5, l6, l7, c8: Char;
Valor, Favorecido, Local: PChar; Setano: Char; Data, Coment1, Coment2: PChar): Integer;
begin
  Result := WritePort(PChar('02' + l1 + c1 + l2 + c2 + l3 + c3 + l4 + l5 + c5 + l6 + l7 + c8 +
                          Valor + Favorecido + Local + Setano + Data + Coment1 + Coment2));
end;

function CancelaChequeValidacao: Integer;
begin
  Result := WritePort(PChar('04'));
end;

function AbreCupomFiscal: Integer;
begin
  Result := WritePort(PChar('10'));
end;

function VendaItem(Fmt: Char; Qtd, punit, Tributo: PChar; TDesc: Char;
Valor, Unidade, Codigo: PChar; Ex: Char; Descricao, LegendaOP: PChar):Integer;
var
  Cmd: String;
begin
  if Fmt = '-' then
    Cmd := '11-'
  else
    Cmd := '11';
  if Trim(LegendaOP) <> '' then
    LegendaOP := PChar('#' + LegendaOP);
  Result := WritePort(PChar(Cmd + Qtd + Punit + Tributo + TDesc +
            Valor + Unidade + Codigo + Ex + Descricao + LegendaOP));
end;

function DescontoItem(Toper: Char; Valor, Legop: PChar): Integer;
begin
  Result := WritePort(PChar('09' + Toper + Valor + '#' + Legop));
end;

function TotalizarCupom(Oper, Toper: Char; Valor, LegendaOP: PChar): Integer;
begin
  if Trim(LegendaOP) <> '' then
    LegendaOP := PChar('#' + LegendaOP);
  if Oper = '@' then
    Result := WritePort(PChar('06' + Oper + Toper + Valor + LegendaOP))
  else
    Result := WritePort(PChar('06' + Toper + Valor + LegendaOP));
end;

function TotalizarCupomParcial: Integer;
begin
  Result := WritePort(PChar('05'));
end;

function PagamentoA(Reg, Vpagto: PChar; Subtr: Char): Integer;
begin
  Result := WritePort(PChar('07' + Reg + Vpagto + Subtr));
  Sleep(2000);
end;

function CancelamentoItem(Numitem: PChar): Integer;
begin
  Result := WritePort(PChar('12' + Numitem));
end;

function FechaCupomFiscalA(Tam_msg, Msg: PChar): Integer;
begin
  Result := WritePort(PChar('08' + Tam_msg + Msg));
end;

function CancelaCupomFiscal: Integer;
begin
  Result := WritePort(PChar('14'));
end;

function LeituraX(relGer: Char): Integer;
begin
  Result := WritePort(PChar('15' + relGer));
end;

function ReducaoZ(relGer: Char): Integer;
begin
  Result := WritePort(PChar('16' + relGer));
end;

function LeMemFiscalData(Datai, Dataf: PChar; Res: Char): Integer;
begin
  Result := WritePort(PChar('17' + Datai + Dataf));
end;

function LeMemFiscalReducaoA(Redi, Redf: PChar; Res: Char): Integer;
begin
  Result := WritePort(PChar('18' + Redi + Redf));
end;

function AbreCupomVinculado: Integer;
begin
  Result := WritePort(PChar('20'));
end;

function AbreCupomNaoVinculado: Integer;
begin
  Result := WritePort(PChar('22'));
end;

function EncerraCupomNaoFiscal: Integer;
begin
  Result := WritePort(PChar('21'));
end;

function CancelaCupomNaoFiscal: Integer;
begin
  Result := WritePort(PChar('25'));
end;

function OperRegNaoVinculadoA(Reg, Valor: PChar; Oper, Toper: Char;
ValorOp, LegOp: PChar): Integer;
begin
  Result := WritePort(PChar('23' + Reg + Valor + Oper + ValorOp + '#' + LegOp));
end;

function ImprimeLinhaNaoFiscalA(Par: Char; Msg: PChar): Integer;
begin
  Result := WritePort(PChar('26' + Par + Msg));
end;

function ImprimeNaoFiscal(Par: Char; Msg: PChar): Integer;
begin
  Result := WritePort(PChar('28' + Par));
end;

function ProgramaLegenda(Eg, Leg: PChar): Integer;
begin
  Result := WritePort(PChar('29' + Eg + Leg));
end;

function AbrirGaveta(Tipo, Ton, Toff: Char): Integer;
begin
  Result := WritePort(PChar('24' + Tipo + Ton + Toff));
end;

function ProgramaHorarioVerao(hv: Char): Integer;
begin
  Result := WritePort(PChar('27' + hv));
end;

function ImprimeTotalizadores(reg: PChar): Integer;
begin
  Result := WritePort(PChar('28' + reg));
end;

function TransTabAliquotas: Integer;
begin
  Result := WritePort(PChar('30'));
end;

function TransTotCont: Integer;
begin
  Result := WritePort(PChar('31'));
end;

function TransStatus(bittest: Integer; var bufStat: PChar): Integer;
var
  BufRet: String;
  BufFmt: Array [1..5] of Integer;
  cnt, stat, shift: Integer;
begin
  FillChar(BufFmt, sizeof(BufFmt), 0);
  Result := WritePort(PChar('32'));
  Sleep(5000);
  ObtemRetorno(BufRet);
  stat := 0;
  if Length(BufRet) > 5 then begin
    for cnt := 1 to 10 do begin
      if not Odd(cnt) then
        stat := stat shl 4;
      if BufRet[cnt + 5] in ['0'..'9'] then
        stat := stat + StrToInt(BufRet[cnt + 5])
      else
        stat := stat + (Ord(BufRet[cnt + 5]) - 55);
      if not Odd(cnt) then begin
        BufFmt[cnt div 2] := stat;
        stat := 0;
      end
    end
  end;
  BufRet := '';
  for cnt := 1 to 5 do
     for shift := 7 downto 0 do
       if ((BufFmt[cnt]) and (1 shl shift)) <> 0 then
         BufRet := BufRet + '1'
       else
         BufRet := BufRet + '0';
  if(bittest < 1) or (bittest > 40)then
    bufStat := PChar(BufRet)
  else
    bufStat := PChar(BufRet[bittest]);
end;

function TransDataHora: Integer;
begin
  Result := WritePort(PChar('33'));
end;

function EcfPar(par: PChar): Integer;
begin
  if Trim(par) = '' then
    Result := WritePort(PChar('34'))
  else
    Result := WritePort(PChar('34M' + par));
end;

function ProgLinhaAdicional(reg: PChar): Integer;
begin
  Result := WritePort(PChar('35' + reg));
end;

function AjusteHora(dir: Char; hora: PChar): Integer;
begin
  Result := WritePort(PChar('38' + dir + hora));
end;

function EcfID: Integer;
begin
  Result := WritePort(PChar('39'));
end;

function ProgRelogio(hora, data: PChar): Integer;
begin
  Result := WritePort(PChar('40' + hora + data));
end;

function GravaDados(cgc, ie, ccm: PChar):Integer;
begin
  Result := WritePort(PChar('41' + cgc + ie + ccm));
end;

function RecompoeDadosNOVRAM: Integer;
begin
  Result := WritePort(PChar('43'));
end;

function ProgAliquotas(tot, aliq: PChar): Integer;
begin
  Result := WritePort(PChar('46' + tot + aliq));
end;

function ProgSimbolo(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11: Char): Integer;
begin
  Result := 0;
end;

function ProgRazaoSocial(razsoc: PChar; numseq: PChar): Integer;
begin
  Result := WritePort(PChar('48' + razsoc + numseq));
end;

function Prog_Moeda(sing, plur: PChar): Integer;
begin
  Result := WritePort(PChar('49' + sing + plur));
end;

function ProgArredondamento(par: Char): Integer;
begin
  Result := WritePort(PChar('50' + par));
end;

procedure CloseCif;
begin
  ClosePort;
end;

function OpenCif(Port: PChar): Integer;
begin
  Result := OpenPort(Port);
end;

function ObtemRetorno(var bufret: String): Integer;
begin
  bufret := '';
  ReadPort(bufret);
  if bufret = '' then
    Result := 999
  else if bufret[1] in ['+', 'S'] then
    Result := 0
  else if bufret[1] = '-' then
    Result := StrToInt(bufret[1] + bufret[6] + bufret[7])
  else
    Result := 0     
end;

{***************** Funcoes internas  ****************}

function OpenPort(Port: PChar): Integer;
var
  tty : PChar;
  NP: Integer;
  Texto: String;
begin
   Texto:=Port;
   NP:= StrToInt(Copy(Texto,4,length(Texto)-3));
   tty:= COMs[NP];
   if tty='' then
    tty := PChar('/dev/ttyS0');
  ComPort := open(tty, O_RDWR or O_NOCTTY or O_NDELAY);
  tcgetattr(ComPort, ComAttr);
  with ComAttr do
  begin
    c_cflag := B9600 or CS8 or CREAD or CLOCAL;
    c_lflag := NOFLSH;
    c_iflag := IGNBRK or IXON or IXOFF or IXANY;
    c_oflag := 0;
    c_line  := '0';
    c_cc[VMIN] := '0';
    c_cc[VTIME] := '2';
    c_cc[VSTART] := STX;
    c_cc[VSTOP] := ETX;
  end;
  tcsetattr(ComPort, TCSANOW, ComAttr);
  Result := ComPort;
end;

function WritePort(Cmd: PChar): Integer;
const
  MAX_SIZE = 450;
var
  CmdSize, BufSize: Integer;
  Buffer: Array[0..MAX_SIZE] of Char;
begin
  CmdSize := Length(Cmd);
  BufSize := CmdSize + 4;
  Move(Cmd[0], Buffer[3], CmdSize);
  Buffer[0] := STX;
  Buffer[1] := #27;
  Buffer[2] := #36;
  Buffer[BufSize - 1] := ETX;
  tcflow(ComPort, TCOON);
  Result := __write(ComPort, Buffer, BufSize);
end;

function ReadPort(var Buffer: String): Integer;
var
  C: Char;
begin
  tcflow(ComPort, TCOOFF);
  Result := 0;
  while Result <> -1 do begin
   Result := __read(ComPort, C, 1);
   if Result <> -1 then
     Buffer := Buffer + C;
  end;
end;

procedure ClosePort;
begin
  __close(ComPort);
end;

end.
