unit frestoquesfiliais;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DB, Windows,
  cpdatasource, Grids, DBGrids, cpdbgrid,dmbasico,frconsultacodigo,cpquery,
  cpdbfindcontrols, ctconstantes;

type
  TfraEstoquesFiliais = class(TFrame)
    dbgEstoquesFiliais: TtecDBGrid;
    dsrEstoquesFiliais: TtecDataSource;
    procedure dbgEstoquesFiliaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsrEstoquesFiliaisStateChange(Sender: TObject);
    procedure dsrEstoquesFiliaisUpdateData(Sender: TObject);
  private
    FListaFiliaisSelecionadas: String;
    { Private declarations }
  protected
    dmbasico : TdtmBasico;
    consulta : TfraConsultaCodigo;
    procedure AcionaPesquisaGrade;
    procedure AtualizarLista;
    procedure ApagarRegistro;
    procedure Condicoes;
    procedure AtribuirDadosFiliais(Found: Boolean);
    property ListaFiliaisSelecionadas: String read FListaFiliaisSelecionadas write FListaFiliaisSelecionadas;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses frconsulta;

{$R *.dfm}

{ TfraEstoquesFiliais }

procedure TfraEstoquesFiliais.AcionaPesquisaGrade;
begin
  Consulta.CtrlOn := True;
  dbgEstoquesFiliais.SetFocus;
  case Consulta.InternoPesquisar(ctFILIAIS) of
    mrOk   : begin
               dbgEstoquesFiliais.SelectedIndex :=  1;
               dbgEstoquesFiliais.SetFocus;
             end;
    mrCancel:begin
               dbgEstoquesFiliais.SelectedIndex :=  0;
               dbgEstoquesFiliais.SetFocus;
             end;
  end
end;

procedure TfraEstoquesFiliais.AtualizarLista;
var
  Pos: TBookmark;
begin
  Pos := dsrEstoquesFiliais.DataSet.GetBookmark;
  dsrEstoquesFiliais.DataSet.DisableControls;
  try
    ListaFiliaisSelecionadas := '';
    dsrEstoquesFiliais.DataSet.First;
    while Not dsrEstoquesFiliais.DataSet.Eof do
    begin
      if dsrEstoquesFiliais.DataSet.FieldByName('filialestoque').AsString<>'' then
        ListaFiliaisSelecionadas := ListaFiliaisSelecionadas +
                                   quotedstr(dsrEstoquesFiliais.DataSet.FieldByName('filialestoque').AsString) + ',';
      dsrEstoquesFiliais.DataSet.Next;
    end;

    if ListaFiliaisSelecionadas <> '' then
      ListaFiliaisSelecionadas := copy(ListaFiliaisSelecionadas,0, Length(ListaFiliaisSelecionadas)-1);

  finally
    dsrEstoquesFiliais.DataSet.GotoBookmark(Pos);
    dsrEstoquesFiliais.DataSet.FreeBookmark(Pos);
    dsrEstoquesFiliais.DataSet.EnableControls;
  end
end;

procedure TfraEstoquesFiliais.Condicoes;
const
  SQL = 'and (f.codigo not in (%s) or f.codigo = %s)';
begin
  if ListaFiliaisSelecionadas<>'' then
  begin
    if dsrEstoquesFiliais.DataSet.State = dsinsert then
    begin
      consulta.qryProcuraFiliais.MacroByName('SQL').AsString :=
      format(SQL,[ListaFiliaisSelecionadas, quotedstr('0')]);
      consulta.qryConsultaFiliais.MacroByName('SQL').AsString :=
      format(SQL,[ListaFiliaisSelecionadas, quotedstr('0')]);
    end
    else
    begin
      consulta.qryProcuraFiliais.MacroByName('SQL').AsString :=
      format(SQL,[ListaFiliaisSelecionadas,
                  quotedstr(dsrEstoquesFiliais.dataset.fieldbyname('filialestoque').asstring)]);

      consulta.qryConsultaFiliais.MacroByName('SQL').AsString :=
      format(SQL,[ListaFiliaisSelecionadas,
                  quotedstr(dsrEstoquesFiliais.dataset.fieldbyname('filialestoque').asstring)]);
    end;
  end
  else
  begin
    consulta.qryProcuraFiliais.MacroByName('SQL').AsString := '';
    consulta.qryConsultaFiliais.MacroByName('SQL').AsString := '';
  end;
end;

constructor TfraEstoquesFiliais.Create(AOwner: TComponent);
begin
  inherited;
  dmbasico := TdtmBasico.Create(self);
  consulta := TfraConsultaCodigo.Create(self);
  consulta.Name := 'consultaEstoquesFiliais';
  Consulta.edfCodigo.MaxLength := 2;
  consulta.edfCodigo.DataSource := dsrEstoquesFiliais;
  consulta.edfCodigo.DataField := 'filialestoque';
  consulta.edfCodigo.Operacao := opATRIBUICAO;
  Consulta.edfCodigo.LookupSource := Consulta.dsrProcuraFiliais;
  Consulta.edfCodigo.LookupField := 'codigo';
  Consulta.edfCodigo.LookupQueryParameter := 'codigo';
  consulta.OnFound := AtribuirDadosFiliais;
  consulta.AbrirTabelaProcura := false;
  consulta.CondicoesdaConsulta := Condicoes;
  Consulta.TipoPesquisa := pesFILIAIS;
  dbgEstoquesFiliais.OnDelete := ApagarRegistro;

end;

procedure TfraEstoquesFiliais.dbgEstoquesFiliaisKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9 : begin
                 Consulta.CtrlOn := Shift = [ssCtrl];
                 if (Shift = []) or Consulta.CtrlOn then
                   AcionaPesquisaGrade
               end;
    end;
  end
  else
  begin
    case key of
      VK_Return :
      begin
        case dbgEstoquesFiliais.SelectedIndex of
        0 : begin
              if Consulta.edfCodigo.Exist then
              begin
                dsrEstoquesFiliais.DataSet.FieldByName('nome').AsString :=
                  consulta.qryProcuraFiliais.FieldByName('nome').AsString;
                dbgEstoquesFiliais.SetFocus;
              end
              else
              begin
                dsrEstoquesFiliais.DataSet.FieldByName('filialestoque').Clear;
                dsrEstoquesFiliais.DataSet.FieldByName('nome').Clear;
                dbgEstoquesFiliais.SelectedIndex := 0;
                dbgEstoquesFiliais.SetFocus;
              end;
            end;
        end;
      end;
    end;
  end;
end;

procedure TfraEstoquesFiliais.dsrEstoquesFiliaisStateChange(
  Sender: TObject);
begin
  if dsrEstoquesFiliais.DataSet.Active then
    if not (dsrEstoquesFiliais.DataSet.State in [dsedit, dsinsert]) then
      AtualizarLista;
end;

procedure TfraEstoquesFiliais.dsrEstoquesFiliaisUpdateData(
  Sender: TObject);
begin
//    AtualizarLista;
end;

procedure TfraEstoquesFiliais.AtribuirDadosFiliais(Found: Boolean);
begin
  dsrEstoquesFiliais.DataSet.FieldByName('nome').AsString :=
    consulta.qryProcuraFiliais.FieldByName('nome').AsString;
end;

procedure TfraEstoquesFiliais.ApagarRegistro;
begin
  dsrEstoquesFiliais.DataSet.Delete;
  AtualizarLista;
end;

end.
