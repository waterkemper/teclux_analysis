unit fmcomissaovendedorespagtoparcelas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  fmrelatoriopadrao, ExtCtrls, Buttons, frconsulta, frconsultacodigo, DateUtils,
  cpdbradiogroup, cpdata, dmcomissaovendedorespagtoparcelas, Biblio, ComCtrls,
  cppagecontrol, ctconstantes, ToolWin, frselecaoaleatoriavendedores,
  frselecaoaleatoriausuarios;

type
  Tfrmcomissaovendedorespagtoparcelas = class(TfrmRelatorioPadrao)
    rgbResumo: TtecDBRadioGroup;
    rbnComresumo: TtecRadioButton;
    rbnSemResumo: TtecRadioButton;
    rbnSoResumo: TtecRadioButton;
    gbxDataRecebimentos: TGroupBox;
    Label2: TLabel;
    edtDataInicialRecebimento: TEditData;
    edtDataFinalRecebimento: TEditData;
    gbxListaCondicionalVendedores: TGroupBox;
    fraSelecaoAleatoriavendedores: TfraSelecaoAleatoriavendedores;
  private
    { Private declarations }
  protected
    procedure internoimpressao; override;
    function  ValidarCamposSelecao: Boolean;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmcomissaovendedorespagtoparcelas: Tfrmcomissaovendedorespagtoparcelas;

implementation

{$R *.dfm}

{ Tfrmcomissaovendedorespagtoparcelas }

constructor Tfrmcomissaovendedorespagtoparcelas.Create(AOwner: TComponent);
begin
  dtmcomissaovendedorespagtoparcelas:= Tdtmcomissaovendedorespagtoparcelas.Create(Self);
  inherited;
//  edtDataInicial.Text := DateToStr(DataLocal);
//  edtDataFinal.Text   := DateToStr(DataLocal);




end;

destructor Tfrmcomissaovendedorespagtoparcelas.Destroy;
begin
  dtmcomissaovendedorespagtoparcelas:= nil;
  inherited;
  frmcomissaovendedorespagtoparcelas:= nil;
end;

procedure Tfrmcomissaovendedorespagtoparcelas.internoimpressao;
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    with dtmcomissaovendedorespagtoparcelas do
    begin
      ParametroCabecalho:= '';

      ListaCondicionalVendedores := fraSelecaoAleatoriavendedores.ListaCondicional;

      PeriodoInicialRecebimento:= edtDataInicialRecebimento.Text;
      PeriodoFinalRecebimento  := edtDataFinalRecebimento.Text;

      MontaIntervaloPeriodoRecebimento;

      Resumo := rgbResumo.ItemIndex;
      if GerarRelatorio then
      begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edtDataInicialRecebimento.SetFocus;
      end
      else
        ImprimirRelatorio;
    end;
  end;
end;

function Tfrmcomissaovendedorespagtoparcelas.ValidarCamposSelecao: Boolean;
begin
  Result := (edtDataInicialRecebimento.DataValida and edtDataFinalRecebimento.DataValida);
  if Result then
  begin
    if (not dataembranco(edtDataInicialRecebimento.text) and not dataembranco(edtDataFinalRecebimento.text)) then
      Result:=StrToDate(edtDataInicialRecebimento.Text) <= StrToDate(edtDataFinalRecebimento.Text);

    if not result then
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicialRecebimento.SetFocus;
    end;
  end;

end;

end.
