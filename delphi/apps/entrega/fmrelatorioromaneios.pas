unit fmrelatorioromaneios;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, cpdata, Mask,
  cpdbfindcontrols, DBCtrls, cpdbtext, ctconstantes, fmConsultaBasica,
  fmConsultaporCampo, biblio,
  //terceiros
  zquery, cpeditioncontrolvalidation, ToolWin, ComCtrls;

type
  TfrmRelatorioRomaneios = class(TfrmRelatorioPadrao)
    gbxFornecedor: TGroupBox;
    sbnProcurarFornecedor: TSpeedButton;
    dtxFornecedor: TtecDBText;
    edfFornecedor: TtecDbEditFind;
    gbxPeriodoAbertura: TGroupBox;
    edtEmissaoInicial: TEditData;
    edtEmissaoFinal: TEditData;
    gbxTipo: TGroupBox;
    ckbNormal: TCheckBox;
    ckbTransferencia: TCheckBox;
    gbxsituacao: TGroupBox;
    rbnEmAberto: TRadioButton;
    rbnQuitados: TRadioButton;
    rbnTodos: TRadioButton;
    ecvValida: TtecEditionControlValidation;
    lblA: TLabel;
    procedure sbnProcurarFornecedorClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure InternoImpressao; override;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    procedure MontaPesquisa;
    function  ValidarCamposSelecao: Boolean;

  end;

var
  frmRelatorioRomaneios: TfrmRelatorioRomaneios;
  tipopesquisa         : ttecRelatorioRomaneios;
  tiporelatorio        : TTecTipoRelatorioRomaneio;
  ControleValido       : TWinControl;

implementation

uses dmrelatorioromaneios;

{$R *.dfm}

{ TfrmRelatorioRomaneio }

constructor TfrmRelatorioRomaneios.Create(Aowner: Tcomponent);
begin
  dtmrelatorioromaneios := Tdtmrelatorioromaneios.Create(Self);
  inherited;
  dtmrelatorioromaneios.Abre(ctTabelas);
end;

destructor TfrmRelatorioRomaneios.Destroy;
begin
  dtmrelatorioromaneios:=nil;
  inherited;
  frmrelatorioromaneios:= nil;
end;

function TfrmRelatorioRomaneios.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl = edfFornecedor then begin
        TipoPesquisa := rrFORNECEDOR;
        Titulo       := 'Fornecedoras';
      end;
      with dtmRelatorioRomaneios do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end;
    end;
  end;
end;

function TfrmRelatorioRomaneios.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmRelatorioRomaneios.TabelaDePesquisa: TZDataSet;
begin
  with dtmrelatorioromaneios do
    case TipoPesquisa of
             rrFORNECEDOR: Result:= ConsultaFornecedores;
    else                 Result:= nil;
    end;
end;

procedure TfrmRelatorioRomaneios.sbnProcurarFornecedorClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFornecedor.SetFocus;
  InternoPesquisar('');
end;

function TfrmRelatorioRomaneios.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  case tipoPesquisa of
    rrFORNECEDOR : result := dtmrelatorioromaneios.ExisteFornecedor(NomeCampo, Value);
  else
    result := false;
  end;

end;

procedure TfrmRelatorioRomaneios.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

procedure TfrmRelatorioRomaneios.MontaPesquisa;
begin
  if ValidarCamposSelecao then begin
    with dtmrelatorioromaneios do
    begin
      ParametroCabecalho:='';
      EmissaoInicial := edtEmissaoInicial.Text;
      EmissaoFinal   := edtEmissaoFinal.Text;
      Fornecedor := edfFornecedor.Text;
      TipoNormal := ckbNormal.Checked;
      TipoTransferencia := ckbTransferencia.checked;


      if rbnEmAberto.Checked then
      begin
       TipoRelatorio := rmEMABERTO;
       porSituacao(0)
      end;

      if rbnQuitados.Checked then
      begin
        TipoRelatorio := rmQUITADOS;
        porSituacao(1)
      end;

      if rbnTodos.Checked then
      begin
        TipoRelatorio := rmTODOS;
        porSituacao(2)
      end;

      qryRomaneios.close;
      qryRomaneios.Open;
      if not (qryRomaneios.IsEmpty) then
         ImprimirRelatorio(TipoRelatorio)
      else begin
             MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
             edfFornecedor.SetFocus;
           end;
    end;
  end;
end;

function TfrmRelatorioRomaneios.ValidarCamposSelecao: Boolean;
begin
   Result:= ecvValida.Verify(gbxPeriodoAbertura, ControleValido);
   if Result then
      if strtodate(edtEmissaoInicial.Text)>strtodate(edtEmissaoFinal.Text) then
      begin
         MensagemAviso(ctDTINICIALMAIORDTFINAL);
         edtEmissaoInicial.SetFocus;
         Result:=false;
      end
      else
       Result:=(ckbNormal.Checked or ckbTransferencia.Checked);
       if Result then
          Result := OperadorTernario((Trim(edfFornecedor.Text) <> ''),edfFornecedor.Exist, True);
end;

end.
