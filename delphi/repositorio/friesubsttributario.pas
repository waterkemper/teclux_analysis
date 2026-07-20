unit friesubsttributario;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DB, Windows, 
  cpdatasource, Grids, DBGrids, cpdbgrid,dmbasico,frconsultacodigo,cpquery,
  cpdbfindcontrols, ctconstantes;

type
  TfraIESubstTributario = class(TFrame)
    dbgIESubstTributario: TtecDBGrid;
    dsrIESubstTributario: TtecDataSource;
    procedure dbgIESubstTributarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsrIESubstTributarioStateChange(Sender: TObject);
    procedure dsrIESubstTributarioDataChange(Sender: TObject;
      Field: TField);
    procedure dsrIESubstTributarioUpdateData(Sender: TObject);
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

{ TfraIESubstTributario }

procedure TfraIESubstTributario.AcionaPesquisaGrade;
begin
  Consulta.CtrlOn := True;
  dbgIESubstTributario.SetFocus;
  case Consulta.InternoPesquisar(ctESTADO) of
    mrOk   : begin
               dbgIESubstTributario.SelectedIndex :=  1;
               dbgIESubstTributario.SetFocus;
             end;
    mrCancel:begin
               dbgIESubstTributario.SelectedIndex :=  0;
               dbgIESubstTributario.SetFocus;
             end;
  end
end;

procedure TfraIESubstTributario.AtualizarListaEstado;
var
  Pos: TBookmark;
begin
  Pos := dsrIESubstTributario.DataSet.GetBookmark;
  dsrIESubstTributario.DataSet.DisableControls;
  try
    ListaEstadoSelecionados := '';
    dsrIESubstTributario.DataSet.First;
    while Not dsrIESubstTributario.DataSet.Eof do
    begin
      if dsrIESubstTributario.DataSet.FieldByName('estado').AsString<>'' then
        ListaEstadoSelecionados := ListaEstadoSelecionados +
                                   quotedstr(dsrIESubstTributario.DataSet.FieldByName('estado').AsString) + ',';
      dsrIESubstTributario.DataSet.Next;
    end;

    if ListaEstadoSelecionados <> '' then
      ListaEstadoSelecionados := copy(ListaEstadoSelecionados,0, Length(ListaEstadoSelecionados)-1);

  finally
    dsrIESubstTributario.DataSet.GotoBookmark(Pos);
    dsrIESubstTributario.DataSet.FreeBookmark(Pos);
    dsrIESubstTributario.DataSet.EnableControls;
  end
end;

procedure TfraIESubstTributario.CondicoesEstados;
const
  SQL = 'and (codigo not in (%s) or codigo = %s)';
begin
  if ListaEstadoSelecionados<>'' then
  begin
    if dsrIESubstTributario.DataSet.State = dsinsert then
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
                  quotedstr(dsrIESubstTributario.dataset.fieldbyname('estado').asstring)]);
      consulta.qryConsultaEstados.MacroByName('SQL').AsString :=
      format(SQL,[ListaEstadoSelecionados,
                  quotedstr(dsrIESubstTributario.dataset.fieldbyname('estado').asstring)]);
    end;
  end
  else
  begin
    consulta.qryProcuraEstados.MacroByName('SQL').AsString := '';
    consulta.qryConsultaEstados.MacroByName('SQL').AsString := '';
  end;
end;

constructor TfraIESubstTributario.Create(AOwner: TComponent);
begin
  inherited;
  dmbasico := TdtmBasico.Create(self);
  consulta := TfraConsultaCodigo.Create(self);
  consulta.Name := 'consultaiesubsttributario';
  Consulta.edfCodigo.MaxLength := 2;
  consulta.edfCodigo.DataSource := dsrIESubstTributario;
  consulta.edfCodigo.DataField := 'estado';
  consulta.edfCodigo.Operacao := opATRIBUICAO;
  Consulta.edfCodigo.LookupSource := Consulta.dsrProcuraEstados;
  Consulta.edfCodigo.LookupField := 'codigo';
  Consulta.edfCodigo.LookupQueryParameter := 'codigo';
  consulta.AbrirTabelaProcura := false;
  consulta.CondicoesdaConsulta := CondicoesEstados;
  Consulta.TipoPesquisa := pesESTADOS;

end;

procedure TfraIESubstTributario.dbgIESubstTributarioKeyDown(
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
        case dbgIESubstTributario.SelectedIndex of
        0,1 : begin
              if Consulta.edfCodigo.Exist then
              begin
                dbgIESubstTributario.SelectedIndex := 1;
                dbgIESubstTributario.SetFocus;
              end
              else
              begin
                dsrIESubstTributario.DataSet.FieldByName('estado').Clear;
                dbgIESubstTributario.SelectedIndex := 0;
                dbgIESubstTributario.SetFocus;
              end;
            end;
        end;
      end;
    end;
  end;
end;

procedure TfraIESubstTributario.dsrIESubstTributarioStateChange(
  Sender: TObject);
begin
  if dsrIESubstTributario.DataSet.Active then
    if not (dsrIESubstTributario.DataSet.State in [dsedit, dsinsert]) then
      AtualizarListaEstado;
end;

procedure TfraIESubstTributario.dsrIESubstTributarioDataChange(
  Sender: TObject; Field: TField);
begin
//  AtualizarListaEstado;
end;

procedure TfraIESubstTributario.dsrIESubstTributarioUpdateData(
  Sender: TObject);
begin
//    AtualizarListaEstado;
end;

end.
