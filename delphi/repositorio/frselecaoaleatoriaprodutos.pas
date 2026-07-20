unit frselecaoaleatoriaprodutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ComCtrls, 
  Dialogs, frselecaoaleatoria, db, frConsulta, frConsultaCodigo, cpdbfindcontrols, ctconstantes, biblio;

type
  TfraSelecaoAleatoriaprodutos = class(TFrame)
    fraSelecaoAleatoriaProduto: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriaProdutodbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaProdutodbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaprodutosbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaProdutoqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaProdutoqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaProdutosbnIncluirItemClick(
      Sender: TObject);
  private
    { Private declarations }
    procedure AcionarPesquisaGrade;
    procedure AtribuirDadosproduto(found: Boolean);
    function GetListaCondicional: String;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ListaCondicional: String read GetListaCondicional;


  end;

implementation

{$R *.dfm}

{ TfraSelecaoAleatoriaprodutos }

procedure TfraSelecaoAleatoriaprodutos.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriaProduto do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Item de Produto');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

constructor TfraSelecaoAleatoriaprodutos.Create(AOwner: TComponent);
begin
  inherited;
//  if ((owner is TTabSheet) and  TTabSheet(owner).tabvisible) or not (owner is TTabSheet) then
  begin
    fraSelecaoAleatoriaProduto.qrySelecaoAleatoria.Sql.Text :=
  //     'SELECT  Codigo, descricao FROM produtos WHERE false';
       'SELECT  cast(null as char(30)) as Codigo, '+
              ' cast(null as char(1)) as tipo, '+
              ' cast(null as varchar(100)) as descricao, '+
              ' cast(null as varchar(11)) as campo, '+
              ' cast(null as varchar(20)) as opcomparacao, '+
              ' cast(null as varchar(2)) as oplogico ';


    fraSelecaoAleatoriaProduto.CampoParaLista := 'codigo';


    with fraSelecaoAleatoriaProduto do
    begin
      ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
      ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
      ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 30;
      ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
      ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
      ConsultaSelecaoAleatoria.edfCodigo.DataaFieldInterno := 'codigo';
      ConsultaSelecaoAleatoria.edfCodigo.DataaFieldVisual := 'codigo';

      ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
      ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraProdutos;
      ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'caracteristicavisual';
      ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'caracteristicavisual';
      ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldinterno := 'caracteristicavisual';
      ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldVisual := 'caracteristicavisual';
      ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;

      ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
  //    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
      ConsultaSelecaoAleatoria.TipoPesquisa := pesPRODUTOS;
      ConsultaSelecaoAleatoria.OnFound := AtribuirDadosProduto;
      fraSelecaoAleatoriaProduto.ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;

    end;
    fraSelecaoAleatoriaProduto.UtilizarCamparacaoeLogica := true;
  end;  
end;

procedure TfraSelecaoAleatoriaprodutos.fraSelecaoAleatoriaProdutodbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  if (fraSelecaoAleatoriaProduto.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaProduto.qrySelecaoAleatoria.FieldByName('codigo')) then
    acionarPesquisaGrade;

end;

procedure TfraSelecaoAleatoriaprodutos.fraSelecaoAleatoriaProdutodbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     if (fraSelecaoAleatoriaProduto.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaProduto.qrySelecaoAleatoria.FieldByName('codigo')) then
                     begin
                       fraSelecaoAleatoriaProduto.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or fraSelecaoAleatoriaProduto.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriaProduto.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaProduto.qrySelecaoAleatoria.FieldByName('codigo')) then
                begin
                  fraSelecaoAleatoriaProduto.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriaProduto.qrySelecaoAleatoria.FieldByName('codigo').asString;
                  fraSelecaoAleatoriaProduto.ConsultaSelecaoAleatoria.edfCodigo.exist;
                  if not fraSelecaoAleatoriaProduto.ConsultaSelecaoAleatoria.qryProcuraProdutos.IsEmpty then
                    AtribuirDadosProduto(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaProduto.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaProduto.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;

end;

procedure TfraSelecaoAleatoriaprodutos.fraSelecaoAleatoriaprodutosbnProcuraClick(
  Sender: TObject);
begin
  AcionarPesquisaGrade;

end;

procedure TfraSelecaoAleatoriaprodutos.fraSelecaoAleatoriaProdutoqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriaProduto do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'Produto';
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

procedure TfraSelecaoAleatoriaprodutos.fraSelecaoAleatoriaProdutoqrySelecaoAleatoriaNewRecord(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriaProduto do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure TfraSelecaoAleatoriaprodutos.AtribuirDadosproduto(found: Boolean);
begin
  with fraSelecaoAleatoriaProduto do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraProdutos.fieldbyname('caracteristicavisual').AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraProdutos.fieldbyname('descricao').AsString;

    if qrySelecaoAleatoria.FieldByName('campo').asString = '' then
      qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';

    if qrySelecaoAleatoria.FieldByName('opcomparacao').asString = '' then
      qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';

    if qrySelecaoAleatoria.FieldByName('oplogico').asString = '' then
      qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';

    qrySelecaoAleatoria.Post;

  end;
end;

function TfraSelecaoAleatoriaprodutos.GetListaCondicional: String;
begin
  result := trocar(fraSelecaoAleatoriaProduto.ListaCondicional, 'codigo', 'c.codigovisual');
  result := trocar(result, 'descricao','c.descricao');
end;

procedure TfraSelecaoAleatoriaprodutos.fraSelecaoAleatoriaProdutosbnIncluirItemClick(
  Sender: TObject);
begin
  fraSelecaoAleatoriaProduto.sbnIncluirItemClick(Sender);

end;

end.
