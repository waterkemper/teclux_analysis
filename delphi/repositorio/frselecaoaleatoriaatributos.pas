unit frselecaoaleatoriaatributos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ComCtrls, 
  Dialogs, frselecaoaleatoria, db, frConsulta, frConsultaCodigo, cpdbfindcontrols,
  ctconstantes, biblio;

type
  TfraSelecaoAleatoriaatributos = class(TFrame)
    fraSelecaoAleatoriaatributos: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriaatributosdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaatributosdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaatributosbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaatributosqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaatributosqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaatributosbnIncluirItemClick(
      Sender: TObject);
  private
    { Private declarations }
    procedure AcionarPesquisaGrade;
    procedure AtribuirDadosatributos(Found: Boolean);
    function GetListaCondicional: String;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ListaCondicional: String read GetListaCondicional;


  end;

implementation

{$R *.dfm}

{ TfraSelecaoAleatoriaatributos }

procedure TfraSelecaoAleatoriaatributos.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriaatributos do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('atributos de Produtos');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

constructor TfraSelecaoAleatoriaatributos.Create(AOwner: TComponent);
begin
  inherited;
//  if ((owner is TTabSheet) and  TTabSheet(owner).tabvisible) or not (owner is TTabSheet) then
  begin
    fraSelecaoAleatoriaatributos.qrySelecaoAleatoria.Sql.Text :=
  //     'SELECT  Codigo, descricao FROM atributos WHERE false';
       'SELECT  cast(null as varchar(100)) as atributo, '+
              ' cast(null as varchar(200)) as valor, '+
              ' cast(null as varchar(11)) as campo, '+
              ' cast(null as varchar(20)) as opcomparacao, '+
              ' cast(null as varchar(2)) as oplogico ';


    fraSelecaoAleatoriaatributos.CampoParaLista := 'p.atributos_valores';
    fraSelecaoAleatoriaatributos.CampoParaLista2 := 'atributo';
    fraSelecaoAleatoriaatributos.CampoParaLista3 := 'valor';



    with fraSelecaoAleatoriaatributos do
    begin
      ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
      ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaatributo';
      ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 100;
      ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
      ConsultaSelecaoAleatoria.edfCodigo.DataField := 'atributo';
//      ConsultaSelecaoAleatoria.edfCodigo.DataaFieldInterno := 'atributo';
//      ConsultaSelecaoAleatoria.edfCodigo.DataaFieldVisual := 'atributo';

      ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
      ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraItemAtributoValor;
      ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'atributo';
      ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'atributo';
//      ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldinterno := 'atributo';
//      ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldVisual := 'atributo';
      ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;

      ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
  //    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
      ConsultaSelecaoAleatoria.TipoPesquisa := pesItemAtributoValor;
      ConsultaSelecaoAleatoria.OnFound := AtribuirDadosatributos;
      fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;

      ConsultaSelecaoAleatoria.AbrirPesquisaQuandoReadOnly := true;

    end;

    fraSelecaoAleatoriaatributos.UtilizarCamparacaoeLogica := true;

  end;
end;

procedure TfraSelecaoAleatoriaatributos.fraSelecaoAleatoriaatributosdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  if (fraSelecaoAleatoriaatributos.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaatributos.qrySelecaoAleatoria.FieldByName('atributo')) or
     (fraSelecaoAleatoriaatributos.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaatributos.qrySelecaoAleatoria.FieldByName('valor')) then

    acionarPesquisaGrade;

end;

procedure TfraSelecaoAleatoriaatributos.fraSelecaoAleatoriaatributosdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     if (fraSelecaoAleatoriaatributos.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaatributos.qrySelecaoAleatoria.FieldByName('atributo')) or
                        (fraSelecaoAleatoriaatributos.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaatributos.qrySelecaoAleatoria.FieldByName('valor')) then
                     begin
                       fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriaatributos.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaatributos.qrySelecaoAleatoria.FieldByName('nrlote')) then
                begin
                {
                  fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.qryProcuraatributosProdutos.close;
                  fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.qryProcuraatributosProdutos.parambyname('produto').value := null;
                  fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriaatributos.qrySelecaoAleatoria.FieldByName('nrlote').asString;
                  fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.edfCodigo.modified := true;
                  fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.edfCodigo.exist;
                  if (fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.qryProcuraatributosProdutos.recordcount = 1) then
                    AtribuirDadosatributos
                  else
                  if (fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.qryProcuraatributosProdutos.recordcount > 1) then
                  begin
                     fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.qryConsultaatributosProdutos.Macrobyname('SQLCondicao').asString :=
                        ' and l.nrlote = '+quotedstr(fraSelecaoAleatoriaatributos.ConsultaSelecaoAleatoria.edfCodigo.text);
                    AcionarPesquisaGrade;
                  end
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaatributos.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaatributos.dbgSelecaoAleatoria.SetFocus;
                  end;
                }
                end;
  end;

end;

procedure TfraSelecaoAleatoriaatributos.fraSelecaoAleatoriaatributosbnProcuraClick(
  Sender: TObject);
begin
  AcionarPesquisaGrade;

end;

procedure TfraSelecaoAleatoriaatributos.fraSelecaoAleatoriaatributosqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriaatributos do
  begin

    qrySelecaoAleatoria.FieldByName('atributo').DisplayLabel := 'Atributo';
    qrySelecaoAleatoria.FieldByName('atributo').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('valor').DisplayLabel := 'Valor';
    qrySelecaoAleatoria.FieldByName('valor').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('oplogico').DisplayLabel := 'Lógica';
    qrySelecaoAleatoria.FieldByName('oplogico').ReadOnly := false;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;
  end;

end;

procedure TfraSelecaoAleatoriaatributos.fraSelecaoAleatoriaatributosqrySelecaoAleatoriaNewRecord(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriaatributos do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'nrlote';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure TfraSelecaoAleatoriaatributos.AtribuirDadosatributos(Found: Boolean);
begin
  with fraSelecaoAleatoriaatributos do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('atributo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraItemAtributoValoratributo.AsString;

    qrySelecaoAleatoria.FieldByName('valor').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraItemAtributoValorvalor.AsString;


{
    if qrySelecaoAleatoria.FieldByName('campo').asString = '' then
      qrySelecaoAleatoria.FieldByName('campo').asString := 'nrlote';

    if qrySelecaoAleatoria.FieldByName('opcomparacao').asString = '' then
      qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
}

    if qrySelecaoAleatoria.FieldByName('oplogico').asString = '' then
      qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';

    qrySelecaoAleatoria.Post;

  end;
end;

function TfraSelecaoAleatoriaatributos.GetListaCondicional: String;
begin

  result := fraSelecaoAleatoriaatributos.ListaCondicionaljson;
end;

procedure TfraSelecaoAleatoriaatributos.fraSelecaoAleatoriaatributosbnIncluirItemClick(
  Sender: TObject);
begin
  fraSelecaoAleatoriaatributos.sbnIncluirItemClick(Sender);

end;

end.
