unit fmcadastroprodutosclientespedidossaidas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, Mask,
  DBCtrls, cptexto, cpdbtext,
  cpnumero, {Qete,} DB, cpdatasource, ToolWin;

type
  TfrmCadastroProdutosClientesPedidosSaidas = class(TfrmCadastroPadrao)
    gbxCliente: TGroupBox;
    gbxProduto: TGroupBox;
    gbxProdutoCliente: TGroupBox;
    gbxPN: TGroupBox;
    gbxOrigem: TGroupBox;
    dtxNomeCliente: TtecDBText;
    dtxDescricaoProduto: TtecDBText;
    edtProdutoCliente: TDBEditTexto;
    edtOrigem: TDBEditTexto;
    dtxCodigoCliente: TtecDBText;
    dtxCodigoProduto: TtecDBText;
    edtPN: TDBEditNumero;
    gbxFinalidade: TGroupBox;
    edtFinalidade: TDBEditTexto;
    dsrProdutosClientes: TtecDataSource;
  private
    { Private declarations }
  protected
    function InternoGravar: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    { Public declarations }
  end;

var
  frmCadastroProdutosClientesPedidosSaidas: TfrmCadastroProdutosClientesPedidosSaidas;

implementation

{$R *.dfm}

{ TfrmCadastroProdutosClientesPedidos }

function TfrmCadastroProdutosClientesPedidosSaidas.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  dsrProdutosClientes.DataSet.Post;
  ModalResult := mrOK;
end;

procedure TfrmCadastroProdutosClientesPedidosSaidas.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_Return) then
    if ActiveControl = edtPN then
      if sbnSalvar.Enabled then
        sbnSalvarClick(self);
  inherited;
end;

end.
