unit fmAgendamentoProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmnavcontroles, StdCtrls, Buttons, ExtCtrls,
  frAgendamentoProdutos, clusuario, ctconstantes;

type
  TfrmAgendamentoProdutos = class(TfrmNavControles)
    pnlBottom: TPanel;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    fraAgendamentoProdutos1: TfraAgendamentoProdutos;
    procedure fraAgendamentoProdutos1ckbMarcarClick(Sender: TObject);
    procedure fraAgendamentoProdutos1dbgAgendamentoProdutosDblClick(
      Sender: TObject);
    procedure fraAgendamentoProdutos1dbgAgendamentoProdutosKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbnOKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

  end;

var
  frmAgendamentoProdutos: TfrmAgendamentoProdutos;
  AcionarTelaAgendamentoProdutos: function (Owner: TComponent; ListadeProdutos: String): boolean;

implementation

{$R *.dfm}

function AcionarTelaAgendamentoProdutos_(Owner: TComponent; ListadeProdutos: String): boolean;
begin
  result := false;
  if {(not assigned(frmAgendamentoProdutos) or (frmAgendamentoProdutos.Owner <> Owner)) and} (ListadeProdutos <> '') then
  begin
            {
    if assigned(frmAgendamentoProdutos) then
    begin
      if frmAgendamentoProdutos <> nil then
        freeandnil(frmAgendamentoProdutos);
    end;
    }

    if Owner.FindComponent('frmAgendamentoProdutos_'+Owner.name) = nil then
    begin
      frmAgendamentoProdutos := TfrmAgendamentoProdutos.create(Owner);
      frmAgendamentoProdutos.name := 'frmAgendamentoProdutos_'+Owner.name;
    end;

    with TfrmAgendamentoProdutos(Owner.FindComponent('frmAgendamentoProdutos_'+Owner.name)) do
    begin
      fraAgendamentoProdutos1.qryAgendamentoProdutos.MacroByName('ListadeProdutos').asString := ListadeProdutos;
      fraAgendamentoProdutos1.AbrirqryAgendamentoProdutos;
      if not fraAgendamentoProdutos1.qryAgendamentoProdutos.isempty then
        result := showmodal = mrOK
      else
        result := false;
    end;

  end;
//  frmAgendamentoProdutos.free;
//  frmVisualizarImageURL.BringToFront;
end;


constructor TfrmAgendamentoProdutos.Create(AOwner: TComponent);
begin
  inherited;
  bbnOK.enabled := false;
end;

procedure TfrmAgendamentoProdutos.fraAgendamentoProdutos1ckbMarcarClick(
  Sender: TObject);
begin
  inherited;
  fraAgendamentoProdutos1.ckbMarcarClick(Sender);
  bbnOK.enabled := (fraAgendamentoProdutos1.vQuantidadeMarcados <> 0)
end;

procedure TfrmAgendamentoProdutos.fraAgendamentoProdutos1dbgAgendamentoProdutosDblClick(
  Sender: TObject);
begin
  inherited;
  fraAgendamentoProdutos1.dbgAgendamentoProdutosDblClick(Sender);
  bbnOK.enabled := (fraAgendamentoProdutos1.vQuantidadeMarcados <> 0);

end;

procedure TfrmAgendamentoProdutos.fraAgendamentoProdutos1dbgAgendamentoProdutosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraAgendamentoProdutos1.dbgAgendamentoProdutosKeyDown(Sender, Key,
  Shift);
  bbnOK.enabled := (fraAgendamentoProdutos1.vQuantidadeMarcados <> 0);
end;

procedure TfrmAgendamentoProdutos.bbnOKClick(Sender: TObject);
begin
  inherited;
  UsuarioAutAux := fraAgendamentoProdutos1.dmbasico.ObterAutorizacao(taLOGIN, 'Atendimentos', 'responsável pelo cadastro', '');

  if Assigned(UsuarioAutAux) then
    modalresult := mrOK
  else
    modalresult := mrNone;

end;

procedure TfrmAgendamentoProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := (modalresult <> mrNone)
end;

procedure TfrmAgendamentoProdutos.FormShow(Sender: TObject);
begin
  inherited;
  self.BringToFront;
end;

initialization
   AcionarTelaAgendamentoProdutos :=  AcionarTelaAgendamentoProdutos_;
end.
