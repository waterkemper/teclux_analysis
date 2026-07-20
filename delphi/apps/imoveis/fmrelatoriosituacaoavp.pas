unit fmrelatoriosituacaoavp;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DB,
  StdCtrls, frconsulta, frconsultacodigo, cpdata, cpnumero, cpdbtext,
  ExtCtrls, Buttons, dmrelatoriosituacaoavp, ctconstantes, biblio,
  ZQuery, ZPgSqlQuery, cpquery,  cpeditioncontrolvalidation, DBCtrls,
  fmrelatoriopadrao, QCheckLst, fmconsultabasica, fmconsultaporcampo, Mask,
  ToolWin, ComCtrls;

type
  TfrmRelatoriosituacaoavp = class(TfrmRelatorioPadrao)
    gbxContrato: TGroupBox;
    ckbVendidos: TCheckBox;
    ckbRescindidos: TCheckBox;
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    gbxEmpreendimento: TGroupBox;
    gbxCliente: TGroupBox;
    ckbRenegociados: TCheckBox;
    fraConsultaEmprendimento: TfraConsultaCodigo;
    fraConsultaCliente: TfraConsultaCodigo;
    lblA: TLabel;
    ckbTransferidos: TCheckBox;
    rgbOrdenacao: TRadioGroup;
    gbxSituacaoEm: TGroupBox;
    edtDataSituacao: TEditData;
    StaticText1: TStaticText;
    stxOrdenacao: TStaticText;
    procedure edtDataFinalExit(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InternoImpressao; override;
    function  VerificarDatas: Boolean;

  public
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;

    { Public declarations }
  end;

var
  frmRelatoriosituacaoavp: TfrmRelatoriosituacaoavp;

implementation

uses dmbasico;

{$R *.dfm}

{ TForm1 }

constructor TfrmRelatoriosituacaoavp.Create(Aowner: Tcomponent);
begin
  inherited;
  dtmrelatoriosituacaoavp:= Tdtmrelatoriosituacaoavp.Create(Self);
  fraConsultaEmprendimento.TipoPesquisa:= pesEMPREENDIMENTOS;
  fraConsultaCliente.TipoPesquisa      := pesCLIENTES;
  
  if edtDataSituacao.Text = '' then
    edtDataSituacao.text := formatDatetime('dd/mm/yyyy',dtmrelatoriosituacaoavp.dataServidor);

  if edtDataFinal.text = '' then
    edtDataFinal.text := formatDatetime('dd/mm/yyyy',dtmrelatoriosituacaoavp.dataServidor);

end;

destructor TfrmRelatoriosituacaoavp.Destroy;
begin
  dtmrelatoriosituacaoavp:= nil;
  inherited;
  frmrelatoriosituacaoavp:= nil;
end;

procedure TfrmRelatoriosituacaoavp.InternoImpressao;
begin
  inherited;
  with dtmrelatoriosituacaoavp do
  begin
    fParametroCabecalho := '';

    DataInicial     := strtodate(edtDataInicial.Text);
    DataFinal       := strtodate(edtDataFinal.Text);
    Datasituacaoem  := strtodate(edtDataSituacao.text);

    if fraConsultaEmprendimento.edfCodigo.Text <> '' then
    begin
      Empreendimento  := strtoint(fraConsultaEmprendimento.edfCodigo.Text);
      fParametroCabecalho := 'Empreendimento: ' + fraConsultaEmprendimento.edfCodigo.Text;
    end
    else
      Empreendimento:= 0;

    if fraConsultaCliente.edfCodigo.Text <> '' then
    begin
      Cliente         := strtoint(fraConsultaCliente.edfCodigo.Text);
      fParametroCabecalho := trim(fParametroCabecalho + ' Cliente: ' + fraConsultaCliente.edfCodigo.Text);
    end
    else
      Cliente         := 0;

    Vendidos     := ckbVendidos.checked;
    Transferidos := ckbTransferidos.Checked;
    Rescindidos  := ckbRescindidos.Checked;
    Renegociados := ckbRenegociados.Checked;

//  ListaOpcao   := rbnListaOpcao.itemindex;

    Ordenacao    := rgbOrdenacao.ItemIndex;

    IF VerificarDatas THEN
      ImprimirRelatorio
    ELSE
      MensagemAviso('Período não informado')
  end;
end;

function TfrmRelatoriosituacaoavp.VerificarDatas: Boolean;
begin
   Result:= True;
   with dtmrelatoriosituacaoavp do
   begin
     if DataInicial > DataFinal then
     begin
       MensagemAviso(Format(ctDATAMENOR,['Data Final', 'Data Inicial']));
       Result:= False;
     end
     else if (DataInicial <= 0) then
     begin
       MensagemAviso('Data inicial em branco');
       Result:= False;
     end
     else if (DataFinal <= 0) then
     begin
       MensagemAviso('Data final em branco');
       Result:= False;
     end
     else if (DataSituacaoEm <= 0) then
     begin
       MensagemAviso('Data da situação em branco');
       Result:= False;
     end;
   end;
end;

procedure TfrmRelatoriosituacaoavp.edtDataFinalExit(
  Sender: TObject);
begin
  inherited;
  {
  if edtDataFinal.Text <> '' then
    edtDataSituacao.Text := edtDataFinal.Text;
    }
end;

end.
