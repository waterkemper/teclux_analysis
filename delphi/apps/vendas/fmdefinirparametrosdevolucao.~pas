unit fmdefinirparametrosdevolucao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, ExtCtrls, DateUtils, cptexto, cpnumero, Buttons,
  {dmdevolucaomercadorias, dmtrocamercadorias,} fmnavcontroles, cpdata, biblio, {Qete,} ctconstantes,
  Grids, DBGrids, cpdbgrid, clparametrossistema, Mask, ACBrBase, ACBrDFe,
  ACBrNFe, pcnNFeRTXT;

type
  TfrmDefinirParametrosDevolucao = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxDefinirParametros: TGroupBox;
    ckbSeguro: TCheckBox;
    ckbFrete: TCheckBox;
    ckbCliente: TCheckBox;
    edtNumeroNota: TEditNumero;
    edtSerie: TEditTexto;
    lblSerie: TLabel;
    lblNumero: TLabel;
    ckbCreditarICMS: TCheckBox;
    lblEmissao: TLabel;
    edtEmissao: TEditData;
    sbnConfirma: TBitBtn;
    ckbCreditoTroca: TCheckBox;
    edtChaveNfe: TMaskEdit;
    ChaveNFe: TLabel;
    sbnLerXMLNfe: TSpeedButton;
    odlLerXMLNfe: TOpenDialog;
    ACBrNFe1: TACBrNFe;
    procedure ckbSeguroClick(Sender: TObject);
    procedure ckbFreteClick(Sender: TObject);
    procedure ckbClienteClick(Sender: TObject);
    procedure edtSerieExit(Sender: TObject);
    procedure edtNumeroNotaExit(Sender: TObject);
    procedure ckbCreditarICMSClick(Sender: TObject);
    procedure edtEmissaoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure ckbCreditoTrocaClick(Sender: TObject);
    procedure edtChaveNfeExit(Sender: TObject);
    procedure sbnLerXMLNfeClick(Sender: TObject);
  protected
//    dtmDevolucaoMercadorias: TdtmDevolucaoMercadorias;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    NFeRTXT: TNFeRTXT;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
//    procedure   SetDataModulo(Dtm: TdtmDevolucaoMercadorias);
  end;

var
  frmDefinirParametrosDevolucao: TfrmDefinirParametrosDevolucao;

implementation

{$R *.dfm}

{ TfrmDefinirParametrosDevolucao }

constructor TfrmDefinirParametrosDevolucao.Create(AOwner: TComponent);
begin
//  dtmDevolucaoMercadorias:= TdtmDevolucaoMercadorias.Create(Self);
  inherited;
//  ckbCreditoTroca.Enabled := parsistema.utilizarcreditotrocacontrato;
  ckbCreditoTroca.Enabled := false;
  sbnLerXMLNfe.Enabled := false;
end;

destructor TfrmDefinirParametrosDevolucao.Destroy;
begin
  inherited;
  frmDefinirParametrosDevolucao:= nil;
end;

procedure TfrmDefinirParametrosDevolucao.ckbSeguroClick(Sender: TObject);
begin
{  dtmDevolucaoMercadorias.DevolverSeguro:= ckbSeguro.Checked;}
end;

procedure TfrmDefinirParametrosDevolucao.ckbFreteClick(Sender: TObject);
begin
{  dtmDevolucaoMercadorias.DevolverFrete:= ckbFrete.Checked;}
end;

procedure TfrmDefinirParametrosDevolucao.ckbClienteClick(Sender: TObject);
begin
  {dtmDevolucaoMercadorias.ClienteTrouxeNota:= ckbCliente.Checked;}

  if not ckbCliente.Checked then begin
    edtSerie.Clear;
    edtNumeroNota.Clear;
    edtEmissao.Clear;
  end;
  lblSerie.Enabled     := ckbCliente.Checked;
  lblNumero.Enabled    := ckbCliente.Checked;
  edtSerie.Enabled     := ckbCliente.Checked;
  edtNumeroNota.Enabled:= ckbCliente.Checked;
  lblEmissao.Enabled   := ckbCliente.Checked;
  edtEmissao.Enabled   := ckbCliente.Checked;
  ChaveNFe.Enabled   := ckbCliente.Checked;
  edtChaveNfe.Enabled   := ckbCliente.Checked;
  sbnLerXMLNfe.Enabled   := ckbCliente.Checked;
end;

procedure TfrmDefinirParametrosDevolucao.edtSerieExit(Sender: TObject);
begin
{  dtmDevolucaoMercadorias.SerieDevolucao:= edtSerie.Text;}
end;

procedure TfrmDefinirParametrosDevolucao.edtNumeroNotaExit(Sender: TObject);
begin
{  dtmDevolucaoMercadorias.NumeroDevolucao:= edtNumeroNota.Text;}
end;

procedure TfrmDefinirParametrosDevolucao.ckbCreditarICMSClick(Sender: TObject);
begin
{  dtmDevolucaoMercadorias.CreditarICMS:= ckbCreditarICMS.Checked;}
end;

//procedure TfrmDefinirParametrosDevolucao.SetDataModulo(Dtm: TdtmDevolucaoMercadorias);
//begin
//  dtmDevolucaoMercadorias:= Dtm;
//end;

procedure TfrmDefinirParametrosDevolucao.edtEmissaoExit(Sender: TObject);
begin
  inherited;
{  if edtEmissao.Text <> '' then
    dtmDevolucaoMercadorias.DataDevolucao:= edtEmissao.Text
    }
end;

procedure TfrmDefinirParametrosDevolucao.FormShow(Sender: TObject);
begin
  inherited;
  {
  with dtmDevolucaoMercadorias do
  begin
    DevolverSeguro    := ckbSeguro.Checked;
    DevolverFrete     := ckbFrete.Checked;
    ckbCreditarICMS.Checked:= PodeCreditarICMS and (SituacaoContrato[1] in ['N','P']);
    ckbCreditarICMS.Enabled:= PodeCreditarICMS and (SituacaoContrato[1] in ['N','P']);
    CreditarICMS      := ckbCreditarICMS.Checked;
    ClienteTrouxeNota := ckbCliente.Checked;
    SerieDevolucao    := '';
    NumeroDevolucao   := '';
    DataDevolucao     := '';
    ckbCliente.Enabled:= (ClientePessoaTipo = 'J');
    edtEmissao.Minimo := DaysBetween(DataServidor,DataContrato);
  end;
  }
  ckbFrete.SetFocus;
end;

procedure TfrmDefinirParametrosDevolucao.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Key:= MAXWORD;
  inherited;
end;

procedure TfrmDefinirParametrosDevolucao.sbnConfirmaClick(Sender: TObject);
begin
  inherited;

  if ckbCliente.Checked then
  begin
    if (edtSerie.Text = '') or (edtNumeroNota.Text = '') or (edtEmissao.Text = '') then
    begin
      MensagemAviso(ctPREENCHERCAMPOSDEVOLUCAO);
      edtSerie.SetFocus;
    end
    else
    begin
      modalresult := mrOK;
//      Close;
    end;
  end
  else
  begin
    modalresult := mrOK;
//    Close;
  end;

end;

procedure TfrmDefinirParametrosDevolucao.ckbCreditoTrocaClick(
  Sender: TObject);
begin
  inherited;
{  dtmDevolucaoMercadorias.DevolverCreditoTroca:= ckbCreditoTroca.Checked;}
end;

procedure TfrmDefinirParametrosDevolucao.edtChaveNfeExit(Sender: TObject);
begin
  inherited;
{  dtmDevolucaoMercadorias.ChaveNfeDevolucao:= edtChaveNfe.Text;}

  if copy(edtChaveNfe.text,23,3)<>'' then
  begin
    edtSerie.text := copy(edtChaveNfe.text,23,3);
    edtSerieexit(nil);
  end;

  if copy(edtChaveNfe.text,26,9)<>'' then
  begin
    edtNumeroNota.text := inttostr(strtoint(copy(edtChaveNfe.text,26,9)));
    edtNumeroNotaExit(nil);
  end;
end;

procedure TfrmDefinirParametrosDevolucao.sbnLerXMLNfeClick(
  Sender: TObject);
var
  n: integer;  
begin
  inherited;
  odlLerXMLNfe.FileName  :=  '';
  odlLerXMLNfe.Title := 'Selecione a NFE';
  odlLerXMLNfe.DefaultExt := '*.XML';
  odlLerXMLNfe.Filter := 'Arquivos XML (*.XML)|*.XML|Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos TXT (*.TXT)|*.TXT|Todos os Arquivos (*.*)|*.*';
  if odlLerXMLNfe.Execute then
  begin
    ACBrNFe1.NotasFiscais.Clear;
    //tenta TXT
    ACBrNFe1.NotasFiscais.Add;
    //  if not Assigned(NFeRTXT) then
    NFeRTXT := TNFeRTXT.Create(ACBrNFe1.NotasFiscais.Items[0].NFe);
    //  NFeRTXT.ConteudoArquivo
    NFeRTXT.CarregarArquivo(odlLerXMLNfe.FileName);
    if NFeRTXT.LerTxt then
      NFeRTXT.Free
    else
    begin
       NFeRTXT.Free;
       //tenta XML

       ACBrNFe1.NotasFiscais.Clear;
       try
         ACBrNFe1.NotasFiscais.LoadFromFile(odlLerXMLNfe.FileName);
       except
          on E: Exception do
          begin
            ShowMessage(E.Message);
            exit;
          end;
       end;
    end;

    for n:=0 to ACBrNFe1.NotasFiscais.Count-1 do
    begin
      with ACBrNFe1.NotasFiscais.Items[n].NFe do
      begin

        edtSerie.text := inttostr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.serie);
        edtSerieExit(nil);

        edtNumeroNota.text := inttostr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF);
        edtNumeroNotaExit(nil);

        edtEmissao.Text := datetimetostr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dEmi);
        edtEmissaoExit(nil);

        edtChaveNfe.text := SomenteNumero(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID);
        edtChaveNfeExit(nil);

      end;
    end;
  end;
end;

end.
