unit fmcadastrofiltros;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ExtCtrls, Buttons, Mask, cpdbfindcontrols,
  DBCtrls, cptexto, cpdata,
  //Terceiros
  ZQuery,
  //Repositório
  ctConstantes, biblio,
  fmconsultabasica, cpdbdata, cpdbtext, ComCtrls, ToolWin;

type
  TfrmCadastroFiltros = class(TfrmCadastroPadrao)
    pnlDados: TPanel;
    edfNumero: TtecDbEditFind;
    lblNumero: TLabel;
    lblDescricao: TLabel;
    edtDescricao: TDBEditTexto;
    lblData: TLabel;
    edtData: TDBEditData;
    lblInativo: TLabel;
    edtInativo: TDBEditData;
    lblFiltro: TLabel;
    mmoFiltro: TDBMemo;
    pnlBotoesParametros: TPanel;
    Bevel1: TBevel;
    sbnCopiarFiltro: TSpeedButton;
    sbnCompras: TSpeedButton;
    sbnInativos: TSpeedButton;
    sbnLembretes: TSpeedButton;
    sbnCobranca: TSpeedButton;
    lblQuestionario: TLabel;
    edfQuestionario: TtecDBFindLookup;
    sbnQuestionario: TSpeedButton;
    dtxDescQuestionario: TtecDBText;
    procedure sbnComprasClick(Sender: TObject);
    procedure sbnLembretesClick(Sender: TObject);
    procedure sbnInativosClick(Sender: TObject);
    procedure sbnCobrancaClick(Sender: TObject);
    procedure sbnCopiarFiltroClick(Sender: TObject);
    procedure sbnQuestionarioClick(Sender: TObject);
    procedure edfNumeroFound(Found: Boolean);
  protected
    TipoConsulta : TtecTipoConsultaFiltrosSAC;
    function  InternoIncluir  : Boolean; override;
    function  InternoGravar   : Boolean; override;
    function  InternoExcluir  : Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AtualizaBotoesParametros;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroFiltros: TfrmCadastroFiltros;
  Aux: TStringList;

implementation

{$R *.dfm}

Uses {Qete,} DB,
     dmcadastrofiltrosac,
     fmconsultaporcampo,
     fmparametroselecaobasica,
     fmparametrosselecaolembretes,
     fmparametrosselecaoinativos,
     fmparametrosselecaoatrasados,
     fmparametrosselecaocompras;

{ TfrmCadastroFiltros }

constructor TfrmCadastroFiltros.Create(AOwner: TComponent);
begin
  dtmCadastroFiltroSac:= TdtmCadastroFiltroSac.Create(Self);
  inherited Create(AOwner);
  DataSet:= dtmCadastroFiltroSac.TabelaFiltrosSAC;
  dtmCadastroFiltroSac.Abre(ctCadastroFiltrosSAC);
end;

destructor TfrmCadastroFiltros.Destroy;
begin
  dtmCadastroFiltroSac.Fecha(ctCadastroFiltrosSAC);
  dtmCadastroFiltroSac:=nil;
  inherited;
  frmCadastroFiltros:= nil;
end;

function TfrmCadastroFiltros.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  if TipoConsulta = tcfFILTRO then
       Result := dtmCadastroFiltroSac.ExisteFiltrosSAC(Parametro, NomeCampo, Value)
  else Result := dtmCadastroFiltroSac.ExisteQuestionario(Parametro, NomeCampo, Value);
end;

function TfrmCadastroFiltros.InternoExcluir: Boolean;
begin
  if CtrlOn then
    Result := False
  else begin
    Result := dtmCadastroFiltroSac.ExcluirFiltrosSAC;
    if Result then
      Result := Inherited InternoExcluir;
  end
end;

function TfrmCadastroFiltros.InternoGravar: Boolean;
begin
  if dtmCadastroFiltroSac.ConfereFiltroSacQuestionario then begin
     Result := Inherited InternoGravar;
     if Result then begin
        Result := dtmCadastroFiltroSac.GravarFiltrosSAC;
        AtualizaBotoesPArametros;
     end;
  end else begin
//      MensagemAviso(ctAVISOINFORMEQUESTIONARIO);
      Result := False;
  end;
  dtmCadastroFiltroSAC.AtivaInsercao:= false;
end;

function TfrmCadastroFiltros.InternoIncluir: Boolean;
begin
  Result := Inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then begin
      dtmCadastroFiltroSac.InserirFiltrosSAC;
//      edfNumero.SetControl(True);
      edtDescricao.SetFocus;
      AtualizaBotoesParametros;
    end;
    Result:= True;
  end
end;

function TfrmCadastroFiltros.InternoPesquisar(Titulo:String): Integer;
begin
  if CtrlOn then begin
    if TipoConsulta = tcfQUESTIONARIO then begin
      dtmCadastroFiltroSac.Fecha(ctTabelasConsultaQuestionarios);
      dtmCadastroFiltroSac.Abre(ctTabelasConsultaQuestionarios);
      Result:= inherited InternoPesquisar('Questionário');
      if Result = mrOk then
         dtmCadastroFiltroSac.AtribuirQuestionarioFiltro;
      dtmCadastroFiltroSac.Fecha(ctTabelasConsultaQuestionarios);
    end
    else
      Result:= 0;
  end
  else begin
    TipoConsulta := tcfFILTRO;
    dtmCadastroFiltroSac.Abre(ctConsultaFiltrosSAC);
    Result := inherited InternoPesquisar('Filtros');
    if Result  = mrok then begin
      dtmCadastroFiltroSac.PosicionarFiltrosSAC;
    end;
    dtmCadastroFiltroSac.Fecha(ctConsultaFiltrosSAC);
  end;
end;

function TfrmCadastroFiltros.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroFiltros.TabelaDePesquisa: TZDataSet;
begin
  if TipoConsulta = tcfFILTRO then
       Result := dtmCadastroFiltroSac.TabelaConsultaFiltrosSAC
  else Result := dtmCadastroFiltroSac.TabelaConsultaQuestionario;
end;

type
  ttecDBMemo = class(TDBMemo);

procedure TfrmCadastroFiltros.sbnComprasClick(Sender: TObject);
var
  frmParametroSselecaoCompras: TfrmParametrosSelecaoCompras;
begin
  inherited;
  if not dtmCadastroFiltroSac.PermiteAlteracaoRegistro then begin
    dtmCadastroFiltroSac.SetTipoFiltro(ctCompras);
    Aux:= TStringList.Create;
    Aux.AddStrings(ttecDBMemo(mmoFiltro).Lines);
    frmParametrosSelecaoCompras := TfrmParametrosSelecaoCompras.Create(Self,Aux);
    if frmParametrosSelecaoCompras.ShowModal('') = mrOk then
       dtmCadastroFiltroSac.GravarSelecaoFiltro(frmParametrosSelecaoCompras.Filtros,frmParametrosSelecaoCompras.SQLCompras);
    frmParametrosSelecaoCompras.Free;
  end;
end;

procedure TfrmCadastroFiltros.sbnLembretesClick(Sender: TObject);
var
  frmParametrosSelecaoLembretes: TfrmParametrosSelecaoLembretes;
begin
  inherited;
 if not dtmCadastroFiltroSac.PermiteAlteracaoRegistro then begin
    dtmCadastroFiltroSac.SetTipoFiltro(ctLembretes);
    Aux:= TStringList.Create;
    Aux.AddStrings(ttecDBMemo(mmoFiltro).Lines);
    frmParametrosSelecaoLembretes := TfrmParametrosSelecaoLembretes.Create(Self,Aux);
    if frmParametrosSelecaoLembretes.ShowModal('') = mrOk then
       dtmCadastroFiltroSac.GravarSelecaoFiltro(frmParametrosSelecaoLembretes.Filtros,frmParametrosSelecaoLembretes.SQLLembrete);
    frmParametrosSelecaoLembretes.Free;
  end;
end;

procedure TfrmCadastroFiltros.sbnInativosClick(Sender: TObject);
var
  frmParametrosSelecaoInativos: TfrmParametrosSelecaoInativos;
begin
  inherited;
  if not dtmCadastroFiltroSac.PermiteAlteracaoRegistro then begin
    dtmCadastroFiltroSac.SetTipoFiltro(ctInativos);
    Aux:= TStringList.Create;
    Aux.AddStrings(ttecDBMemo(mmoFiltro).Lines);
    frmParametrosSelecaoInativos:= TfrmParametrosSelecaoInativos.Create(Self,Aux);
    if frmParametrosSelecaoInativos.ShowModal('') = mrOk then
      dtmCadastroFiltroSac.GravarSelecaoFiltro(frmParametrosSelecaoInativos.Filtros,frmParametrosSelecaoInativos.SQLInativo);
    frmParametrosSelecaoInativos.Free;
  end;
end;


procedure TfrmCadastroFiltros.sbnCobrancaClick(Sender: TObject);
var
  frmParametrosSelecaoAtrasados: TfrmParametrosSelecaoAtrasados;
begin
  inherited;
  if not dtmCadastroFiltroSac.PermiteAlteracaoRegistro then begin
    dtmCadastroFiltroSac.SetTipoFiltro(ctAtrasados);
    Aux:= TStringList.Create;
    Aux.AddStrings(ttecDBMemo(mmoFiltro).Lines);
    frmParametrosSelecaoAtrasados:= TfrmParametrosSelecaoAtrasados.Create(Self,Aux);
    if frmParametrosSelecaoAtrasados.ShowModal('') = mrOK then
      dtmCadastroFiltroSac.GravarSelecaoFiltro(frmParametrosSelecaoAtrasados.Filtros,frmParametrosSelecaoAtrasados.SQLAtrasado);
    frmParametrosSelecaoAtrasados.Free;
  end;
end;

procedure TfrmCadastroFiltros.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case KEY of
    VK_F7 : if (Shift = []) then sbnCopiarFiltro.Click;
    VK_F9 : if edfQuestionario.Focused then
                TipoConsulta:= tcfQUESTIONARIO;
  end;
  inherited;
end;

procedure TfrmCadastroFiltros.sbnCopiarFiltroClick(Sender: TObject);
begin
  inherited;
  dtmCadastroFiltroSac.CopiarFiltro;
  AtualizaBotoesParametros;
end;

procedure TfrmCadastroFiltros.sbnQuestionarioClick(Sender: TObject);
begin
  CtrlOn:= True;
  TipoConsulta:= tcfQUESTIONARIO;
  InternoPesquisar('');
end;

procedure TfrmCadastroFiltros.AtualizaBotoesParametros;
begin
  sbnCompras.Enabled      := (dtmCadastroFiltroSac.InserindoFiltro or (dtmCadastroFiltroSac.TipoFiltro = ctCompras)   or (dtmCadastroFiltroSac.TipoFiltro = ''));
  sbnInativos.Enabled     := (dtmCadastroFiltroSac.InserindoFiltro or (dtmCadastroFiltroSac.TipoFiltro = ctInativos)  or (dtmCadastroFiltroSac.TipoFiltro = ''));
  sbnLembretes.Enabled    := (dtmCadastroFiltroSac.InserindoFiltro or (dtmCadastroFiltroSac.TipoFiltro = ctLembretes) or (dtmCadastroFiltroSac.TipoFiltro = ''));
  sbnCobranca.Enabled     := (dtmCadastroFiltroSac.InserindoFiltro or (dtmCadastroFiltroSac.TipoFiltro = ctAtrasados) or (dtmCadastroFiltroSac.TipoFiltro = ''));
  sbnQuestionario.Enabled := (dtmCadastroFiltroSac.InserindoFiltro or  not dtmCadastroFiltroSac.PermiteAlteracaoRegistro);
end;

procedure TfrmCadastroFiltros.edfNumeroFound(Found: Boolean);
begin
  inherited;
  if Found then
     AtualizaBotoesParametros;
end;

end.
