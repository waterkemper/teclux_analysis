unit fmplanocontasreferencial;

interface

uses
  SysUtils, Windows, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, cpnumero,
  cpdbdata, DBCtrls, cptexto, cpdbfindcontrols, cpdbradiogroup,
  DB, biblio, {Qete,} MaskUtils,
  //Componentes
  ctconstantes , clparametrossistema,

  //Terceiros
  ZQuery,

  //Repositorio
  fmconsultabasica, fmconsultaporcampo,

  //Projeto
  ZPgSqlQuery, cpquery, Grids, DBGrids, cpdbgrid, cpdocumento, cpcpfcnpj2,
  cpcpf, cpdata, cpdbmesano, cpmascara, cpeditioncontrolvalidation,
  frlistafiliais, Mask, cpdbmemo, ToolWin, cpdbtext;


type
  TfrmPlanoContasReferencial = class(TfrmCadastroPadrao)
    sbnImprimir: TSpeedButton;
    pgcPlanoContas: TPageControl;
    tstCadastroPlanoContas: TTabSheet;
    tstImpressaoPlanoContas: TTabSheet;
    gbxCodigo: TGroupBox;
    edfCodigo: TtecDbEditFind;
    gbxClassificacao: TGroupBox;
    edtClassificacao: TDBEditmascara;
    edtDataValidoDesde: TDBEditData;
    gbxDescricao: TGroupBox;
    edtDescricao: TDBEditTexto;
    rgpTipo: TtecDBRadioGroup;
    rbnAnalitica: TtecRadioButton;
    rbnSintetica: TtecRadioButton;
    gbxVinculacao: TGroupBox;
    dbgPlanoContasVinculados: TtecDBGrid;
    gbxRelatorio: TGroupBox;
    ckbAnalitico: TCheckBox;
    ckbSintetico: TCheckBox;
    gbxFiltro: TGroupBox;
    ckbContaSelecionada: TCheckBox;
    rgpOrdenacao: TtecDBRadioGroup;
    rbnClassificacao: TtecRadioButton;
    rbnDescricao: TtecRadioButton;
    gbxValidasDesde: TGroupBox;
    edtValidoDesde: TEditData;
    gbxValidasAte: TGroupBox;
    edtValidoAte: TEditData;
    gbxValidades: TGroupBox;
    gbxDataValidade: TGroupBox;
    gbxValidadeInicial: TGroupBox;
    gbxValidadeFinal: TGroupBox;
    edtDataValidoAte: TDBEditData;
    gbxOrientacoes: TGroupBox;
    mmoORIENTACOES: TtecDBMemo;
    ckbImprimirOrientacoes: TCheckBox;
    pnlDados: TPanel;
    pnlPlanoContas: TPanel;
    pnlTipoPlanoReferencial: TPanel;
    procedure edtClassificacaoChange(Sender: TObject);
    procedure edtClassificacaoExit(Sender: TObject);
    procedure rbnSinteticaClick(Sender: TObject);
    procedure edfCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClassificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnImprimirClick(Sender: TObject);
    procedure pgcPlanoContasChange(Sender: TObject);
    procedure ckbSinteticoClick(Sender: TObject);
    procedure ckbAnaliticoClick(Sender: TObject);
    procedure edtDataValidoDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtDataValidoAteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
     function  InternoIncluir: Boolean; override;
     function  InternoExcluir: Boolean; override;
     Function  InternoGravar: Boolean; Override;
     function  InternoPesquisar(Titulo:String): Integer; override;
     function  JanelaPesquisa: TfrmConsultaBasica; override;
     function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function  TabelaDePesquisa: TZDataSet; override;
     procedure KeyDown(var Key: Word; Shift: TShiftState); override;
     procedure PercorrerPlanoContas(Campo: Byte; var Key: Word; Shift: TShiftState);
     procedure AfterPlanoContasVinculado_SinteticasAfterOpen(Sender: TObject);
  public
     constructor Create(AOwner: TComponent); Override;
     destructor  Destroy; override;
  end;

var
  frmPlanoContasReferencial: TfrmPlanoContasReferencial;
  ControleValido: TWinControl;

implementation

uses dmplanocontasreferencial;

{$R *.dfm}
constructor TfrmPlanoContasReferencial.Create(AOwner: TComponent);
begin
   dtmPlanoContasReferencial := TdtmPlanoContasReferencial.Create(Self);
   inherited;
   DataSet:= dtmPlanoContasReferencial.TabelaPlanoContas;
   pnlTipoPlanoReferencial.caption := dtmPlanoContasReferencial.TipoPlanoReferencial_('descricao');

   pgcPlanoContasChange(pgcPlanoContas);
   dtmPlanoContasReferencial.PlanoContasVinculado_SinteticasAfterOpen := AfterPlanoContasVinculado_SinteticasAfterOpen;
   if ParSistema.PermitirCODIGOnoPLANODECONTASinformado then
     edfCodigo.DenyInsert := false
   else
     edfCodigo.DenyInsert := true;
end;

destructor TfrmPlanoContasReferencial.Destroy;
begin
  dtmPlanoContasReferencial:=nil;
  inherited;
  frmPlanoContasReferencial := nil;
end;

function TfrmPlanoContasReferencial.InternoIncluir: Boolean;
begin
  pgcPlanoContas.ActivePage := tstCadastroPlanoContas;
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      if dtmPlanoContasReferencial.IncluirPlanoContas then
      begin
        if ParSistema.PermitirCODIGOnoPLANODECONTASinformado then
        begin
          edfCodigo.SetFocus;
          edfCodigo.SelectAll;
        end
        else
        begin
          edtClassificacao.SetFocus;
          edtClassificacao.SelectAll;
        end;
        rbnAnalitica.Enabled :=  true;
        rbnAnalitica.Enabled := true;
      end;
  end;
end;

function TfrmPlanoContasReferencial.InternoExcluir: Boolean;
begin
  pgcPlanoContas.ActivePage := tstCadastroPlanoContas;
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
    begin
      rbnAnalitica.Enabled :=  true;
      rbnAnalitica.Enabled := true;
      dtmPlanoContasReferencial.ExcluirPlanoContas;
    end;
  end;
end;

function TfrmPlanoContasReferencial.InternoGravar: Boolean;
begin
  pgcPlanoContas.ActivePage := tstCadastroPlanoContas;
  Result:= inherited InternoGravar;
  result :=  edtClassificacao.Criticar(false);
  if Result then
    dtmPlanoContasReferencial.GravarPlanoContas;
end;

function TfrmPlanoContasReferencial.InternoPesquisar(Titulo:String): Integer;
begin
  pgcPlanoContas.ActivePage := tstCadastroPlanoContas;
  Result:= mrOK;
  if not CtrlOn then begin
    dtmPlanoContasReferencial.abre(ctConsultaPlanoContas);
    Result:= inherited InternoPesquisar(ctPlanoContas);
    if Result = mrOK then
    begin
       dtmPlanoContasReferencial.SelecionarPlanoContas;
       edfCodigo.Text := dtmPlanoContasReferencial.qryConsultaPlanosCodigo.AsString;
       edfcodigo.Exist;
    end;
    dtmPlanoContasReferencial.Fecha(ctConsultaPlanoContas);
  end;
end;

function TfrmPlanoContasReferencial.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmPlanoContasReferencial.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmPlanoContasReferencial.ExistePlanoContas(NomeCampo, Value);
end;

function TfrmPlanoContasReferencial.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmPlanoContasReferencial.TabelaConsultarPlanoContas;
end;

procedure TfrmPlanoContasReferencial.edtClassificacaoChange(Sender: TObject);
begin
  inherited;
  dtmPlanoContasReferencial.PercorrendoPlanoContas := false;
  dtmPlanoContasReferencial.VerificarMascaraClassificacao(edtClassificacao.Text);
end;

procedure TfrmPlanoContasReferencial.edtClassificacaoExit(Sender: TObject);
begin
  if not edtClassificacao.ClassificacaoInvalida then
  begin
    dtmPlanoContasReferencial.ValidarContas(true);
    dtmPlanoContasReferencial.VerificarClassificacao;
  end;
end;

procedure TfrmPlanoContasReferencial.rbnSinteticaClick(Sender: TObject);
begin
  inherited;
  if rbnSintetica.Checked then
    edtDescricao.CharCase := ecUpperCase
  else edtDescricao.CharCase := ecNormal;
end;

procedure TfrmPlanoContasReferencial.KeyDown(var Key: Word; Shift: TShiftState);
begin
 if edtDescricao.Focused then
   if TeclaEnterOuReturn(key) then
     If dtmPlanoContasReferencial.Inserindo
         then InternoGravar;

   inherited;
end;

procedure TfrmPlanoContasReferencial.PercorrerPlanoContas(Campo: Byte; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_NEXT) or
      (Key = VK_PRIOR)   or
     ((ssCtrl in Shift) and ((Key = VK_HOME) or (Key = VK_END))) then
   begin
     dtmPlanoContasReferencial.PercorrendoPlanoContas := true;
     dtmPlanoContasReferencial.PercorrerPlanoContas(Campo, Key, Shift);
//     edfCodigo.Text := dtmPlanoContasReferencial.qryPlanoContascodigo.AsString;
//     edfcodigo.Exist;
     case campo of
      cmpcodigo        : edfCodigo.SelectAll;
      cmpClassificacao : edtClassificacao.SelectAll;
      cmpDescricao     : edtDescricao.SelectAll;
{      cmpDataValidoDesde   : edtDataValidoDesde.SelectAll;
      cmpDataValidoAte   : edtDataValidoAte.SelectAll;}
     end;
   end;
end;

procedure TfrmPlanoContasReferencial.edfCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  PercorrerPlanoContas(cmpcodigo, Key, Shift);
end;

procedure TfrmPlanoContasReferencial.edtClassificacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PercorrerPlanoContas(cmpClassificacao, Key, Shift);
end;

procedure TfrmPlanoContasReferencial.edtDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PercorrerPlanoContas(cmpDescricao, Key, Shift);
end;

procedure TfrmPlanoContasReferencial.sbnImprimirClick(Sender: TObject);

begin
  inherited;
  dtmPlanoContasReferencial.ImprimirPlanoContas(
     ckbImprimirOrientacoes.Checked,
     ckbSintetico.Checked,
     ckbAnalitico.Checked,
     ckbContaSelecionada.Checked,
     rgpOrdenacao.ItemIndex,
     edtValidoDesde.Text, edtValidoAte.Text);
end;

procedure TfrmPlanoContasReferencial.pgcPlanoContasChange(Sender: TObject);
begin
  inherited;
  sbnImprimir.Enabled := (pgcPlanoContas.ActivePage = tstImpressaoPlanoContas);
end;

procedure TfrmPlanoContasReferencial.ckbSinteticoClick(Sender: TObject);
begin
  inherited;
  if not ckbSintetico.Checked then
    ckbAnalitico.Checked := true;
end;

procedure TfrmPlanoContasReferencial.ckbAnaliticoClick(Sender: TObject);
begin
  inherited;
  if not ckbAnalitico.Checked then
    ckbSintetico.Checked := true;
end;

procedure TfrmPlanoContasReferencial.edtDataValidoDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
{  PercorrerPlanoContas(cmpDataValidoDesde, Key, Shift);}
end;

procedure TfrmPlanoContasReferencial.AfterPlanoContasVinculado_SinteticasAfterOpen(
  Sender: TObject);
begin
  edtClassificacao.OnExit := nil;
  rbnAnalitica.Enabled := dtmPlanoContasReferencial.AbilitarAnalitica;
  if not rbnAnalitica.Enabled then
    rbnSintetica.Enabled := true
  else
    rbnSintetica.Enabled := dtmPlanoContasReferencial.AbilitarSintetica;
  edtClassificacao.OnExit := edtClassificacaoExit;
end;

procedure TfrmPlanoContasReferencial.edtDescricaoExit(Sender: TObject);
begin
  inherited;
  dtmPlanoContasReferencial.ValidarContas(true)
end;

procedure TfrmPlanoContasReferencial.edtDataValidoAteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
{ PercorrerPlanoContas(cmpDataValidoAte, Key, Shift);}
end;

end.
