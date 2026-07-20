unit fmrelatoriorecebimentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DB,
  StdCtrls, frconsulta, frconsultacodigo, cpdata, cpnumero, cpdbtext,
  ExtCtrls, Buttons, dmrelatoriorecebimentos, ctconstantes, biblio,
  ZQuery, ZPgSqlQuery, cpquery,  cpeditioncontrolvalidation, DBCtrls,
  fmrelatoriopadrao, QCheckLst, fmconsultabasica, fmconsultaporcampo, Mask,
  ToolWin, ComCtrls;

type
  TfrmRelatorioRecebimentos = class(TfrmRelatorioPadrao)
    gbxListar: TGroupBox;
    ckbRecebimentosporEmpreendimento: TCheckBox;
    ckbRecebimentosporCliente: TCheckBox;
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    gbxEmpreendimento: TGroupBox;
    gbxCliente: TGroupBox;
    ckbRecebimentoscomParcelas: TCheckBox;
    fraConsultaEmprendimento: TfraConsultaCodigo;
    fraConsultaCliente: TfraConsultaCodigo;
    lblA: TLabel;
    gbxContas: TGroupBox;
    fraConsultaContas: TfraConsultaCodigo;
    lbltraco: TLabel;
    dtxAgencia: TtecDBText;
    ckbTotaisporConta: TCheckBox;
    dtxDigito: TtecDBText;
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
  frmRelatorioRecebimentos: TfrmRelatorioRecebimentos;

implementation

uses dmbasico;

{$R *.dfm}

{ TForm1 }

constructor TfrmRelatorioRecebimentos.Create(Aowner: Tcomponent);
begin
  inherited;
  dtmRelatorioRecebimentos:= TdtmRelatorioRecebimentos.Create(Self);
  fraConsultaEmprendimento.TipoPesquisa:= pesEMPREENDIMENTOS;
  fraConsultaCliente.TipoPesquisa      := pesCLIENTES;
  fraConsultaContas.TipoPesquisa       := pesCONTAS;
end;

destructor TfrmRelatorioRecebimentos.Destroy;
begin
  dtmRelatorioRecebimentos:= nil;
  inherited;
  frmRelatorioRecebimentos:= nil;
end;

procedure TfrmRelatorioRecebimentos.InternoImpressao;
begin
  inherited;
  with dtmRelatorioRecebimentos do
  begin
    DataInicial     := strtodate(edtDataInicial.Text);
    DataFinal       := strtodate(edtDataFinal.Text);
    if fraConsultaEmprendimento.edfCodigo.Text <> '' then
      Empreendimento  := strtoint(fraConsultaEmprendimento.edfCodigo.Text)
    else
      Empreendimento:= 0;
    if fraConsultaCliente.edfCodigo.Text <> '' then
      Cliente         := strtoint(fraConsultaCliente.edfCodigo.Text)
    else
      Cliente         := 0;
    if fraConsultaContas.edfCodigo.Text <> '' then
      ContaPagto:= strtoint(fraConsultaContas.edfCodigo.Text)
    else
      ContaPagto := 0;

    SoEmpreendimento:= ckbRecebimentosporEmpreendimento.Checked;
    SoCliente       := ckbRecebimentosporCliente.Checked;
    ComParcelas     := ckbRecebimentoscomParcelas.Checked;
    TotaisporConta  := ckbTotaisporConta.Checked;
    IF VerificarDatas THEN
      ImprimirRelatorio
    ELSE
      MensagemAviso('Período não informado')
  end;
end;

function TfrmRelatorioRecebimentos.VerificarDatas: Boolean;
begin
   Result:= True;
   with dtmRelatorioRecebimentos do
   begin
     if DataInicial > DataFinal then
     begin
       MensagemAviso(Format(ctDATAMENOR,['Data Final', 'Data Inicial']));
       Result:= False;
     end
     else if not (DataInicial >= 0) then
     begin
       MensagemAviso('Database inicial em branco');
       Result:= False;
     end
     else if not (DataFinal >= 0) then
     begin
       MensagemAviso('Database final em branco');
       Result:= False;
     end;
   end;
end;

end.
