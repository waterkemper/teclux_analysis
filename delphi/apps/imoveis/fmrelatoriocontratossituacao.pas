unit fmrelatoriocontratossituacao;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DB,
  StdCtrls, frconsulta, frconsultacodigo, cpdata, cpnumero, cpdbtext,
  ExtCtrls, Buttons, dmrelatoriocontratossituacao, ctconstantes, biblio,
  ZQuery, ZPgSqlQuery, cpquery,  cpeditioncontrolvalidation, DBCtrls,
  fmrelatoriopadrao, QCheckLst, fmconsultabasica, fmconsultaporcampo, Mask,
  ToolWin, ComCtrls;

type
  TfrmRelatorioContratosSituacao = class(TfrmRelatorioPadrao)
    gbxContrato: TGroupBox;
    ckbVendidos: TCheckBox;
    ckbRescindidos: TCheckBox;
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    gbxEmpreendimento: TGroupBox;
    gbxCliente: TGroupBox;
    ckbRenegociadosDe: TCheckBox;
    fraConsultaEmprendimento: TfraConsultaCodigo;
    fraConsultaCliente: TfraConsultaCodigo;
    lblA: TLabel;
    ckbTransferidosDe: TCheckBox;
    rbnListaOpcao: TRadioGroup;
    rgbOrdenacao: TRadioGroup;
    ckbNoJuridico: TCheckBox;
    ckbQuitados: TCheckBox;
    ckbReservados: TCheckBox;
    ckbTransferidosPara: TCheckBox;
    ckbRenegociadosPara: TCheckBox;
    ckbCancelados: TCheckBox;
    stxOrdenacao: TStaticText;
    stxListar: TStaticText;
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
  frmRelatorioContratosSituacao: TfrmRelatorioContratosSituacao;

implementation

uses dmbasico;

{$R *.dfm}

{ TForm1 }

constructor TfrmRelatorioContratosSituacao.Create(Aowner: Tcomponent);
begin
  inherited;
  dtmrelatoriocontratossituacao:= Tdtmrelatoriocontratossituacao.Create(Self);
  fraConsultaEmprendimento.TipoPesquisa:= pesEMPREENDIMENTOS;
  fraConsultaCliente.TipoPesquisa      := pesCLIENTES;
end;

destructor TfrmRelatorioContratosSituacao.Destroy;
begin
  dtmrelatoriocontratossituacao:= nil;
  inherited;
  frmrelatoriocontratossituacao:= nil;
end;

procedure TfrmRelatorioContratosSituacao.InternoImpressao;
begin
   inherited;
   with dtmrelatoriocontratossituacao do begin
      fParametroCabecalho := '';

      DataInicial:= strtodate(edtDataInicial.Text);
      DataFinal  := strtodate(edtDataFinal.Text);

      if fraConsultaEmprendimento.edfCodigo.Text <> ''
      then begin
         Empreendimento  := strtoint(fraConsultaEmprendimento.edfCodigo.Text);
         fParametroCabecalho := 'Empreendimento: ' + fraConsultaEmprendimento.edfCodigo.Text;
      end
      else Empreendimento:= 0;

      if fraConsultaCliente.edfCodigo.Text <> ''
      then begin
         Cliente         := strtoint(fraConsultaCliente.edfCodigo.Text);
         fParametroCabecalho := trim(fParametroCabecalho + ' Cliente: ' + fraConsultaCliente.edfCodigo.Text);
      end
      else Cliente         := 0;

      Vendidos        := ckbVendidos.        Checked;
      RenegociadosDe  := ckbRenegociadosDe.  Checked;
      TransferidosDe  := ckbTransferidosDe.  Checked;
      Rescindidos     := ckbRescindidos.     Checked;
      NoJuridico      := ckbNoJuridico.      Checked;
      Quitados        := ckbQuitados.        Checked;
      Reservados      := ckbReservados.      Checked;
      Cancelados      := ckbCancelados.      Checked;
      RenegociadosPara:= ckbRenegociadosPara.Checked;
      TransferidosPara:= ckbTransferidosPara.Checked;


      ListaOpcao   := rbnListaOpcao.itemindex;

      Ordenacao    := rgbOrdenacao.ItemIndex;

      if VerificarDatas
      then ImprimirRelatorio
      else MensagemAviso('Período não informado')
   end;
end;

function TfrmRelatorioContratosSituacao.VerificarDatas: Boolean;
begin
   Result:= True;
   with dtmrelatoriocontratossituacao do
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
     end
     else
   end;
end;

end.
