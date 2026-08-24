unit fmcadastromercadoriasanuncio;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols, Grids, DBGrids, cpdbgrid, ctconstantes,
  ZQuery, fmconsultabasica, fmconsultaporcampo, Windows, fmselecionarimpressoras,
  DB, ZPgSqlQuery, cpquery, ActnList, biblio, cptexto, ToolWin;

type
  TfrmCadastroMercadoriasAnuncio = class(TfrmCadastroPadrao)
    gbxMercadorias: TGroupBox;
    sbnExcluirProduto: TSpeedButton;
    sbnIncluirProduto: TSpeedButton;
    lblTabloide: TLabel;
    edfTabloide: TtecDbEditFind;
    lblEmissao: TLabel;
    dtxEmissao: TtecDBText;
    dbgProdutos: TtecDBGrid;
    lblDescricao: TLabel;
    sbnImprimir: TSpeedButton;
    ckbMarcarTodos: TCheckBox;
    lblLegenda: TLabel;
    aclAbilitar: TActionList;
    actAbilitar: TAction;
    edtDescricao: TDBEditTexto;
    pnlCabecalho: TPanel;
    pnlRodape: TPanel;
    pnlLeft: TPanel;
    procedure sbnIncluirProdutoClick(Sender: TObject);
    procedure sbnExcluirProdutoClick(Sender: TObject);
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnImprimirClick(Sender: TObject);
    procedure ckbMarcarTodosClick(Sender: TObject);
    procedure dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edfDescricaoTabloideKeyPress(Sender: TObject; var Key: Char);
    procedure actAbilitarUpdate(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);
  protected
    function InternoIncluir: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataset; override;
    function IncluirEditarProdutoTabloide(Editar: boolean): Boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroMercadoriasAnuncio: TfrmCadastroMercadoriasAnuncio;
  AfterScroll: Boolean;

implementation

uses dmcadastromercadoriasanuncio, fmnavcontroles, fmprodutostabloides, clparametrossistema;

{$R *.dfm}
constructor TfrmCadastroMercadoriasAnuncio.Create(AOwner: TComponent);
begin
  dtmCadastroMercadoriasAnuncio := TdtmCadastroMercadoriasAnuncio.Create(self);
  inherited;
  DataSet := dtmCadastroMercadoriasAnuncio.TabelaTabloide;
  dbgProdutos.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutos.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dtmCadastroMercadoriasAnuncio.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  dbgProdutos.Columns[8].Width := length(ParSistema.MascaraQuantidade)*7;
  dbgProdutos.Columns[9].Width := length(ParSistema.MascaraQuantidade)*7;
  dbgProdutos.Columns[10].Width := length(ParSistema.MascaraQuantidade)*7;

  if ParSistema.PermitirProdutoAlfanumerico then
     dbgProdutos.Columns[0].Width:= 217
  else
     dbgProdutos.Columns[0].Width:= 135;

  
end;

destructor TfrmCadastroMercadoriasAnuncio.Destroy;
begin
  dtmCadastroMercadoriasAnuncio := nil;
  inherited;
  frmCadastroMercadoriasAnuncio.Free;
end;

function TfrmCadastroMercadoriasAnuncio.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if CtrlOn then begin
      if dbgProdutos.Focused then
        Result:= IncluirEditarProdutoTabloide(false)
    end
    else begin
      Result := dtmCadastroMercadoriasAnuncio.IncluirTabloide;
      if Result then begin
        edtDescricao.Enabled:=true;
        dbgProdutos.Enabled:=true;
        edtDescricao.SetFocus;
      end
      else
        edfTabloide.SetFocus;
    end;
  end;
end;

function TfrmCadastroMercadoriasAnuncio.InternoGravar:Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    Result:= dtmCadastroMercadoriasAnuncio.GravarTabloide;
end;

function TfrmCadastroMercadoriasAnuncio.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  with dtmCadastroMercadoriasAnuncio do begin
    Titulo      := ctTABLOIDE;
    TipoPesquisa:= ttcTABLOIDE;
    if TipoPesquisa <> ttcNENHUM then begin
      dtmCadastroMercadoriasAnuncio.AbreTabelaPesquisa(TipoPesquisa);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        dtmCadastroMercadoriasAnuncio.Selecionar(TipoPesquisa);
      dtmCadastroMercadoriasAnuncio.FechaTabelaPesquisa(TipoPesquisa);
    end;
  end;
end;

function TfrmCadastroMercadoriasAnuncio.JanelaPesquisa: TfrmConsultaBasica;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := false;
  Result := Jan;
end;

function TfrmCadastroMercadoriasAnuncio.TabelaDePesquisa: TZDataSet;
begin
  case TipoPesquisa of
    ttcTABLOIDE: Result := dtmCadastroMercadoriasAnuncio.TabelaConsultaTabloide;
  end;
end;

function TfrmCadastroMercadoriasAnuncio.IncluirEditarProdutoTabloide(Editar: Boolean): Boolean;
begin
  Result := False;
  if sbnIncluirProduto.Enabled then
  begin
    frmProdutosTabloides := TfrmProdutosTabloides.Create(frmProdutosTabloides);
    if not Editar then
      Result := dtmCadastroMercadoriasAnuncio.IncluirProdutoTabloide
    else Result := dtmCadastroMercadoriasAnuncio.EditarProdutosTabloide;
    if Result then
      Result := frmProdutosTabloides.ShowModal = mrOk;
    frmProdutosTabloides.Free;
    SetFocus;
  end;
end;

procedure TfrmCadastroMercadoriasAnuncio.sbnIncluirProdutoClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  dbgProdutos.SetFocus;
  InternoIncluir;
end;

procedure TfrmCadastroMercadoriasAnuncio.sbnExcluirProdutoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroMercadoriasAnuncio.ExcluirProdutoTabloide;
end;

procedure TfrmCadastroMercadoriasAnuncio.dbgProdutosDblClick(
  Sender: TObject);
begin
  inherited;
  IncluirEditarProdutoTabloide(true);
end;

procedure TfrmCadastroMercadoriasAnuncio.dbgProdutosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = VK_F3) then
     sbnIncluirProdutoClick(Sender)
  else
  if (Shift = [ssCtrl]) and (Key = VK_SPACE) then begin
    dtmCadastroMercadoriasAnuncio.SelecionarParaImpressao := not dtmCadastroMercadoriasAnuncio.SelecionarParaImpressao;
    dbgProdutos.Invalidate;
  end else
  if (Key = VK_F2) then
     if (Shift = [ssCtrl]) then
        IncluirEditarProdutoTabloide(True)
     else
     if (Shift = [ssCtrl, ssAlt]) then
          IncluirEditarProdutoTabloide(True);
end;

procedure TfrmCadastroMercadoriasAnuncio.AfterScrollLinhaColunaGrade(Sender: TObject);
begin
  dbgProdutos.Columns[3].Title.Caption := dtmCadastroMercadoriasAnuncio.LinhadaGrade;
  dbgProdutos.Columns[4].Title.Caption := dtmCadastroMercadoriasAnuncio.ColunadaGrade;
end;

procedure TfrmCadastroMercadoriasAnuncio.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmCadastroMercadoriasAnuncio.ImprimirProdutosTabloide;
end;


procedure TfrmCadastroMercadoriasAnuncio.ckbMarcarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroMercadoriasAnuncio.MarcarTodosProdutos(ckbMarcarTodos.Checked);
  dbgProdutos.Invalidate;
end;

procedure TfrmCadastroMercadoriasAnuncio.dbgProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dtmCadastroMercadoriasAnuncio.SelecionarParaImpressao then begin
    TDBGrid(Sender).Canvas.Brush.Color := $00FFAA00;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmCadastroMercadoriasAnuncio.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Shift = [] then begin
    case Key of
      VK_F3: sbnIncluirClick(self);
      VK_F5: sbnSalvarClick(self);
      VK_F6: sbnExcluirClick(self);
      VK_F7: sbnImprimirClick(self);
      VK_F9: sbnProcurarClick(self);
      VK_Escape: begin
                    with dtmCadastroMercadoriasAnuncio do begin
                      if qryTabloide.State = dsInsert then begin
                         if MensagemConfirmacao(ctINFORMACOESSERAOPERDIDAS) = smbOK then begin
                            ReFazConsulta(qryTabloide,[0],        [qryTabloideNumero.AsInteger]);
                            ReFazConsulta(qryProdutosTabloide,[0],[qryTabloideNumero.AsInteger]);
                         end;
                      end
                      else
                      begin
                        ReFazConsulta(qryTabloide,[0],[0]);
                        ReFazConsulta(qryProdutosTabloide,[0],[0]);
                      end;
                    end;
                  end;
    end;
  end;
end;

procedure TfrmCadastroMercadoriasAnuncio.edfDescricaoTabloideKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if KEY = #13 Then Begin
     key := #0;
     dbgProdutos.SetFocus;
  end;
end;

function TfrmCadastroMercadoriasAnuncio.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
     dtmCadastroMercadoriasAnuncio.ExcluirTabloide;
end;

procedure TfrmCadastroMercadoriasAnuncio.actAbilitarUpdate(
  Sender: TObject);
begin
  inherited;
  sbnImprimir.Enabled := not dtmCadastroMercadoriasAnuncio.qryProdutosTabloide.IsEmpty;
end;

procedure TfrmCadastroMercadoriasAnuncio.edtDescricaoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if KEY = #13 Then Begin
     key := #0;
     dbgProdutos.SetFocus;
  end;
end;

end.
