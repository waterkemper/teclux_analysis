unit fmcadastrocontatos;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Buttons, DBCtrls, ComCtrls,Grids, DBGrids, Mask,
  //Terceiros
  ZQuery,
  //Repositorio
  fmcadastropadrao, fmconsultabasica,
  //Projeto
  dmcadastrocontatos, cpnumero, cpdbdata, cptexto;

type
  TfrmCadastroContatos = class(TfrmCadastroPadrao)
    mmoComplementoPerg: TDBMemo;
    nvgPerguntas: TDBNavigator;
    lblCliente: TLabel;
    lblQuestionario: TLabel;
    lblPergunta: TLabel;
    edtEnunciado: TDBEdit;
    bbnGravar: TBitBtn;
    bbnExcluir: TBitBtn;
    pnlRespostas: TPanel;
    lblNumeroContato: TLabel;
    lblDataContato: TLabel;
    pgcContatos: TPageControl;
    tstQuestionario: TTabSheet;
    edtNumero: TDBEditNumero;
    edtNomeCliente: TDBEditTexto;
    edtData: TDBEditData;
    edtDescricaoQuestionario: TDBEditTexto;
    edtCodigoQuestionario: TDBEditNumero;
    pgcRespotas: TPageControl;
    tstRespostaDiscursiva: TTabSheet;
    mmoRespostaDiscursiva: TDBMemo;
    tstRespostaObjetiva: TTabSheet;
    procedure bbnGravarClick(Sender: TObject);
    procedure bbnExcluirClick(Sender: TObject);
  protected
    dtmCadastroContatos: TdtmCadastroContatos;
    NroOpcoes: Integer;
    procedure GravarOpcoesObjetivas;
//    procedure AtribuirNill; override;
    procedure CheckBoxClick(Sender: TObject);
    procedure CriarDataModulo; override;
    procedure DestruirDataModulo; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    procedure ScrollPerguntaAplicada(Sender: TObject);
    procedure BeforeScrollPerguntaAplicada(Sender: TObject);
    procedure MontaQuadroOpcoes;
    procedure AtualizaQuadroOpcoes;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  end;

var
  frmCadastroContatos: TfrmCadastroContatos;

implementation

uses
  {Qete,}
  //Biblio
  ctConstantes, biblio,
  //Projeto
  fmconsultaporcampo;

{$R *.dfm}

{ TfrmCadastroContatos }

procedure TfrmCadastroContatos.CriarDataModulo;
begin
  inherited;
  dtmCadastroContatos  := TdtmCadastroContatos.Create(Self);
  dtmCadastroContatos.Abre(ctCadastroContatos);
  DataSet := dtmCadastroContatos.TabelaContato;
  dtmCadastroContatos.OnScrollPerguntaAplicada := ScrollPerguntaAplicada;
  dtmCadastroContatos.OnBeforeScrollPerguntaAplicada:= BeforeScrollPerguntaAplicada;
end;

procedure TfrmCadastroContatos.DestruirDataModulo;
begin
  inherited;
  dtmCadastroContatos:=nil;
end;

procedure TfrmCadastroContatos.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_NEXT: dtmCadastroContatos.ProximaPergunta;
    VK_PRIOR  : dtmCadastroContatos.PerguntaAnterior;
  end;
  inherited KeyDown(Key,Shift);  
end;

function TfrmCadastroContatos.InternoExcluir: Boolean;
begin
  Result:= dtmCadastroContatos.ExcluirContatos;
  if Result then begin
    MontaQuadroOpcoes;
    Result := inherited InternoExcluir
  end
end;

function TfrmCadastroContatos.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then begin
    Result:= dtmCadastroContatos.GravarContatos;
  end;
end;

function TfrmCadastroContatos.InternoPesquisar(Titulo:String): Integer;
begin
  Result := inherited InternoPesquisar('Contatos');
  if Result = mrOk then
    dtmCadastroContatos.PosicionarContato(False);
  dtmCadastroContatos.Fecha(ctTabelasConsultaContatos);
end;

procedure TfrmCadastroContatos.ScrollPerguntaAplicada(Sender: TObject);
begin
  if dtmCadastroContatos.TipoPerguntaAplicada = tpOBJETIVA then begin
    pgcRespotas.ActivePage := tstRespostaObjetiva;
    AtualizaQuadroOpcoes;
  end
  else if dtmCadastroContatos.TipoPerguntaAplicada = tpDISCURSIVA then
    pgcRespotas.ActivePage := tstRespostaDiscursiva;
end;

procedure TfrmCadastroContatos.BeforeScrollPerguntaAplicada(Sender : TObject);
begin
  if dtmCadastroContatos.TipoPerguntaAplicada = tpDISCURSIVA then
    bbnGravarClick(bbnGravar);
end;

procedure TfrmCadastroContatos.bbnExcluirClick(Sender: TObject);
begin
  inherited;
  if dtmCadastroContatos.TipoPerguntaAplicada = tpDISCURSIVA then begin
    dtmCadastroContatos.ExcluirResposta;
    MontaQuadroOpcoes
  end;
end;

procedure TfrmCadastroContatos.GravarOpcoesObjetivas;
var
  a:integer;
begin
  if dtmCadastroContatos.TipoPerguntaAplicada = tpOBJETIVA then
    for a:=0 to tstRespostaObjetiva.ControlCount - 1 do
      if TCheckBox(tstRespostaObjetiva.Controls[a]).Checked then
        dtmCadastroContatos.GravarResposta (TCheckBox(tstRespostaObjetiva.Controls[a]).Tag)
      else
        dtmCadastroContatos.ExcluirResposta(TCheckBox(tstRespostaObjetiva.Controls[a]).Tag);
end;

procedure TfrmCadastroContatos.bbnGravarClick(Sender: TObject);
{  function VerificaAssinaladas:Integer;
  var
    B:Integer;
  begin
    Result:=0;
    for B:=0 to tstRespostaObjetiva.ControlCount - 1 do
      if TCheckBox(tstRespostaObjetiva.Controls[B]).Checked then
        Inc(Result);
  end;
}
begin
  inherited;
  if dtmCadastroContatos.TipoPerguntaAplicada = tpDISCURSIVA then begin
     dtmCadastroContatos.GravarResposta;
    if (dtmCadastroContatos.SituacaoLigacao <> ctSACAtendendoLigacao) then
       dtmCadastroContatos.SetStatusLigacao(ctSACAtendendoLigacao);
  end;
{  else if dtmCadastroContatos.TipoPerguntaAplicada = tpOBJETIVA then
    for a:=0 to tstRespostaObjetiva.ControlCount - 1 do
      if TCheckBox(tstRespostaObjetiva.Controls[a]).Checked then
        dtmCadastroContatos.GravarResposta (TCheckBox(tstRespostaObjetiva.Controls[a]).Tag)
      else
        dtmCadastroContatos.ExcluirResposta(TCheckBox(tstRespostaObjetiva.Controls[a]).Tag);}
end;

procedure TfrmCadastroContatos.CheckBoxClick(Sender: TObject);
var
  OnClick: TNotifyEvent;
  procedure DesmacarOpcao(Atual: TObject);
  var
    OnClick: TNotifyEvent;
    a: Integer;
  begin
    for a := 0 to tstRespostaObjetiva.ControlCount - 1 do
      if Atual <> tstRespostaObjetiva.Controls[a] then
        if TCheckBox(tstRespostaObjetiva.Controls[a]).Checked then begin
          OnClick := TCheckBox(tstRespostaObjetiva.Controls[a]).OnClick;
          TCheckBox(tstRespostaObjetiva.Controls[a]).OnClick := nil;
          TCheckBox(tstRespostaObjetiva.Controls[a]).Checked := False;
          TCheckBox(tstRespostaObjetiva.Controls[a]).OnClick := OnClick;
          break
        end
  end;
begin
  OnClick := TCheckBox(Sender).OnClick;
  TCheckBox(Sender).OnClick := nil;
  if TCheckBox(Sender).Checked then
    if NroOpcoes = dtmCadastroContatos.MaximoOpcoes then
      if dtmCadastroContatos.MaximoOpcoes = 1 then
        DesmacarOpcao(Sender)
      else begin
        TCheckBox(Sender).Checked := False;
        MensagemAviso(Format(ctOPCOESASSINALADAACIMALIMITE, [dtmCadastroContatos.MaximoOpcoes]));
      end
    else
      Inc(NroOpcoes)
  else if NroOpcoes > 0  then
    Dec(NroOpcoes);
  TCheckBox(Sender).OnClick := OnClick;

  GravarOpcoesObjetivas;

  // Quando utilizado o Módulo Manutenção das Respostas ocorre um problema,
  // pois a tabela de ligação não esta aberta.
  if (dtmCadastroContatos.SituacaoLigacao <> ctSACAtendendoLigacao) then
     dtmCadastroContatos.SetStatusLigacao(ctSACAtendendoLigacao);

  if pgcContatos.ActivePage = tstQuestionario then
     bbnGravar.SetFocus; //Utilizado para poder funcionar a navegação do PgDown e PgUp.
end;

procedure TfrmCadastroContatos.MontaQuadroOpcoes;
var
  op:TCheckBox;
  Altura,Lado,I :Integer;

begin
  Altura:= 0; Lado:= 0;
  dtmCadastroContatos.ReFazConsulta(dtmCadastroContatos.qryOpcoesPerguntasAplicadas,[0],[dtmCadastroContatos.qryPerguntasAplicadascodigo.AsInteger]);

  if (tstRespostaObjetiva.ComponentCount - 1) > 0 then
     tstRespostaObjetiva.DestroyComponents;

  dtmCadastroContatos.qryOpcoesPerguntasAplicadas.First;
  for I:=1 to (dtmCadastroContatos.qryOpcoesPerguntasAplicadas.RecordCount) do begin
    case I of
        1: Lado:= Lado + 2;
        7: Lado:= Lado + 190;
    end;
    op:=TCheckBox.Create(tstRespostaObjetiva);
    op.Left         := Lado;
    op.Top          := 03 + Altura;
    op.Width        := 170 ;
    op.Height       := 20;
    op.OnClick      := CheckBoxClick;
    tstRespostaObjetiva.InsertControl(op);
    op.Caption      := dtmCadastroContatos.qryOpcoesPerguntasAplicadasOpcao.AsString;
    op.Tag          := dtmCadastroContatos.qryOpcoesPerguntasAplicadascodigo.AsInteger;
//    op.Tag          := dtmCadastroContatos.qryOpcoesPerguntasAplicadascodigo.AsInteger;
//    op.Hint         := IntToStr(dtmCadastroContatos.qryOpcoesPerguntasAplicadascodigo.AsInteger);
//    op.TabOrder     := I - 1;
    if I mod 6 = 0 then Altura:=0
    else                Inc(Altura,20);
    dtmCadastroContatos.qryOpcoesPerguntasAplicadas.Next;
  end;
end;

procedure TfrmCadastroContatos.AtualizaQuadroOpcoes;
var
   a,i:Integer;
begin
   MontaQuadroOpcoes;
   NroOpcoes := 0;
   for i:=1 to dtmCadastroContatos.qryConsultaRespostaObjetiva.RecordCount do begin
     for a := 0 to tstRespostaObjetiva.ControlCount - 1 do begin
       if (TCheckBox(tstRespostaObjetiva.Controls[a]).Tag) = dtmCadastroContatos.qryConsultaRespostaObjetivaOpcao.AsInteger then
         TCheckBox(tstRespostaObjetiva.Controls[a]).Checked := True;
     end;
//     TCheckBox(tstRespostaObjetiva.Controls[dtmCadastroContatos.qryConsultaRespostaObjetivaOpcao.AsInteger]).Checked := True;
//     TCheckBox(tstRespostaObjetiva.Controls[dtmCadastroContatos.qryConsultaRespostaObjetivaOpcao.AsInteger - 1]).Checked := True;
     dtmCadastroContatos.qryConsultaRespostaObjetiva.Next;
   end;
end;

function TfrmCadastroContatos.ExisteInformacao(Parametro: Integer; NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result := dtmCadastroContatos.ExisteContato(Parametro, NomeCampo, Value)
end;

function TfrmCadastroContatos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := False;
end;

function TfrmCadastroContatos.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastroContatos.TabelaConsultaContato
end;

function TfrmCadastroContatos.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  Result := nil;
end;

{procedure TfrmCadastroContatos.AtribuirNill;
begin
  frmCadastroContatos := nil;
end;}



end.
