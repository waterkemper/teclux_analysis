unit frselecaoaleatorialocalizacaoestoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, frselecaoaleatoria, db, frConsulta, frConsultaCodigo, cpdbfindcontrols, ctconstantes, biblio;

type
  TfraSelecaoaleatorialocalizacaoestoque = class(TFrame)
    fraSelecaoAleatoriaLocalizacaoEstoque: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriaLocalizacaoEstoquedbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaLocalizacaoEstoquedbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoaleatorialocalizacaoestoquebnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaLocalizacaoEstoqueqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaLocalizacaoEstoqueqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
  private
    { Private declarations }
    procedure AcionarPesquisaGrade;
    procedure AtribuirDadosLocalizaoEstoque(Found: Boolean);
    function GetListaCondicional: String;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ListaCondicional: String read GetListaCondicional;


  end;

implementation

{$R *.dfm}

{ TfraSelecaoaleatorialocalizacaoestoque }

procedure TfraSelecaoaleatorialocalizacaoestoque.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriaLocalizacaoEstoque do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Item de Produto');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

constructor TfraSelecaoaleatorialocalizacaoestoque.Create(AOwner: TComponent);
begin
  inherited;

  fraSelecaoAleatoriaLocalizacaoEstoque.qrySelecaoAleatoria.Sql.Text :=
//     'SELECT  Codigo, descricao FROM produtos WHERE false';
//     'SELECT  cast(null as char(20)) as Codigo, '+
//            ' cast(null as char(1)) as tipo, '+
//            ' cast(null as varchar(50)) as descricao, '+
//            ' cast(null as varchar(11)) as campo, '+
//            ' cast(null as varchar(20)) as opcomparacao, '+
//            ' cast(null as varchar(2)) as oplogico ';

     'SELECT  cast(null as varchar(50)) as descricao, '+
            ' cast(null as varchar(11)) as campo, '+
            ' cast(null as varchar(20)) as opcomparacao, '+
            ' cast(null as varchar(2)) as oplogico ';





  fraSelecaoAleatoriaLocalizacaoEstoque.CampoParaLista := 'descricao';


  with fraSelecaoAleatoriaLocalizacaoEstoque do
  begin

    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 20;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'descricao';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldInterno := 'descricao';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldVisual := 'descricao';

    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraLocalizaoEstoque;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'localizacao';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'localizacao';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldinterno := 'localizacao';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldVisual := 'localizacao';
    ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;

    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesLocalizacaoEstoque;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosLocalizaoEstoque;
    ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;

  end;

  fraSelecaoAleatoriaLocalizacaoEstoque.UtilizarCamparacaoeLogica := true;
  
end;

procedure TfraSelecaoaleatorialocalizacaoestoque.fraSelecaoAleatoriaLocalizacaoEstoquedbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  if (fraSelecaoAleatoriaLocalizacaoEstoque.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaLocalizacaoEstoque.qrySelecaoAleatoria.FieldByName('descricao')) then
    acionarPesquisaGrade;
end;

procedure TfraSelecaoaleatorialocalizacaoestoque.fraSelecaoAleatoriaLocalizacaoEstoquedbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     if (fraSelecaoAleatoriaLocalizacaoEstoque.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaLocalizacaoEstoque.qrySelecaoAleatoria.FieldByName('descricao')) then
                     begin
                       fraSelecaoAleatoriaLocalizacaoEstoque.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or fraSelecaoAleatoriaLocalizacaoEstoque.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriaLocalizacaoEstoque.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaLocalizacaoEstoque.qrySelecaoAleatoria.FieldByName('descricao')) then
                begin
                  fraSelecaoAleatoriaLocalizacaoEstoque.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriaLocalizacaoEstoque.qrySelecaoAleatoria.FieldByName('descricao').asString;
                  fraSelecaoAleatoriaLocalizacaoEstoque.ConsultaSelecaoAleatoria.edfCodigo.exist;
                  if not fraSelecaoAleatoriaLocalizacaoEstoque.ConsultaSelecaoAleatoria.qryProcuraLocalizacaoEstoque.IsEmpty then
                    AtribuirDadosLocalizaoEstoque(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaLocalizacaoEstoque.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaLocalizacaoEstoque.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
end;

procedure TfraSelecaoaleatorialocalizacaoestoque.fraSelecaoaleatorialocalizacaoestoquebnProcuraClick(
  Sender: TObject);
begin
  AcionarPesquisaGrade;

end;

procedure TfraSelecaoaleatorialocalizacaoestoque.fraSelecaoAleatoriaLocalizacaoEstoqueqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriaLocalizacaoEstoque do
  begin
//    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'Produto';
//    qrySelecaoAleatoria.FieldByName('codigo').SetFieldType(ftLargeInt);
//    qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('descricao').DisplayLabel := 'Localização';
    qrySelecaoAleatoria.FieldByName('descricao').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('opcomparacao').DisplayLabel := 'Comparação';
    qrySelecaoAleatoria.FieldByName('opcomparacao').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('oplogico').DisplayLabel := 'Lógica';
    qrySelecaoAleatoria.FieldByName('oplogico').ReadOnly := false;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;
  end;
end;

procedure TfraSelecaoaleatorialocalizacaoestoque.fraSelecaoAleatoriaLocalizacaoEstoqueqrySelecaoAleatoriaNewRecord(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriaLocalizacaoEstoque do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure TfraSelecaoaleatorialocalizacaoestoque.AtribuirDadosLocalizaoEstoque(Found: Boolean);
begin
  with fraSelecaoAleatoriaLocalizacaoEstoque do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraLocalizacaoEstoque.FieldByname('localizacao').AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraLocalizacaoEstoque.FieldByname('localizacao').AsString;

    if qrySelecaoAleatoria.FieldByName('campo').asString = '' then
      qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';

    if qrySelecaoAleatoria.FieldByName('opcomparacao').asString = '' then
      qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';

    if qrySelecaoAleatoria.FieldByName('oplogico').asString = '' then
      qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';

    qrySelecaoAleatoria.Post;

  end;
end;

function TfraSelecaoaleatorialocalizacaoestoque.GetListaCondicional: String;
begin
  result := trocar(fraSelecaoAleatoriaLocalizacaoEstoque.ListaCondicional, 'codigo', 'e.localizacao');
  result := trocar(result, 'descricao','e.localizacao');
end;

end.
