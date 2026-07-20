unit fmSelecaoMultiplasNotasRomaneio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls,
  StdCtrls, cpdata, frselecaoaleatoriaclientes, frlistafiliais,
  dmcadastroromaneios, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, biblio,
  ctconstantes, asgcheck, clparametrossistema, DBCtrls, cpdbcombobox,
  advlued, AdvEdit, AdvMoneyEdit, MoneyEdit, AdvCombo, Lucombo, dblucomb,
  AdvDateTimePicker, cpmemo, dbadvle, AdvSmoothEdit, AdvSmoothEditButton,
  AdvSmoothDatePicker, cpdblookupcombobox, frmctrllink, Mask, Menus,
  AdvMenus;

type
  TfrmSelecaoMultiplasNotasRomaneio = class(TfrmCadastroPadrao)
    pgcConsultaNotaseCupons: TPageControl;
    tstParametros: TTabSheet;
    tstDados: TTabSheet;
    gbxEmissao: TGroupBox;
    lblA: TLabel;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    fraListaFiliais: TfraListaFiliais;
    fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes;
    gbxListadeClientes: TGroupBox;
    sbnGerar: TSpeedButton;
    gbxNotasFiscais: TGroupBox;
    Timer1: TTimer;
    dbgNotasFiscais: TDBAdvGrid;
    gbxValoresPadrao: TGroupBox;
    gbxTipodeFrete: TGroupBox;
    gbxDatadeEntrega: TGroupBox;
    gbxValor: TGroupBox;
    edtValor: TAdvLUEdit;
    gbxObservacoes: TGroupBox;
    mmoObservacoes: TtecMemo;
    ckbSelecionarTodos: TCheckBox;
    pnlRight: TPanel;
    cbbTabeladeFrete: TLUCombo;
    edtDataEntrega: TAdvSmoothDatePicker;
    sbnAplicar: TSpeedButton;
    cbbTipodeFrete: TTecDBLookupComboBox;
    FormControlEditLink1: TFormControlEditLink;
    gbxPesquisaNFe: TGroupBox;
    edtNFE: TMaskEdit;
    gbxEntregaEntre: TGroupBox;
    Label1: TLabel;
    edtDataInicialEntrega: TEditData;
    edtDataFinalEntrega: TEditData;
    ckbSomenteNFComItensdeEntrega: TCheckBox;
    AdvPopupMenu1: TAdvPopupMenu;
    Copia1: TMenuItem;
    procedure sbnGerarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dbgNotasFiscaisCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure edtDataEntrega_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnAplicarClick(Sender: TObject);
    procedure cbbTabeladeFreteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNFEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNotasFiscaisClipboardPaste(Sender: TObject;
      var Allow: Boolean);
    procedure dbgNotasFiscaisClipboardCut(Sender: TObject;
      var Allow: Boolean);
    procedure Copia1Click(Sender: TObject);
  private
    { Private declarations }
    function  ValidarCamposSelecao: Boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  InternoGravar: Boolean; override;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmSelecaoMultiplasNotasRomaneio: TfrmSelecaoMultiplasNotasRomaneio;

implementation

{$R *.dfm}

{ TfrmSelecaoMultiplasNotasRomaneio }

constructor TfrmSelecaoMultiplasNotasRomaneio.Create(AOwner: TComponent);
begin
  inherited;

  DataSet := dtmCadastroRomaneios.qryNotasRomaneio;
  edtDataInicial.Text := FormatDateTime('dd/MM/yyyy', dtmCadastroRomaneios.DataServidor - 15);
  edtDataFinal.text := FormatDateTime('dd/MM/yyyy', dtmCadastroRomaneios.DataServidor);


  dbgNotasFiscais.Bands.PrimaryColor := TColor(strtoint(parsistema.CorZebradoRelatorio));

  dbgNotasFiscais.AutoNumberRow(0);
//  dbgNotasFiscais.AutoNumberRow(0);

  cbbTabeladeFrete.Items.AddStrings(RetornarListaTString(dtmCadastroRomaneios.qryTabeladeFretes, dtmCadastroRomaneios.qryTabeladeFretescodigodescricaofrete));
//  cbbTabeladeFrete.Items.Append('');
  edtDataEntrega.Clear;
//  dbgNotasFiscais.SortSettings.Direction := sdDescending;

  fraListaFiliais.gbxFiliais.Font.Height:= 11;
  dtmCadastroRomaneios.RegistrosSelecionados := 0;

end;

destructor TfrmSelecaoMultiplasNotasRomaneio.Destroy;
begin

  inherited;
  frmSelecaoMultiplasNotasRomaneio := nil;
end;

procedure TfrmSelecaoMultiplasNotasRomaneio.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    if dtmCadastroRomaneios.AbrirConsultaNotasRomaneio(edtDataInicial.Text, edtDataFinal.text,
                edtDataInicialEntrega.Text, edtDataFinalEntrega.text,
                fraListaFiliais.ListaSelecionada,
                fraSelecaoAleatoriaClientes1.ListaCondicional,
                ckbSomenteNFComItensdeEntrega.checked
                ) then
      pgcConsultaNotaseCupons.ActivePage := tstDados;
  end;

//  dbgNotasFiscais.AutoNumberCol(0);
//  dbgNotasFiscais.Refresh;


end;

function TfrmSelecaoMultiplasNotasRomaneio.ValidarCamposSelecao: Boolean;
begin
   Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
   if Result then
   begin

    if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
      Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);

    if result then
    begin
      Result:=(not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text));
      if not Result then
      begin
       MensagemAviso(ctDATAINVALIDA);
       if dataembranco(edtDataInicial.text) then
         edtDataInicial.SetFocus
       else
         edtDataFinal.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicial.SetFocus;
    end;
   end;

end;

procedure TfrmSelecaoMultiplasNotasRomaneio.Timer1Timer(Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled := pgcConsultaNotaseCupons.ActivePage = tstParametros;
  sbnSalvar.enabled := dtmCadastroRomaneios.RegistrosSelecionados <> 0;
  sbnAplicar.enabled := dtmCadastroRomaneios.RegistrosSelecionados <> 0;
  gbxNotasFiscais.Enabled := dtmCadastroRomaneios.qryNotasRomaneio.RecordCount <> 0;
  gbxPesquisaNFe.Visible := pgcConsultaNotaseCupons.ActivePage = tstDados;
end;

procedure TfrmSelecaoMultiplasNotasRomaneio.dbgNotasFiscaisCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;
  doSort := false;

//  if dtmCadastroRomaneios.qryNotasRomaneio.SqlBuffer.SortFields[TDBAdvGrid(sender).FieldAtColumn[ACol].Index] <> 0 then

  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
//      dtmCadastroRomaneios.qryNotasRomaneio.SortDescByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    end
    else
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
//      dtmCadastroRomaneios.qryNotasRomaneio.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    end;

    dtmCadastroRomaneios.qryNotasRomaneio.SortInverse;

    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end
  else
  begin
    {
    if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
    begin

      TDBAdvGrid(sender).SortSettings.Direction := sdDescending;
      dtmCadastroRomaneios.qryNotasRomaneio.SortDescByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);

    end
    else
    begin
    }
//      TDBAdvGrid(sender).SortSettings.Remove;
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmCadastroRomaneios.qryNotasRomaneio.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    {
    end;
    }
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end;
//  TDBAdvGrid(sender).AutoNumberCol(0);
//  TDBAdvGrid(sender).Refresh;


end;

procedure TfrmSelecaoMultiplasNotasRomaneio.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  if ckbSelecionarTodos.Checked then
    ckbSelecionarTodos.Caption := 'Desmarcar Todos'
  else
    ckbSelecionarTodos.Caption := 'Marcar Todos';

  dtmCadastroRomaneios.MarcarRegistros(dtmCadastroRomaneios.qryNotasRomaneio,
   dtmCadastroRomaneios.qryNotasRomaneioselecionarregistro,
   ckbSelecionarTodos.Checked,
   true, true);

end;

procedure TfrmSelecaoMultiplasNotasRomaneio.edtDataEntrega_KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_delete then
    edtDataEntrega.Clear;

end;

procedure TfrmSelecaoMultiplasNotasRomaneio.sbnAplicarClick(
  Sender: TObject);
  
var
  v_codigofrete, v_entrega, v_valor, v_observacao: Variant;

begin
  inherited;
  if cbbTabeladeFrete.ItemIndex <> -1 then
  begin
    v_codigofrete := trim(copy(cbbTabeladeFrete.items[cbbTabeladeFrete.ItemIndex], 0,
                    pos(' - ', cbbTabeladeFrete.items[cbbTabeladeFrete.ItemIndex])))
  end
  else
    v_codigofrete := null;

  if edtDataEntrega.text <> '' then
    v_entrega := edtDataEntrega.text
  else
    v_entrega := null;

  if edtValor.text <> '' then
    v_valor := edtValor.text
  else
    v_valor := null;

  if mmoObservacoes.text <> '' then
    v_observacao := mmoObservacoes.text
  else
    v_observacao := null;

  with dtmCadastroRomaneios do
  begin
    AtribuirDados(qryNotasRomaneio,
       [qryNotasRomaneiocodigofrete,
        qryNotasRomaneioentrega,
        qryNotasRomaneiovalor,
        qryNotasRomaneioobservacao],

       [v_codigofrete, v_entrega, v_valor, v_observacao],

       [qryNotasRomaneioselecionarregistro],
       [True],
       ['='], true, false);

  end;


end;

procedure TfrmSelecaoMultiplasNotasRomaneio.cbbTabeladeFreteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_delete then
    cbbTabeladeFrete.ItemIndex := -1;
end;

procedure TfrmSelecaoMultiplasNotasRomaneio.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) then
  begin
    if key = vk_F5 then
      if sbnAplicar.enabled then
        sbnAplicarclick(nil);
  end
  else
  if key = vk_f6 then
    if sbnGerar.Enabled then
      sbnGerarClick(nil);      
end;

function TfrmSelecaoMultiplasNotasRomaneio.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
  begin
    dtmCadastroRomaneios.IncluirMultiplosItensdeRomaneio;
    close;
  end;  
end;

procedure TfrmSelecaoMultiplasNotasRomaneio.edtNFEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
    if somentenumero(edtNFE.Text)<>'' then
    begin
      dtmCadastroRomaneios.LocalizarNfe(somentenumero(edtNFE.Text));
      dbgNotasFiscais.Col := 10;
//      dbgNotasFiscais.ColumnByName := dtmCadastroRomaneios.qryNotasRomaneiochv_nfe;
      edtNFE.setfocus;
      edtNFE.selectall;
    end;
end;

procedure TfrmSelecaoMultiplasNotasRomaneio.dbgNotasFiscaisClipboardPaste(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
//  Allow := false;
end;

procedure TfrmSelecaoMultiplasNotasRomaneio.dbgNotasFiscaisClipboardCut(
  Sender: TObject; var Allow: Boolean);
begin
  inherited;
//  allow := false;
end;

procedure TfrmSelecaoMultiplasNotasRomaneio.Copia1Click(Sender: TObject);
begin
  inherited;
  if activecontrol = dbgNotasFiscais then
    dbgNotasFiscais.CopySelectionToClipboard;
end;

end.
