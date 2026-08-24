unit fmrelatoriochequesemitidos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, ComCtrls, Mask, DBCtrls,
  Windows, DateUtils, Grids, DBGrids,
  // Terceiros
  zquery,
  // Componentes
  cpdbfindcontrols, cpdbtext, cppagecontrol, cpnumero, cpdata, cpdbgrid,
  // Constantes
  ctconstantes, biblio,
  // Repositorio
  fmconsultaporcampo, fmrelatoriopadrao, fmconsultabasica, fmajudabt,
  // Projeto
  dmrelatoriochequesemitidos, ToolWin;

type
  TfrmRelatorioChequesEmitidos = class(TfrmRelatorioPadrao)
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    edfFilial: TtecDbEditFind;
    tstGrupoFilial: TTabSheet;
    sbnProcurarGrupoFilial: TSpeedButton;
    dtxGrupoFilial: TtecDBText;
    edfGrupoFilial: TtecDbEditFind;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbCapaCheque: TCheckBox;
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    gbxNumeracao: TGroupBox;
    edtChequeInicial: TEditNumero;
    edtChequeFinal: TEditNumero;
    gbxConta: TGroupBox;
    sbnProcurarConta: TSpeedButton;
    edfConta: TtecDbEditFind;
    dtxDigito: TtecDBText;
    Label1: TLabel;
    gbxSiglaBanco: TGroupBox;
    dtxSigla: TtecDBText;
    gbxNomeAgencia: TGroupBox;
    dtxNomeAgencia: TtecDBText;
    rgrResumo: TRadioGroup;
    rgrOrdenacao: TRadioGroup;
    lblAEmissao: TLabel;
    Label2: TLabel;
    gbxResumo: TGroupBox;
    gbxOrdenacao: TGroupBox;
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarGrupoFilialClick(Sender: TObject);
    procedure pgcFilialGrupoFilialChange(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure ckbAgruparGrupoFilialClick(Sender: TObject);
    procedure ckbAgruparFilialClick(Sender: TObject);
    procedure FormLoaded(Sender: TObject);
    procedure sbnProcurarContaClick(Sender: TObject);
  protected
    dtmRelatorioChequesEmitidos: TdtmRelatorioChequesEmitidos;
    procedure internoimpressao; override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  ValidarCamposSelecao: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmRelatorioChequesEmitidos: TfrmRelatorioChequesEmitidos;
  TipoPesquisa: TtecChequesEmitidos;

implementation

{$R *.dfm}

{ TfrmRelatorioChequesEmitidos }

constructor TfrmRelatorioChequesEmitidos.Create(AOwner: TComponent);
begin
  dtmRelatorioChequesEmitidos:= TdtmRelatorioChequesEmitidos.Create(Self);
  inherited;
  dtmRelatorioChequesEmitidos.Abre(ctTabelas);
  edtDataInicial.Text:= DateToStr(dtmRelatorioChequesEmitidos.DataServidor);
  edtDataFinal.Text  := DateToStr(dtmRelatorioChequesEmitidos.DataServidor);
end;

destructor TfrmRelatorioChequesEmitidos.Destroy;
begin
  dtmRelatorioChequesEmitidos:=nil;
  inherited;
  frmRelatorioChequesEmitidos:= nil;
end;

function TfrmRelatorioChequesEmitidos.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
   with dtmRelatorioChequesEmitidos do
      case TipoPesquisa of
         cheFILIAIS:      Result:= ExisteFiliais     (NomeCampo, Value);
         cheGRUPOFILIAIS: Result:= ExisteGrupoFiliais(NomeCampo, Value);
         cheCONTA:        Result:= ExisteConta       (NomeCampo, Value);
         else             Result:= False;
    end;
end;

function TfrmRelatorioChequesEmitidos.InternoPesquisar(Titulo: string): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl = edfFilial then begin
        TipoPesquisa := cheFILIAIS;
        Titulo       := 'Filiais';
      end
      else if ActiveControl = edfGrupoFilial then begin
        TipoPesquisa := cheGRUPOFILIAIS;
        Titulo       := 'Grupo Filiais';
      end
      else if ActiveControl = edfConta then begin
        TipoPesquisa := cheCONTA;
        Titulo       := 'Contas';
      end;

      with dtmRelatorioChequesEmitidos do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end;
    end;
  end;
end;

function TfrmRelatorioChequesEmitidos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;  
end;

procedure TfrmRelatorioChequesEmitidos.pgcFilialGrupoFilialChange(Sender: TObject);
begin
   inherited;
   if pgcFilialGrupoFilial.ActivePage = tstFilial then begin
      edfGrupoFilial.Clear;
      edfFilial.setFocus;
   end
   else begin
      edfFilial.Clear;
      edfGrupoFilial.setFocus;
   end;
end;



procedure TfrmRelatorioChequesEmitidos.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmRelatorioChequesEmitidos.sbnProcurarGrupoFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfGrupoFilial.SetFocus;
  InternoPesquisar('');
end;

function TfrmRelatorioChequesEmitidos.TabelaDePesquisa: TZdataSet;
begin
   with dtmRelatorioChequesEmitidos do
      case TipoPesquisa of
         cheFILIAIS:      Result:= ConsultaFiliais;
         cheGRUPOFILIAIS: Result:= ConsultaGrupoFiliais;
         cheCONTA:        Result:= ConsultaContas;
         else             Result:= nil;
    end;
end;

function TfrmRelatorioChequesEmitidos.ValidarCamposSelecao: Boolean;
begin
   Result:= (edtDataInicial.DataValida and edtDataFinal.DataValida);
   if Result then begin
      if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text))
      then Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);

      if result then begin
         Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
         if Result
         then Result:= OperadorTernario((Trim(edfFilial.     Text) <> ''),edfFilial.     Exist, True) and
                       OperadorTernario((Trim(edfGrupoFilial.Text) <> ''),edfGrupoFilial.Exist, True) and
                       OperadorTernario((Trim(edfConta.      Text) <> ''),edfConta.      Exist, True)
         else begin
            MensagemAviso(ctDATAINVALIDA);
            edtDataInicial.SetFocus;
        end;
      end
      else begin
         MensagemAviso(ctDTINICIALMAIORDTFINAL);
         edtDataInicial.SetFocus;
      end;
   end;
end;


procedure TfrmRelatorioChequesEmitidos.edtDataFinalEnter(
  Sender: TObject);
begin
  inherited;
  if not dataembranco(edtDataInicial.Text) and edtDataInicial.Criticar(false) then
    edtDataFinal.Minimo:= DaysBetween(dtmRelatorioChequesEmitidos.DataServidor,StrToDate(edtDataInicial.Text));
end;

procedure TfrmRelatorioChequesEmitidos.internoimpressao;
begin
  inherited;
    if ValidarCamposSelecao then
    with dtmRelatorioChequesEmitidos do begin
      ParametroCabecalho:='';
      DataInicial := edtDataInicial.Text;
      DataFinal   := edtDataFinal.Text;
      Filial         := edfFilial.Text;
      Grupo          := edfGrupoFilial.Text;
      Conta          := edfConta.Text;
      ChequeInicial  := edtChequeInicial.Text;
      ChequeFinal    := edtChequeFinal.Text;
      AgruparGrupoFilial :=ckbAgruparGrupoFilial.Checked;
      AgruparFilial      :=ckbAgruparFilial.Checked;
      CapaCheque     := ckbCapaCheque.Checked;
      DefineOrdenacao(rgrORdenacao.ItemIndex);
      Resumo := rgrResumo.ItemIndex;
      if GerarRelatorio then begin
         MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
         edtDataInicial.SetFocus;
      end
      else ImprimirRelatorio;
    end;
end;

procedure TfrmRelatorioChequesEmitidos.ckbAgruparGrupoFilialClick(Sender: TObject);
begin
  inherited;
  if ckbAgruparFilial.Checked then
       ckbAgruparFilial.Checked:= not ckbAgruparGrupoFilial.Checked
  else ckbAgruparGrupoFilial.Checked:= True;
end;

procedure TfrmRelatorioChequesEmitidos.ckbAgruparFilialClick(Sender: TObject);
begin
  inherited;
  if ckbAgruparGrupoFilial.Checked then
       ckbAgruparGrupoFilial.Checked:= not ckbAgruparFilial.Checked
  else ckbAgruparFilial.Checked:= True;
end;

procedure TfrmRelatorioChequesEmitidos.FormLoaded(Sender: TObject);
begin
  inherited;
  edtDataInicial.SetFocus;
end;

procedure TfrmRelatorioChequesEmitidos.sbnProcurarContaClick(
  Sender: TObject);
begin
   inherited;
   InternoPesquisar(edfConta, ctCONTAS);
end;

end.
