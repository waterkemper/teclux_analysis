unit fmrelatorioreimpressaorequisicoes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, StdCtrls, ExtCtrls, cpdata, Mask, cpdbfindcontrols,
  DBCtrls, cpdbtext, Buttons, cpnumero,
  fmconsultabasica, fmconsultaporcampo,
  zquery,
  ctconstantes,
  biblio;

type
  TfrmRelatorioReimpressaoRequisicoes = class(TfrmRelatorioPadrao)
    Panel1: TPanel;
    gbxCliente: TGroupBox;
    sbnProcuraCliente: TSpeedButton;
    dtxCliente: TtecDBText;
    edfCliente: TtecDbEditFind;
    gbxDatadeAbertura: TGroupBox;
    lblVencimentoInicial: TLabel;
    edtDataInicial: TEditData;
    lblVencimentoFinal: TLabel;
    edtDataFinal: TEditData;
    gbxMontador: TGroupBox;
    sbnProcuraMontador: TSpeedButton;
    dtxMontador: TtecDBText;
    edfMontador: TtecDbEditFind;
    rgpSituacaodaMontagem: TRadioGroup;
    ckbRequisicoesItensMontagemFechada: TCheckBox;
    gbxIntervaloRequisicoes: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtRequisicaoInicial: TEditNumero;
    edtRequisicaoFinal: TEditNumero;
    edtHoraInicial: TEditHora;
    edtHoraFinal: TEditHora;
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure sbnProcuraMontadorClick(Sender: TObject);
  private
    { Private declarations }
  protected
   procedure InternoImpressao; override;
   function  InternoPesquisar(Titulo: String): Integer; override;
   function  JanelaPesquisa: TfrmConsultaBasica; override;
   function  TabelaDePesquisa: TZDataSet; override;
   function  PermitirProcura: Boolean;
   function  TituloPesquisa(Tipo: TipoProcuraRequisicoes): String;
   procedure MontaPesquisa;
   function  ValidarCamposSelecao: Boolean;
   procedure KeyDown(var Key: Word; Shift: TShiftState); override;
   function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    { Public declarations }
   tipoprocura: TipoProcuraRequisicoes;
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  end;

var
  frmRelatorioReimpressaoRequisicoes: TfrmRelatorioReimpressaoRequisicoes;

implementation
{$R *.dfm}

uses dmrelatorioreimpressaorequisicoes;


{ TfrmRelatorioReimpressaoRequisicoes }

constructor TfrmRelatorioReimpressaoRequisicoes.Create(AOwner: TComponent);
begin
  dtmRelatorioReimpressaoRequisicoes:= TdtmRelatorioReimpressaoRequisicoes.Create(Self);
  inherited;
  edtDataInicial.Text := datetostr(now());
  edtDataFinal.Text := datetostr(now());

end;

destructor TfrmRelatorioReimpressaoRequisicoes.Destroy;
begin
  dtmRelatorioReimpressaoRequisicoes:=nil;
  inherited;
  frmRelatorioReimpressaoRequisicoes:=nil;
end;

function TfrmRelatorioReimpressaoRequisicoes.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmRelatorioReimpressaoRequisicoes do
  if CtrlOn then
   case tipoprocura of
    tpRequisicoesClientes   :result := ExisteCliente(NomeCampo, Value);
    tpRequisicoesMontadores :result := ExisteMontador(NomeCampo, Value);
   end;
end;

procedure TfrmRelatorioReimpressaoRequisicoes.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

function TfrmRelatorioReimpressaoRequisicoes.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PermitirProcura then
  begin
   with dtmRelatorioReimpressaoRequisicoes do
   begin
    AbreTabelaPesquisa(tipoprocura);
    Titulo := TituloPesquisa(tipoprocura);
    result:=inherited internopesquisar(Titulo);
    if Result = mrOK then
      Selecionar(tipoProcura);
    FechaTabelaPesquisa(tipoprocura);
   end;
  end
  else
   Result := mrNone
end;

function TfrmRelatorioReimpressaoRequisicoes.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoProcura in [tpRequisicoesClientes]) and CtrlOn;
  Result := Jan
end;

procedure TfrmRelatorioReimpressaoRequisicoes.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;

end;

procedure TfrmRelatorioReimpressaoRequisicoes.MontaPesquisa;
begin
if ValidarCamposSelecao then
begin
 with dtmRelatorioReimpressaoRequisicoes do
 begin
  HoraInicial                   := edtHoraInicial.Text;
  DataInicial                   := edtDataInicial.Text;
  HoraFinal                     := edtHoraFinal.Text;
  DataFinal                     := edtDataFinal.Text;
  Cliente                       := edfCliente.Text;
  Montador                      := edfMontador.Text;
  SituacaodaMontagem            := rgpSituacaodaMontagem.ItemIndex;
  SituacaoRequisicaoItemMontagem:= ckbRequisicoesItensMontagemFechada.Checked;
  RequisicaoInicial             := edtRequisicaoInicial.Text;
  RequisicaoFinal               := edtRequisicaoFinal.Text;
  qryRequisicoes.Open;
  if (qryRequisicoes.IsEmpty) then
  begin
   MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
   edfCliente.setFocus;
  end
  else
   ImprimirRelatorio('REQUISICAO');
 end;
end;
end;

function TfrmRelatorioReimpressaoRequisicoes.PermitirProcura: Boolean;
begin
  Result := False;
  if CtrlOn then
  begin
    if edfCliente.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesClientes;
    end;
    if edfMontador.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesMontadores;
    end;
  end;
end;

function TfrmRelatorioReimpressaoRequisicoes.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmRelatorioReimpressaoRequisicoes do
  Case tipoprocura of
  tpRequisicoesClientes                :result := ConsultaClientes;
  tpRequisicoesMontadores              :result := ConsultaMontadores;
  end;
end;

function TfrmRelatorioReimpressaoRequisicoes.TituloPesquisa(
  Tipo: TipoProcuraRequisicoes): String;
begin
  Case tipo of
   tpRequisicoesClientes    :result := ctCLIENTES;
   tpRequisicoesMontadores  :result := ctMONTADORES;
  end;
end;

function TfrmRelatorioReimpressaoRequisicoes.ValidarCamposSelecao: Boolean;
begin
  Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
  if Result then
  begin
   if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
     Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
   if result then
   begin
     Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
     if Result then
            Result := OperadorTernario((Trim(edfCliente.Text) <> ''),edfCliente.Exist, True) and
                      OperadorTernario((Trim(edfMontador.Text) <> ''), edfMontador.Exist, True)
     else
     begin
      MensagemAviso(ctDATAINVALIDA);
      edtDataInicial.SetFocus;
     end;
   end
   else
   begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicial.SetFocus;
   end;
  end;
end;

procedure TfrmRelatorioReimpressaoRequisicoes.sbnProcuraClienteClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfCliente, ctCLIENTES);
end;

procedure TfrmRelatorioReimpressaoRequisicoes.sbnProcuraMontadorClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfMontador, ctMONTADORES);
end;

end.
