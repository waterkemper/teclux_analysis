unit fmlivroapuracaoPisCofins;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, cpdata, cpnumero,
  DBCtrls, cpdbtext, Mask, cpdbfindcontrols, ComCtrls, cppagecontrol,
  cpeditioncontrolvalidation, DateUtils,
  fmconsultabasica, fmconsultaporcampo,
  ZQuery,
  biblio, ctconstantes, cptexto,
  clparametrossistema, ToolWin, Grids, DBGrids;

type
  TfrmLivroApuracaoPisCofins = class(TfrmRelatorioPadrao)
    gbxImprimir: TGroupBox;
    ckbLivroApuracaoPisCofins: TCheckBox;
    ckbResumo: TCheckBox;
    ecvValida: TtecEditionControlValidation;
    gbxFilial: TGroupBox;
    edfFilial: TtecDbEditFind;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    gbxPeriodo: TGroupBox;
    edtMesAno: TEditMesAno;
    gbxTiposdeNota: TGroupBox;
    ckbNotasdeVenda: TCheckBox;
    ckbNotasdeTransferencia_s: TCheckBox;
    ckbNotasdeDevolucao_s: TCheckBox;
    GroupBox1: TGroupBox;
    ckbNotasdeCompra: TCheckBox;
    ckbNotasdeTransferencia_e: TCheckBox;
    ckbNotasdeDevolucao_e: TCheckBox;
    ckbConferenciaCFOP: TCheckBox;
    ckbSelecaoPelaDatadeEmissao: TCheckBox;
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure ckbLivroApuracaoPisCofinsClick(Sender: TObject);
    procedure ckbResumoClick(Sender: TObject);
    procedure ckbConferenciaCFOPClick(Sender: TObject);
  private
    { Private declarations }
  protected
     function InternoPesquisar(Titulo: String): Integer; override;
     function JanelaPesquisa: TfrmConsultaBasica; override;
     function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function TabelaDePesquisa: TZDataSet; override;
     procedure internoImpressao; Override;
  public
    { Public declarations }
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
   function PesquisaHabilitada: Boolean;
   function TituloPesquisa: String;
   function ValidarCamposSelecao: Boolean;
  end;

var
  frmLivroApuracaoPisCofins: TfrmLivroApuracaoPisCofins;
  TipoPesquisa: TTecPesquisa;
  ControleValido: TWinControl;

implementation
{$R *.dfm}
uses dmlivroapuracaoPisCofins;

{ TfrmLivroApuracaoPisCofins }

constructor TfrmLivroApuracaoPisCofins.Create(AOwner: TComponent);
begin
  inherited;
  dtmLivroApuracaoPisCofins := TdtmLivroApuracaoPisCofins.Create(Self);

  with dtmLivroApuracaoPisCofins do
   Abre(ctTabelas);

  edtMesAno.Text := FormatDateTime('mm/yyyy', DataLocal);
   
end;

destructor TfrmLivroApuracaoPisCofins.Destroy;
begin
  dtmLivroApuracaoPisCofins:=nil;
  inherited;
  frmLivroApuracaoPisCofins := nil;
end;

function TfrmLivroApuracaoPisCofins.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmLivroApuracaoPisCofins do
    case TipoPesquisa of
      pesFILIAIS      : Result := ExisteFilial(NomeCampo, Value);
    else  Result:= False;
    end;
end;

procedure TfrmLivroApuracaoPisCofins.internoImpressao;
begin
 inherited;
 if ValidarCamposSelecao then
  with dtmLivroApuracaoPisCofins do
  begin
   ParametroCabecalho:='';
   MesAno := edtMesAno.Text;
   ParametroFilial:=edfFilial.Text;
   LivrodeApuracaoPisCofins:=ckbLivroApuracaoPisCofins.Checked;
   Resumo:=ckbResumo.Checked;



   NotasdeCompra           := ckbNotasdeCompra         .checked;
   NotasdeTransferencia_e  := ckbNotasdeTransferencia_e.checked;
   NotasdeDevolucao_e      := ckbnotasdeDevolucao_e    .checked;

   NotasdeVenda            := ckbNotasdeVenda          .checked;
   NotasdeTransferencia_s  := ckbNotasdeTransferencia_s.checked;
   NotasdeDevolucao_s      := ckbNotasdeDevolucao_s    .checked;

   if AbrirConsultaRelatorios then
     ImprimirRelatorio
     
  end;
end;

function TfrmLivroApuracaoPisCofins.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmLivroApuracaoPisCofins do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result := inherited InternoPesquisar(TituloPesquisa);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
    Result := 0;
end;

function TfrmLivroApuracaoPisCofins.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

function TfrmLivroApuracaoPisCofins.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfFilial.Focused then
      TipoPesquisa := pesFILIAIS;
    Result:= True;
  end;
end;

function TfrmLivroApuracaoPisCofins.TabelaDePesquisa: TZDataSet;
begin
  with dtmLivroApuracaoPisCofins do
    case TipoPesquisa of
      pesFILIAIS      : Result := ConsultarFilial;
      pesGRUPOSFILIAIS: Result := ConsultarGrupoFilial;
    else  Result:= nil;
    end;
end;

function TfrmLivroApuracaoPisCofins.TituloPesquisa: String;
begin
  case TipoPesquisa of
    pesFILIAIS      : Result := ctFILIAIS;
    pesGRUPOSFILIAIS: Result := ctGRUPOFILIAIS;
  end;
end;

function TfrmLivroApuracaoPisCofins.ValidarCamposSelecao: Boolean;
begin
  result:=ecvValida.Verify(gbxFilial, ControleValido);
  if result then
    Result := OperadorTernario(Trim(edffilial.Text) <> '',edffilial.Exist, True);

  if result then
    result:=ecvValida.Verify(gbxPeriodo, ControleValido);

end;

procedure TfrmLivroApuracaoPisCofins.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilial, ctFILIAIS);
end;

procedure TfrmLivroApuracaoPisCofins.ckbLivroApuracaoPisCofinsClick(Sender: TObject);
begin
  inherited;

  try
    ckbConferenciaCFOP.onclick := nil;
    ckbResumo.onClick := nil;

    if ckbResumo.Checked or ckbLivroApuracaoPisCofins.checked then
      ckbConferenciaCFOP.Checked := false
    else
      ckbConferenciaCFOP.Checked := true;

    if not ckbLivroApuracaoPisCofins.Checked then
      if not ckbConferenciaCFOP.Checked then
        ckbResumo.Checked := True;
  finally
    ckbConferenciaCFOP.onclick := ckbConferenciaCFOPclick;
    ckbResumo.onClick := ckbResumoClick;
  end;


end;

procedure TfrmLivroApuracaoPisCofins.ckbResumoClick(Sender: TObject);
begin
  inherited;

  try

    ckbConferenciaCFOP.onclick := nil;
    ckbLivroApuracaoPisCofins.onclick := nil;

    if ckbResumo.Checked or ckbLivroApuracaoPisCofins.checked then
      ckbConferenciaCFOP.Checked := false
    else
      ckbConferenciaCFOP.Checked := true;

    if not ckbResumo.Checked then
       if not ckbConferenciaCFOP.checked then
         ckbLivroApuracaoPisCofins.Checked := True;
  finally
    ckbConferenciaCFOP.onclick := ckbConferenciaCFOPclick;
    ckbLivroApuracaoPisCofins.onclick := ckbLivroApuracaoPisCofinsClick;
  end;




end;

procedure TfrmLivroApuracaoPisCofins.ckbConferenciaCFOPClick(
  Sender: TObject);
begin
  inherited;
  try
    ckbResumo.onclick := nil;
    ckbLivroApuracaoPisCofins.onclick := nil;

    ckbLivroApuracaoPisCofins.checked := not ckbConferenciaCFOP.checked;
    ckbResumo.checked := not ckbConferenciaCFOP.checked;
  finally
    ckbResumo.onclick := ckbResumoclick;
    ckbLivroApuracaoPisCofins.onclick := ckbLivroApuracaoPisCofinsclick;
  end;
end;

end.
