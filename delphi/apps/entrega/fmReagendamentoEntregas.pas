unit fmReagendamentoEntregas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvDBLookupComboBox, ComCtrls, AdvDateTimePicker,
  AdvDBDateTimePicker, dmConsultaEntregaProdutos, Buttons, PCheck, PDBCheck,
  cpdbradiogroup, Mask, DBCtrls, cptexto, DBLup2, ExtCtrls, cpquery;

type
  TfrmReagendamentoEntregas = class(TForm)
    AdvDBDateTimePicker1: TAdvDBDateTimePicker;
    AdvDBDateTimePicker2: TAdvDBDateTimePicker;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    ckbDBDefinirEntregaParaTodos: TPDBCheck;
    rgbEntrega: TtecDBRadioGroup;
    rbnEntregaSIM: TtecRadioButton;
    rbnEntregaNAO: TtecRadioButton;
    lblDias: TLabel;
    edtDias: TDBEditTexto;
    DBLPeriodo: TDBLookupComboPlus;
    Paneltop: TPanel;
    Panelmiddle: TPanel;
    PanelBottom: TPanel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    vRecnoaux: integer;
  end;

var
  frmReagendamentoEntregas: TfrmReagendamentoEntregas;

implementation

{$R *.dfm}

procedure TfrmReagendamentoEntregas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if vRecnoaux <> 0 then
    if TTecQuery(AdvDBDateTimePicker1.datasource.dataset).recno <> vRecnoaux then
      TTecQuery(AdvDBDateTimePicker1.datasource.dataset).recno :=  vRecnoaux;

  CanClose := TTecQuery(AdvDBDateTimePicker1.datasource.dataset).checkrequiredFields;
end;

end.
