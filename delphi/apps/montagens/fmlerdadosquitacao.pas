
unit fmlerdadosquitacao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmnavcontroles, StdCtrls, cpdata, Buttons, ExtCtrls,
  cpeditioncontrolvalidation, dmquitacaorequisicoesmontagens;

type
  TfrmLerDadosQuitacao = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    lblDatadePagto: TLabel;
    pnlSeparador: TPanel;
    edtDataPagto: TEditData;
    ecvValida: TtecEditionControlValidation;
    procedure bbnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   destructor destroy; override;
   function ValidaControles: Boolean;
  end;

var
  ControleValido     : TWinControl;
  frmLerDadosQuitacao: TfrmLerDadosQuitacao;

implementation

{$R *.dfm}

{ TForm1 }

function TfrmLerDadosQuitacao.ValidaControles: Boolean;
begin
 result:=ecvValida.Verify(gbxFundoJanela, controleValido);
end;

procedure TfrmLerDadosQuitacao.bbnOKClick(Sender: TObject);
begin
  inherited;
  if not ValidaControles then
    modalresult := mrnone
  else
    begin
     with dtmQuitacaoRequisicoesMontagens do
      DatadePagto:=edtDataPagto.Text;
     modalresult := mrOK;
    end;
end;
destructor TfrmLerDadosQuitacao.destroy;
begin
  inherited;
  frmLerDadosQuitacao := nil; 
end;

procedure TfrmLerDadosQuitacao.FormShow(Sender: TObject);
begin
  inherited;
  edtDataPagto.SetFocus;
end;

end.
