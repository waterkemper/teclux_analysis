unit fmrelatorioextratoconta;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, frlercontacorrentesaldo, ExtCtrls, Buttons,
  //projeto
  dmrelatorioextratoconta, StdCtrls, cpdata, cpdbradiogroup, Mask,
  cpdbfindcontrols, DBCtrls, cpdbtext, ctconstantes, biblio, clparametrossistema,
  fmconsultabasica, fmconsultaporcampo, zquery, cpeditioncontrolvalidation,
  ToolWin, ComCtrls, frconsultacontabil, frconsultacodigocontabil,
  frselecaoaleatoriaeventos, frselecaoaleatoriacontasbancarias;

type
  TfrmRelatorioExtratoConta = class(TFrmRelatorioPadrao)
    gbxTipo: TGroupBox;
    ckbCreditos: TCheckBox;
    ckbDebitos: TCheckBox;
    gbxPeriodo: TGroupBox;
    edtDataFinal: TEditData;
    edtDataInicial: TEditData;
    rgpOrdenacao: TtecDBRadioGroup;
    rbnLancamento: TtecRadioButton;
    rbnCompensacao: TtecRadioButton;
    rgpDocumento: TtecDBRadioGroup;
    rbnSoPrimeiraLinha: TtecRadioButton;
    rbnTodasLinhas: TtecRadioButton;
    ecvValida: TtecEditionControlValidation;
    lblA: TLabel;
    fraSelecaoAleatoriaeventos1: TfraSelecaoAleatoriaeventos;
    fraSelecaoAleatoriacontasbancarias1: TfraSelecaoAleatoriacontasbancarias;
    procedure ckbCreditosClick(Sender: TObject);
    procedure ckbDebitosClick(Sender: TObject);
  private
    { Private declarations }
    procedure CondicoesdaConsultaEvento;
  protected
     procedure InternoImpressao; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); Override;
    destructor  Destroy; override;
    function  ValidarCamposSelecao: Boolean;
  end;

var
  frmRelatorioExtratoConta: TfrmRelatorioExtratoConta;
  TipoPesquisa: TtecMovtosBancos;
  ControleValido       : TWinControl;
  

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmRelatorioExtratoConta.ckbCreditosClick(Sender: TObject);
begin
  inherited;
  if not ckbCreditos.Checked then
    ckbDebitos.Checked := true;
end;

procedure TfrmRelatorioExtratoConta.ckbDebitosClick(Sender: TObject);
begin
  inherited;
  if not ckbDebitos.Checked then
    ckbCreditos.Checked := true;
end;

constructor TfrmRelatorioExtratoConta.Create(AOwner: TComponent);
var Dia: Integer;
begin
  dtmRelatorioExtratoConta:= TdtmRelatorioExtratoConta.Create(Self);
  inherited;
                          {Até o 3º dia  do mês,  sugerimos o 1º}
                          {dia do mês anterior como DataInicial,}
                          {senão, o do mês atual                }
  Dia:= StrToInt(Copy(DateToStr(DataLocal),1,2));
  if Dia <= 3
  then edtDataInicial.Text:= DateToStr(PrimeiroDiaMesPassado(1))
  else edtDataInicial.Text:= DateToStr(PrimeiroDiaMesPassado(0));
  edtDataInicial.Minimo:= DaysBetween(DataLocal, StrToDate('01/01/1990'));

  if StrToDate(edtDataInicial.Text) < ParSistema.BancoDataInicial
  then edtDataInicial.Text:= DateToStr(ParSistema.BancoDataInicial);

                                   {Hoje é sugerido para DataFinal}
   edtDataFinal.Text:= DateToStr(DataLocal);
   if StrToDate(edtDataInicial.Text) > ParSistema.BancoDataFinal
   then edtDataInicial.Text:= DateToStr(ParSistema.BancoDataFinal);
   edtDataFinal.Minimo:= edtDataInicial.Minimo;

{
  fraConsultaEvento.TipoPesquisa  := pesEVENTO;
  fraConsultaEvento.CondicoesdaConsulta := CondicoesdaConsultaEvento;
}


  fraSelecaoAleatoriaeventos1.fraSelecaoAleatoriaeventos.ConsultaSelecaoAleatoriaContabil.CondicoesdaConsulta :=
    CondicoesdaConsultaEvento


end;

destructor TfrmRelatorioExtratoConta.Destroy;
begin
  inherited;

end;

procedure TfrmRelatorioExtratoConta.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    with dtmRelatorioExtratoConta do
    begin
      ParametroConta  := fraSelecaoAleatoriacontasbancarias1.ListaCondicional;
      ParametroEvento := fraSelecaoAleatoriaeventos1.ListaCondicional;
      ParametroDebito := ckbDebitos.Checked;
      ParametroCredito := ckbCreditos.Checked;
      ParametroDataInicial := edtDataInicial.Text;
      ParametroDataFinal := edtDataFinal.Text;
      ParametroOrdenacao := rgpOrdenacao.ItemIndex;
      ParametroDocumento := rgpDocumento.ItemIndex;
      ImprimirExtratoConta;
    end;
  end;  
end;

function TfrmRelatorioExtratoConta.ValidarCamposSelecao: Boolean;
begin
   Result:= ecvValida.Verify(pnlFundoJanela, ControleValido);
   if result then
   begin
     Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
     if Result then
     begin
      if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
        Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
      if result then
      begin
        Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));

        if not Result then
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
end;

procedure TfrmRelatorioExtratoConta.CondicoesdaConsultaEvento;
begin
  fraSelecaoAleatoriaeventos1.fraSelecaoAleatoriaeventos.ConsultaSelecaoAleatoriaContabil.qryConsultaEventos.MacroByName('condicoes').asString :=
    ' and e.tipo = ''A'' and e.Inativo IS NULL ';

  fraSelecaoAleatoriaeventos1.fraSelecaoAleatoriaeventos.ConsultaSelecaoAleatoriaContabil.qryProcuraEventos.MacroByName('condicoes').asString :=
    ' and e.tipo = ''A'' and e.Inativo IS NULL ';


end;

end.
