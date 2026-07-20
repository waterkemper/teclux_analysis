{ ************************************************************************* }
{                                                                           }
{ Delphi and Kylix Cross-Platform Unit                                      }
{                                                                           }
{ Usefull Date  & Arithmetic Routines version 1.1                           }
{                                                                           }
{ This file may be distributed and/or modified under the terms of the GNU   }
{ General Public License (GPL) version 2 as published by the Free Software  }
{ Foundation.                                                               }
{                                                                           }
{ This file has no warranty and is used at the users own peril              }
{                                                                           }
{ Please report any bugs to jplevene@netscape.net or contact me if you want }
{ to contribute to this component.  It will be deemed a breach of copywrite }
{ if you publish any source code herein under your own name without the     }
{ authors consent!!!!!                                                      }
{                                                                           }
{ Designers:- Justin Levene (jplevene@netscape.net)                         }
{ ************************************************************************* }


UNIT Dates;

INTERFACE

USES SysUtils;

FUNCTION DateConvert(VAR y,m,d : WORD) : STRING;
{ This function converts 3 date Words into a LongDateFormat String }

FUNCTION DayString(ScalDate : TDateTime) : STRING;
{ This function obtains the the weekday as a string from a date }

FUNCTION DateString(ScalDate : TDateTime) : STRING;
{ This function returns the date in the LongDateFormat as a string from the
  date removing any leading spaces }

FUNCTION DateTimeTranslate(DateText : STRING; wFormat : STRING = '') : TDateTime;
{ This procedure translates the date from a string in a format
  into a date using the regional format in ShortDateFormat if no wFormat is
  passed.  Translates words any abreviations, works multilingual.  Will not create
  an exception on errors (if you want to, the code is shown inside a comment to
  raise an exception), just sets result to 0.  You can also get 1st of a month and year
  by passing DateTimeTranslate('February 1976', 'm y' or combinations of day month &
  year. Will also translate the time or even the date and time together in one string }

FUNCTION TodayString : STRING;
{ This function returns todays date as a string }

FUNCTION RoundNumber(R : EXTENDED; Decimals : BYTE) : EXTENDED;
{ This function rounds off an Extended number }

FUNCTION GetCurrencyValue(S : String) : DOUBLE;
{ Converts a currency string to currency, even with '£', ',' etc. in the string }

function PasToPChar(Source: String) : PChar;
{ Copy a Pascal string to a C string, allocating memory for Dest }
function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
IMPLEMENTATION

USES Types, Classes, Variants, Forms, DateUtils, StrUtils;

{ **************  CONVERT THE DATE FROM 3 INTEGERS TO A STRING  ************}

FUNCTION DateConvert(VAR y,m,d : WORD) : STRING;
BEGIN
     DateConvert := FormatDateTime(LongDateFormat, EncodeDate(y, m, d))
END;


{ *********  OBTAIN THE DAY OF THE WEEK FROM A SCALAR DATE  ***********}

FUNCTION DayString(ScalDate : TDateTime) : STRING;
BEGIN
     DayString := FormatDateTime('dddd', ScalDate)
END;


{ *************************  TRANSLATE THE DATE  **************************}

FUNCTION DateTimeTranslate(DateText : STRING; wFormat : STRING = '') : TDateTime;

VAR  Y, M, D : WORD;        { Global working variables }
     codevar : INTEGER;     { Global working integers }
     wDateChars : STRING;   { Current working chars in DateText }
     wFormatChars : STRING; { Current working chars in Format }
     Error : BOOLEAN;       { Error flag }
     fDay, fMonth, fYear : WORD;  { Date results }
     fHour, fMin, fSec, fMil : WORD; { Time results }

{ Seperators between day & month or hour & min, etc... }
CONST  Seperators : SET OF CHAR = [' ', '.', '-', '/', '\', ',', ';', ':'];

   { Find the position of next seperator }
   function SeperatorPos(Value : STRING) : INTEGER;
   var I : INTEGER;
   begin
        Result := 0;
        I := 1;
        WHILE (I <= LENGTH(Value)) AND (Result = 0) DO
        BEGIN
             IF Value[I] IN Seperators THEN
                Result := I;
             INC(I)
        END;
   end;

   { Get characters between seperators or upto end of string }
   FUNCTION GetChars(VAR Value : STRING) : STRING;
   begin
        { Erase any leading seperators }
        WHILE (LENGTH(Value) > 0) AND (Value[1] IN Seperators) DO
             DELETE(Value, 1, 1);  { Delete leading seperator }
        { Now get characters }
        IF SeperatorPos(Value) > 0 THEN
        begin
             { Get characters, in uppercase }
             Result := ANSIUpperCase(COPY(Value, 1, (SeperatorPos(Value) - 1)));
             { Delete used characters }
             DELETE(Value, 1, (SeperatorPos(Value) - 1));
        end
        else
        begin  { No more seperators, at end of string }
             Result := ANSIUpperCase(Value);
             Value := ''
        end;
   end;

BEGIN
     { Reset error flag }
     Error := FALSE;
     { Erase any text block quotes }
     WHILE ((POS('"', wFormat) > 0) OR (POS('''', wFormat) > 0)) AND
           NOT Error DO
     BEGIN  { Find block quote and delete it from format }
          IF POS('"', wFormat) > 0 THEN
          BEGIN
               { Get first index pos of quote }
               Y := POS('"', wFormat);
               { Get index pos of next quote }
               M := POSEX('"', wFormat, Y + 1);
               { Erase section only if in block quotes }
               IF M > Y THEN DELETE(wFormat, Y, M)
               ELSE Error := TRUE
          END;
          IF POS('''', wFormat) > 0 THEN
          BEGIN
               Y := POS('''', wFormat);
               M := POSEX('''', wFormat, Y + 1);
               IF M > Y THEN DELETE(wFormat, Y, M)
               ELSE Error := TRUE
          END
     END;
     { If nothing then work from ShortDateFormat }
     IF wFormat = '' THEN wFormat := ShortDateFormat;
     { Break down formats }
     wFormat := StringReplace(wFormat, 'DDDDDD', LongDateFormat, [rfReplaceAll, rfIgnoreCase]);
     wFormat := StringReplace(wFormat, 'DDDDD', ShortDateFormat, [rfReplaceAll, rfIgnoreCase]);
     wFormat := StringReplace(wFormat, 'C', ShortDateFormat, [rfReplaceAll, rfIgnoreCase]);
     wFormat := StringReplace(wFormat, 'TT', LongTimeFormat, [rfReplaceAll, rfIgnoreCase]);
     wFormat := StringReplace(wFormat, 'T', ShortTimeFormat, [rfReplaceAll, rfIgnoreCase]);
     { Uppercase for ease of comparissons }
     wFormat := ANSIUpperCase(wFormat);
     { Reset variables }
     fYear := 0;
     fMonth := 0;
     fDay := 0;
     fHour := 0;
     fMin := 0;
     fSec := 0;
     fMil := 0;
     { Loop 3 times; day, month ,year }
     WHILE NOT(Error) AND (LENGTH(wFormat) > 0)  AND (LENGTH(DateText) > 0) DO
     BEGIN
          { Get characters from DateText }
          wDateChars := GetChars(DateText);
          { Get Format chars }
          wFormatChars := GetChars(wFormat);

          { Is it a Year }
          IF POS('Y', wFormatChars) > 0 THEN
          begin
               VAL(wDateChars, fYear, codevar);    { convert to Integer }
               IF codevar > 0 THEN  Error := TRUE   { Is there an error? }
               ELSE
               BEGIN
                    { Is it a 2 digit year ? }
                    IF fYear < 100 THEN
                    begin
                         DecodeDate(Now, Y, M, D);
                         { Make M the year, excluding century }
                         M := (Y MOD 100);
                         { Make Y the century }
                         Y := Y DIV 100;
                         { If more than 50 years ago, then year in next century }
                         IF (fYear < M) AND ((fYear + 50) < M) THEN INC(Y, 1);
                         { If more than 50 years ahead, then year in last century }
                         IF (fYear > M) AND ((fYear - 50) > M) THEN DEC(Y, 1);
                         INC(fYear, Y * 100)
                    end;
               end;
          end;

          { Is it a day, also checks no 'ddd', etc which day of week }
          IF (POS('D', wFormatChars) > 0) AND (LENGTH(wFormatChars) < 3) THEN
          begin
               VAL(wDateChars, fDay, codevar);  { convert to Integer }
               IF codevar > 0 THEN  Error := TRUE;  { Is there an error? }
          end;

          { Is it a Month }
          IF POS('M', wFormatChars) > 0 THEN
          begin
               VAL(wDateChars, fMonth, codevar);  { convert to Integer }
               { Not a number so check for a word }
               IF codevar > 0 THEN
               BEGIN
                     FOR M := 1 TO 12 DO
                     BEGIN  { Compare the months }
                          D := POS(ANSIUpperCase(ShortMonthNames[M]),
                                   ANSIUpperCase(wDateChars));
                          { If short month name in word then Bingo }
                          IF D > 0 THEN fMonth := M;
                     END
               END
               ELSE  { Check for invalid number }
                   IF (fMonth > 12) OR (fMonth < 1) THEN fMonth := 0;
               { Has there been an error ??? }
               Error := fMonth = 0;
          end;

          { Is it an hour }
          IF POS('H', wFormatChars) > 0 THEN
          begin
               VAL(wDateChars, fHour, codevar);  { convert to Integer }
               IF codevar > 0 THEN  Error := TRUE;  { Is there an error? }
          end;

          { Is it a minute }
          IF POS('N', wFormatChars) > 0 THEN
          begin
               VAL(wDateChars, fMin, codevar);  { convert to Integer }
               IF codevar > 0 THEN  Error := TRUE;  { Is there an error? }
          end;

          { Is it a second }
          IF POS('S', wFormatChars) > 0 THEN
          begin
               VAL(wDateChars, fSec, codevar);  { convert to Integer }
               IF codevar > 0 THEN  Error := TRUE;  { Is there an error? }
          end;
          { Is it a millisecond }
          IF POS('Z', wFormatChars) > 0 THEN
          begin
               VAL(wDateChars, fMil, codevar);  { convert to Integer }
               IF codevar > 0 THEN  Error := TRUE;  { Is there an error? }
          end;
     END;
     IF Error THEN
     BEGIN
          Result := 0;
{ Next line is optional if you want an exception raised on errors }
{          raise EConvertError.Create('Not a valid date');}
     END
     ELSE
     BEGIN
          { Test to see if Year, Month & Day entered }
          IF (fMonth > 0) OR (fDay > 0) OR (fYear > 0) THEN
          BEGIN
               { No year, then set to current year }
               IF fYear = 0 THEN fYear := YearOf(Now);
               { No month, then set to January }
               IF fMonth = 0 THEN fMonth := 1;
               { No day, then set to firat }
               IF fDay = 0 THEN fDay := 1;
          END;
          IF fYear <> 0 THEN
             Result := EncodeDateTime(fYear, fMonth, fDay, fHour, fMin, fSec, fMil)
          ELSE Result := 0;
     END
END;

{ **************** Get the day, month and year *********************** }

FUNCTION DateString(ScalDate : TDateTime) : STRING;
var sDate : STRING;
BEGIN
     sDate := FormatDateTime(LongDateFormat, ScalDate);
     { Delete any leading spaces }
     WHILE sDate[1] = #32 DO Delete(sDate, 1, 1);
     Result := sDate
END;


{ ******************** Gets today as a string ********************** }

FUNCTION TodayString : STRING;
BEGIN
     TodayString := DateString(Now)
END;

{ Round a off a Extended number to a required amount of decimal places }
FUNCTION RoundNumber(R : EXTENDED; Decimals : BYTE) : EXTENDED;
var S : STRING;
begin
     STR(R:18:Decimals, S);
     RoundNumber := StrToFloat(S)
end;

{ Convert a currency string into a real number }
FUNCTION GetCurrencyValue(S : String) : DOUBLE;
BEGIN
     { Remove any currency symbols, ie £, $ etc. }
     WHILE POS(CurrencyString, S) > 0 DO
         Delete(S, POS(CurrencyString, S), LENGTH(CurrencyString));
     { Delete all commas }
     WHILE POS(ThousandSeparator, S) > 0 DO
           Delete(S, POS(ThousandSeparator, S), 1);
     { If nothing left, then make it 0 }
     IF (S = '.') OR (S = '-') OR (S = '-.') OR (S = '') THEN S := '0';
     GetCurrencyValue := StrToFloat(S)
END;

{ Copy and allocate memory for a PChar from a Pascal String }
function PasToPChar(Source: String) : PChar;
var Dest: PChar;
begin
     GetMem(Dest, LENGTH(Source) + 1);
     StrPCopy(Dest, Source);
     PasToPChar := Dest
end;
function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
var
  I,X: Integer;
  Len, LenSubStr: Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else
  begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do
    begin
      if S[I] = SubStr[1] then
      begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then
        begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;
    Result := 0;
  end;
end;


END.


