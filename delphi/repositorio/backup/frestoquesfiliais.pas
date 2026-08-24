unit frEstoquesFiliais;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DB,
  cpdatasource, Grids, DBGrids, cpdbgrid,dmbasico,frconsultacodigo,cpquery,
  cpdbfindcontrols, ctconstantes,qt;

type
  TfraEstoquesFiliais = class(TFrame)
    dbgEstoquesFiliais: TtecDBGrid;
    dsrEstoquesFiliais: TtecDataSource;
    procedure dbgEstoquesFiliaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsrEstoquesFiliaisStateChange(Sender: TObject);
    procedure dsrEstoquesFiliaisDataChange(Sender: TObject;
      Field: TField);
    procedure dsrEstoquesFiliaisUpdateData(Sender: TObject);
  private
    FListaEstadosSelecionados: String;
    { Private declarations }
  protected
    dmbasico : TdtmBasico;
    consulta : TfraConsultaCodigo;
    TabelaIE:  TtecQuery;
    procedure AcionaPesquisaGrade;
    procedure AtualizarListaEstado;
    procedure CondicoesEstados;
    property ListaEstadoSelecionados: String read FListaEstadosSelecionados write FListaEstadosSelecionados;
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
  case Consulta.InternoPesquisar(ctESTADO) of
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

procedure TfraEstoquesFiliais.AtualizarListaEstado;
var
  Pos: TBookmark;
begin
  Pos := dsrEstoquesFiliais.DataSet.GetBookmark;
  dsrEstoquesFiliais.DataSet.DisableControls;
  try
    ListaEstadoSelecionados := '';
    dsrEstoquesFiliais.DataSet.First;
    while Not dsrEstoquesFiliais.DataSet.Eof do
    begin
      if dsrEstoquesFiliais.DataSet.FieldByName('estado').AsString<>'' then
        ListaEstadoSelecionados := ListaEstadoSelecionados +
                                   quotedstr(dsrEstoquesFiliais.DataSet.FieldByName('estado').AsString) + ',';
      dsrEstoquesFiliais.DataSet.Next;
    end;

    if ListaEstadoSelecionados <> '' then
      ListaEstadoSelecionados := copy(ListaEstadoSelecionados,0, Length(ListaEstadoSelecionados)-1);

  finally
    dsrEstoquesFiliais.DataSet.GotoBookmark(Pos);
    dsrEstoquesFiliais.DataSet.FreeBookmark(Pos);
    dsrEstoquesFiliais.DataSet.EnableControls;
  end
end;

procedure TfraEstoquesFiliais.CondicoesEstados;
const
  SQL = 'and (codigo not in (%s) or codigo = %s)';
begin
  if ListaEstadoSelecionados<>'' then
  begin
    if dsrEstoquesFiliais.DataSet.State = dsinsert then
    begin
      consulta.qryProcuraEstados.MacroByName('SQL').AsString :=
      format(SQL,[ListaEstadoSelecionados, quotedstr('0')]);
      consulta.qryConsultaEstados.MacroByName('SQL').AsString :=
      format(SQL,[ListaEstadoSelecionados, quotedstr('0')]);
    end
    else
    begin
      consulta.qryProcuraEstados.MacroByName('SQL').AsString :=
      format(SQL,[ListaEstadoSelecionados,
                  quotedstr(dsrEstoquesFiliais.dataset.fieldbyname('estado').asstring)]);
      consulta.qryConsultaEstados.MacroByName('SQL').AsString :=
      format(SQL,[ListaEstadoSelecionados,
                  quotedstr(dsrEstoquesFiliais.dataset.fieldbyname('estado').asstring)]);
    end;
  end
  else
  begin
    consulta.qryProcuraEstados.MacroByName('SQL').AsString := '';
    consulta.qryConsultaEstados.MacroByName('SQL').AsString := '';
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
  consulta.edfCodigo.DataField := 'estado';
  consulta.edfCodigo.Operacao := opATRIBUICAO;
  Consulta.edfCodigo.LookupSource := Consulta.dsrProcuraEstados;
  Consulta.edfCodigo.LookupField := 'codigo';
  Consulta.edfCodigo.LookupQueryParameter := 'codigo';
  consulta.AbrirTabelaProcura := false;
  consulta.CondicoesdaConsulta := CondicoesEstados;
  Consulta.TipoPesquisa := pesESTADOS;

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
      VK_Return,
      VK_Return :
      begin
        case dbgEstoquesFiliais.SelectedIndex of
        0,1 : begin
              if Consulta.edfCodigo.Exist then
              begin
                dbgEstoquesFiliais.SelectedIndex := 1;
                dbgEstoquesFiliais.SetFocus;
              end
              else
              begin
                dsrEstoquesFiliais.DataSet.FieldByName('estado').Clear;
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
      AtualizarListaEstado;
end;

procedure TfraEstoquesFiliais.dsrEstoquesFiliaisDataChange(
  Sender: TObject; Field: TField);
begin
//  AtualizarListaEstado;
end;

procedure TfraEstoquesFiliais.dsrEstoquesFiliaisUpdateData(
  Sender: TObject);
begin
//    AtualizarListaEstado;
end;

end.
