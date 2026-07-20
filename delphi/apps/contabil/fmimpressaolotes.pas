unit fmimpressaolotes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, StdCtrls, cpnumero, Mask, cpdata, ExtCtrls,
  Buttons, frlistafiliais, biblio, ctconstantes, clparametrossistema,
  DBCtrls, cpdbtext, frconsulta, frconsultacodigo, frconsultacontabil,
  frconsultacodigocontabil, ToolWin, ComCtrls;

type
  TfrmImpressaoLotes = class(TfrmRelatorioPadrao)
    gbxDataConsulta: TGroupBox;
    gbxNrLotes: TGroupBox;
    edtLoteInicial: TEditNumero;
    edtLoteFinal: TEditNumero;
    gbxFilialConsulta: TGroupBox;
    lblFilialBase: TLabel;
    ckbExibirTotaisporLote: TCheckBox;
    gbxConta: TGroupBox;
    fraConsultaContaContabil: TfraConsultaCodigoContabil;
    dtxClassificacaoContabil: TtecDBText;
    ckbExcetoConta: TCheckBox;
    gbxDataConsultaAlteracao: TGroupBox;
    rgpOrdenacao: TRadioGroup;
    gbxOpcoes: TGroupBox;
    edtDataInicialAlteracao: TEditData;
    edtDataFinalAlteracao: TEditData;
    lblA_NrLotes: TLabel;
    lblA_PeriodoAlteracoes: TLabel;
    edtDataIniciallancto: TEditData;
    Label1: TLabel;
    edtDataFinallancto: TEditData;
    gbxOrigemConsulta: TGroupBox;
    ckbEntradas: TCheckBox;
    ckbManual: TCheckBox;
    ckbPagamentos: TCheckBox;
    ckbRecebimentos: TCheckBox;
    ckbSaidas: TCheckBox;
    ckbDocPagar: TCheckBox;
    ckbLotes: TCheckBox;
    ckbEncerramento: TCheckBox;
    ckbBancos: TCheckBox;
    ckbImportacao: TCheckBox;
    ckbAdiantamentos: TCheckBox;
    ckbVendasImoveis: TCheckBox;
    ckbChavesImoveis: TCheckBox;
    ckbAtMonImoveis: TCheckBox;
    ckbRecebimentosImoveis: TCheckBox;
    stxOrdenacao: TStaticText;
    procedure edtLoteInicialExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FViaLancto: boolean;
    FOntecClose: TtecProcedure;
  private
    { Private declarations }
    function ValidarCamposSelecao: Boolean;
    property ViaLancto: boolean read FViaLancto write FViaLancto;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure OperacaoPadrao(Value: Array of Variant); override;
    procedure InternoImpressao; override;
    property  OntecClose: TtecProcedure read FOntecClose write FOntecClose;
  end;

var
  frmImpressaoLotes: TfrmImpressaoLotes;

implementation

uses dmimpressaolotes;

{$R *.dfm}

{ TfrmImpressaoLotes }

constructor TfrmImpressaoLotes.Create(AOwner: TComponent);
begin
  dtmImpressaoLotes := TdtmImpressaoLotes.Create(Self);
  inherited;
  edtDataInicialAlteracao.Text:= DateToStr(DataLocal);
  edtDataFinalAlteracao.  Text:= DateToStr(DataLocal);
  edtDataIniciallancto.Text := DateToStr(PrimeiroDiaMesPassado(0));
  edtDataFinallancto.  Text := DateToStr(DataLocal);
  lblFilialBase.Caption := dtmImpressaoLotes.DescricaoFilial;
  fraConsultaContaContabil.TipoContaContabilDebitoSelecionavel  := '';
  fraConsultaContaContabil.TipoContaContabilConsultaSelecionavel:= '';
  fraConsultaContaContabil.TipoPesquisa := pesCONTADEBITO;
  ViaLancto := false;

end;

destructor TfrmImpressaoLotes.Destroy;
begin
{
  dtmimpressaoLotes.free;
  dtmImpressaoLotes := nil;
  inherited;
  frmImpressaoLotes := nil;
}
  inherited;
  frmImpressaoLotes := nil;
  dtmImpressaoLotes := nil;
  if Assigned(OntecClose) then
    OntecClose;
end;

procedure TfrmImpressaoLotes.InternoImpressao;
var
  par_origem,datainiciallancto,
  datafinallancto,
  datainicialalteracao,
  datafinalalteracao: String;
begin
  inherited;
  if ValidarCamposSelecao then
    with dtmImpressaoLotes do
    begin
      par_origem:= '';
      if ckbBancos.       Checked then par_origem := par_origem + '''B'',';
      if ckbDocPagar.     Checked then par_origem := par_origem + '''D'',';
      if ckbAdiantamentos.Checked then par_origem := par_origem + '''A'',';
      if ckbEntradas.     Checked then par_origem := par_origem + '''E'',';
      if ckbLotes.        Checked then par_origem := par_origem + '''L'',';
      if ckbManual.       Checked then par_origem := par_origem + '''M'',';
      if ckbPagamentos.   Checked then par_origem := par_origem + '''P'',';
      if ckbRecebimentos. Checked then par_origem := par_origem + '''R'',';
      if ckbSaidas.       Checked then par_origem := par_origem + '''S'',';
      if ckbEncerramento. Checked then par_origem := par_origem + '''X'',';
      if ckbImportacao.   Checked then par_origem := par_origem + '''I'',';
      if ckbVendasImoveis.Checked then par_origem := par_origem + '''V'',';
      if ckbChavesImoveis.Checked   then par_origem := par_origem + '''H'',';
      if ckbAtMonImoveis.Checked   then par_origem := par_origem + '''O'',';
      if ckbRecebimentosImoveis.Checked   then par_origem := par_origem + '''T'',';


      if Length(par_origem) > 0  then delete(par_origem,Length(Par_Origem),1);

      if not DataEmBranco(edtDataIniciallancto.Text) then
        datainiciallancto := edtDataIniciallancto.Text
      else
        datainiciallancto := '';

      if not DataEmBranco(edtDataFinallancto.Text) then
        datafinallancto := edtDataFinallancto.Text
      else
        datafinallancto := '';

      if not DataEmBranco(edtDataInicialAlteracao.Text) then
        datainicialalteracao := edtDataInicialAlteracao.Text
      else
        datainicialalteracao := '';

      if not DataEmBranco(edtDataFinalAlteracao.Text) then
        datafinalalteracao := edtDataFinalAlteracao.Text
      else
        datafinalalteracao := '';

      ImprimirLotes(datainiciallancto,datafinallancto,datainicialalteracao, datafinalalteracao,
                    edtLoteInicial.text, edtLoteFinal.text, par_origem, fraConsultaContaContabil.edfCodigo.Text,
                    fraConsultaContaContabil.edfCodigo.DataSource.DataSet.FieldByName('classificacao').AsString,
                    fraConsultaContaContabil.edfCodigo.DataSource.DataSet.FieldByName('tipo').AsString,
                    fraConsultaContaContabil.edfCodigo.DataSource.DataSet.FieldByName('descricao').AsString,
                    ckbExcetoConta.Checked, ckbExibirTotaisporLote.Checked, rgpOrdenacao.ItemIndex);
    end;
end;

function TfrmImpressaoLotes.ValidarCamposSelecao: Boolean;
begin
  Result := (edtDataInicialLancto.DataValida and edtDataFinalLancto.DataValida);
  if Result then
  begin
    Result:=(not DataEmBranco(edtDataInicialLancto.text) or
             not DataEmBranco(edtDataFinalLancto.text));
    if result then
    begin
      Result:=   StrToDate(edtDataInicialLancto.Text)
              <= StrToDate(edtDataFinalLancto.Text);

      if not Result then
      begin
        MensagemAviso(ctDATAINVALIDA);
        edtDataInicialLancto.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicialLancto.SetFocus;
    end;
  end;

  if result then
  begin
    Result := (edtDataInicialAlteracao.DataValida and
               edtDataFinalAlteracao.DataValida);
    if Result then
    begin
      if (not DataEmBranco(edtDataInicialAlteracao.text) and
          not DataEmBranco(edtDataFinalAlteracao.text)) then
      begin
        Result:=   StrToDate(edtDataInicialAlteracao.Text)
              <= StrToDate(edtDataFinalAlteracao.Text);
        if not result then
        begin
          MensagemAviso(ctDTINICIALMAIORDTFINAL);
          edtDataInicialAlteracao.SetFocus;
        end;
      end;
    end;
  end;

  if result then
  begin
    if (edtloteinicial.Text<>'') and
       (edtLoteFinal.Text<>'') then
      if strtoint(edtLoteInicial.Text) >
         strtoint(edtLoteFinal.text) then
      begin
        result := false;
        MensagemAviso(format(ctINICIALMAIORFINAL,['de lote inicial','final']));
      end;
  end;
end;

procedure TfrmImpressaoLotes.edtLoteInicialExit(Sender: TObject);
begin
  inherited;
  if  edtLoteInicial.Text <> '' then
    edtLoteFinal.Text := edtLoteInicial.Text;
end;

procedure TfrmImpressaoLotes.OperacaoPadrao(Value: array of Variant);
begin
  inherited;
  edtDataInicialAlteracao.Text:= ''; //DateToStr(DataLocal);
  edtDataFinalAlteracao.  Text:= ''; //DateToStr(DataLocal);
  edtDataIniciallancto.Text:= DateToStr(Value[0]);
  edtDataFinallancto.  Text:= DateToStr(Value[1]);
  edtLoteInicial.Text:= Value[2];
  edtLoteFinal.  Text:= Value[2];
  ckbEncerramento.Checked := True;
  ckbExibirTotaisporLote.Checked := False;
  fraConsultaContaContabil.ListaContasContabeisConsultaSelecionaveis := Value[3];
  fraConsultaContaContabil.ListaContasContabeisCreditosSelecionaveis := Value[3];
  fraConsultaContaContabil.ListaContasContabeisDebitosSelecionaveis := Value[3];
  ViaLancto := True;
  BloquearFormularios(self.name);
  fraConsultaContaContabil.edfCodigo.SetFocus;
  fraConsultaContaContabil.edfCodigo.SelectAll;
end;

procedure TfrmImpressaoLotes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if ViaLancto then
    DesbloquearFormularios;
end;

end.
