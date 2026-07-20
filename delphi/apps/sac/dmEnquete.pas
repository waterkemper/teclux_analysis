unit dmEnquete;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, ctconstantes, CheckLst, biblio, ExtCtrls;

type
  TdtmEnquete = class(TdtmBasico)
    qryClientes: TtecQuery;
    dsrClientes: TtecDataSource;
    qryClientescodigo: TIntegerField;
    qryClientestipo: TStringField;
    qryClientesnome: TStringField;
    qryQuestionario: TtecQuery;
    dsrQuestionario: TtecDataSource;
    qryQuestionariocodigo: TIntegerField;
    qryQuestionariodescricao: TStringField;
    qryQuestionariodata_inicio: TDateTimeField;
    qryQuestionariodata_fim: TDateTimeField;
    qryQuestionariodisponivel: TBooleanField;
    qryQuestionariodata_inativo: TDateTimeField;
    qryQuestionariodescricao_text: TStringField;
    qryPerguntas: TtecQuery;
    dsrPerguntas: TtecDataSource;
    qryPerguntascodigo: TIntegerField;
    qryPerguntasquestionario: TIntegerField;
    qryPerguntasdescricao: TStringField;
    qryPerguntastipo: TStringField;
    qryPerguntasjustificativa: TBooleanField;
    qryRespostas: TtecQuery;
    dsrRespostas: TtecDataSource;
    qryRespostascodigo: TIntegerField;
    qryRespostaspergunta: TIntegerField;
    qryRespostasresposta: TStringField;
    qryrespostas_clientes: TtecQuery;
    dsrrespostas_clientes: TtecDataSource;
    qryrespostas_clientesresposta: TIntegerField;
    qryrespostas_clientescliente: TIntegerField;
    qryrespostas_clientestipocliente: TStringField;
    qryrespostas_clientestexto: TStringField;
    qryClientestexto: TStringField;
    qryClientesrespostaunica: TIntegerField;
    qryQuestionariorespondermaisdeumavez: TBooleanField;
    qryrespostas_clientesorcamento: TIntegerField;
    qryrespostas_clientescontrato: TStringField;
    qryrespostas_clientesquestionario: TIntegerField;
    qryrespostas_os: TtecQuery;
    dsrrespostas_os: TtecDataSource;
    qryrespostas_osresposta: TIntegerField;
    qryrespostas_oscontrato: TStringField;
    qryrespostas_osequipamento: TStringField;
    qryrespostas_ostexto: TStringField;
    qryrespostas_osquestionario: TIntegerField;
    qryEquipamentoOS: TtecQuery;
    dsrEquipamentoOS: TtecDataSource;
    qryEquipamentoOScliente: TIntegerField;
    qryEquipamentoOStipocliente: TStringField;
    qryEquipamentoOSequipamento: TStringField;
    qryEquipamentoOSdescricaoequipamento: TStringField;
    qryEquipamentoOSnomecliente: TStringField;
    qryEquipamentoOSnumero: TStringField;
    procedure qryQuestionarioAfterScroll(DataSet: TDataSet);
    procedure qryPerguntasAfterScroll(DataSet: TDataSet);
    procedure qryPerguntasBeforeScroll(DataSet: TDataSet);
  private
    FPerguntasAfterScroll: TNotifyEvent;
    FPerguntasBeforeScroll: TNotifyEvent;

    { Private declarations }
  public
    { Public declarations }
    vCanClose : Boolean;
    constructor Create(AOwner: TComponent); Override;
    property PerguntasAfterScroll: TNotifyEvent
             read FPerguntasAfterScroll
             write FPerguntasAfterScroll;

    property PerguntasBeforeScroll: TNotifyEvent
             read FPerguntasBeforeScroll
             write FPerguntasBeforeScroll;


    function SalvarEnquete(Multipla: TCheckListBox; Unica: TRadioGroup; Texto: String; Gravar: boolean): boolean;

  end;

var
  dtmEnquete: TdtmEnquete;

implementation

{$R *.dfm}

constructor TdtmEnquete.Create(AOwner: TComponent);
begin
  inherited;
  vCanClose := false;
end;

procedure TdtmEnquete.qryQuestionarioAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryPerguntas, ['questionario'], [qryQuestionariocodigo.asinteger]);
  RefazConsultaPorNome(qryRespostas, ['questionario'], [qryQuestionariocodigo.asinteger]);
end;

procedure TdtmEnquete.qryPerguntasAfterScroll(DataSet: TDataSet);
begin
  inherited;
//  qryPerguntas.AfterScroll := nil;
  if assigned(PerguntasAfterScroll) then
    PerguntasAfterScroll(DataSet);
//  qryPerguntas.AfterScroll := qryPerguntasAfterScroll;

end;

function TdtmEnquete.SalvarEnquete(Multipla: TCheckListBox; Unica: TRadioGroup; Texto: String; Gravar: Boolean): boolean;
var
 i :integer ;

 procedure ApagarRespostaCliente;
 begin
   case qryQuestionario.ParamByName('formaAbertura').asInteger of
     0,1 :
     begin
       if qryRespostas_clientes.Locate('resposta', qryRespostascodigo.AsInteger, []) then
         qryrespostas_clientes.delete;
     end;

     2 :
     begin
       if qryRespostas_os.Locate('resposta', qryRespostascodigo.AsInteger, []) then
         qryrespostas_os.delete;
     end;
   end;
 end;

 procedure AtribuirOrcamento_e_Contrato(Texto: String = '');
 begin
   case qryQuestionario.ParamByName('formaAbertura').asInteger of
     0,1 :
     begin
       if qryRespostas_clientes.Locate('resposta', qryRespostascodigo.AsInteger, []) then
         qryrespostas_clientes.edit
       else
         qryrespostas_clientes.Append;

       qryrespostas_clientescliente.AsInteger := qryClientescodigo.asinteger;
       qryrespostas_clientestipocliente.AsString := qryClientestipo.asString;
       qryrespostas_clientesresposta.AsInteger := qryRespostascodigo.AsInteger;

       if Texto <> '' then
          qryrespostas_clientestexto.asString := Texto;

       if qryclientes.ParamByName('orcamento').AsInteger <> 0 then
         qryrespostas_clientesorcamento.asinteger := qryclientes.ParamByName('orcamento').AsInteger
       else
         qryrespostas_clientesorcamento.clear;

       if qryclientes.ParamByName('contrato').AsString <> '' then
         qryrespostas_clientescontrato.asString := qryclientes.ParamByName('contrato').AsString
       else
         qryrespostas_clientescontrato.clear;

       qryrespostas_clientes.post;
     end;

     2 :
     begin
       if qryRespostas_os.Locate('resposta', qryRespostascodigo.AsInteger, []) then
         qryrespostas_os.edit
       else
         qryrespostas_os.Append;

//       qryrespostas_oscontrato.AsString := qryEquipamentoOSnumero.asString;
       qryrespostas_osequipamento.asString := qryEquipamentoOSequipamento.asString;
       qryrespostas_osresposta.AsInteger := qryRespostascodigo.AsInteger;

       if Texto <> '' then
          qryrespostas_ostexto.asString := Texto;

       if qryEquipamentoOS.ParamByName('contrato').AsInteger <> 0 then
         qryrespostas_oscontrato.AsString := qryEquipamentoOS.ParamByName('contrato').AsString
       else
         qryrespostas_oscontrato.clear;

       qryrespostas_os.post;
     end;

   end;
 end;

begin
  result := true;

//  qryPerguntas.AfterScroll := nil;

//  qryPerguntas.First;
//  while not qryPerguntas.eof do
//  begin

    if qryPerguntastipo.AsString = 'múltipla' then
    begin

      for i:=0 to Multipla.Count-1 do
      begin

        if Multipla.Checked[i] then
        begin
          if qryRespostas.Locate('codigo', tintobj(Multipla.items.objects[i]).i, []) then
          begin
            if qryPerguntasjustificativa.asboolean then
               AtribuirOrcamento_e_Contrato(texto)
             else
               AtribuirOrcamento_e_Contrato;
          end;
        end
        else
        if qryRespostas.Locate('codigo', tintobj(Multipla.items.objects[i]).i, []) then
           ApagarRespostaCliente;
      end;
    end
    else
    if qryPerguntastipo.AsString = 'única' then
    begin
      for i:=0 to Unica.Items.Count-1 do
      begin
        if Unica.ItemIndex = i then
        begin
          if qryRespostas.Locate('codigo', tintobj(unica.items.objects[i]).i, []) then
          begin
            if qryPerguntasjustificativa.asboolean then
              AtribuirOrcamento_e_Contrato(texto)
            else
              AtribuirOrcamento_e_Contrato(texto);
          end;
        end
        else
        if qryRespostas.Locate('codigo', tintobj(unica.items.objects[i]).i, []) then
           ApagarRespostaCliente;
      end;
    end
    else
    if qryPerguntastipo.AsString = 'texto' then
      AtribuirOrcamento_e_Contrato(texto);

//    qryPerguntas.next;
//  end;

  if gravar then
  begin
    case qryQuestionario.ParamByName('formaAbertura').asInteger of
    0,1 : result := perpetrar([qryrespostas_clientes]);
      2 : result := perpetrar([qryrespostas_os]);
    end;
  end;

//  qryPerguntas.AfterScroll := qryPerguntasAfterScroll;

end;

procedure TdtmEnquete.qryPerguntasBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  if assigned(PerguntasBeforeScroll) then
    PerguntasBeforeScroll(DataSet);

end;

end.
