unit dmcadastroperguntas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery;

type
  TdtmCadastroPerguntas = class(TdtmBasico)
    qryPerguntas: TtecQuery;
    qryPerguntascodigo: TIntegerField;
    qryPerguntasenunciado: TStringField;
    qryPerguntascomplementos: TStringField;
    qryPerguntasmaximo: TIntegerField;
    qryPerguntasminimo: TIntegerField;
    qryPerguntasordem: TIntegerField;
    qryPerguntastipo: TStringField;
    qryPerguntasvalida: TBooleanField;
    dsrPerguntas: TtecDataSource;
    qryOpcoesPerguntas: TtecQuery;
    qryOpcoesPerguntaspergunta: TIntegerField;
    qryOpcoesPerguntascodigo: TIntegerField;
    qryOpcoesPerguntasopcao: TStringField;
    dsrOpcoesPerguntas: TtecDataSource;
    qryConsultaPerguntas: TtecQuery;
    qryConsultaPerguntasenunciado: TStringField;
    qryConsultaPerguntascodigo: TIntegerField;
    qryConsultaMaximoMinimo: TtecQuery;
    qryConsultaMaximoMinimomaximo: TIntegerField;
    qryConsultaMaximoMinimominimo: TIntegerField;
    qryCodigoProximaPergunta: TtecQuery;
    qryCodigoProximaPerguntacodigo: TIntegerField;
    qryMaxNrOpcoes: TtecQuery;
    qryMaxNrOpcoesmax: TIntegerField;
    { Pergunta }
    procedure qryPerguntasNewRecord(DataSet: TDataSet);
    procedure qryPerguntasAfterScroll(DataSet: TDataSet);
    { Opcoes Perguntas }
    procedure qryOpcoesPerguntasBeforeInsert(DataSet: TDataSet);
    procedure qryOpcoesPerguntasBeforeDelete(DataSet: TDataSet);
  protected
    FNROpcoes: Integer;
    function GetTabelaConsultaPergunta: TtecQuery;
    function GetTabelaPerguntas: TtecQuery;
    procedure SetNROpcoes(const Value: Integer);
  public
    { Pergunta }
    function  BuscaTipoPergunta:String;
    procedure SetarTipoPergunta(Tipo:String);
    function  IncluirPerguntas : Boolean;
    function  GravarPerguntas  : Boolean;
    function  ExcluirPerguntas : Boolean;
    procedure PosicionarPergunta;
    function  ExistePergunta(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
    { OpçõesPerguntas }
    procedure ExcluirMaximoMinimo;
    function  ExcluirOpcoesPerguntas(Todas:Boolean):Boolean;
    function  ExisteOpcoesPerguntas: Boolean;
    function  IncluirOpcoesPerguntas:Boolean;

    constructor Create(AOwner: TComponent); override;
    property  NROpcoes: Integer read FNROpcoes write SetNROpcoes;
    property  TabelaConsultaPergunta: TtecQuery read GetTabelaConsultaPergunta;
    property  TabelaPerguntas: TtecQuery read GetTabelaPerguntas;
  end;

var
  dtmCadastroPerguntas: TdtmCadastroPerguntas;

implementation

{$R *.dfm}

uses ctConstantes,
     biblio,
     dmtecsoft;

{ TdtmCadastroPerguntas }

constructor TdtmCadastroPerguntas.Create(AOwner: TComponent);
begin
  inherited;
  qryPerguntas.Tag             := ctCadastroPerguntas;
  qryOpcoesPerguntas.Tag       := ctCadastroPerguntas;
  qryConsultaPerguntas.Tag     := ctTabelasConsultaPerguntas;
end;

{ ========================== PERGUNTAS ===========================}

function TdtmCadastroPerguntas.BuscaTipoPergunta: String;
begin
  Result:= qryPerguntastipo.AsString;
end;

procedure TdtmCadastroPerguntas.ExcluirMaximoMinimo;
begin
  qryPerguntasmaximo.AsInteger:= 0;
  qryPerguntasminimo.AsInteger:= 0;
end;

function TdtmCadastroPerguntas.ExcluirPerguntas: Boolean;
begin
  if not qryPerguntas.IsEmpty then begin
    qryPerguntas.Delete;
    Perpetrar([qryOpcoesPerguntas,qryPerguntas]);
  end;
  Result:=True;
end;

function TdtmCadastroPerguntas.ExistePergunta(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaPerguntas, NomeCampo, Value)
end;

function TdtmCadastroPerguntas.GetTabelaConsultaPergunta: TtecQuery;
begin
  Result := qryConsultaPerguntas;
end;

function TdtmCadastroPerguntas.GetTabelaPerguntas: TtecQuery;
begin
  Result := qryPerguntas;
end;

function TdtmCadastroPerguntas.GravarPerguntas: Boolean;
var
  a:integer;
Begin
  if qryOpcoesPerguntas.IsEmpty and (qryPerguntastipo.AsString = 'O') then begin
    MensagemAviso(ctOPCOESPERGUNTASVAZIO);
    Result := False
  end else begin
    if qryPerguntas.State in [dsInsert] then begin
       qrycodigoproximapergunta.Open;
       qryPerguntascodigo.value := qrycodigoproximaperguntacodigo.value;
       qrycodigoproximapergunta.Close;
    end;

    qryOpcoesPerguntas.First;
    for a:= 1 to qryOpcoesPerguntas.RecordCount do begin
      if (qryOpcoesPerguntascodigo.AsInteger = 0) then begin
        FNROpcoes:= FNROpcoes + 1;
        qryOpcoesPerguntas.Edit;
        qryOpcoesPerguntaspergunta.AsInteger := qryPerguntascodigo.AsInteger;
        qryOpcoesPerguntascodigo.AsInteger   := FNROpcoes;
      end;
      qryOpcoesPerguntas.Next;
    end;

    Perpetrar([qryPerguntas,qryOpcoesPerguntas]);
    ReFazConsulta(qryOpcoesPerguntas,[0],[qryPerguntascodigo.AsInteger]);
    Result:=True
  end
end;

function TdtmCadastroPerguntas.IncluirPerguntas: Boolean;
begin
  qryPerguntas.Insert;
  Result:=True;
end;

procedure TdtmCadastroPerguntas.PosicionarPergunta;
begin
  qryPerguntas.Close;
  qryOpcoesPerguntas.Close;
  qryPerguntas.Params[0].AsInteger := qryConsultaPerguntasCodigo.AsInteger;
  qryPerguntas.Open;
  qryOpcoesPerguntas.Open
end;

procedure TdtmCadastroPerguntas.qryPerguntasAfterScroll(DataSet: TDataSet);
begin
  ReFazConsulta(qryOpcoesPerguntas, [0], [qryPerguntasCodigo.AsInteger]);
end;

procedure TdtmCadastroPerguntas.qryPerguntasNewRecord(DataSet: TDataSet);
begin
  qryPerguntasTipo.Value       := 'O';
  qryPerguntasValida.Value     := True;
end;

procedure TdtmCadastroPerguntas.SetarTipoPergunta(Tipo: String);
begin
  qryPerguntas.Edit;
  qryPerguntastipo.AsString:= Tipo;
end;

procedure TdtmCadastroPerguntas.SetNROpcoes(const Value: Integer);
begin
  if FNROpcoes <> Value then
     FNROpcoes := Value;
end;

{ ========================== OPCOES PERGUNTAS ===========================}

function TdtmCadastroPerguntas.ExcluirOpcoesPerguntas(Todas: Boolean): Boolean;
var
  a:Integer;
begin
  if Todas then begin
    if not qryOpcoesPerguntas.IsEmpty then begin
      qryOpcoesPerguntas.First;
      for a:= 1 to qryOpcoesPerguntas.RecordCount do begin
        qryOpcoesPerguntas.Delete;
        qryOpcoesPerguntas.Next;
      end;
    end;
  end
  else
    if not qryOpcoesPerguntas.IsEmpty then begin
      if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, [ctINFORMACAO])) = smbOk then
         qryOpcoesPerguntas.Delete;
    end;
  Result:= True;
end;

function TdtmCadastroPerguntas.ExisteOpcoesPerguntas: Boolean;
begin
  Result:= not qryOpcoesPerguntas.IsEmpty;
end;

function TdtmCadastroPerguntas.IncluirOpcoesPerguntas: Boolean;
begin
  if not (qryOpcoesPerguntas.State in [dsEdit,dsInsert]) then
     qryOpcoesPerguntas.Insert;
  Result:= True;
end;

procedure TdtmCadastroPerguntas.qryOpcoesPerguntasBeforeDelete(DataSet: TDataSet);
begin
  qryPerguntas.Edit;
end;

procedure TdtmCadastroPerguntas.qryOpcoesPerguntasBeforeInsert(DataSet: TDataSet);
begin
  FNROpcoes:= 0;
  ReFazConsulta(qryMaxNrOpcoes,[0],[qryPerguntascodigo.AsInteger]);
  FNROpcoes:= qryMaxNrOpcoesmax.asInteger;
  qryPerguntas.Edit;
end;

end.
