unit fmOperacoesPorcelana;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls, Grids,
  DBGrids, cpdbgrid, StdCtrls, frconsulta, frconsultacodigo, ctconstantes;

type
  TfrmOperacoesPorcelana = class(TFrmCadastroPadrao)
    dbgOperacoes: TtecDBGrid;
    gbxOperador: TGroupBox;
    fraConsultaOperador: TfraConsultaCodigo;
    dbgOperacoesOSPUsuarios: TtecDBGrid;
    ckbMarcarTodos: TCheckBox;
    gbxOSPsQueimadas: TGroupBox;
    procedure ckbMarcarTodosClick(Sender: TObject);
    procedure fraConsultaOperadoredfCodigoChange(Sender: TObject);
  private
    { Private declarations }
    procedure CondicoesOperadores;
    procedure OperacoesAfterScroll(Sender: TObject);

  protected
    procedure AlterarEstadoBotoes; override;
    function  InternoGravar    : Boolean;    override;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmOperacoesPorcelana: TfrmOperacoesPorcelana;

implementation

uses dmOperacoesPorcelana, dmbasico;

{$R *.dfm}

{ TfrmOperacoesPorcelana }

procedure TfrmOperacoesPorcelana.AlterarEstadoBotoes;
begin
  inherited;
  if dtmOperacoesPorcelana.ExisteondicaoParaGravar(fraConsultaOperador.edfCodigo.Text) then
    sbnSalvar.Enabled := true
  else
    sbnSalvar.Enabled := false;

end;

procedure TfrmOperacoesPorcelana.CondicoesOperadores;
const
  SQLOperacao = ' and codigo in (select uit.Usuario '+
                               ' from Usuariosinstrucoestrabalho uit '+
                               '      join instrucoestrabalho it '+
                               '      on uit.instrucaotrabalho = it.codigo '+
                               '      join instrucoestrabalhooperacoes ito '+
                               '      on uit.instrucaotrabalho = ito.instrucaotrabalho '+
                               ' where ito.operacao  = %s '+
                               '   and (it.inativo is null or it.inativo > current_date)) ';

begin
  fraConsultaOperador.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString := format(SQLOperacao,[dtmOperacoesPorcelana.qryOperacoescodigo.AsString]);
  fraConsultaOperador.qryConsultaUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString := format(SQLOperacao,[dtmOperacoesPorcelana.qryOperacoescodigo.AsString]);
end;

constructor TfrmOperacoesPorcelana.Create(AOwner: TComponent);
begin
  inherited;
  dtmOperacoesPorcelana := TdtmOperacoesPorcelana.Create(Self);
  DataSet := dtmOperacoesPorcelana.qryConsultaOperacoesOSPUsuarios;
  fraConsultaOperador.TipoPesquisa := pesUSUARIOS;
  fraConsultaOperador.CondicoesdaConsulta := CondicoesOperadores;
  fraConsultaOperador.OnFound := AlterarEstadoBotoes;
  dtmOperacoesPorcelana.OperacoesAfterScroll := OperacoesAfterScroll;
end;

destructor TfrmOperacoesPorcelana.Destroy;
begin
  inherited;
  frmOperacoesPorcelana := nil;

end;

procedure TfrmOperacoesPorcelana.ckbMarcarTodosClick(Sender: TObject);
begin
  inherited;
  dtmOperacoesPorcelana.MarcarRegistros(dtmOperacoesPorcelana.qryConsultaOperacoesOSPUsuarios,
                                        dtmOperacoesPorcelana.qryConsultaOperacoesOSPUsuariosok,
                                        ckbMarcarTodos.checked,true);
  dtmOperacoesPorcelana.Marcados := dtmOperacoesPorcelana.QtdeMarcados;
  AlterarEstadoBotoes;
end;

procedure TfrmOperacoesPorcelana.fraConsultaOperadoredfCodigoChange(
  Sender: TObject);
begin
  inherited;
  AlterarEstadoBotoes
end;

function TfrmOperacoesPorcelana.InternoGravar: Boolean;
begin
  dtmOperacoesPorcelana.GravarOperacoesPorcelana(fraConsultaOperador.qryProcuraUsuarioscodigo.AsInteger,
                                                 fraConsultaOperador.qryProcuraUsuariosturno.AsInteger);
end;

procedure TfrmOperacoesPorcelana.OperacoesAfterScroll(Sender: TObject);
begin
  if fraConsultaOperador.edfCodigo.text <> '' then
  begin
    fraConsultaOperador.qryConsultaUsuarios.Close;
    fraConsultaOperador.qryConsultaUsuarios.Open;

    if not fraConsultaOperador.qryConsultaUsuarios.locate('codigo', fraConsultaOperador.qryProcuraUsuarioscodigo.AsString, []) then
    begin
      fraConsultaOperador.edfCodigo.Clear;
      fraConsultaOperador.qryProcuraUsuarios.Close;
    end;
  end;
end;

end.
