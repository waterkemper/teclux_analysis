unit fmRelatorioVendasListasCasamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  frintervalodatas, biblio, ctconstantes;

type
  TfrmRelatorioVendasListasCasamento = class(TFrmRelatorioPadrao)
    fraIntervaloDatas: TfraIntervaloDatas;
  private
    { Private declarations }
    function  ValidarCamposSelecao: Boolean;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure InternoImpressao; override;
  end;

var
  frmRelatorioVendasListasCasamento: TfrmRelatorioVendasListasCasamento;

implementation

uses dmRelatorioVendasListasCasamento;

{$R *.dfm}

{ TfrmRelatorioVendasListasCasamento }

constructor TfrmRelatorioVendasListasCasamento.Create(AOwner: TComponent);
begin
  inherited;
  dtmRelatorioVendasListasCasamento := TdtmRelatorioVendasListasCasamento.Create(Self);
end;

destructor TfrmRelatorioVendasListasCasamento.Destroy;
begin
  inherited;
  frmRelatorioVendasListasCasamento := nil;
end;

procedure TfrmRelatorioVendasListasCasamento.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
    dtmRelatorioVendasListasCasamento.ImprimirRelatorio(fraIntervaloDatas.edtDataInicial.text,
                                                  fraIntervaloDatas.edtDataFinal.text);
end;

function TfrmRelatorioVendasListasCasamento.ValidarCamposSelecao: Boolean;
begin
  Result := (fraIntervaloDatas.edtDataInicial.DataValida and fraIntervaloDatas.edtDataFinal.DataValida);
  if Result then
  begin
    if (not dataembranco(fraIntervaloDatas.edtDataInicial.text) and not dataembranco(fraIntervaloDatas.edtDataFinal.text)) then
      Result:=StrToDate(fraIntervaloDatas.edtDataInicial.Text) <= StrToDate(fraIntervaloDatas.edtDataFinal.Text);

    if result then
    begin
      Result:=(not dataembranco(fraIntervaloDatas.edtDataInicial.text) or not dataembranco(fraIntervaloDatas.edtDataFinal.text));
      if not Result then
      begin
        MensagemAviso(ctDATAINVALIDA);
        fraIntervaloDatas.edtDataInicial.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      fraIntervaloDatas.edtDataInicial.SetFocus;
    end;
  end;
end;

end.
