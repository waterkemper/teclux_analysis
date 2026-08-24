unit fmImportacaoConciliacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, Grids, DBGrids, cpdbgrid, Mask, DBCtrls,
  cpdbtext, StdCtrls, cptexto, ComCtrls, Buttons, ToolWin, ExtCtrls,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, dmImportacaoconciliacao, biblio,
  ctconstantes, Spin, frconsulta, frconsultacodigo, cpnumero, cpdata,
  frlercontacorrentesaldo, fmconsultabasica, zquery, fmconsultaporcampo;

type
  TfrmImportacaoConciliacao = class(TfrmCadastroPadrao)
    pnlImportacao: TPanel;
    gbxLancamentosaImportar: TGroupBox;
    btnSelecionarARquivoImportacao: TSpeedButton;
    lblCaminhodoArquivoImportacao: TStaticText;
    edtCaminhodoArquivoImportacao: TEditTexto;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    dtxBanco: TtecDBText;
    dtxConta: TtecDBText;
    dtxDataInicial: TtecDBText;
    dtxDataFinal: TtecDBText;
    dtxNome: TtecDBText;
    dbgImportacao: TDBAdvGrid;
    dbgconciliacaoextratoitems: TDBAdvGrid;
    OpenDialogImportacao: TOpenDialog;
    gbxParametros: TGroupBox;
    edtPercentualValorAbaixo: TSpinEdit;
    edtPercentualValorAcima: TSpinEdit;
    lblDiasAntes: TStaticText;
    lblDiasDepois: TStaticText;
    StaticText6: TStaticText;
    edtDiasAcima: TSpinEdit;
    StaticText7: TStaticText;
    edtDiasAbaixo: TSpinEdit;
    gbxDias: TGroupBox;
    gbxPercentualsobreoValor: TGroupBox;
    gbxFornecedor: TGroupBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    sbnConsultaContratos: TSpeedButton;
    ckbAplicaouNaoFiltroFornecedor: TCheckBox;
    btnRefazeraConsulta: TBitBtn;
    StaticText9: TStaticText;
    dtxStatus: TtecDBText;
    StaticText8: TStaticText;
    dtxSaldoFinal: TtecDBText;
    fraLerContaCorrenteSaldo1: TfraLerContaCorrenteSaldo;
    pgcSelecaoDados: TPageControl;
    tstSelecaoPorPeriodo: TTabSheet;
    tstImportacaoOFX: TTabSheet;
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtDataFinal: TEditData;
    edtDataInicial: TEditData;
    sbnGerar: TSpeedButton;
    procedure btnSelecionarARquivoImportacaoClick(Sender: TObject);
    procedure dbgconciliacaoextratoitemsFooterCalc(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure edtDiasAbaixoChange(Sender: TObject);
    procedure edtDiasAcimaChange(Sender: TObject);
    procedure edtPercentualValorAbaixoChange(Sender: TObject);
    procedure edtPercentualValorAcimaChange(Sender: TObject);
    procedure btnRefazeraConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgconciliacaoextratoitemsCheckBoxClick(Sender: TObject;
      ACol, ARow: Integer; State: Boolean);
    procedure pgcSelecaoDadosChange(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure fraLerContaCorrenteSaldo1sbnProcurarContaClick(
      Sender: TObject);
    procedure sbnConsultaContratosClick(Sender: TObject);
    procedure dbgconciliacaoextratoitemsCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
  private
    { Private declarations }
    procedure CalcularTotaisConciliacao;
    procedure MovtosBancosEventosAfterPost(Sender: TObject);
  protected
     function  InternoPesquisar(Titulo:String): Integer; override;
     function  JanelaPesquisa: TfrmConsultaBasica; override;
     function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function  TabelaDePesquisa: TZDataSet; override;
     procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    { Public declarations }
     constructor Create(AOwner: TComponent); Override;
     destructor  Destroy; override;
     function InternoGravar: Boolean; Override;
     function InternoCancelar: Boolean; Override;
     function InternoExcluir: Boolean; Override;



    
  end;

var
  frmImportacaoConciliacao: TfrmImportacaoConciliacao;
  TipoPesquisa: TtecMovtosBancos;
  

implementation

{$R *.dfm}

procedure TfrmImportacaoConciliacao.btnSelecionarARquivoImportacaoClick(
  Sender: TObject);
begin
  inherited;
  if OpenDialogImportacao.Execute then
  begin
    edtCaminhodoArquivoImportacao.Text := OpenDialogImportacao.FileName;

    if FileExists(edtCaminhodoArquivoImportacao.text) then
    begin
      dtmImportacaoConciliacao.ImportarConciliacao(edtCaminhodoArquivoImportacao.text);
      CalcularTotaisConciliacao;
    end
    else
      MensagemAviso(format(ctARQUIVONAOENCONTRADO, [edtCaminhodoArquivoImportacao.text]));

  end;

end;

constructor TfrmImportacaoConciliacao.Create(AOwner: TComponent);
begin
  dtmImportacaoConciliacao:= TdtmImportacaoConciliacao.Create(Self);
  inherited;
  dataset := dtmImportacaoConciliacao.qryconciliacao;

  dtmImportacaoConciliacao.DiasAbaixo := edtDiasAbaixo.value;
  dtmImportacaoConciliacao.DiasAcima := edtDiasAcima.value;
  dtmImportacaoConciliacao.PercentualValorAbaixo := edtPercentualValorAbaixo.value;
  dtmImportacaoConciliacao.PercentualValorAcima := edtPercentualValorAcima.value;

  dtmImportacaoConciliacao.MovtosBancosEventosAfterPost := MovtosBancosEventosAfterPost;


end;

destructor TfrmImportacaoConciliacao.Destroy;
begin

  inherited;
end;

procedure TfrmImportacaoConciliacao.dbgconciliacaoextratoitemsFooterCalc(
  Sender: TObject; ACol, ARow: Integer; var Value: String);
begin
  inherited;
//  dbgconciliacaoextratoitems.FloatingFooter.ColumnCalc[3] := acSum;

end;

procedure TfrmImportacaoConciliacao.edtDiasAbaixoChange(Sender: TObject);
begin
  inherited;
  dtmImportacaoConciliacao.DiasAbaixo := edtDiasAbaixo.value;
end;

procedure TfrmImportacaoConciliacao.edtDiasAcimaChange(Sender: TObject);
begin
  inherited;
  dtmImportacaoConciliacao.DiasAcima := edtDiasAcima.value;
end;

procedure TfrmImportacaoConciliacao.edtPercentualValorAbaixoChange(
  Sender: TObject);
begin
  inherited;
  dtmImportacaoConciliacao.PercentualValorAbaixo := edtPercentualValorAbaixo.value;
end;

procedure TfrmImportacaoConciliacao.edtPercentualValorAcimaChange(
  Sender: TObject);
begin
  inherited;
  dtmImportacaoConciliacao.PercentualValorAcima := edtPercentualValorAcima.value;
end;

procedure TfrmImportacaoConciliacao.btnRefazeraConsultaClick(
  Sender: TObject);
begin
  inherited;
  dtmImportacaoConciliacao.qryconciliacaoextratoAfterScroll(nil);
end;

procedure TfrmImportacaoConciliacao.FormActivate(Sender: TObject);
begin
  inherited;
  if not dtmImportacaoConciliacao.qryconciliacaoextrato.isempty then
    dtmImportacaoConciliacao.qryconciliacaoextratoAfterScroll(nil);
end;

function TfrmImportacaoConciliacao.InternoGravar: Boolean;
begin
  dtmImportacaoConciliacao.Gravar;
end;

function TfrmImportacaoConciliacao.InternoCancelar: Boolean;
begin
  dtmImportacaoConciliacao.Cancelar;
  CalcularTotaisConciliacao;
end;

function TfrmImportacaoConciliacao.InternoExcluir: Boolean;
begin
  dtmImportacaoConciliacao.Excluir;
end;

procedure TfrmImportacaoConciliacao.CalcularTotaisConciliacao;
begin
  dtmImportacaoConciliacao.qryconciliacaoextrato.AfterScroll := nil;
  dbgimportacao.FloatingFooter.ColumnCalc[5] := acSum;
  dbgimportacao.FloatingFooter.ColumnCalc[6] := acSum;
  dbgimportacao.FloatingFooter.ColumnCalc[7] := acSum;
  dtmImportacaoConciliacao.qryconciliacaoextrato.AfterScroll := dtmImportacaoConciliacao.qryconciliacaoextratoAfterScroll;

  if dtmImportacaoConciliacao.qryConciliacaostatus.asstring = 'ABERTO' then
    dtxStatus.Font.Color := clred
  else
  if dtmImportacaoConciliacao.qryConciliacaostatus.asstring = 'PARCIAL' then
   dtxStatus.Font.Color := $004080FF
  else
   dtxStatus.Font.Color := clGreen;

end;

procedure TfrmImportacaoConciliacao.MovtosBancosEventosAfterPost(
  Sender: TObject);
begin
  CalcularTotaisConciliacao
end;

procedure TfrmImportacaoConciliacao.dbgconciliacaoextratoitemsCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  {Os comandos abaixo são usados para resolver a situacão de erro no grid: grid index out of range}

  dbgImportacao.datasource.dataset.next;
  if dbgImportacao.datasource.dataset.eof then
  begin
    dbgImportacao.datasource.dataset.prior;
    dbgImportacao.datasource.dataset.next;
  end
  else
    dbgImportacao.datasource.dataset.prior;

  dtmImportacaoConciliacao.RestaurarPosicaoMovtosBancosEventos;  
end;

procedure TfrmImportacaoConciliacao.pgcSelecaoDadosChange(Sender: TObject);
begin
  inherited;
  if pgcSelecaoDados.ActivePage = tstSelecaoPorPeriodo then sbnGerar.caption := 'Gerar F6'
                                                       else sbnGerar.caption := 'Importar F6';
end;

procedure TfrmImportacaoConciliacao.sbnGerarClick(Sender: TObject);
begin
  inherited;
  case pgcSelecaoDados.ActivePageIndex of

    0 {tstSelecaoPorPeriodo} :
    begin
      if fraLerContaCorrenteSaldo1.edfConta.text = '' then
      begin
        MensagemAviso('Informe o número da conta');
        fraLerContaCorrenteSaldo1.edfConta.setfocus;
      end
      else
      if edtDataInicial.text = '' then
      begin
        MensagemAviso('Informe a data inicial');
        edtDataInicial.setfocus;
      end
      else
      if edtDataFinal.text = '' then
      begin
        MensagemAviso('Informe a data final');
        edtDataFinal.setfocus;
      end
      else
      if strtodate(edtDataInicial.text)>
         strtodate(edtDataFinal.text) then
      begin
        MensagemAviso('A data inicial esta superior a data final');
        edtDataInicial.setfocus;
      end
      else
      begin
        if dtmImportacaoConciliacao.GerarConsultaConciliacao(edtDataInicial.text, edtDataFinal.text) then
          CalcularTotaisConciliacao
        else
          MensagemAviso('Nenhum registro foi encontrado.');
      end;
    end;
    1 {tstImportacaoOFX }   :
    begin

      if FileExists(edtCaminhodoArquivoImportacao.text) then
      begin
        if dtmImportacaoConciliacao.ImportarConciliacao(edtCaminhodoArquivoImportacao.text) then
           CalcularTotaisConciliacao;
      end
      else
        MensagemAviso(format(ctARQUIVONAOENCONTRADO, [edtCaminhodoArquivoImportacao.text]));


    end;

  end;

end;

function TfrmImportacaoConciliacao.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
   case TipoPesquisa of
      tmbCONTAS:  Result:= dtmImportacaoConciliacao.ExisteConta (NomeCampo, Value);
      else        Result:= False;
   end;

end;

function TfrmImportacaoConciliacao.InternoPesquisar(
  Titulo: String): Integer;
begin
   Result:= mrOK;
   if CtrlOn then
   begin
           if ActiveControl = fraLerContaCorrenteSaldo1.edfConta        then TipoPesquisa:= tmbCONTAS;
   end;

   if TipoPesquisa <> tmbNENHUM then
   begin
      if tipoPesquisa = tmbCONTAS then
        dtmImportacaoConciliacao.qryConsultaContas.open;

      Result:= inherited InternoPesquisar(Titulo);
      if Result = mrOK then
         dtmImportacaoConciliacao.Selecionar(TipoPesquisa);

      if tipoPesquisa = tmbCONTAS then
        dtmImportacaoConciliacao.qryConsultaContas.close;

{      if TipoPesquisa = tmbCONTAS then
        fraLerContaCorrenteSaldo1edfContaExit(self);}
   end;

end;

function TfrmImportacaoConciliacao.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False

end;

function TfrmImportacaoConciliacao.TabelaDePesquisa: TZDataSet;
begin
   case TipoPesquisa of
      tmbCONTAS:  Result:= dtmImportacaoConciliacao.qryConsultaContas;
      else        Result:= nil;
   end;

end;

procedure TfrmImportacaoConciliacao.fraLerContaCorrenteSaldo1sbnProcurarContaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(fraLerContaCorrenteSaldo1.edfConta,ctCONTAS);
end;

procedure TfrmImportacaoConciliacao.sbnConsultaContratosClick(
  Sender: TObject);
begin
  inherited;
  dtmImportacaoConciliacao.AbrirDocumentos;

end;

procedure TfrmImportacaoConciliacao.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
  vk_f6 :
    begin
      if sbnGerar.Enabled then
        sbnGerarclick(nil)
    end;
  end;
  
end;

procedure TfrmImportacaoConciliacao.dbgconciliacaoextratoitemsCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  Allow := not dtmImportacaoConciliacao.qryMovtosBancosEventos.IsEmpty;
end;

end.
