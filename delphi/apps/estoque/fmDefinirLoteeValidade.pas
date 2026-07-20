unit fmDefinirLoteeValidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dmcadastroprodutos, ExtCtrls, Grids, DBGrids, cpdbgrid,
  StdCtrls, Buttons, fmajuda, db;


type
  TfrmDefinirLoteeValidade = class(TfrmAjuda)
    dbEstoquesFiliais: TtecDBGrid;
    dbEstoquesFiliaisLoteseValidades: TtecDBGrid;
    pnlBottom: TPanel;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    pnlOpcoesProdutosLotes: TPanel;
    sbnIncluirOpcoesProdutosLotes: TSpeedButton;
    sbnExcluirOpcoesProdutosLotes: TSpeedButton;
    procedure dbEstoquesFiliaisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbnIncluirOpcoesProdutosLotesClick(Sender: TObject);
    procedure sbnExcluirOpcoesProdutosLotesClick(Sender: TObject);
    procedure dbEstoquesFiliaisLoteseValidadesKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefinirLoteeValidade: TfrmDefinirLoteeValidade;

implementation



{$R *.dfm}

procedure TfrmDefinirLoteeValidade.dbEstoquesFiliaisDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;


  if gdSelected in State then
  begin
    TDBGrid(Sender).Canvas.brush.Color := clskyblue;
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];
  end
  else
  begin
    TDBGrid(Sender).Canvas.brush.Color := clWindow;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.Font.Style := [];
  end;

  if (column.fieldname = dtmcadastroprodutos.qryEstoquesFiliaissaldopendente.fieldname)
     and (dtmcadastroprodutos.qryEstoquesFiliaissaldopendente.asCurrency <> 0) then
//    TDBGrid(Sender).Canvas.Font.Color:= clRed;
      TDBGrid(Sender).Canvas.Brush.Color := $009D9DFF;

                           {
  if (column.fieldname = dtmcadastroprodutos.qryEstoquesFiliaisemestoque.fieldname)
     and (dtmcadastroprodutos.qryEstoquesFiliaissaldopendente.asCurrency = 0) then
    TDBGrid(Sender).Canvas.Font.Color:= clGreen;
    }
    
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmDefinirLoteeValidade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if modalresult = mrOk then
    Canclose := dtmcadastroprodutos.DadosLotesProdutosOK
  else
    Canclose := true;  
end;

procedure TfrmDefinirLoteeValidade.sbnIncluirOpcoesProdutosLotesClick(
  Sender: TObject);
begin
  inherited;
  if (dtmCadastroProdutos.qryProdutosLotes.state <> dsinsert) then
    if (dtmCadastroProdutos.qryProdutosLotes.recordcount = 1) and
       (dtmCadastroProdutos.qryProdutosLotesquantidade.isnull) then
      dtmCadastroProdutos.qryProdutosLotes.edit
    else
    begin
      dtmCadastroProdutos.qryProdutosLotes.append;
      dtmCadastroProdutos.qryProdutosLotesnlote.focuscontrol;
    end;
end;

procedure TfrmDefinirLoteeValidade.sbnExcluirOpcoesProdutosLotesClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroProdutos.qryProdutosLotes.delete;
end;

procedure TfrmDefinirLoteeValidade.dbEstoquesFiliaisLoteseValidadesKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
  begin
    if dbEstoquesFiliaisLoteseValidades.SelectedField = dtmCadastroProdutos.qryProdutosLotesnlote then
    begin

      if trim(dtmCadastroProdutos.qryProdutosLotesnlote.asstring)<>'' then
        dbEstoquesFiliaisLoteseValidades.SelectedField := dtmCadastroProdutos.qryProdutosLotesdval;

    end
    else
    if dbEstoquesFiliaisLoteseValidades.SelectedField = dtmCadastroProdutos.qryProdutosLotesdval then
    begin

      if not dtmCadastroProdutos.qryProdutosLotesdval.isnull then
        dbEstoquesFiliaisLoteseValidades.SelectedField := dtmCadastroProdutos.qryProdutosLotesquantidade;

    end
    else
    if dbEstoquesFiliaisLoteseValidades.SelectedField = dtmCadastroProdutos.qryProdutosLotesquantidade then
    begin

      if dtmCadastroProdutos.qryProdutosLotesquantidade.ascurrency <> 0 then
      begin

        if dtmCadastroProdutos.qryProdutosLotes.recno <> dtmCadastroProdutos.qryProdutosLotes.recordcount then
        begin
          dtmCadastroProdutos.qryProdutosLotes.next;
          dbEstoquesFiliaisLoteseValidades.SelectedField := dtmCadastroProdutos.qryProdutosLotesnlote;
        end
        else
        begin

          dbEstoquesFiliaisLoteseValidades.SelectedField := dtmCadastroProdutos.qryProdutosLotesnlote;
          if dtmCadastroProdutos.qryEstoquesFiliaissaldopendente.ascurrency <> 0 then
            sbnIncluirOpcoesProdutosLotesClick(nil);

          if not (dtmCadastroProdutos.qryProdutosLotes.state = dsinsert) then
          begin
            while not dtmCadastroProdutos.qryEstoquesFiliais.eof do
            begin
              if dtmCadastroProdutos.qryEstoquesFiliaissaldopendente.ascurrency <> 0 then
                break
              else
                dtmCadastroProdutos.qryEstoquesFiliais.next;
            end;

            if dtmCadastroProdutos.qryEstoquesFiliais.eof then
              bbnOK.setfocus;
          end;
        end;
      end;

    end;
  end;
end;

end.
