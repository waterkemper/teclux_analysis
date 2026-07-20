unit frselecaoaleatoriagruposusuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, classes, Graphics, Controls, Forms, 
  Dialogs, frselecaoaleatoria, db, frConsulta, frConsultaCodigo, cpdbfindcontrols, ctconstantes, biblio;

type
  TfraSelecaoaleatoriagruposusuarios = class(TFrame)
    fraSelecaoAleatoriagruposusuarios: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriagruposusuariosdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriagruposusuariosdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoaleatoriagruposusuariosbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriagruposusuariosqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriagruposusuariosqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
  private
    { Private declarations }
    procedure AcionarPesquisaGrade;
    procedure AtribuirDadosgruposusuarios(Found: Boolean);
    function GetListaCondicional: String;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ListaCondicional: String read GetListaCondicional;


  end;

implementation

{$R *.dfm}

{ TfraSelecaoaleatoriagruposusuarios }

procedure TfraSelecaoaleatoriagruposusuarios.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriagruposusuarios do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Grupos de Usuarios');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

constructor TfraSelecaoaleatoriagruposusuarios.Create(AOwner: TComponent);
begin
  inherited;


  fraSelecaoAleatoriagruposusuarios.qrySelecaoAleatoria.Sql.Text :=
//     'SELECT  Codigo, descricao FROM produtos WHERE false';
     'SELECT  cast(null as char(18)) as Codigo, '+
            ' cast(null as char(1)) as tipo, '+
            ' cast(null as varchar(50)) as descricao, '+
            ' cast(null as varchar(11)) as campo, '+
            ' cast(null as varchar(20)) as opcomparacao, '+
            ' cast(null as varchar(2)) as oplogico ';




  fraSelecaoAleatoriagruposusuarios.CampoParaLista := 'codigo';


  with fraSelecaoAleatoriagruposusuarios do
  begin

    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldInterno := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldVisual := 'codigo';

    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuragruposusuarios;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldinterno := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldVisual := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;

    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesgruposusuarios;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosgruposusuarios;
    fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;

  end;
  fraSelecaoAleatoriagruposusuarios.UtilizarCamparacaoeLogica := true;
  
end;

procedure TfraSelecaoaleatoriagruposusuarios.fraSelecaoAleatoriagruposusuariosdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  if (fraSelecaoAleatoriagruposusuarios.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriagruposusuarios.qrySelecaoAleatoria.FieldByName('codigo')) then
    acionarPesquisaGrade;

end;

procedure TfraSelecaoaleatoriagruposusuarios.fraSelecaoAleatoriagruposusuariosdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     if (fraSelecaoAleatoriagruposusuarios.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriagruposusuarios.qrySelecaoAleatoria.FieldByName('codigo')) then
                     begin
                       fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriagruposusuarios.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriagruposusuarios.qrySelecaoAleatoria.FieldByName('codigo')) then
                begin

                  fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriagruposusuarios.qrySelecaoAleatoria.FieldByName('codigo').asString;
                  fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.edfCodigo.modified := True;
                  fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.qryProcuragruposusuarios.close;
                  fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.qryProcuragruposusuarios.ParamByName('codigo').AsString :=
                    fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.edfCodigo.text;
                  fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.qryProcuragruposusuarios.open;

                  fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.edfCodigo.exist;
                  if not fraSelecaoAleatoriagruposusuarios.ConsultaSelecaoAleatoria.qryProcuragruposusuarios.IsEmpty then
                    AtribuirDadosgruposusuarios(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriagruposusuarios.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriagruposusuarios.dbgSelecaoAleatoria.SetFocus;
                  end;


                end;
  end;

end;

procedure TfraSelecaoaleatoriagruposusuarios.fraSelecaoaleatoriagruposusuariosbnProcuraClick(
  Sender: TObject);
begin
  AcionarPesquisaGrade;

end;

procedure TfraSelecaoaleatoriagruposusuarios.fraSelecaoAleatoriagruposusuariosqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriagruposusuarios do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'Grupo';
//    qrySelecaoAleatoria.FieldByName('codigo').SetFieldType(ftLargeInt);
    qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('descricao').DisplayLabel := 'Nome';
    qrySelecaoAleatoria.FieldByName('descricao').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('opcomparacao').DisplayLabel := 'Comparação';
    qrySelecaoAleatoria.FieldByName('opcomparacao').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('oplogico').DisplayLabel := 'Lógica';
    qrySelecaoAleatoria.FieldByName('oplogico').ReadOnly := false;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;
  end;

end;

procedure TfraSelecaoaleatoriagruposusuarios.fraSelecaoAleatoriagruposusuariosqrySelecaoAleatoriaNewRecord(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriagruposusuarios do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure TfraSelecaoaleatoriagruposusuarios.AtribuirDadosgruposusuarios(Found: Boolean);
begin
  with fraSelecaoAleatoriagruposusuarios do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuragruposusuarioscodigo.AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuragruposusuariosnome.AsString;

    if qrySelecaoAleatoria.FieldByName('campo').asString = '' then
      qrySelecaoAleatoria.FieldByName('campo').asString := 'codigo';

    if qrySelecaoAleatoria.FieldByName('opcomparacao').asString = '' then
      qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';

    if qrySelecaoAleatoria.FieldByName('oplogico').asString = '' then
      qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';

    qrySelecaoAleatoria.Post;

  end;
end;

function TfraSelecaoaleatoriagruposusuarios.GetListaCondicional: String;
begin
  result := trocar(fraSelecaoAleatoriagruposusuarios.ListaCondicional, 'codigo', 'gu.codigo');
  result := trocar(result, 'descricao','gu.nome');
end;

end.
