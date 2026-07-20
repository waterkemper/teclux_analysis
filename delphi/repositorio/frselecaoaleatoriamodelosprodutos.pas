unit frselecaoaleatoriamodelosprodutos;

interface

uses
  Windows, Messages, SysUtils, Variants, classes, Graphics, Controls, Forms, 
  Dialogs, frselecaoaleatoria, db, frConsulta, frConsultaCodigo, cpdbfindcontrols, ctconstantes, biblio;

type
  TfraSelecaoaleatoriamodelosprodutos = class(TFrame)
    fraSelecaoAleatoriamodelosProduto: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriamodelosProdutodbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriamodelosProdutodbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoaleatoriamodelosprodutosbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriamodelosProdutoqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriamodelosProdutoqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
  private
    { Private declarations }
    procedure AcionarPesquisaGrade;
    procedure AtribuirDadosmodelosdeProdutos(Found: Boolean);
    function GetListaCondicional: String;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ListaCondicional: String read GetListaCondicional;


  end;

implementation

{$R *.dfm}

{ TfraSelecaoaleatoriamodelosprodutos }

procedure TfraSelecaoaleatoriamodelosprodutos.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriamodelosProduto do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Modelo do Produto');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

constructor TfraSelecaoaleatoriamodelosprodutos.Create(AOwner: TComponent);
begin
  inherited;


  fraSelecaoAleatoriamodelosProduto.qrySelecaoAleatoria.Sql.Text :=
//     'SELECT  Codigo, descricao FROM produtos WHERE false';
     'SELECT  cast(null as char(18)) as Codigo, '+
            ' cast(null as char(1)) as tipo, '+
            ' cast(null as varchar(50)) as descricao, '+
            ' cast(null as varchar(11)) as campo, '+
            ' cast(null as varchar(20)) as opcomparacao, '+
            ' cast(null as varchar(2)) as oplogico ';




  fraSelecaoAleatoriamodelosProduto.CampoParaLista := 'codigo';


  with fraSelecaoAleatoriamodelosProduto do
  begin

    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldInterno := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldVisual := 'codigo';

    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraModelo;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldinterno := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldVisual := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;

    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesMODELO;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosmodelosdeProdutos;
    ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;

  end;

  fraSelecaoAleatoriamodelosProduto.UtilizarCamparacaoeLogica := true;
end;

procedure TfraSelecaoaleatoriamodelosprodutos.fraSelecaoAleatoriamodelosProdutodbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  if (fraSelecaoAleatoriamodelosProduto.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriamodelosProduto.qrySelecaoAleatoria.FieldByName('codigo')) then
    acionarPesquisaGrade;

end;

procedure TfraSelecaoaleatoriamodelosprodutos.fraSelecaoAleatoriamodelosProdutodbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     if (fraSelecaoAleatoriamodelosProduto.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriamodelosProduto.qrySelecaoAleatoria.FieldByName('codigo')) then
                     begin
                       fraSelecaoAleatoriamodelosProduto.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or fraSelecaoAleatoriamodelosProduto.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;    
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriamodelosProduto.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriamodelosProduto.qrySelecaoAleatoria.FieldByName('codigo')) then
                begin
                  fraSelecaoAleatoriamodelosProduto.ConsultaSelecaoAleatoria.qryProcuramodelo.close;
                  fraSelecaoAleatoriamodelosProduto.ConsultaSelecaoAleatoria.qryProcuramodelo.ParamByName('codigo').asString := fraSelecaoAleatoriamodelosProduto.qrySelecaoAleatoria.FieldByName('codigo').asString;
                  fraSelecaoAleatoriamodelosProduto.ConsultaSelecaoAleatoria.qryProcuramodelo.open;
                  fraSelecaoAleatoriamodelosProduto.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriamodelosProduto.qrySelecaoAleatoria.FieldByName('codigo').asString;
                  fraSelecaoAleatoriamodelosProduto.ConsultaSelecaoAleatoria.edfCodigo.modified := true;
                  fraSelecaoAleatoriamodelosProduto.ConsultaSelecaoAleatoria.edfCodigo.exist;
                  
                  if not fraSelecaoAleatoriamodelosProduto.ConsultaSelecaoAleatoria.qryProcuramodelo.IsEmpty then
                    AtribuirDadosmodelosdeProdutos(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriamodelosProduto.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriamodelosProduto.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;

end;

procedure TfraSelecaoaleatoriamodelosprodutos.fraSelecaoaleatoriamodelosprodutosbnProcuraClick(
  Sender: TObject);
begin
  AcionarPesquisaGrade;

end;

procedure TfraSelecaoaleatoriamodelosprodutos.fraSelecaoAleatoriamodelosProdutoqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriamodelosProduto do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'Modelo';
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

procedure TfraSelecaoaleatoriamodelosprodutos.fraSelecaoAleatoriamodelosProdutoqrySelecaoAleatoriaNewRecord(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriamodelosProduto do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure TfraSelecaoaleatoriamodelosprodutos.AtribuirDadosmodelosdeProdutos(Found: Boolean);
begin
  with fraSelecaoAleatoriamodelosProduto do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraModelo.fieldbyname('codigo').AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraModelo.fieldbyname('descricao').AsString;

    if qrySelecaoAleatoria.FieldByName('campo').asString = '' then
      qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';

    if qrySelecaoAleatoria.FieldByName('opcomparacao').asString = '' then
      qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';

    if qrySelecaoAleatoria.FieldByName('oplogico').asString = '' then
      qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';

    qrySelecaoAleatoria.Post;

  end;
end;

function TfraSelecaoaleatoriamodelosprodutos.GetListaCondicional: String;
begin
  result := trocar(fraSelecaoAleatoriamodelosProduto.ListaCondicional, 'codigo', 'mo.codigo');
  result := trocar(result, 'descricao','mo.descricao');
end;

end.
