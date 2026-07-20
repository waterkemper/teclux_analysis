unit frselecaoaleatoriamarketplace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, frselecaoaleatoria, db, frConsulta, frConsultaCodigo, cpdbfindcontrols, ctconstantes, biblio;

type
  TfraSelecaoaleatoriamarketplace = class(TFrame)
    fraSelecaoAleatoriamarketplace: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriamarketplacedbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriamarketplacedbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoaleatoriamarketplacebnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriamarketplaceqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriamarketplaceqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
  private
    { Private declarations }
    procedure AcionarPesquisaGrade;
    procedure AtribuirDadosMarketPlace(Found: Boolean);
    function GetListaCondicional: String;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ListaCondicional: String read GetListaCondicional;


  end;

implementation

{$R *.dfm}

{ TfraSelecaoaleatoriamarketplace }

procedure TfraSelecaoaleatoriamarketplace.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriamarketplace do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('MarketPlace');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

constructor TfraSelecaoaleatoriamarketplace.Create(AOwner: TComponent);
begin
  inherited;

  fraSelecaoAleatoriamarketplace.qrySelecaoAleatoria.Sql.Text :=
//     'SELECT  Codigo, descricao FROM produtos WHERE false';
     'SELECT  cast(null as char(20)) as Codigo, '+
            ' cast(null as char(1)) as tipo, '+
            ' cast(null as varchar(50)) as descricao, '+
            ' cast(null as varchar(11)) as campo, '+
            ' cast(null as varchar(20)) as opcomparacao, '+
            ' cast(null as varchar(2)) as oplogico ';




  fraSelecaoAleatoriamarketplace.CampoParaLista := 'codigo';


  with fraSelecaoAleatoriamarketplace do
  begin

    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 20;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldInterno := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldVisual := 'codigo';

    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraMarketPlace;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldinterno := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldVisual := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;

    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesmarketplace;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosMarketPlace;
    ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;

  end;
  fraSelecaoAleatoriamarketplace.UtilizarCamparacaoeLogica := true;
end;

procedure TfraSelecaoaleatoriamarketplace.fraSelecaoAleatoriamarketplacedbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  if (fraSelecaoAleatoriamarketplace.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriamarketplace.qrySelecaoAleatoria.FieldByName('codigo')) then
    acionarPesquisaGrade;
end;

procedure TfraSelecaoaleatoriamarketplace.fraSelecaoAleatoriamarketplacedbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     if (fraSelecaoAleatoriamarketplace.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriamarketplace.qrySelecaoAleatoria.FieldByName('codigo')) then
                     begin
                       fraSelecaoAleatoriamarketplace.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or fraSelecaoAleatoriamarketplace.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriamarketplace.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriamarketplace.qrySelecaoAleatoria.FieldByName('codigo')) then
                begin
                  fraSelecaoAleatoriamarketplace.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriamarketplace.qrySelecaoAleatoria.FieldByName('codigo').asString;
                  fraSelecaoAleatoriamarketplace.ConsultaSelecaoAleatoria.edfCodigo.exist;
                  if not fraSelecaoAleatoriamarketplace.ConsultaSelecaoAleatoria.qryProcuramarketplace.IsEmpty then
                    AtribuirDadosMarketPlace(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriamarketplace.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriamarketplace.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
end;

procedure TfraSelecaoaleatoriamarketplace.fraSelecaoaleatoriamarketplacebnProcuraClick(
  Sender: TObject);
begin
  AcionarPesquisaGrade;

end;

procedure TfraSelecaoaleatoriamarketplace.fraSelecaoAleatoriamarketplaceqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriamarketplace do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'Código';
//    qrySelecaoAleatoria.FieldByName('codigo').SetFieldType(ftLargeInt);
    qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('descricao').DisplayLabel := 'Descrição';
    qrySelecaoAleatoria.FieldByName('descricao').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('opcomparacao').DisplayLabel := 'Comparação';
    qrySelecaoAleatoria.FieldByName('opcomparacao').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('oplogico').DisplayLabel := 'Lógica';
    qrySelecaoAleatoria.FieldByName('oplogico').ReadOnly := false;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;
  end;
end;

procedure TfraSelecaoaleatoriamarketplace.fraSelecaoAleatoriamarketplaceqrySelecaoAleatoriaNewRecord(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriamarketplace do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure TfraSelecaoaleatoriamarketplace.AtribuirDadosMarketPlace(Found: Boolean);
begin
  with fraSelecaoAleatoriamarketplace do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuramarketplace.FieldByname('codigo').AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuramarketplace.FieldByname('descricao').AsString;

    if qrySelecaoAleatoria.FieldByName('campo').asString = '' then
      qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';

    if qrySelecaoAleatoria.FieldByName('opcomparacao').asString = '' then
      qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';

    if qrySelecaoAleatoria.FieldByName('oplogico').asString = '' then
      qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';

    qrySelecaoAleatoria.Post;

  end;
end;

function TfraSelecaoaleatoriamarketplace.GetListaCondicional: String;
begin
  result := trocar(fraSelecaoAleatoriamarketplace.ListaCondicional, 'codigo', 'mk.codigo');
  result := trocar(result, 'descricao','mk.descricao');
end;

end.
