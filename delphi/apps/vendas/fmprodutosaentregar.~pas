unit fmprodutosaentregar;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, Buttons, Grids, DBGrids, cpdbgrid, {Qete,} fmnavcontroles, dmcadastrocontratos;


type
  TfrmProdutosaEntregar = class(TfrmNavControles)
    dbgProdutos: TDBGrid;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    lblMensagem: TLabel;
    gbxFiltroEntrega: TGroupBox;
    ckbComEntrega: TCheckBox;
    ckbSemEntrega: TCheckBox;
    lblLegenda: TLabel;
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure ckbComEntregaClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
    dtmCadastroContratos : tdtmCadastroContratos;
      
  private
    { Private declarations }
    procedure  SetDataModulo(Dtm: TdtmCadastroContratos);

  public
    { Public declarations }
    constructor Create(AOwner: TComponent; dtm: TdtmCadastroContratos); reintroduce;
    destructor  Destroy; override;
  end;

var
  frmProdutosaEntregar: TfrmProdutosaEntregar;

implementation




{$R *.dfm}

procedure TfrmProdutosaEntregar.dbgProdutosDblClick(Sender: TObject);
begin
  dtmCadastroContratos.selecionarprodutosEntregar;
end;

procedure TfrmProdutosaEntregar.ckbComEntregaClick(Sender: TObject);
begin
  dtmCadastroContratos.filtrarEntrega(ckbComEntrega.Checked, ckbSemEntrega.Checked);
end;

procedure TfrmProdutosaEntregar.dbgProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_SPACE) then
    dbgProdutosDblClick(dbgProdutos);

end;

destructor TfrmProdutosaEntregar.Destroy;
begin
  inherited;
  frmProdutosaEntregar := nil;
end;




constructor TfrmProdutosaEntregar.Create(AOwner: TComponent;
  dtm: TdtmCadastroContratos);
begin
  inherited Create(AOwner);
  SetDataModulo(dtm);
end;

procedure TfrmProdutosaEntregar.SetDataModulo(Dtm: TdtmCadastroContratos);
begin
  dtmCadastroContratos := dtm;
  dbgProdutos.dataSource := dtmCadastroContratos.dsrProdutosContratosEntregar;

end;

end.
