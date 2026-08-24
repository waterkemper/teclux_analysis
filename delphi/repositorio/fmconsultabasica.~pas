unit fmconsultabasica;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons,
  ExtCtrls, Grids, DBGrids, {Qete,} DB, Windows,
  //Biblio
  ctconstantes, clparametrossistema,
  //Terceiros
  cpQuery, zQuery, 
  //Componentes
  cpdbgrid, cpdatasource, cptexto,
  //Repositorio
   ComCtrls, fmajuda;


type

  TfrmConsultaBasica = class(TfrmAjuda)
    dbgConsulta: TtecDBGrid;
    Source: TtecDataSource;
    pnlCabecalho: TPanel;
    sptConsulta: TSplitter;
    sbxItensConsulta: TScrollBox;
    pnlBotoes: TPanel;
    bbnCancelar: TBitBtn;
    bbnOK: TBitBtn;
    stbMensagem: TStatusBar;
    ckbOpcional1: TCheckBox;
    ckbOpcional2: TCheckBox;
    cbbOpcao: TComboBox;
    gbxSelecionar: TGroupBox;
    procedure dbgConsultaColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure dbgConsultaExit(Sender: TObject);
    procedure ckbOpcional1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgConsultaTitleClick(Column: TColumn);
    procedure ckbOpcional2Click(Sender: TObject);
    procedure cbbOpcaoKeyPress(Sender: TObject; var Key: Char);
    procedure cbbOpcaoSelect(Sender: TObject);
    procedure cbbOpcaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//    procedure FormResize(Sender: TObject);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FOntecClose: TtecProcedure;
    FExibirUltimoParametro: Boolean;
    FPesquisaIniciada: Boolean;
    FManterParametros: Boolean;
    tecla :  Word;
    fParametrodaPesquisa: String;
    fUsarParametrodaPesquisa: Boolean;
    procedure ColResize(Sender:TObject);
    procedure AfterVisualizarCampos;

  protected
    vVerificandoCodigo : Boolean;
//    vPosicaoRegistro: TBookMark;
    FClicadoTitulo: Boolean;
    FLarguraDefault: Integer;
    FDbgColumnsIndex: Integer;
    FConsultaInterativa: Boolean;
    FDataSetPrincipal: TZDataSet;
    FExisteCodigo: TtecVerificaInformacaoNaTabela;
    FMsg: string;
    FFieldName: String;
    FOnControleEnter: TtecProcParametroInteger;
    FPosicionarTabelaDoParametro: TtecInformacaoPorIndice;
    FProximoControle: TtecProcParametroInteger;
    FTabelaParametro: TtecTabelaPorIndice;
    FUsarParametrosDaTabela: Boolean;
    IdxEditorAtual,
    ParametroAtual: Integer;
    Lbo: TLabel;
    function  GetControleProcura: TEditTexto;
    function  ControleEdicaoParametroAtual: TEditTexto; virtual;
//    function  MontaCamposPesquisaveis(ds: TDataSet): String;
    procedure MontaCamposPesquisaveis(ds: TDataSet);
    function  Pesquisavel(Field: TField): Boolean;
    function  GetControle(Index: Integer): TEditTexto;
    function  GetControleAtual: TEditTexto;
    function  GetDataSet: TZDataSet;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DimensionaFormularioConsulta(ManterTamanhoAtual: Boolean = false);
    procedure CriarEditoresDeParametros;
    procedure OrdenePor(NomeCampo: String);
    procedure ProcurarEditor(Sender: TObject);
    procedure SetDataSet(const Value: TZDataSet);

    procedure VerificaCodigo(ExibirMSG: boolean = True);

    procedure ParametroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure ParametroEnter(Sender: TObject);
    procedure ParametroExit(Sender: TObject);
    procedure ParametroChange(Sender: TObject);

    procedure ProcuraEnter(Sender: TObject);
    procedure ProcuraExit(Sender: TObject);
    procedure ProcuraChange(Sender: TObject);

    procedure AlteraTituloGrid;

    property  Controle[Index: Integer]: TEditTexto read GetControle;
    property  ControleAtual: TEditTexto read GetControleAtual;
    procedure AtualizarQuantidadeRegistros(DataSet: TDataSet);

  public
    ReabrirFormulario: Boolean;
    constructor Create(AOwner: TComponent); override;

    destructor destroy; override;
    function  ShowModal(Titulo:String): Integer; reintroduce;
    property  DataSet: TZDataSet read GetDataSet write SetDataSet;
    property  ExisteCodigo: TtecVerificaInformacaoNaTabela read FExisteCodigo write FExisteCodigo;
    property  FieldName: String read FFieldName;
    property  TabelaParametro: TtecTabelaPorIndice read FTabelaParametro write FTabelaParametro;
    property  UsarParametrosDaTabela: Boolean read FUsarParametrosDaTabela write FUsarParametrosDaTabela;
    property  ExibirUltimoParametro: Boolean read FExibirUltimoParametro write FExibirUltimoParametro;
    property  PosicionarTabelaDoParametro: TtecInformacaoPorIndice read FPosicionarTabelaDoParametro write FPosicionarTabelaDoParametro;
    property  OnControleEnter: TtecProcParametroInteger read FOnControleEnter write FOnControleEnter;
    property  ProximoControle: TtecProcParametroInteger read FProximoControle write FProximoControle;
    property  ConsultaInterativa: Boolean read FConsultaInterativa write FConsultaInterativa;
    property  Msg: string read FMsg write FMsg;
    property  OntecClose: TtecProcedure read FOntecClose write FOntecClose;
    property PesquisaIniciada: Boolean read FPesquisaIniciada write FPesquisaIniciada;
    property ManterParametros: Boolean read FManterParametros write FManterParametros;
    property ParametrodaPesquisa: String read fParametrodaPesquisa write fParametrodaPesquisa;
    property UsarParametrodaPesquisa: Boolean read fUsarParametrodaPesquisa write fUsarParametrodaPesquisa;


  end;

  TfrmConsultaBasicaClass = class of TfrmConsultaBasica;

implementation

uses
  //Biblio
  biblio;

{$R *.dfm}

procedure TfrmConsultaBasica.AlteraTituloGrid;
var
 i: integer;

begin

  if dataset <> nil then
  begin
    for i:=0 to dbgConsulta.Columns.Count-1 do
      dbgConsulta.columns[i].Title.Font.Style := [];

    if (dbgConsulta.Columns.Count > 0) then
    begin
      if FDbgColumnsIndex >= dbgConsulta.Columns.Count then
        FDbgColumnsIndex := dbgConsulta.Columns.Count - 1;

      dbgConsulta.Columns[FDbgColumnsIndex].Title.Font.Style:= [fsBold];
      dbgConsulta.Columns[FDbgColumnsIndex].Title.Alignment := taCenter;

      if Assigned(Lbo) then
        if dbgConsulta.Columns[FDbgColumnsIndex].Field <> nil then
          if dbgConsulta.Columns[FDbgColumnsIndex].Field.Tag = 0 then
            Lbo.Caption:= dbgConsulta.Columns[FDbgColumnsIndex].Title.Caption;
    end;
  end;  
end;

function TfrmConsultaBasica.ControleEdicaoParametroAtual: TEditTexto;
begin
  if IdxEditorAtual = -1 then
    Result := nil
  else
    Result := TEditTexto(sbxItensConsulta.Controls[IdxEditorAtual])
end;

constructor TfrmConsultaBasica.Create(AOwner: TComponent);
begin
//  SalvarPropriedadesFormulario := True;
  inherited create(AOwner);

  BorderIcons := [biSystemMenu, biMinimize, biMaximize];
  BorderStyle := bsSizeable;

  FDbgColumnsIndex := 0;
  ParametroAtual   := -1;
  IdxEditorAtual   := -1;
  UsarParametrosDaTabela := True;
  FLarguraDefault:= 540;
  dbgConsulta.OnColResize := ColResize;
//  dbgConsulta.AfterVisualizarCampos := self.AfterVisualizarCampos;



end;

procedure TfrmConsultaBasica.CriarEditoresDeParametros;
var
  a, i, cont: Integer;
  ed: TEditTexto;
  lb: TLabel;
begin

  if Assigned(source.DataSet) then
  begin
    if UsarParametrosDaTabela then
    begin

      cont := DataSet.ParamCount;

      pnlCabecalho.Height := cont * 27 + 50;

      for a := 0 to cont - 1 do
      begin
        lb          := TLabel.Create(Self);
        lb.Parent := pnlCabecalho;
//        lb.Alignment:=taLeftJustify;
        lb.Left     := 10;
        lb.Width    := 71;
        lb.Top      := (a * 27) + 12;
        lb.Caption  := PrimeiraMaiuscula(DataSet.Params[a].DisplayName);
//        lb.Name := 'l' + IntToStr(a);

        ed := TEditTexto.Create(Self);
        ed.Parent := pnlCabecalho;
        ed.Name := 'edtParametro_'+inttostr(a);
        ed.Text := '';
//        ed.MaxLength := 100;
        ed.Left      := 110;//88;
        ed.Top       := (a * 27) + 10;
        ed.Width     := 200;
        ed.OnEnter   := ParametroEnter;
        ed.OnExit    := ParametroExit;
        ed.OnChange  := ParametroChange;
        ed.OnKeyDown := ParametroKeyDown;
        ed.Anchors   := [akLeft, akBottom];
//        ed.Name      := 'e' + IntToStr(a);

        sbxItensConsulta.InsertControl(lb);
        sbxItensConsulta.InsertControl(ed);
        ed.TabOrder := a;
      end;


    end else
      cont := 0;

    lb          := TLabel.Create(Self);
    lb.Parent := pnlCabecalho;
    lb.Alignment:= taLeftJustify;
    lb.Left     := 10;
    lb.Width    := 71;
    lb.Top      := (cont * 27) + 10;
    lb.Caption  := 'Procura por';

    lbo          := TLabel.Create(Self);
    lbo.Parent := pnlCabecalho;
    lbo.Alignment:= taLeftJustify;
    lbo.Left     := 10;
    lbo.Width    := 71;
    lbo.Top      := (cont * 27) + 26;

    ed := TEditTexto.Create(self);
    ed.Parent := pnlCabecalho;
//    ed.MaxLength := 100;

    ed.Name := 'edtProcura';
    ed.Left      := 110; //88;
    ed.Top       := (cont * 27) + 10;
    ed.Width     := 200;
    ed.Text      := '';



    if ExibirUltimoParametro then
    begin
     if UsarParametrodaPesquisa then
        ed.text := ParametrodaPesquisa
     else
     if (dataset.params.Count) > 0 then
     begin
      ed.text := DataSet.Params[0].AsString;
      for I:=0 to dbgConsulta.Columns.Count -1 do
       if dbgconsulta.Columns[i].DisplayName = dataset.Params[0].DisplayName then
       FDbgColumnsIndex := I;
     end;
    end;

    ed.OnEnter   := ProcuraEnter;
    ed.OnExit    := ProcuraExit;
    ed.OnChange  := ProcuraChange;
    ed.OnKeyDown := ParametroKeyDown;
    ed.Anchors   := [akLeft, akBottom];

    sbxItensConsulta.InsertControl(lb);
    sbxItensConsulta.InsertControl(lbo);
    sbxItensConsulta.InsertControl(ed);
    ed.TabOrder := cont;
  end
  else
    sbxItensConsulta.DestroyComponents;



end;

procedure TfrmConsultaBasica.dbgConsultaColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin
  inherited;
  if (ToIndex = 0) or (FromIndex = 0) then begin
    OrdenePor(dbgConsulta.Columns.Items[0].Field.FieldName);
    FDbgColumnsIndex := 0;
  end;
end;



procedure TfrmConsultaBasica.dbgConsultaDblClick(Sender: TObject);
var
 i: integer;
begin
  inherited;
  if bbnOK.Enabled then
    ModalResult := mrOk
  else
  begin
   if assigned(controleAtual) then
      controleatual.SetFocus;
    tecla := VK_Return;
    KeyDown(tecla,[]);
  end;
end;

procedure TfrmConsultaBasica.dbgConsultaExit(Sender: TObject);
begin
  inherited;
  {
  if Not bbnOK.Enabled then
    ParametroExit(nil);
    }
end;

procedure TfrmConsultaBasica.DimensionaFormularioConsulta(ManterTamanhoAtual: Boolean);
var
  Largura, cnt :integer;
begin
{
  with Constraints do
  begin
    MaxHeight := 0;
    MinHeight := 0;
    MaxWidth  := 0;
    MinWidth  := 0;
  end;
  }

  if dbgConsulta.Columns[0].Field <> nil then
  begin

    Largura:= 50;


    if not ManterTamanhoAtual then
    begin
      if dbgConsulta.Columns[0].Field.tag = 0 then
      begin
        if dataset.recordcount <> 0 then
          for cnt:= 0 to dbgConsulta.Columns.Count - 1 do
            dbgConsulta.Columns[cnt].Field.tag := dbgConsulta.Columns[cnt].Width;
      end
      else
      begin
        for cnt:= 0 to dbgConsulta.Columns.Count - 1 do
        begin
          if dbgConsulta.Columns[cnt].Width <> dbgConsulta.Columns[cnt].Field.tag then
            dbgConsulta.Columns[cnt].Width := dbgConsulta.Columns[cnt].Field.tag;
        end
      end;
    end;

    for cnt:= 0 to dbgConsulta.Columns.Count - 1 do
      if pesquisavel(dbgConsulta.Columns[cnt].Field) then
        if dbgConsulta.Columns[cnt].visible then
           Largura:= Largura + (dbgConsulta.Columns[cnt].Width);

    Width := Largura;


    if Width < FLarguraDefault then
      begin
        {
        with Constraints do
        begin
          MaxHeight := Height;
          MinHeight := Height;
          MaxWidth  := FLarguraDefault;
          MinWidth  := FLarguraDefault;
        end;
        }
        Width := FLarguraDefault;

      end;


//    dbgConsulta.AjustarTamanhoGrid;

         {
    with Constraints do
    begin
      MaxHeight := Height;
      MinHeight := Height;
      MaxWidth  := Width;
      MinWidth  := Width;
    end;
    }

    Left := (Screen.Width div 2) - (Width div 2);
    Top := (Screen.Height div 2) - (Height div 2);

  //  OrdenePor(dbgConsulta.Columns.Items[FDbgColumnsIndex].Field.FieldName);
    AlteraTituloGrid;
    stbMensagem.Panels[0].Width:= stbMensagem.Width - 128;
    AtualizarQuantidadeRegistros(source.dataset);
  //  stbMensagem.Panels[1].Text:= ' Registros:  ' + Format('%7.7d',[DataSet.RecordCount]);
 end; 
end;

function TfrmConsultaBasica.GetControle(Index: Integer): TEditTexto;
var
  a: Integer;
begin
  Result := nil;
  for a := 0 to sbxItensConsulta.ControlCount - 1 do
    if sbxItensConsulta.Controls[a] is TEditTexto then
      if TEditTexto(sbxItensConsulta.Controls[a]).TabOrder = Index then begin
        Result := TEditTexto(sbxItensConsulta.Controls[a]);
        break
      end
end;

function TfrmConsultaBasica.GetControleAtual: TEditTexto;
begin
  Result := ControleEdicaoParametroAtual;
end;

function TfrmConsultaBasica.GetDataSet: TZDataSet;
begin
  Result := TZDataSet(Source.DataSet);
end;

type
   TtecScrollBox = class(TScrollBox);

procedure TfrmConsultaBasica.KeyDown(var Key: Word; Shift: TShiftState);
{
var
  FDbgColumnsIndex_Temp : integer;}

begin
  if ActiveControl <> dbgConsulta then
    if assigned(controleAtual) then
      controleatual.SetFocus;

  if TeclaEnterOuReturn(Key) then
  begin

    if ssShift in Shift then
      TtecScrollBox(sbxItensConsulta).SelectNext(ActiveControl, False, True)
    else
    if Shift = [] then
    begin

      if ConsultaInterativa then
      begin
        TtecScrollBox(sbxItensConsulta).SelectNext(ActiveControl, True, True);
        controleatual.clear;
      end
      else
//      if TEditTexto(ActiveControl).Modified then
      if TEditTexto(ControleAtual).Modified then
      begin
        TEditTexto(ControleAtual).Modified := False;
        VerificaCodigo;
      end
      else
        TtecScrollBox(sbxItensConsulta).SelectNext(ActiveControl, True, True);

    end
  end
  else if (Key = VK_F11) and (dbgConsulta.Columns.Count > 0) then
  begin
//    FDbgColumnsIndex_Temp := FDbgColumnsIndex;
    if (Shift = [ssShift]) then
    begin
          {
      while true do
      begin
      }
        Dec(FDbgColumnsIndex);
        {
        if (dbgConsulta.Columns[FDbgColumnsIndex].Field.Tag = 0) then
        begin
          FDbgColumnsIndex_Temp := FDbgColumnsIndex;
          break;
        end;
        if (FDbgColumnsIndex = 0) then
          break;
      end;
      FDbgColumnsIndex := FDbgColumnsIndex_Temp;
      }
    end
    else
    begin
    {
      while true do
      begin
      }
        Inc(FDbgColumnsIndex);
        {
        if (dbgConsulta.Columns[FDbgColumnsIndex].Field.Tag = 0) then
        begin
          FDbgColumnsIndex_Temp := FDbgColumnsIndex;
          break;
        end;
        if (FDbgColumnsIndex >= (dbgConsulta.Columns.Count - 1)) then
          break;
      end;
      }
    end;
//    FDbgColumnsIndex := FDbgColumnsIndex_Temp;

    if (FDbgColumnsIndex > (dbgConsulta.Columns.Count - 1)) then
      FDbgColumnsIndex := 0
    else
    if (FDbgColumnsIndex < 0) then
      FDbgColumnsIndex := (dbgConsulta.Columns.Count - 1);

    OrdenePor(dbgConsulta.Columns.Items[FDbgColumnsIndex].Field.FieldName);
    AlteraTituloGrid;


    if UsarParametrodaPesquisa then
      if (ParametrodaPesquisa<>'') and
         (dbgConsulta.Columns[FDbgColumnsIndex].Field.Tag = 0) then
        VerificaCodigo(false);

  end;
  {
  else
    TEditTexto(ControleAtual).Modified := true;
    }

  inherited;
   {
  if parametroatual = -1 then
    ProcuraChange(self);}
end;

procedure TfrmConsultaBasica.MontaCamposPesquisaveis(ds: TDataSet);
var
  a: Integer;
begin
//  Result := '';
  if Assigned(ds) then
  begin
    if ExibirUltimoParametro then
        FFieldName := dbgConsulta.Columns.Items[FDbgColumnsIndex].Field.FieldName
    else
    begin
      if FClicadoTitulo then
        FFieldName := dbgConsulta.Columns.Items[FDbgColumnsIndex].Field.FieldName
      else
      begin
        for a := 0 to ds.FieldCount - 1 do
          if Pesquisavel(ds.Fields[a]) then
          begin
            FFieldName:= ds.Fields[a].FieldName;
            Break;
          end;
      end;

  {        if ParSistema.ExibirReferenciaProduto then begin
            Result := ds.Fields[0].FieldName;
            if ds.Fields[a].Tag = 1 then begin
              Result := ds.Fields[a].FieldName;
              break;
            end
          end
          else begin
            Result := ds.Fields[a].FieldName; // Jander
            break; // Jander
          end;
        end;
   }
      for a := 0 to ds.FieldCount - 1 do
        if Not Pesquisavel(ds.Fields[a]) then
          ds.Fields[a].Visible := False;

  {    if ParSistema.ExibirReferenciaProduto then begin
        for a := 0 to ds.FieldCount - 1 do
          if (Pesquisavel(ds.Fields[a])and ds.Fields[a].Visible) then
            if ds.Fields[a].Tag = 1 then begin
              ds.Fields[a].Index:= 0;
              break;
            end;
      end;}
    end;
 end;
end;

procedure TfrmConsultaBasica.OrdenePor(NomeCampo: String);
var
  a, Idx: Integer;
begin
{
  Idx := -1;
  if Assigned(ControleAtual) then
    ControleAtual.Text := '';
  for a := DataSet.Sql.Count - 1 downto 0 do
  begin
    Idx := Pos('ORDER', ANSIUpperCase(DataSet.Sql[a]));
    if Idx > 0 then begin
     DataSet.Close;
      case dataset.FieldByName(NomeCampo).DataType of
       ftString : DataSet.Sql[a]  := 'order by Maiusculo(' + (NomeCampo)+')';
      else
        DataSet.Sql[a]  := 'order by ' + (NomeCampo)
      end;

      FFieldName := NomeCampo;
      break
    end
  end;

  if Idx = 0 then begin

    DataSet.Close;
    case dataset.FieldByName(NomeCampo).DataType of
      ftString : DataSet.Sql.Append('order by Maiusculo(' + (NomeCampo)+')');
    else
      DataSet.Sql.Append('order by ' + (NomeCampo));
    end;

    FFieldName := NomeCampo;
  end;


  try
    DataSet.Open;
  except
    if Idx = 0 then
       dataset.Sql[dataset.sql.Count-1] := 'order by ' + (NomeCampo)
    else
       DataSet.Sql[a]  := 'order by ' + (NomeCampo);
    Dataset.Open;
  end;
}

  FFieldName := NomeCampo;
  dataset.SortByField(NomeCampo);
  AtualizarQuantidadeRegistros(source.dataset);
//  stbMensagem.Panels[1].Text:= 'Registros:  ' + Format('%7.7d',[DataSet.RecordCount]);
end;

function TfrmConsultaBasica.Pesquisavel(Field: TField): Boolean;
begin
  result := False;

  if field <> nil then
    Result := (Field.DataType in [ftString, ftSmallint, ftInteger, ftWord, ftFloat,
                               ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
                               ftWideString, ftLargeint]) and Field.Visible;
end;

procedure TfrmConsultaBasica.ProcurarEditor(Sender: TObject);
var
  a: Integer;

begin
  for a := 0 to sbxItensConsulta.ControlCount - 1 do
    if Sender = sbxItensConsulta.Controls[a] then begin
      IdxEditorAtual := a;
      ParametroAtual := TEditTexto(sbxItensConsulta.Controls[IdxEditorAtual]).TabOrder;
      break
    end
end;

procedure TfrmConsultaBasica.SetDataSet(const Value: TZDataSet);
function FieldsFromGridinDataSet: Boolean;
begin
  result := false;
end;

begin
  if Assigned(Value) then
  begin
    {
    if assigned(dataset) and dataset.active then
      dataset.SortClear;
      }
{    dbgConsulta.DataSource.Enabled := false;  problema cadastro endereço}
//    Source.DataSet := nil;

{
    if not PesquisaIniciada then
      CarregarConfiguracoesFormulario(True);
      }


    if Source.DataSet <> Value then
    begin
      SalvarConfiguracoesFormulario;
      Source.DataSet := nil;
      dbgConsulta.Columns.Clear;
      Source.DataSet := Value;
      CarregarConfiguracoesFormulario(False);
    end;



    {Os campos do dbgrid estão no dataset, caso negativo, reverter o formulario }

    {
    if not FieldsFromGridinDataSet then
       dbgConsulta.reverterCampos(nil);
       }


{    dbgConsulta.DataSource.Enabled := true; problema cadastro endereço}
    dbgConsulta.RefazerOrdenacaoTabela;

    dbgConsulta.Refresh;
    FDataSetPrincipal := Value;
    source.dataset.AfterRefresh := AtualizarQuantidadeRegistros;
  end else
    Source.DataSet := nil;

  if not PesquisaIniciada then
    CriarEditoresDeParametros;

end;

function TfrmConsultaBasica.ShowModal(Titulo:String): Integer;
var
  a: Integer;
  edt: TEditTexto;
  Continuar: Boolean;
  ds: TzDataSet;
  vAuxIdxEditorAtual : integer;
begin
  if Titulo <> '' then
    Caption:= '< ' + Titulo + ' >';

  if Assigned(PosicionarTabelaDoParametro) then begin
    Continuar := True;
    ds := DataSet;
    for a := 0 to ds.ParamCount - 1 do begin
      edt := Controle[a];
      if Assigned(edt) then begin
        ParametroEnter(edt);
        PosicionarTabelaDoParametro(a, Continuar);
        if Continuar then begin
          edt.Text := dbgConsulta.Columns[0].Field.AsString;
          if a = ds.ParamCount - 1 then begin
            ParametroExit(nil);
            IdxEditorAtual := -1;
          end
        end else
          break;
      end;
    end;
  end;

  if ExibirUltimoParametro then
  begin
    edt := Controle[0];
    if UsarParametrodaPesquisa then
       edt.text := ParametrodaPesquisa
    else
      edt.text := DataSet.Params[0].AsString;

    edt.Modified := false;
    edt.SelectAll;
  end;

  if not ConsultaInterativa then
  begin
    if ReabrirFormulario then
    begin
      DataSet.Active := false;
      DataSet.Active := true;
    end;


    if ExibirUltimoParametro then
    begin
      vauxIdxEditorAtual := IdxEditorAtual;
      ProcuraEnter(nil);
      IdxEditorAtual := vauxIdxEditorAtual;
    end;

    if UsarParametrodaPesquisa then
      if (ParametrodaPesquisa<>'') and
         (dbgConsulta.Columns[FDbgColumnsIndex].Field.Tag = 0) then
        VerificaCodigo(false);

  end;

  if DataSet.Active then
  begin

    DimensionaFormularioConsulta;
    FFieldName := dbgConsulta.Columns.Items[FDbgColumnsIndex].Field.FieldName
//    FFieldName := dbgConsulta.Columns.Items[0].Field.FieldName AQUI
  end;


  if ConsultaInterativa and (DataSet.RecordCount = 0) then begin
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['registro']));
    Result := mrNONE
  end else
    Result := inherited ShowModal;
end;

procedure TfrmConsultaBasica.VerificaCodigo(ExibirMSG: boolean);
var
  valorcampo: String;
  cnt : integer;
begin
  vVerificandoCodigo := true;

  if DataSet.RecordCount <> 0 then
    for cnt:= 0 to dbgConsulta.Columns.Count - 1 do
      dbgConsulta.Columns[cnt].Field.tag := dbgConsulta.Columns[cnt].Width;

  if Assigned(ControleAtual) then
  begin

    valorcampo := ControleAtual.Text;
    if (valorcampo <> '') then
    begin

      if not ExisteCodigo(ParametroAtual, dbgConsulta.Columns[FDbgColumnsIndex].FieldName, valorcampo) then
      begin
        if not ConsultaInterativa {and ExibirUltimoParametro} then
        begin

          if (DataSet.recordcount = 0) then
            if dbgConsulta.Columns[0].Field.tag <> 0 then
              for cnt:= 0 to dbgConsulta.Columns.Count - 1 do
              begin
                if dbgConsulta.Columns[cnt].Width <> dbgConsulta.Columns[cnt].Field.tag then
                  dbgConsulta.Columns[cnt].Width := dbgConsulta.Columns[cnt].Field.tag;
              end;

          if ExibirMSG then
            if FMsg <> '' then
                 MensagemAviso(FMsg)
            else MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['registro']));

          AlteraTituloGrid;
//          DimensionaFormularioConsulta;
        end;
      end
      else
      if not ConsultaInterativa then
      begin
        bbnOK.Enabled := (ControleEdicaoParametroAtual.Name = 'edtProcura') or ExibirUltimoParametro ;
      end;


    end;
  end;

  bbnOK.Enabled := (ControleEdicaoParametroAtual.Name = 'edtProcura') and (DataSet.recordcount <> 0);

  {
  if (DataSet.recordcount <> 0) then
    DimensionaFormularioConsulta;
    }

  vVerificandoCodigo := false;
  dbgConsulta.AjustarTamanhoGrid;  

//  AutoSizeDBGrid(dbgConsulta);
end;

procedure TfrmConsultaBasica.ParametroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP:
    begin
      DataSet.Prior;
      key := 0;
    end;

    VK_DOWN:
    begin
      DataSet.Next;
      key := 0;
    end;

    VK_PRIOR:
    begin
      DataSet.MoveBy(-dbgConsulta.VisibleRowCount);
      key := 0;
    end;

    VK_NEXT:
    begin
      DataSet.MoveBy(dbgConsulta.VisibleRowCount);
      key := 0;
    end;

    VK_HOME:
    begin
      DataSet.First;
      key := 0;
    end;

    VK_END:
    begin
      DataSet.Last;
      key := 0;
    end;
  end;
end;

procedure TfrmConsultaBasica.ParametroEnter(Sender: TObject);
begin
  if not FClicadoTitulo then
  begin
//    FClicadoTitulo := False;
    FDbgColumnsIndex := 0;
    ProcurarEditor(Sender);
    bbnOK.Enabled := IdxEditorAtual = -1;
    {
    if assigned(dataset) and dataset.active then
      dataset.SortClear;
      }
  {  dbgConsulta.DataSource.Enabled := false; problema cadastro endereço}

//    if Source.DataSet <> TabelaParametro(ParametroAtual) then
    begin
        SalvarConfiguracoesFormulario;
        Source.DataSet := nil;
        dbgConsulta.Columns.Clear;
        Source.DataSet := TabelaParametro(ParametroAtual);
        CarregarConfiguracoesFormulario(False);
    end;

  {  dbgConsulta.DataSource.Enabled := true; problema cadastro endereço}
    MontaCamposPesquisaveis(Source.DataSet);
    AlteraTituloGrid;
    if DataSet.Active then
      DimensionaFormularioConsulta;
    if Assigned(OnControleEnter) then
      OnControleEnter(ParametroAtual);
  end;
end;

procedure TfrmConsultaBasica.ParametroExit(Sender: TObject);
begin

  if ActiveControl is TEditTexto then
  begin
    if Assigned(ControleAtual) then
    begin
  //    if Not ConsultaInterativa and not TEditTexto(ControleAtual).Modified  then
      begin

        if Assigned(dbgConsulta.Columns[FDbgColumnsIndex].Field) then
        begin
          ControleAtual.Text := dbgConsulta.Columns[FDbgColumnsIndex].Field.AsString;
          TEditTexto(ControleAtual).Modified := false;
          ControleAtual.Refresh;
        end;

  //      VerificaCodigo;
      end;


      if Assigned(ProximoControle) then
        ProximoControle(ParametroAtual);

//      FClicadoTitulo := False;
      FDbgColumnsIndex := 0;
    end;
  end;

end;

procedure TfrmConsultaBasica.ParametroChange(Sender: TObject);
begin
 if ConsultaInterativa then
    VerificaCodigo;
end;

procedure TfrmConsultaBasica.ProcuraChange(Sender: TObject);
begin
  inherited;
  try
    if ConsultaInterativa then
    begin
     ExisteCodigo(-1, FieldName, ANSIUpperCase(GetControleProcura.Text));
    end
    else
    if (DataSet.RecordCount > 0) and
       ((GetControleProcura.Text = '') or
        ((GetControleProcura.Text <> '') and (parametroatual = -1) and not TEditTexto(ActiveControl).Modified))  then
      bbnOK.Enabled:= True
    else
      bbnOK.Enabled:= False;
  except
  end

end;

procedure TfrmConsultaBasica.ProcuraEnter(Sender: TObject);
begin
  inherited;
  if not FClicadoTitulo then
  begin

    IdxEditorAtual := -1;

    if Source.DataSet <> FDataSetPrincipal then
    begin
     {
      if assigned(dataset) and dataset.active then
        dataset.SortClear;
        }
  {    dbgConsulta.DataSource.Enabled := false; problema cadastro endereço}
      dbgConsulta.ordenacao := '';

      SalvarConfiguracoesFormulario;
      Source.DataSet := nil;
      dbgConsulta.Columns.Clear;
      Source.DataSet := FDataSetPrincipal;
      CarregarConfiguracoesFormulario(False);

  {    dbgConsulta.DataSource.Enabled := true; problema cadastro endereço}
    end;

    if Assigned(Source.DataSet) then begin
      MontaCamposPesquisaveis(Source.DataSet);
      AlteraTituloGrid;
      bbnOK.Enabled := Not DataSet.IsEmpty;
  //    DimensionaFormularioConsulta;
      if Assigned(OnControleEnter) then
        OnControleEnter(-1);

      ParametroAtual := -1;

    end else
      bbnOK.Enabled := False;
  end;
end;

procedure TfrmConsultaBasica.ProcuraExit(Sender: TObject);
begin
  inherited;
  if ActiveControl is TEditTexto then
  begin
    if (DataSet.ParamCount > 1) then
      bbnOK.Enabled := IdxEditorAtual = -1;

    ProximoControle(-1);
//    FClicadoTitulo := False;
    if not ManterParametros then
      FDbgColumnsIndex := 0;
  end;    
end;

function TfrmConsultaBasica.GetControleProcura: TEditTexto;
var
  cnt: Integer;
begin
  Result := nil;
  for cnt := 0 to sbxItensConsulta.ControlCount - 1 do
    if sbxItensConsulta.Controls[cnt].Name = 'edtProcura' then
    begin
//      ParametroAtual := -1;
      Result := TEditTexto(sbxItensConsulta.Controls[cnt]);
    end;
end;

procedure TfrmConsultaBasica.ckbOpcional1Click(Sender: TObject);
begin
  inherited;
  if ckbOpcional1.Checked then
    if ckbOpcional2.Checked then
    begin
      ckbOpcional2.OnClick := nil;
      ckbOpcional2.Checked := false;
      ckbOpcional2.OnClick := ckbOpcional2Click;
    end;
  ReabrirFormulario := true;
  OntecClose;
  ModalResult := mrcancel;

end;

procedure TfrmConsultaBasica.FormClose(Sender: TObject;
  var Action: TCloseAction);
var  
  cnt: integer;
begin


  if DataSet.RecordCount <> 0 then
    for cnt:= 0 to dbgConsulta.Columns.Count - 1 do
      dbgConsulta.Columns[cnt].Field.tag := dbgConsulta.Columns[cnt].Width;

//  vPosicaoRegistro := DataSet.GetBookmark;

  ttecquery(Source.dataset).GuardarRegistroAtual(false, false);

  if assigned(OntecClose) then
  begin
    ReabrirFormulario := False;
    OntecClose;
  end;


  inherited;
end;

procedure TfrmConsultaBasica.dbgConsultaTitleClick(Column: TColumn);
begin
  inherited;

  try
    FClicadoTitulo := true;
    FDbgColumnsIndex:= column.Index;
    OrdenePor(dbgConsulta.Columns.Items[FDbgColumnsIndex].Field.FieldName);
    AlteraTituloGrid;

    if UsarParametrodaPesquisa then
      if (ParametrodaPesquisa<>'') and
         (column.Field.Tag = 0) then
        VerificaCodigo(false);

   if ActiveControl = dbgConsulta then
     if assigned(controleAtual) then
       controleatual.SetFocus;
  finally
    FClicadoTitulo := False;
  end;
end;

destructor TfrmConsultaBasica.destroy;
begin
//  self := nil;

  inherited;
end;

procedure TfrmConsultaBasica.ckbOpcional2Click(Sender: TObject);
begin
  inherited;
  if ckbOpcional2.Checked then
    if ckbOpcional1.Checked then
    begin
      ckbOpcional1.OnClick := nil;
      ckbOpcional1.Checked := false;
      ckbOpcional1.OnClick := ckbOpcional1Click;
    end;
  ReabrirFormulario := true;
  OntecClose;
  ModalResult := mrcancel;
end;

procedure TfrmConsultaBasica.cbbOpcaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key <> VK_UP) and
     (key <> VK_DOWN) then
    Key := 0;
end;

procedure TfrmConsultaBasica.cbbOpcaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key <> '') and
     (key <> '') then
    key := chr(13)
end;

procedure TfrmConsultaBasica.cbbOpcaoSelect(Sender: TObject);
{
var
  vAccept: Boolean;
  }
begin
  inherited;
  DataSet.Filtered := true;
//  DataSet.Refresh;
  AtualizarQuantidadeRegistros(source.DataSet);

  {
  if cbbOpcao.Text = 'ATIVOS' then
    vAccept := DataSet.FieldByName('inativo').IsNull;
 }
//  DataSet.OnFilterRecord(Dataset, vAccept);
end;

procedure TfrmConsultaBasica.FormShow(Sender: TObject);
begin
  inherited;
  try
//   dbgConsulta.invalidate;
//    if dataset.BookmarkValid(vPosicaoRegistro) then
//      dataset.GotoBookmark(vPosicaoRegistro);
    ttecquery(Source.dataset).VoltarRegistro;

  finally
//    dataset.FreeBookmark(vPosicaoRegistro);
  end;

  DimensionaFormularioConsulta(true);

end;

procedure TfrmConsultaBasica.AtualizarQuantidadeRegistros(DataSet: TDataSet);
begin
  stbMensagem.Panels[1].Text:= 'Registros:  ' + Format('%7.7d',[DataSet.RecordCount]);
end;

procedure TfrmConsultaBasica.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  // CanClose := not TEditTexto(ActiveControl).Modified;
end;

(*
procedure TfrmConsultaBasica.FormResize(Sender: TObject);
begin
  inherited;
//  AutoSizeDBGrid(dbgConsulta);
end;
*)

procedure TfrmConsultaBasica.ColResize(Sender: TObject);
begin
  if not vVerificandoCodigo then
//    if dataset.recordcount <> 0 then
    if self.dataset <> nil then
      DimensionaFormularioConsulta(True);
end;

procedure TfrmConsultaBasica.dbgConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Column.FieldName = 'comissao_produto') or
     (Column.FieldName = 'comissao') or
     (Column.FieldName = 'comissao_grupo') then
  begin
    TDBGrid(Sender).Canvas.Brush.color := $0002FD86;
    TDBGrid(Sender).Canvas.Font.Color := clRed;
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;


procedure TfrmConsultaBasica.AfterVisualizarCampos;
begin
  DimensionaFormularioConsulta(true);
end;




procedure TfrmConsultaBasica.dbgConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then
  begin
   ControleAtual.Text := dbgConsulta.Columns[FDbgColumnsIndex].Field.AsString;
   if assigned(controleAtual) then
      controleatual.SetFocus;

//    tecla := VK_Return;
//    KeyDown(tecla,[]);
  end;
  inherited;

end;

end.
