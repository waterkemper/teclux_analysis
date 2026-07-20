unit fmalteracoescontrato;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cpdbradiogroup, cpdata, ExtCtrls, Buttons, fmnavcontroles,
  biblio, {Qete,} ctconstantes, dmcontratosimoveis;

type
  TfrmAlteracoes = class(TfrmNavControles)
    rgpSelecionar: TtecDBRadioGroup;
    rbnQuitacao: TtecRadioButton;
    rbnRescisao: TtecRadioButton;
    rbnTransferencia: TtecRadioButton;
    rbnRenegociacao: TtecRadioButton;
    gbxData: TGroupBox;
    edtData: TEditData;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    pnlHorizontal: TPanel;
    procedure bbnOKClick(Sender: TObject);
  private
    function GetAlteracao: String;
    function GetData: String;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);reintroduce;
    destructor destroy; override;
    property Alteracao : String read GetAlteracao;
    property DataAlteracao : String read GetData;
  end;

var
  frmAlteracoes: TfrmAlteracoes;

implementation

{$R *.dfm}

{ TfrmAlteracoes }

constructor TfrmAlteracoes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  edtData.Minimo:= dtmContratosImoveis.MaiordataPagamento;
  edtData.Text:= datetostr(DataLocal);
  rgpSelecionar.Value:= 'Q';
end;

function TfrmAlteracoes.GetAlteracao: String;
begin
  Result:= rgpSelecionar.Value;
end;

function TfrmAlteracoes.GetData: String;
begin
  Result:= edtData.Text;
end;

procedure TfrmAlteracoes.bbnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult:= mrOk;
end;

destructor TfrmAlteracoes.destroy;
begin
  inherited;
  frmAlteracoes := nil;

end;

end.
