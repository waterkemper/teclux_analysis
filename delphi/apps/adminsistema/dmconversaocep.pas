unit dmconversaocep;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpquery, cpdatasource,
  //Repositorio
  dmbasico, ZTransact, ACBrBase, ACBrDFe, ACBrNFSe;

type
  TtecNotifyNewValue = procedure(Value: Integer) of object;
  TtecNotifyValue = procedure(Value: Integer) of object;
  TtecFunctionBoolean = function: Boolean of object;

   TDBFBufferCidades = packed Record                        {Layout do arquivo CEP_LOC.DBF}
      Case Byte of                          {fornecido pelos CORREIOS     }
      1: (DBFHeader: Record
             DBFNumeroTres:  Byte;
             DBFAnoArquivo:  Byte;
             DBFMesArquivo:  Byte;
             DBFDiaArquivo:  Byte;
             DBFNrRegistros: LongInt;
             DBFHeaderSize:  Word;
             DBFRecordSize:  Word;
             DBFFiller:      Array[1..150] of Char;
          End);
      2: (DBFLocal: Record
             DBFDeletado: Array[1..01] of Char;
             DBFCidade:   Array[1..45] of Char;
             DBFCep_8Dig: Array[1..08] of Char;
             DBFEstado:   Array[1..02] of Char;
             DBFTipo:     Array[1..01] of Char;
         End);
   End;

   TDBFBufferRuas = packed Record
      Case Byte of
      1: (DBFHeader: Record
             DBFNumeroTres:  Byte;
             DBFAnoArquivo:  Byte;
             DBFMesArquivo:  Byte;
             DBFDiaArquivo:  Byte;
             DBFNrRegistros: LongInt;
             DBFHeaderSize:  Word;
             DBFRecordSize:  Word;
             DBFFiller:      Array[1..246] of Char;
          End);
      2: (DBFLogradouro: Record
             DBFDeletado:    Array[1..01] of Char;
             DBFNomeRua:     Array[1..50] of Char;
             DBFCidade:      Array[1..60] of Char;
             DBFBairro:      Array[1..30] of Char;
             DBFCEP_8Dig:    Array[1..08] of Char;
             DBFEstado:      Array[1..02] of Char;
             DBFRuaAV:       Array[1..05] of Char;
             DBFComplemento: Array[1..45] of Char;
          End);
   End;

  TdtmConversaoCEP = class(TdtmBasico)
    qryCidades: TtecQuery;
    dsrCidades: TtecDataSource;
    dsrRuas: TtecDataSource;
    qryRuas: TtecQuery;
    qryBairros: TtecQuery;
    dsrBairros: TtecDataSource;
    dsrEstados: TtecDataSource;
    qryEstados: TtecQuery;
  private
    FOnNotifyNewValue: TtecNotifyNewValue;
    FOnBeforeStart: TtecNotifyValue;
    procedure Complemento(Complemento: String; var Lado, DaOnde,
      AteOnde: String);
  protected
    FConversaoCancelada: Boolean;
    FConvertendo:        Boolean;
    Posicao:             Integer;
    procedure DoNotifyNewValue(Value: Integer);
    procedure DoBeforeStart(Value: Integer);
    function  DoCancel: Boolean;

  public
    procedure ApagarBairros(const Estado, Cidade: String);
    procedure ApagarCidades(const Estado: String);
    procedure ApagarEstado(const Estado: String);
    procedure ApagarRuas(const Estado, Cidade: String);
    function ConverterCidades(NomeArquivo, Estado: String): boolean;
    function ConverterRuas(NomeArquivo, Estado, Cid: String): boolean;
    property OnNotifyNewValue: TtecNotifyNewValue read  FOnNotifyNewValue
                                                  write FOnNotifyNewValue;
    property OnBeforeStart: TtecNotifyValue read  FOnBeforeStart
                                               write FOnBeforeStart;
    property ConversaoCancelada: Boolean read FConversaoCancelada write FConversaoCancelada;
    property Convertendo:        Boolean read FConvertendo;
  end;

{  var
  dtmConversaoCEP: TdtmConversaoCEP; }

implementation

uses
  //Biblio
  ctconstantes, biblio;

{$R *.dfm}

procedure TdtmConversaoCEP.ApagarCidades(const Estado: String);
begin
  If Estado = '' Then begin
    QryCidades.Sql.Clear;
    QryCidades.Sql.Add('DELETE FROM cidades');
    QryCidades.ExecSql;
  end
  Else begin
    QryCidades.Sql.Clear;
    QryCidades.Sql.Add('DELETE FROM cidades WHERE estado = '''+Estado+'''');
    QryCidades.ExecSql;
  end;
end;

procedure TdtmConversaoCEP.ApagarEstado(const Estado: String);
begin
  If Estado = '' Then begin
    QryEstados.Sql.Clear;
    QryEstados.Sql.Add('DELETE FROM estados');
    QryEstados.ExecSql;
  end
  Else begin
    QryEstados.Sql.Clear;
    QryEstados.Sql.Add('DELETE FROM estados WHERE codigo = '''+Estado+'''');
    QryEstados.ExecSql;
  end;
end;

function TdtmConversaoCEP.ConverterCidades(NomeArquivo, Estado: String): boolean;
Var DBFFile:     File;
    DBFBuffer:   TDBFBufferCidades;
    Erro:        Integer;

    Function SemBranco(S: String): String;
    Var TM: Byte;
    begin
       TM := Length(S);
       While (TM > 0) and (S[TM]=' ') do Dec(TM);
       SemBranco := Copy(S,1,TM);
    end;


    Function CharString(Var Campo;
                            Tamanho: Byte): String;
    Var S:  String;
        NN: Byte;
        Vetor: Array[1..1] of Char Absolute Campo;
    Begin
       S := '';
       For NN:=1 to Tamanho do
          If not (Vetor[NN] in ['''']) Then
             S := S + Vetor[NN];
       S := SemBranco(S);
       CharString:= S;
    End; {CharString}


    Procedure AtualizarCidades;
    Var Codigo: Integer;
    Begin
       With DBFBuffer.DBFLocal do begin
         QryCidades.Sql.Clear;
         QryCidades.Sql.Add('SELECT codigo FROM cidades WHERE '+
            'estado = '''+CharString(DBFEstado,2)+''' and '+
            'nome = '''+CharString(DBFCidade,30) +''' FOR UPDATE');
         QryCidades.Active := True;
         If QryCidades.RecordCount = 0 Then Begin
            QryCidades.Sql.Clear;
            QryCidades.Sql.Add('SELECT cidades_proximocodigo('''+
                               CharString(DBFEstado,2)+''') AS codigo');
            QryCidades.Active := True;
            Codigo := QryCidades.FieldByName('codigo').Value;

            QryCidades.Sql.Clear;
            QryCidades.Sql.Add('INSERT INTO cidades (estado,codigo,nome,cep) VALUES ('''+
               CharString(DBFEstado,2)+''','+
               IntToStr(Codigo)+','''+
               CharString(DBFCidade,45) +''','+
               CharString(DBFCep_8Dig,8)+')');
            QryCidades.ExecSql;
         end
         Else begin
            Codigo := QryCidades.FieldByName('codigo').Value;

            QryCidades.Sql.Clear;
            QryCidades.Sql.Add('UPDATE cidades SET cep = '+
               CharString(DBFCep_8Dig,8)+
               ' WHERE estado = '''+CharString(DBFEstado,2)+
               ''' AND codigo = '+IntToStr(Codigo));
            QryCidades.ExecSql;
         end;
       end;
    End;

    Procedure AtualizarEstado;
    Begin
       With DBFBuffer.DBFLocal do begin
         dtmTecSoft.tstTecSoft.Commit;
         QryEstados.Sql.Clear;
         QryEstados.Sql.Add('SELECT codigo FROM estados WHERE codigo = '''+
                            CharString(DBFEstado,2)+''' FOR UPDATE');
         QryEstados.Active := True;
         If QryEstados.RecordCount = 0 Then Begin
            QryEstados.Sql.Clear;
            QryEstados.Sql.Add('INSERT INTO estados (codigo, nome) VALUES ('''+
                               CharString(DBFEstado,2)+''','''+
                               CharString(DBFEstado,2)+''')');
            QryEstados.ExecSql;
         End;
       End;
    End;

Var UltEstado: String[2];
    Tamanho:   Integer;
begin
{$I-}
    AssignFile(DBFFile, NomeArquivo);
    FileMode := 0;   {Somente Leitura}
    Reset(DBFFile,1);
{$I+}
    Erro := IOResult;
    If Erro = 0 Then With DBFBuffer do Begin
        BlockRead(DBFFile,DBFBuffer,SizeOf(DBFHeader));
        DoBeforeStart(DBFHeader.DBFNrRegistros);

        dtmTecSoft.tstTecSoft.Disconnect;
        dtmTecSoft.tstTecSoft.AutoCommit := False;
        dtmTecSoft.tstTecSoft.Connect;

        FConvertendo        := True;
        FConversaoCancelada := False;
        UltEstado := '';
        Posicao   := 0;
        While not DoCancel and not EOF(DBFFile) do With DBFLocal do Begin
           BlockRead(DBFFile,DBFBuffer,SizeOf(DBFLocal),Tamanho);
           If Tamanho = SizeOf(DBFLocal) Then begin
               Posicao := Posicao + 1;
               DoNotifyNewValue(Posicao);
               If (DBFDeletado = ' ') and (DBFTipo = 'M') Then Begin
                  If ((Estado = '') or (Estado = CharString(DBFEstado,2))) and
                     (CharString(DBFCidade,45) <> '')
                  Then begin
                     AtualizarEstado;
                     AtualizarCidades;
                  End;
                  UltEstado := CharString(DBFEstado,2);
               End;
           End;
           Application.ProcessMessages;
        End;
        If FConversaoCancelada Then
           dtmTecSoft.tstTecSoft.Rollback
        Else
           dtmTecSoft.tstTecSoft.Commit;
        dtmTecSoft.tstTecSoft.AutoCommit := True;
        FConvertendo := False;
{$I-}   CloseFile(DBFFile);
{$I+}   Erro := IOResult;
    End;
    Result := Erro = 0;
end;

function TdtmConversaoCEP.ConverterRuas(NomeArquivo, Estado, Cid: String): boolean;
Var DBFFile:     File;
    DBFBuffer:   TDBFBufferRuas;
    Erro:        Integer;
    Bairro:      Integer;
    Cidade:      Integer;


    Function SemBranco(S: String): String;
    Var TM: Byte;
    begin
       TM := Length(S);
       While (TM > 0) and (S[TM]=' ') do Dec(TM);
       SemBranco := Copy(S,1,TM);
    end;


    Function CharString(Var Campo;
                            Tamanho: Byte): String;
    Var S:  String;
        NN: Byte;
        Vetor: Array[1..1] of Char Absolute Campo;
    Begin
       S := '';
       For NN:=1 to Tamanho do
          If not (Vetor[NN] in ['''']) Then
             S := S + Vetor[NN];
       S := SemBranco(S);
       CharString:= S;
    End; {CharString}


    Procedure AtualizarRuas;
    Var Lado,
        DaOnde,
        AteOnde: String;
        Rua:     Integer;
    Begin
       With DBFBuffer.DBFLogradouro do If Cidade <> 0 Then begin
         QryRuas.Sql.Clear;
         QryRuas.Sql.Add('SELECT ruas_proximocodigo() AS codigo');
         QryRuas.Active := True;
         Rua := QryRuas.FieldByName('codigo').Value;

         Complemento(CharString(DBFComplemento,46),
                     Lado,DaOnde,AteOnde);
         QryRuas.Sql.Clear;
         QryRuas.Sql.Add('INSERT INTO ruas (estado,codigo,cidade,bairro,nomerua,cep,lado,daonde,ateonde,tipo) VALUES ('''+
               CharString(DBFEstado,2)+''','+
               IntToStr(Rua)+','+
               IntToStr(Cidade)+','+
               IntToStr(Bairro)+','''+
               CharString(DBFNomeRua,50) +''','+
               CharString(DBFCep_8Dig,8)+','+
               Lado+','+
               DaOnde+','+
               AteOnde+','''+
               CharString(DBFRuaAv,5)+''')');
         QryRuas.ExecSql;
       end;
    End;

    Procedure AtualizarBairros;
    Begin
       With DBFBuffer.DBFLogradouro do begin
         If Cidade <> 0 Then Begin
             QryBairros.Sql.Clear;
             QryBairros.Sql.Add('SELECT codigo FROM bairros WHERE '+
                                'estado = '''+CharString(DBFEstado,2)+''''+
                           ' AND cidade = '+IntToStr(Cidade)+
                           ' AND nome = '''+CharString(DBFBairro,30)+'''');
             QryBairros.Active := True;
             If QryBairros.RecordCount = 0 Then Begin
                QryCidades.Sql.Clear;
                QryCidades.Sql.Add('SELECT bairros_proximocodigo('''+
                                   CharString(DBFEstado,2)+''','+
                                   IntToStr(Cidade)+') AS codigo');
                QryCidades.Active := True;
                Bairro := QryCidades.FieldByName('codigo').Value;

                QryBairros.Sql.Clear;
                QryBairros.Sql.Add('INSERT INTO bairros (estado, cidade, codigo, nome, cep) VALUES ('''+
                                   CharString(DBFEstado,2)+''','+
                                   IntToStr(Cidade)+','+
                                   IntToStr(Bairro)+','''+
                                   CharString(DBFBairro,30)+''','+
                                   CharString(DBFCep_8Dig,8)+')');
                QryBairros.ExecSql;
             End
             Else
                Bairro := QryBairros.FieldByName('codigo').Value;
         End;
       End;
    End;

    Procedure AtualizarCidades(Novo: Boolean);
    Begin
       With DBFBuffer.DBFLogradouro do begin
         dtmTecSoft.tstTecSoft.Commit;
         QryCidades.Sql.Clear;
         QryCidades.Sql.Add('SELECT codigo FROM cidades WHERE '+
                            'estado = '''+CharString(DBFEstado,2)+''' AND ');
         If not Novo Then
            QryCidades.Sql.Add('codigo = '+IntToStr(Cidade))
         Else
            QryCidades.Sql.Add('nome = '''+CharString(DBFCidade,60)+'''');
         QryCidades.Sql.Add(' FOR UPDATE');
         QryCidades.Active := True;
         If QryCidades.RecordCount = 0 Then Begin
            MensagemErro(Format(ctNAOCADASTRAdO,['cidade',CharString(DBFCidade,60)]));
            Cidade := 0;
         End
         Else
            Cidade := QryCidades.FieldByName('codigo').Value;
       End;
    End;

Var UltEstado: String[2];
    UltCidade: String;
    UltBairro: String;
    Tamanho:   Integer;
begin
{$I-}
    AssignFile(DBFFile, NomeArquivo);
    FileMode := 0;   {Somente Leitura}
    Reset(DBFFile,1);
{$I+}
    Erro := IOResult;
    If Erro = 0 Then With DBFBuffer do Begin
        BlockRead(DBFFile,DBFBuffer,SizeOf(DBFHeader));

        DoBeforeStart(DBFHeader.DBFNrRegistros);

        Posicao := 0;

        dtmTecSoft.tstTecSoft.Disconnect;
        dtmTecSoft.tstTecSoft.AutoCommit := False;
        dtmTecSoft.tstTecSoft.Connect;

        FConvertendo        := True;
        FConversaoCancelada := False;
        UltEstado := '';
        UltCidade := '';
        UltBairro := '';
        While not DoCancel and not EOF(DBFFile) do With DBFLogradouro do Begin
           BlockRead(DBFFile,DBFBuffer,SizeOf(DBFLogradouro),Tamanho);
           If Tamanho = SizeOf(DBFLogradouro) Then begin
               Posicao := Posicao + 1;
               DoNotifyNewValue(Posicao);
               If (DBFDeletado = ' ') and
                  (CharString(DBFCidade,60) <> '') Then begin
                   If ((Estado = '') or
                       (Estado = CharString(DBFEstado,2))) and
                      ((Cid = '') or
                       (Cid = CharString(DBFCidade,60))) Then begin
                      AtualizarCidades((UltEstado <> CharString(DBFEstado,2)) or
                                       (UltCidade <> CharString(DBFCidade,60)));
                      If (UltEstado <> CharString(DBFEstado,2)) or
                         (UltCidade <> CharString(DBFCidade,60)) or
                         (UltBairro <> CharString(DBFBairro,30))Then
                         AtualizarBairros;
                      AtualizarRuas;
                   End;
                   UltEstado := CharString(DBFEstado,2);
                   UltCidade := CharString(DBFCidade,60);
                   UltBairro := CharString(DBFBairro,30);
               End;
           End;
           Application.ProcessMessages;
        End;
        If FConversaoCancelada Then
           dtmTecSoft.tstTecSoft.Rollback
        Else
           dtmTecSoft.tstTecSoft.Commit;
        dtmTecSoft.tstTecSoft.AutoCommit := True;
        FConvertendo := False;
{$I-}   CloseFile(DBFFile);
{$I+}   Erro := IOResult;
    End;
    Result := Erro = 0;
end;

procedure TdtmConversaoCEP.Complemento(Complemento: String;
                                       Var Lado:        String;
                                       Var DaOnde,
                                           AteOnde:     String);
Var X,PS:     Byte;
begin
//   Lado    := 'NULL';
   Lado    := '''X''';
   DaOnde  := 'NULL';
   AteOnde := 'NULL';
   If Length(Complemento) > 0 Then Begin
      While (Length(Complemento) > 0) and (Complemento[1] = ' ') do
         Delete(Complemento,1,1);
      If Pos('- LADO', Complemento) > 0 Then Begin
         If Pos('IMPAR', Complemento) > 0 Then Lado:= '''P'''
                                          Else Lado:= '''I''';
      End;
      If Pos('- DO KM', Complemento) > 0 Then Begin
         X := Pos('- DO KM',Complemento);
         PS:= X + 8;
         While (PS <= Length(Complemento)) and
               (Complemento[PS] <> ' ')    do Inc(PS);
         DaOnde:= ''''+Copy(Complemento, X+7, PS-X-7)+'''';
         Delete(Complemento,X,PS - X);

         If Pos(' AO KM', Complemento) > 0 Then Begin
            X:= Pos(' AO ',Complemento);
            PS:= X + 7;
            While (PS <= Length(Complemento)) and
                  (Complemento[PS] <> ' ')    do Inc(PS);
            AteOnde:= ''''+Copy(Complemento, X+4, PS-X-4)+'''';
            Delete(Complemento,X,PS - X);
         End;
      End;
      If Pos('- ATE KM', Complemento) > 0 Then Begin
         X := Pos('- ATE KM',Complemento);
         PS:= X + 10;
         While (PS <= Length(Complemento)) and
               (Complemento[PS] <> ' ')    do Inc(PS);
         AteOnde:= ''''+Copy(Complemento, X+6, PS-X-6)+'''';
         Delete(Complemento,X,PS - X);
      End;

      If Pos('- DE', Complemento) > 0 Then Begin
         X:= Pos('- DE ',Complemento);
         PS:= X + 5;
         While (PS <= Length(Complemento)) and
               (Complemento[PS] <> ' ')    do Inc(PS);
         DaOnde:= ''''+Copy(Complemento, X+5, PS-X-5)+'''';
         Delete(Complemento,X,PS - X);

         If Pos(' A ', Complemento) > 0 Then Begin
            X:= Pos(' A ',Complemento);
            PS:= X + 3;
            While (PS <= Length(Complemento)) and
                  (Complemento[PS] <> ' ')    do Inc(PS);
            AteOnde:= ''''+Copy(Complemento, X+3, PS-X-3)+'''';
            Delete(Complemento,X,PS - X);
         End;

         If Pos(' AO ', Complemento) > 0 Then Begin
            X:= Pos(' AO ',Complemento);
            PS:= X + 4;
            While (PS <= Length(Complemento)) and
                  (Complemento[PS] <> ' ')    do Inc(PS);
            AteOnde:= ''''+Copy(Complemento, X+4, PS-X-4)+'''';
            Delete(Complemento,X,PS - X);
         End;
      End;

      If Pos('- ATE', Complemento) > 0 Then Begin
         X := Pos('- ATE ',Complemento);
         PS:= X + 6;
         While (PS <= Length(Complemento)) and (Complemento[PS] <> ' ') do Inc(PS);
         AteOnde:= ''''+Copy(Complemento, X+6, PS-X-6)+'''';
         Delete(Complemento,X,PS - X);
      End;
   End;
end;

procedure TdtmConversaoCEP.DoBeforeStart(Value: Integer);
begin
  if Assigned(OnBeforeStart) then
    OnBeforeStart(Value)
end;

function TdtmConversaoCEP.DoCancel: Boolean;
begin
  if ConversaoCancelada then begin
    If MensagemConfirmacao(ctCANCELACONVERSAO) = smbOK Then
      Result := True
    Else begin
      Result := False;
      ConversaoCancelada := False;
    end
  end
  else
    Result := False;
end;

procedure TdtmConversaoCEP.DoNotifyNewValue(Value: Integer);
begin
  if Assigned(OnNotifyNewValue) then
    OnNotifyNewValue(Value)
end;

procedure TdtmConversaoCEP.ApagarBairros(const Estado, Cidade: String);
Var Geral: String;
begin
  QryBairros.Sql.Clear;
  QryBairros.Sql.Add('DELETE FROM bairros');
  If Estado <> '' Then begin
    QryBairros.Sql.Add('WHERE estado = '''+Estado+'''');
  end;
  If Cidade <> '' then Begin
    If Estado = '' Then
       Geral := 'WHERE'
    else
       Geral := 'AND';
    QryBairros.Sql.Add(Geral+' cidade in (SELECT codigo FROM cidades WHERE nome = '''+Cidade+''')');
  end;
  QryBairros.ExecSql;
end;

procedure TdtmConversaoCEP.ApagarRuas(const Estado, Cidade: String);
Var Geral: String;
begin
  QryRuas.Sql.Clear;
  QryRuas.Sql.Add('DELETE FROM ruas');
  If Estado <> '' Then begin
    QryRuas.Sql.Add('WHERE estado = '''+Estado+'''');
  end;
  If Cidade <> '' Then begin
    If Estado = '' Then
       Geral := 'WHERE'
    else
       Geral := 'AND';
    QryRuas.Sql.Add(Geral+' cidade in (SELECT codigo FROM cidades WHERE nome = '''+Cidade+''')');
  end;
  QryRuas.ExecSql;
end;

end.

