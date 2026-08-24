unit frselecaoaleatoriacontasbancarias;

interface

uses
  Windows, Messages, SysUtils, Variants, classes, Graphics, Controls, Forms, 
  Dialogs, frselecaoaleatoria, db, frConsulta, frConsultaCodigo, cpdbfindcontrols, ctconstantes, biblio;

type
  TfraSelecaoaleatoriacontasbancarias = class(TFrame)
    fraSelecaoAleatoriacontasbancarias: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriacontasbancariasdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriacontasbancariasdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoaleatoriacontasbancariasbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriacontasbancariasqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriacontasbancariasqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
  private
    { Private declarations }
    procedure AcionarPesquisaGrade;
    procedure AtribuirDadoscontasbancarias(Found: Boolean);
    function GetListaCondicional: String;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ListaCondicional: String read GetListaCondicional;


  end;

implementation

{$R *.dfm}

{ TfraSelecaoaleatoriacontasbancarias }

procedure TfraSelecaoaleatoriacontasbancarias.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriacontasbancarias do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Contas');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

constructor TfraSelecaoaleatoriacontasbancarias.Create(AOwner: TComponent);
begin
  inherited;


  fraSelecaoAleatoriacontasbancarias.qrySelecaoAleatoria.Sql.Text :=
//     'SELECT  Codigo, descricao FROM produtos WHERE false';
     'SELECT  cast(null as char(18)) as conta, '+
            ' cast(null as char(3)) as nrbanco, '+
            ' cast(null as char(50)) as banco, '+
            ' cast(null as char(30)) as agencia, '+
            ' cast(null as varchar(50)) as titular, '+
            ' cast(null as varchar(11)) as campo, '+
            ' cast(null as varchar(20)) as opcomparacao, '+
            ' cast(null as varchar(2)) as oplogico ';

  fraSelecaoAleatoriacontasbancarias.CampoParaLista := 'conta';
  with fraSelecaoAleatoriacontasbancarias do
  begin

    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'conta';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldInterno := 'conta';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldVisual := 'conta';

    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraContas;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'conta';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'conta';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldinterno := 'conta';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldVisual := 'conta';
    ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;

    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesCONTAS;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadoscontasbancarias;
    fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;

  end;
  fraSelecaoAleatoriacontasbancarias.UtilizarCamparacaoeLogica := true;
end;

procedure TfraSelecaoaleatoriacontasbancarias.fraSelecaoAleatoriacontasbancariasdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  if (fraSelecaoAleatoriacontasbancarias.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriacontasbancarias.qrySelecaoAleatoria.FieldByName('conta')) then
    acionarPesquisaGrade;

end;

procedure TfraSelecaoaleatoriacontasbancarias.fraSelecaoAleatoriacontasbancariasdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     if (fraSelecaoAleatoriacontasbancarias.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriacontasbancarias.qrySelecaoAleatoria.FieldByName('conta')) then
                     begin
                       fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;    
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriacontasbancarias.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriacontasbancarias.qrySelecaoAleatoria.FieldByName('conta')) then
                begin
                  fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriacontasbancarias.qrySelecaoAleatoria.FieldByName('conta').asString;
                  fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.edfCodigo.modified := true;
                  fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.qryProcuraContas.close;
                  fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.qryProcuraContas.parambyname('conta').asString := fraSelecaoAleatoriacontasbancarias.qrySelecaoAleatoria.FieldByName('conta').asString;
                  fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.qryProcuraContas.open;
                  fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.edfCodigo.exist;

                  if not fraSelecaoAleatoriacontasbancarias.ConsultaSelecaoAleatoria.qryProcuracontas.IsEmpty then
                    AtribuirDadoscontasbancarias(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriacontasbancarias.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriacontasbancarias.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;

end;

procedure TfraSelecaoaleatoriacontasbancarias.fraSelecaoaleatoriacontasbancariasbnProcuraClick(
  Sender: TObject);
begin
  AcionarPesquisaGrade;

end;

procedure TfraSelecaoaleatoriacontasbancarias.fraSelecaoAleatoriacontasbancariasqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriacontasbancarias do
  begin
    qrySelecaoAleatoria.FieldByName('conta').DisplayLabel := 'Conta';
    qrySelecaoAleatoria.FieldByName('conta').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('nrbanco').DisplayLabel := 'Nr.';
    qrySelecaoAleatoria.FieldByName('banco').DisplayLabel := 'Banco';
    qrySelecaoAleatoria.FieldByName('agencia').DisplayLabel := 'Agência';
    qrySelecaoAleatoria.FieldByName('titular').DisplayLabel := 'Titular';

    qrySelecaoAleatoria.FieldByName('opcomparacao').DisplayLabel := 'Comparação';
    qrySelecaoAleatoria.FieldByName('opcomparacao').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('oplogico').DisplayLabel := 'Lógica';
    qrySelecaoAleatoria.FieldByName('oplogico').ReadOnly := false;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;
  end;

end;

procedure TfraSelecaoaleatoriacontasbancarias.fraSelecaoAleatoriacontasbancariasqrySelecaoAleatoriaNewRecord(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriacontasbancarias do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'conta';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure TfraSelecaoaleatoriacontasbancarias.AtribuirDadoscontasbancarias(Found: Boolean);
begin
  with fraSelecaoAleatoriacontasbancarias do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('conta').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraContas.fieldbyname('conta').AsString;

    qrySelecaoAleatoria.FieldByName('nrbanco').AsString :=
        ConsultaSelecaoAleatoria.qryProcuracontas.fieldbyname('nrbanco').AsString;

    qrySelecaoAleatoria.FieldByName('banco').AsString :=
        ConsultaSelecaoAleatoria.qryProcuracontas.fieldbyname('banco').AsString;

    qrySelecaoAleatoria.FieldByName('agencia').AsString :=
        ConsultaSelecaoAleatoria.qryProcuracontas.fieldbyname('agencia').AsString;

    qrySelecaoAleatoria.FieldByName('titular').AsString :=
        ConsultaSelecaoAleatoria.qryProcuracontas.fieldbyname('titular').AsString;


    if qrySelecaoAleatoria.FieldByName('campo').asString = '' then
      qrySelecaoAleatoria.FieldByName('campo').asString := 'conta';

    if qrySelecaoAleatoria.FieldByName('opcomparacao').asString = '' then
      qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';

    if qrySelecaoAleatoria.FieldByName('oplogico').asString = '' then
      qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';

    qrySelecaoAleatoria.Post;


  end;
end;

function TfraSelecaoaleatoriacontasbancarias.GetListaCondicional: String;
begin
  result := trocar(fraSelecaoAleatoriacontasbancarias.ListaCondicional, 'conta', 'ct.conta');
end;

end.
