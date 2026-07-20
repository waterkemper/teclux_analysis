unit fmConsultaEntregaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, frintervalodatas, StdCtrls, CheckLst, frlistafiliais,
  Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, dmConsultaEntregaProdutos,
  fmajudabt, Buttons, ToolWin, ExtCtrls, cpeditioncontrolvalidation, biblio,
  ctconstantes, dmBasico, DBLup2, AdvDateTimePicker, AdvDBDateTimePicker,
  frmctrllink, AdvDBLookupComboBox, lpLstBox, Menus, AdvMenus,
  tmsAdvGridExcel, AsgFindDialog, fmReagendamentoEntregas,
  fmPrincipalBasico, frselecaoaleatoriaclientes;

type
  TfrmConsultaEntregaProdutos = class(TfrmAjudaBt)
    pgcConsultaEntregaProdutos: TPageControl;
    tstParametros: TTabSheet;
    tstDados: TTabSheet;
    fraIntervaloDatas1: TfraIntervaloDatas;
    fraListaFiliaisVenda: TfraListaFiliais;
    gbxPeriodo: TGroupBox;
    sbnGerar: TSpeedButton;
    ckbTodoIntervaloEntregas: TCheckBox;
    Timer1: TTimer;
    FormControlEditLink1: TFormControlEditLink;
    AdvDBDateTimePicker1: TAdvDBDateTimePicker;
    AdvDBLookupComboBox1: TAdvDBLookupComboBox;
    AdvDBDateTimePicker2: TAdvDBDateTimePicker;
    sbnSalvar: TSpeedButton;
    DBAdvGrid1: TDBAdvGrid;
    AdvGridFindDialog1: TAdvGridFindDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    AdvPopupMenu1: TAdvPopupMenu;
    Pesquizar1: TMenuItem;
    ExportarExcel1: TMenuItem;
    Copia1: TMenuItem;
    dbgConsultaEntregaProdutos: TDBAdvGrid;
    sbnContrato: TSpeedButton;
    fraListaFiliaisProduto: TfraListaFiliais;
    gbxListaFornecedores: TGroupBox;
    fraSelecaoAleatoriaFornecedores1: TfraSelecaoAleatoriaClientes;
    procedure sbnGerarClick(Sender: TObject);
    procedure pgcConsultaEntregaProdutosChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgConsultaEntregaProdutosGetEditorType(Sender: TObject;
      ACol, ARow: Integer; var AEditor: TEditorType);
    procedure sbnSalvarClick(Sender: TObject);
    procedure dbgConsultaEntregaProdutosCanSort(Sender: TObject;
      ACol: Integer; var DoSort: Boolean);
    procedure Pesquizar1Click(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure Copia1Click(Sender: TObject);
    procedure dbgConsultaEntregaProdutosGetFloatFormat(Sender: TObject;
      ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure dbgConsultaEntregaProdutosDblClick(Sender: TObject);
    procedure sbnContratoClick(Sender: TObject);
    procedure fraListaFiliaisVendasbnDesmarcarFiliaisClick(
      Sender: TObject);
    procedure dbgConsultaEntregaProdutosGetDisplText(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure dbgConsultaEntregaProdutosColumnCalc(Sender: TObject; ACol,
      FromRow, ToRow: Integer; var Res: Double);
    procedure dbgConsultaEntregaProdutosGroupCalc(Sender: TObject; ACol,
      FromRow, ToRow: Integer; var Res: Double);

  private
    fdtmConsultaEntregaProdutos: TdtmConsultaEntregaProdutos;
    { Private declarations }
    function VerificaCampos: Boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AGrupamento;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure OperacaoPadrao(Value: Array of Variant); override;
    property dtmConsultaEntregaProdutos: TdtmConsultaEntregaProdutos read fdtmConsultaEntregaProdutos write fdtmConsultaEntregaProdutos;
  end;

var
  frmConsultaEntregaProdutos: TfrmConsultaEntregaProdutos;


//  ControleValido: TWinControl;

implementation

uses ZQuery, DB, fmnavcontroles;

{$R *.dfm}

constructor TfrmConsultaEntregaProdutos.Create(AOwner: TComponent);
begin
  self.dtmConsultaEntregaProdutos := TdtmConsultaEntregaProdutos.Create(self);
  dtmConsultaEntregaProdutos := self.dtmConsultaEntregaProdutos;
  dtmConsultaEntregaProdutos.qryPeriodosEntrega.open;
  inherited create(AOwner);

  SetarActivePage(self);

//  dbgConsultaEntregaProdutos.Group(dbgConsultaEntregaProdutos.ColumnByFieldName['filialnf'].Index);


//  dbgConsultaEntregaProdutos.SaveFixedCells := false;
//  dbgConsultaEntregaProdutos.Group(dbgConsultaEntregaProdutos.ColumnByFieldName['dataentrega'].Index);
//  dbgConsultaEntregaProdutos.Group(1);
  //Advstringgrid1.Group(1);
  //Advstringgrid1.SubGroup(1);
//  dbgConsultaEntregaProdutos.SubGroup(dbgConsultaEntregaProdutos.ColumnByFieldName['descricaoperiodoentrega'].Index);
//  dbgConsultaEntregaProdutos.SubGroup(dbgConsultaEntregaProdutos.ColumnByFieldName['nomeregiao'].Index);

//  dbgConsultaEntregaProdutos.GroupSum(dbgConsultaEntregaProdutos.ColumnByFieldName['saldo_quantidade'].Index-1);
  //Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['qtcontrato'].Index-1);

  //Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['totalinternet'].Index-1);
  //Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['qtinternet'].Index-1);

  //Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['totalloja'].Index-1);
  //Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['qtloja'].Index-1);

  //Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['quantidade'].Index-1);
  //Advstringgrid1.GroupAvg(Advstringgrid1.ColumnByFieldName['precotabela'].Index-1);
  //Advstringgrid1.GroupAvg(Advstringgrid1.ColumnByFieldName['precovenda'].Index-1);

  //advstringgrid1.Cells[1,0] :='Mês';
  //advstringgrid1.Cells[2,0] :='Data/Produto';

  //Advstringgrid1.ExpandAll;
//  dbgConsultaEntregaProdutos.ContractAll;

   fraSelecaoAleatoriaFornecedores1.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.TipoCliente := 'F';


end;

procedure TfrmConsultaEntregaProdutos.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if VerificaCampos then
    dtmConsultaEntregaProdutos.AbrirConsultaEntregaProdutos(
                                ckbTodoIntervaloEntregas.checked,
                                fraIntervaloDatas1.edtDataInicial.text,
                                fraIntervaloDatas1.edtDataFinal.text,
                                fraListaFiliaisVenda.ListaSelecionada,
                                fraListaFiliaisProduto.ListaSelecionada,

                                fraSelecaoAleatoriaFornecedores1.ListaCondicional);

  if dtmConsultaEntregaProdutos.qryConsultaEntregaProdutos.recordcount <> 0 then
  begin
    pgcConsultaEntregaProdutos.activepage := tstDados;
//    DBGConsultaEntregaProdutos.autosize := true;
    Agrupamento;


  end
  else
  begin
//    DBGConsultaEntregaProdutos.autosize := false;
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
  end;
end;

function TfrmConsultaEntregaProdutos.VerificaCampos: Boolean;
begin
  if ckbTodoIntervaloEntregas.checked then
    result := true
  else
  begin
    Result := (fraIntervaloDatas1.edtDataInicial.text <> '') or (fraIntervaloDatas1.edtDataFinal.text <> '');

    if Result then
    begin
      if (fraIntervaloDatas1.edtDataInicial.text <> '') and (fraIntervaloDatas1.edtDataFinal.text <> '') then
        if strtodate(fraIntervaloDatas1.edtDataInicial.Text) > strtodate(fraIntervaloDatas1.edtDataFinal.Text) then
        begin
          mensagemAviso(ctDTINICIALMAIORDTFINAL);
          fraIntervaloDatas1.edtDataInicial.setfocus;
          result:=false;
        end;
    end
    else
      fraIntervaloDatas1.edtDataInicial.setfocus;
  end;

end;

procedure TfrmConsultaEntregaProdutos.pgcConsultaEntregaProdutosChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  {
  if pgcConsultaEntregaProdutos.activepage = tstDados then
  begin
    DBGConsultaEntregaProdutos.autosize := dtmConsultaEntregaProdutos.qryConsultaEntregaProdutos.recordcount <> 0;
    DBGConsultaEntregaProdutos.AutoSizeRows(false);
    DBGConsultaEntregaProdutos.refresh;
  end;
  }
end;

procedure TfrmConsultaEntregaProdutos.Timer1Timer(Sender: TObject);
begin
  inherited;
  sbnGerar.enabled := (pgcConsultaEntregaProdutos.activepage = tstParametros);
  sbnSalvar.enabled := (pgcConsultaEntregaProdutos.activepage = tstDados) and
                       dtmConsultaEntregaProdutos.editando;
  sbnContrato.enabled := dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['contrato'].Index-1, dbgConsultaEntregaProdutos.row]<>'';

end;

procedure TfrmConsultaEntregaProdutos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_F5: begin
           if sbnSalvar.enabled then
             sbnSalvarClick(nil);
         end;

  VK_F6: begin
           if sbnGerar.enabled then
             sbnGerarclick(nil);
         end;

  VK_F10: begin
           if sbnContrato.enabled then
             sbnContratoclick(nil);
         end;

  end;
  inherited;

end;

procedure TfrmConsultaEntregaProdutos.OperacaoPadrao(
  Value: array of Variant);
begin
  inherited;
  if Length(Value) > 0 then
  begin
    if Value[0] = 'Consultar entregas em aberto' then
    begin
//      self.free;
      frmConsultaEntregaProdutos := TfrmConsultaEntregaProdutos.create(nil);
      frmConsultaEntregaProdutos.formstyle := fsNormal;
      frmConsultaEntregaProdutos.visible := false;
      frmConsultaEntregaProdutos.ckbTodoIntervaloEntregas.checked := false;
      frmConsultaEntregaProdutos.fraIntervaloDatas1.edtDataInicial.text := datetostr(Now());
      frmConsultaEntregaProdutos.fraIntervaloDatas1.edtDataFinal.text := '';
      frmConsultaEntregaProdutos.fraListaFiliaisVenda.sbnDesmarcarFiliaisClick(nil);
      frmConsultaEntregaProdutos.fraListaFiliaisProduto.sbnDesmarcarFiliaisClick(nil);
//      frmConsultaEntregaProdutos.fraListaFiliaisProduto.MarcarListaArmazenada(Value[1]);

      frmConsultaEntregaProdutos.sbnGerarClick(nil);
      frmConsultaEntregaProdutos.showmodal;
      freeandnil(frmConsultaEntregaProdutos);

//      self.bringtofront;
    end;
  end;
end;

procedure AbrirConsultaEntregaProdutos(
  Value: array of Variant);
begin
  if Length(Value) > 0 then
  begin
    if Value[0] = 'Consultar entregas em aberto' then
    begin
//      self.free;
      frmConsultaEntregaProdutos := TfrmConsultaEntregaProdutos.create(nil);
      frmConsultaEntregaProdutos.formstyle := fsNormal;
      frmConsultaEntregaProdutos.visible := false;
      frmConsultaEntregaProdutos.ckbTodoIntervaloEntregas.checked := false;
      frmConsultaEntregaProdutos.fraIntervaloDatas1.edtDataInicial.text := datetostr(Now());
      frmConsultaEntregaProdutos.fraIntervaloDatas1.edtDataFinal.text := '';
      frmConsultaEntregaProdutos.fraListaFiliaisVenda.sbnDesmarcarFiliaisClick(nil);
      frmConsultaEntregaProdutos.fraListaFiliaisProduto.sbnDesmarcarFiliaisClick(nil);
      frmConsultaEntregaProdutos.fraListaFiliaisProduto.MarcarListaArmazenada(Value[1]);

      frmConsultaEntregaProdutos.sbnGerarClick(nil);
      frmConsultaEntregaProdutos.showmodal;
      freeandnil(frmConsultaEntregaProdutos);

//      self.bringtofront;
    end
    else
    if Value[0] = 'Consultar entrega romaneio' then
    begin
//      self.free;
      frmConsultaEntregaProdutos := TfrmConsultaEntregaProdutos.create(nil);
      frmConsultaEntregaProdutos.formstyle := fsNormal;
      frmConsultaEntregaProdutos.visible := false;
      frmConsultaEntregaProdutos.ckbTodoIntervaloEntregas.checked := true;
      frmConsultaEntregaProdutos.fraIntervaloDatas1.edtDataInicial.text := '';
      frmConsultaEntregaProdutos.fraIntervaloDatas1.edtDataFinal.text := '';
      frmConsultaEntregaProdutos.fraListaFiliaisVenda.sbnDesmarcarFiliaisClick(nil);
      frmConsultaEntregaProdutos.fraListaFiliaisVenda.sbnDesmarcarFiliaisClick(nil);
      frmConsultaEntregaProdutos.dtmConsultaEntregaProdutos.romaneio := Value[1];
      frmConsultaEntregaProdutos.dtmConsultaEntregaProdutos.romaneiodadofiscal := Value[2];

      frmConsultaEntregaProdutos.sbnGerarClick(nil);

      frmConsultaEntregaProdutos.dtmConsultaEntregaProdutos.romaneio := 0;
      frmConsultaEntregaProdutos.dtmConsultaEntregaProdutos.romaneiodadofiscal := 0;

      frmConsultaEntregaProdutos.showmodal;
      freeandnil(frmConsultaEntregaProdutos);

//      self.bringtofront;
    end

  end;
end;


destructor TfrmConsultaEntregaProdutos.Destroy;
begin

  inherited;
  frmConsultaEntregaProdutos := nil;

end;

procedure TfrmConsultaEntregaProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  RemoveDataModule(dtmConsultaEntregaProdutos);
  sbnSalvar.enabled := false;

  DBAdvGrid1.Refresh;
end;

procedure TfrmConsultaEntregaProdutos.dbgConsultaEntregaProdutosGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  if  TDBAdvGrid(Sender).Columns[Acol].Field <> nil then
  begin

    if TDBAdvGrid(Sender).Columns[Acol].Field.FieldName = 'dataentrega' then
    begin
  //    AdvDBDateTimePicker1.kind := dkDate;
  //    AdvDBDateTimePicker1.datafield := 'dataentrega';
      FormControlEditLink1.control := AdvDBDateTimePicker1;

      if dtmConsultaEntregaProdutos.qryConsultaEntregaProdutosdataentrega.isnull then
        AdvDBDateTimePicker1.datetime := dtmConsultaEntregaProdutos.DataHoraServidor;
      AdvDBDateTimePicker1.MinDate := dtmConsultaEntregaProdutos.qryConsultaEntregaProdutosdata.asdatetime;
    end
    else
  //  if TDBAdvGrid(Sender).Columns[Acol].Field.FieldName = 'horaentrega' then
    if Acol = (dbgConsultaEntregaProdutos.ColumnByFieldName['horaentrega'].Index-1) then
    begin
  //    dbgConsultaEntregaProdutos.pagemode := true;
  //    AdvDBDateTimePicker1.kind := dkTime;
  //    AdvDBDateTimePicker1.datafield := 'horaentrega';
      FormControlEditLink1.control := AdvDBDateTimePicker2;
      if dtmConsultaEntregaProdutos.qryConsultaEntregaProdutoshoraentrega.isnull then
        AdvDBDateTimePicker2.Time := dtmConsultaEntregaProdutos.HoraServidor;
    end
    else
    if TDBAdvGrid(Sender).Columns[Acol].Field.FieldName = 'descricaoperiodoentrega' then
    begin
      if dtmConsultaEntregaProdutos.qryConsultaEntregaProdutosperiodoentrega.isnull then
        dtmConsultaEntregaProdutos.qryConsultaEntregaProdutosperiodoentrega.asinteger :=
          dtmConsultaEntregaProdutos.qryPeriodosEntregacodigo.AsInteger;

  //    AdvDBLookupComboBox1.Width := TDBAdvGrid(Sender).Columns[Acol].Width;

      AdvDBLookupComboBox1.Columns[0].Width := TDBAdvGrid(Sender).Columns[Acol].Width;
      AdvDBLookupComboBox1.DropWidth := AdvDBLookupComboBox1.Width ;


      FormControlEditLink1.control := AdvDBLookupComboBox1;
    end

  end;

end;

procedure TfrmConsultaEntregaProdutos.sbnSalvarClick(Sender: TObject);
begin
  inherited;
  dtmConsultaEntregaProdutos.GravarDados;
end;

procedure TfrmConsultaEntregaProdutos.dbgConsultaEntregaProdutosCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;
  doSort := false;
  if TDBAdvGrid(sender).SortSettings.Column = ACol then
  begin

    if (TDBAdvGrid(sender).SortSettings.Direction = sdDescending) and
       TDBAdvGrid(sender).SortSettings.undosort then
    begin
      TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      TDBAdvGrid(sender).SortSettings.Column := -1;
      dtmConsultaEntregaProdutos.qryConsultaEntregaProdutos.Sortclear;
    end
    else
    begin
      if TDBAdvGrid(sender).SortSettings.Direction = sdAscending then
        TDBAdvGrid(sender).SortSettings.Direction := sdDescending
      else
        TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
      dtmConsultaEntregaProdutos.qryConsultaEntregaProdutos.SortInverse;
      TDBAdvGrid(sender).SortSettings.Column := ACol;
    end;

  end
  else
  begin
    TDBAdvGrid(sender).SortSettings.Direction := sdAscending;
    dtmConsultaEntregaProdutos.qryConsultaEntregaProdutos.SortByField(TDBAdvGrid(sender).FieldAtColumn[ACol].FieldName);
    TDBAdvGrid(sender).SortSettings.Column := ACol;
  end;
end;


procedure TfrmConsultaEntregaProdutos.Pesquizar1Click(Sender: TObject);
begin
  inherited;
  AdvGridFindDialog1.Grid := dbgConsultaEntregaProdutos;
  AdvGridFindDialog1.Execute;

end;

procedure TfrmConsultaEntregaProdutos.ExportarExcel1Click(Sender: TObject);
var
  vNomeArquivo : String;
begin
  inherited;
  AdvGridExcelIO1.AdvStringGrid := dbgConsultaEntregaProdutos;
  vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\ConsultaEntregaProdutos.xls';
  AdvGridExcelIO1.XLSExport(vNomeArquivo, 'ConsultaEntregaProdutos');
end;

procedure TfrmConsultaEntregaProdutos.Copia1Click(Sender: TObject);
begin
  inherited;
  dbgConsultaEntregaProdutos.CopySelectionToClipboard;
end;

procedure TfrmConsultaEntregaProdutos.dbgConsultaEntregaProdutosGetFloatFormat(
  Sender: TObject; ACol, ARow: Integer; var IsFloat: Boolean;
  var FloatFormat: String);
begin
  inherited;
  if (Acol = (dbgConsultaEntregaProdutos.ColumnByFieldName['entregas'].Index)-1) or
     (Acol = (dbgConsultaEntregaProdutos.ColumnByFieldName['saldo_quantidade'].Index)-1) or
     (Acol = (dbgConsultaEntregaProdutos.ColumnByFieldName['limitequantidade'].Index)-1) then
//      FloatFormat := '%.0n';
//      FloatFormat := '%n';

  FloatFormat := '%g';

end;

procedure TfrmConsultaEntregaProdutos.dbgConsultaEntregaProdutosDblClick(
  Sender: TObject);
begin
  inherited;
  if dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['produtovisual'].Index-1, dbgConsultaEntregaProdutos.row]<>'' then
  begin

    if
     dtmConsultaEntregaProdutos.posicionarregistro(
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['contrato'].Index-1, dbgConsultaEntregaProdutos.row],
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['filialnf'].Index-1, dbgConsultaEntregaProdutos.row],
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['serie'].Index-1, dbgConsultaEntregaProdutos.row],
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['numero'].Index-1, dbgConsultaEntregaProdutos.row],
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['produtovisual'].Index-1, dbgConsultaEntregaProdutos.row]) then

    begin

      frmReagendamentoEntregas := TfrmReagendamentoEntregas.create(self);
      with frmReagendamentoEntregas do
      begin
        vRecnoaux :=  dtmConsultaEntregaProdutos.dsrConsultaEntregaProdutos.dataset.recno;
        AdvDBDateTimePicker1.datasource := dtmConsultaEntregaProdutos.dsrConsultaEntregaProdutos;
        AdvDBDateTimePicker1.MinDate := dtmConsultaEntregaProdutos.DataServidor;
        AdvDBDateTimePicker1.MaxDate := dtmConsultaEntregaProdutos.DataServidor+60;
        AdvDBDateTimePicker2.datasource := dtmConsultaEntregaProdutos.dsrConsultaEntregaProdutos;
        DBLPeriodo.datasource := dtmConsultaEntregaProdutos.dsrConsultaEntregaProdutos;
        DBLPeriodo.Lookupsource := dtmConsultaEntregaProdutos.dsrPeriodosEntrega;


      end;

      if frmReagendamentoEntregas.ShowModal = mrOK then
      begin
        if dtmConsultaEntregaProdutos.qryConsultaEntregaProdutos.state = dsEdit then
        begin
          dtmConsultaEntregaProdutos.qryConsultaEntregaProdutos.post;
          dtmConsultaEntregaProdutos.GravarDadosEntrega;
          AGrupamento;
        end;  
      end;

    end;
  end;

end;

procedure TfrmConsultaEntregaProdutos.AGrupamento;
var i: integer;
begin
//  dbgConsultaEntregaProdutos.sor
//  dbgConsultaEntregaProdutos.MergeCells(6, 0, 12, dbgConsultaEntregaProdutos.RowCount );



  dbgConsultaEntregaProdutos.SubUnGroup(dbgConsultaEntregaProdutos.ColumnByFieldName['contratonota'].Index-1);

  dbgConsultaEntregaProdutos.SubUnGroup(dbgConsultaEntregaProdutos.ColumnByFieldName['nomeregiao'].Index-1);
  dbgConsultaEntregaProdutos.SubUnGroup(dbgConsultaEntregaProdutos.ColumnByFieldName['descricaoperiodoentrega'].Index-1);
  dbgConsultaEntregaProdutos.UnGroup;

  DBGConsultaEntregaProdutos.reload;

  dbgConsultaEntregaProdutos.refresh;
  application.ProcessMessages;

  dbgConsultaEntregaProdutos.autosize := true;
  dbgConsultaEntregaProdutos.refresh;
  dbgConsultaEntregaProdutos.autosize := false;


//  dbgConsultaEntregaProdutos.MergeCols(6, 12);


  DBGConsultaEntregaProdutos.SaveFixedCells := false;


  dbgConsultaEntregaProdutos.Group(dbgConsultaEntregaProdutos.ColumnByFieldName['dataentrega'].Index);
  dbgConsultaEntregaProdutos.SubGroup(dbgConsultaEntregaProdutos.ColumnByFieldName['descricaoperiodoentrega'].Index-1);
  dbgConsultaEntregaProdutos.SubGroup(dbgConsultaEntregaProdutos.ColumnByFieldName['nomeregiao'].Index-1);
  dbgConsultaEntregaProdutos.SubGroup(dbgConsultaEntregaProdutos.ColumnByFieldName['contratonota'].Index-1);

  dbgConsultaEntregaProdutos.GroupSum(dbgConsultaEntregaProdutos.ColumnByFieldName['entregas'].Index-1);
  dbgConsultaEntregaProdutos.GroupCustomCalc(dbgConsultaEntregaProdutos.ColumnByFieldName['limitequantidade'].Index-1);

//  dbgConsultaEntregaProdutos.GroupStdDev(dbgConsultaEntregaProdutos.ColumnByFieldName['nomebairro'].Index-1);


//  dbgConsultaEntregaProdutos.SubGroup(dbgConsultaEntregaProdutos.ColumnByFieldName['contratonota'].Index-1);
  dbgConsultaEntregaProdutos.GroupSum(dbgConsultaEntregaProdutos.ColumnByFieldName['saldo_quantidade'].Index-1);



  dbgConsultaEntregaProdutos.ExpandAll;
  for i:= dbgConsultaEntregaProdutos.RowCount-1 downto 1 do
  begin
    if dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['contratonota'].Index, i]<>'' then
    begin
      dbgConsultaEntregaProdutos.ContractNode(i);
//      dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['romaneio'].Index, i] := 'ROMANEIO';
    end
  end;


  {
  dbgConsultaEntregaProdutos.autosize := true;
  dbgConsultaEntregaProdutos.refresh;
  dbgConsultaEntregaProdutos.autosize := false;
  }

  dbgConsultaEntregaProdutos.Columns[dbgConsultaEntregaProdutos.ColumnByFieldName['contratonota'].Index-1].Width := 0;
  dbgConsultaEntregaProdutos.Columns[dbgConsultaEntregaProdutos.ColumnByFieldName['contratonota'].Index].Width := 400;

//  dbgConsultaEntregaProdutos.ColumnByFieldName['contratonota'].Width := 5;
  dbgConsultaEntregaProdutos.refresh;

end;

procedure TfrmConsultaEntregaProdutos.sbnContratoClick(Sender: TObject);
begin
  inherited;


  if dtmConsultaEntregaProdutos.posicionarregistro(
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['contrato'].Index-1, dbgConsultaEntregaProdutos.row],
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['filialnf'].Index-1, dbgConsultaEntregaProdutos.row],
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['serie'].Index-1, dbgConsultaEntregaProdutos.row],
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['numero'].Index-1, dbgConsultaEntregaProdutos.row],
     dbgConsultaEntregaProdutos.Cells[dbgConsultaEntregaProdutos.ColumnByFieldName['produtovisual'].Index-1, dbgConsultaEntregaProdutos.row]) then
    if dtmConsultaEntregaProdutos.qryConsultaEntregaProdutoscontrato.asstring <> '' then
      TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmConsultaEntregaProdutos.qryConsultaEntregaProdutoscontrato.asstring], 'TfrmCadastroContratos', True)

end;

procedure TfrmConsultaEntregaProdutos.fraListaFiliaisVendasbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliaisVenda.sbnDesmarcarFiliaisClick(Sender);

end;

procedure TfrmConsultaEntregaProdutos.dbgConsultaEntregaProdutosGetDisplText(
  Sender: TObject; ACol, ARow: Integer; var Value: String);
begin
  inherited;

  if (Acol =  (dbgConsultaEntregaProdutos.ColumnByFieldName['limitequantidade'].Index)-1)
      and (Value = '0,00') then
    Value := '';

  if (Acol =  (dbgConsultaEntregaProdutos.ColumnByFieldName['limitequantidade'].Index)-1) and
     (TDBAdvGrid(sender).cells[dbgConsultaEntregaProdutos.ColumnByFieldName['nomeregiao'].Index,ARow]='') then
    Value := '';




                {
  if (Acol =  (dbgConsultaEntregaProdutos.ColumnByFieldName['limitequantidade'].Index)-1)
      and (Value <> '')
      and (ARow<>0)
      and (dbgConsultaEntregaProdutos.Cells[(dbgConsultaEntregaProdutos.ColumnByFieldName['descricaoproduto'].Index)-1, Arow]<>'')
  then
    Value := '';
    }
end;

procedure TfrmConsultaEntregaProdutos.dbgConsultaEntregaProdutosColumnCalc(
  Sender: TObject; ACol, FromRow, ToRow: Integer; var Res: Double);
begin
  inherited;
;
end;

procedure TfrmConsultaEntregaProdutos.dbgConsultaEntregaProdutosGroupCalc(
  Sender: TObject; ACol, FromRow, ToRow: Integer; var Res: Double);
Var
  i : integer;
begin
  inherited;
//  Res := TDBAdvGrid(sender).Floats[ACol,ToRow];


  for i := FromRow to ToRow do
    Res := Res + TDBAdvGrid(sender).Floats[ACol,i];


end;

initialization

  dmBasico.AbrirConsultaEntregaProdutos := AbrirConsultaEntregaProdutos;

end.
