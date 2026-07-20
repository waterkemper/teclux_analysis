unit fmmensagemgridprodutosconferencia;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cptexto, Grids, DBGrids, cpdbgrid, ExtCtrls, Buttons, DB,
  cpdatasource, AdvObj, BaseGrid, AdvGrid, DBAdvGrid;

type
  tpOrigem = (Diversas, ProdutosConferencia);

type
  Tfrmmensagemgridprodutosconferencia = class(TForm)
    lblTitulo: TLabel;
    pnlBottom: TPanel;
    bbnOK: TBitBtn;
    dsrListaErros: TtecDataSource;
    dbgMensagem: TDBAdvGrid;
    btnCancelar: TBitBtn;
    btnConferir: TBitBtn;
    procedure dbgMensagemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbgMensagemCustomCellSize(Sender: TObject; Canvas: TCanvas;
      ACol, ARow: Integer; var ASize: TPoint; Printing: Boolean);
    procedure FormShow(Sender: TObject);
  private
    fTipoOrigem: tpOrigem;
    { Private declarations }
  public
    { Public declarations }
    property TipoOrigem: tpOrigem read fTipoOrigem write fTipoOrigem default Diversas;
  end;

var
  frmmensagemgridprodutosconferencia: Tfrmmensagemgridprodutosconferencia;

implementation

{$R *.dfm}

procedure Tfrmmensagemgridprodutosconferencia.dbgMensagemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  case TipoOrigem of

    ProdutosConferencia:
    begin

      {
      if (pos(column.fieldname, 'reservado transito demonstracao conserto futuro danificada estoquefisico reservaprevia')<>0) then
      begin
        TDBGrid(Sender).Canvas.Font.Color := clRed;
        TDBGrid(Sender).Canvas.Font.Style := [fsBold];
        TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
      }

    end;

  end;
end;

procedure Tfrmmensagemgridprodutosconferencia.FormCreate(Sender: TObject);
begin

//  self.width := dbgMensagem.width + 50;

//  dbgMensagem_.AutoSizeRows(false);
//  dbgMensagem_.autosize := true;
//  dbgMensagem_.autosize := false;
  dbgMensagem.AutoSizeRows(false);
  dbgMensagem.wordwrap := true;
//  dbgMensagem_.Refresh;

//  dbgMensagem_.wordwrap := false;




end;

procedure Tfrmmensagemgridprodutosconferencia.FormResize(Sender: TObject);
begin
  bbnOK.left := (pnlBottom.width div 2) - btnConferir.Width - btnCancelar.Width ;
  btnConferir.left := bbnOK.left + bbnOK.width + 5;
  btnCancelar.left := btnConferir.left + btnConferir.width + 5;

end;

procedure Tfrmmensagemgridprodutosconferencia.dbgMensagemCustomCellSize(Sender: TObject;
  Canvas: TCanvas; ACol, ARow: Integer; var ASize: TPoint;
  Printing: Boolean);
begin
//  aSize := Point(100,100)
end;

procedure Tfrmmensagemgridprodutosconferencia.FormShow(Sender: TObject);
begin
  self.BringToFront;
end;

end.
