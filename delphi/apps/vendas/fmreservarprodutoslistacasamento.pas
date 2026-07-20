unit fmreservarprodutoslistacasamento;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, StdCtrls, DBCtrls,
  cpdbtext,dmlistacasamento, cpnumero, Mask, ToolWin;

type
  TfrmReservarProdutosListaCasamento = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxReservarProdutos: TGroupBox;
    lblProduto: TLabel;
    dtxProduto: TtecDBText;
    lblUsuario: TLabel;
    dtxUsuario: TtecDBText;
    lblData: TLabel;
    dtxData: TtecDBText;
    lblQuantidade: TLabel;
    edtQuantidade: TDBEditNumero;
  protected
    dtmListaCasamento: TdtmListaCasamento;
    function InternoGravar: Boolean; override;
  public
    constructor Create(AOwner: TComponent; Titulo: String); reintroduce;
    destructor Destroy; override;
    procedure SetDataModulo(Dtm: TdtmListaCasamento);
  end;

var
  frmReservarProdutosListaCasamento: TfrmReservarProdutosListaCasamento;

implementation

{$R *.dfm}

{ TfrmReservarProdutosListaCasamento }

constructor TfrmReservarProdutosListaCasamento.Create(AOwner: TComponent; Titulo: String);
begin
  inherited Create(AOwner);
  Self.Caption:= Titulo;
end;

destructor TfrmReservarProdutosListaCasamento.Destroy;
begin
  inherited;
  frmReservarProdutosListaCasamento := nil;
end;

function TfrmReservarProdutosListaCasamento.InternoGravar: Boolean;
begin
  Result:= Inherited InternoGravar;
  if Result then begin
//    Result:= dtmListaCasamento.GravarReservasProdutosListaCasamento(StrToInt(edtQuantidade.Text));
    Close;
  end;
end;

procedure TfrmReservarProdutosListaCasamento.SetDataModulo(Dtm: TdtmListaCasamento);
begin
  dtmListaCasamento := Dtm;
end;

end.
 