unit fmCancelamentoNFCe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, ComCtrls, Buttons, ToolWin, ExtCtrls, Grids, DBGrids,
  cpdbgrid, StdCtrls, cpnumero, clusuario, clparametrossistema, DB,
  cpdatasource, ZQuery, ZPgSqlQuery, cpquery, dmbasico, dmcontrolenotasfiscaiseletronicas,
  ActnList, biblio, ctconstantes;

type
  TfrmCancelamentoNFCe = class(TfrmAjudaBt)
    pnlFiltros: TPanel;
    gbxEmissao: TGroupBox;
    gbxUsuario: TGroupBox;
    pnlTotalizadores: TPanel;
    gbxContratos: TGroupBox;
    lblQtdeContratos: TLabel;
    lblQtdeMarcados: TLabel;
    edtQtdeTotal: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    gbxValores: TGroupBox;
    lblTotalContratos: TLabel;
    lblTotalMarcados: TLabel;
    edtValorTotal: TEditNumero;
    edtValorMarcados: TEditNumero;
    ckbSelecionarTodos: TCheckBox;
    dbgNotas: TtecDBGrid;
    stxDataAtual: TStaticText;
    stxUsuario: TStaticText;
    qryDadosFiscais: TtecQuery;
    qryDadosFiscaistiponfe: TStringField;
    qryDadosFiscaisoperacao: TStringField;
    qryDadosFiscaisfilial: TIntegerField;
    qryDadosFiscaisserie: TStringField;
    qryDadosFiscaisnrdocumento: TIntegerField;
    qryDadosFiscaismodelodocto: TStringField;
    qryDadosFiscaisemissao: TDateField;
    qryDadosFiscaisnome: TStringField;
    qryDadosFiscaiscnpj: TStringField;
    qryDadosFiscaisestado: TStringField;
    qryDadosFiscaisvalornota: TFloatField;
    qryDadosFiscaisselecionar: TBooleanField;
    qryDadosFiscaischavenota: TIntegerField;
    dsrDadosFiscais: TtecDataSource;
    sbnEnviar: TSpeedButton;
    qryDadosFiscaisnumprotocolonfe: TStringField;
    qryDadosFiscaisstatusnfe: TIntegerField;
    qryDadosFiscaissituacao: TStringField;
    qryDadosFiscaischave_nfe: TStringField;
    qryDadosFiscaisnumcancelamentonfe: TStringField;
    qryDadosFiscaisnuminutilizacaonfe: TStringField;
    sbnGerar: TSpeedButton;
    Timer1: TTimer;
    qryDadosFiscaisdatacancelamento: TDateField;
    qryDadosFiscaisdhprocnfe: TDateTimeField;
    qryDadosFiscaislimiteminutos: TIntegerField;
    qryDadosFiscaisMinRestantes: TStringField;
    qryDadosFiscaiscontrato: TStringField;
    qryDadosFiscaisorcamento: TIntegerField;
    procedure sbnEnviarClick(Sender: TObject);
    procedure dbgNotasDblClick(Sender: TObject);
    procedure dbgNotasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnGerarClick(Sender: TObject);
    procedure Action1Update(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure qryDadosFiscaisAfterOpen(DataSet: TDataSet);
    procedure qryDadosFiscaisCalcFields(DataSet: TDataSet);
    procedure qryDadosFiscaisAfterScroll(DataSet: TDataSet);
  private
    fdtmControleNotasFiscaisEletronicas: TdtmControleNotasFiscaisEletronicas;
    function GetdtmControleNotasFiscaisEletronicas: TdtmControleNotasFiscaisEletronicas;
  protected
    dtmBasico : TdtmBasico;
  private
    { Private declarations }
    procedure AtualizarContadores(Selecionadas: Boolean);
    procedure SelecionarRegistro;
    procedure MarcarNotas(Marcando, Todas: Boolean);
    property dtmControleNotasFiscaisEletronicas: TdtmControleNotasFiscaisEletronicas read GetdtmControleNotasFiscaisEletronicas write fdtmControleNotasFiscaisEletronicas;
//    property dtmCadastroContratosAuxiliar: TdtmCadastroContratosAuxiliar read GetdtmCadastroContratosAuxiliar write fdtmCadastroContratosAuxiliar;


  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

  end;

var
  frmCancelamentoNFCe: TfrmCancelamentoNFCe;
  AcertaMovimentacoesAposCancelamentoNFCe: function (dadofiscal: Integer): Boolean;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmCancelamentoNFCe.AtualizarContadores(Selecionadas: Boolean);
begin
  if not Selecionadas then
  begin
    edtQtdeTotal.Text  := IntToStr(qryDadosFiscais.recordcount);
    edtValorTotal.Text := Format('%8.2m', [dtmBasico.TotalizarValores[qryDadosFiscais, qryDadosFiscaisvalornota, nil]]);
  end;
  edtQtdeMarcados.Text  := IntToStr(dtmBasico.QtdeMarcados);
  edtValorMarcados.Text := Format('%8.2m', [dtmBasico.TotalMarcados]);
end;

constructor TfrmCancelamentoNFCe.Create(AOwner: TComponent);
begin
  inherited;
  dtmBasico := tdtmBasico.create(nil);
  stxDataAtual.caption := datetostr(date());
  stxUsuario.caption := inttostr(usuariologin.codigousuario) + ' - ' + usuariologin.nomeusuario;
  sbnGerarClick(nil);



end;

procedure TfrmCancelamentoNFCe.sbnEnviarClick(Sender: TObject);
var
  UsuarioAut: TtecUsuarios;



  function CancelarNFe: boolean;

  var
    vResult : Boolean;
    vDadosFiscaisReadOnly : Boolean;
    vDadosFiscaissituacao : String;

    function GravarSituacaoDadoFiscal(Situacao: String): Boolean;
    begin
      vDadosFiscaissituacao := qryDadosFiscaissituacao.AsString;
      vDadosFiscaisReadOnly := qryDadosFiscais.ReadOnly;
      qryDadosFiscais.ReadOnly := False;
      qryDadosFiscais.Edit;
      qryDadosFiscaissituacao.AsString := Situacao;
//      if situacao = 'N' then
//        qryDadosFiscaisdescricaosituacao.asString := '';

      qryDadosFiscais.Post;
      qryDadosFiscais.ReadOnly := vDadosFiscaisReadOnly;
      result := dtmBasico.perpetrar([qryDadosFiscais]);

//      qryDadosFiscaisCalcFields(nil);
    end;


  begin
    result := false;

    if UsuarioLogin.GerenteCaixa then
      UsuarioAut := dtmBasico.ObterAutorizacao(taSENHA, ctPARACANCELAMENTOAUTENTICACAO, ctGERENTECAIXA, '')
    else
      UsuarioAut := dtmBasico.ObterAutorizacao(taLOGIN, ctPARACANCELAMENTOAUTENTICACAO, ctGERENTECAIXA, '');

    if Assigned(UsuarioAut) then
    begin
      Result := UsuarioAut.GerenteCaixa;
      if Not Result then
        MensagemAviso(ctUSUARIOSEMPERMISSAO);
    end
    else
      Result := False;

    if result then
    begin
//    dtmControleNotasFiscaisEletronicas := TdtmControleNotasFiscaisEletronicas.Create(self);
      qryDadosFiscais.first;
      while not qryDadosFiscais.eof do
      begin
        if qryDadosFiscaisselecionar.asboolean and (qryDadosFiscaisMinRestantes.asString <> 'EXCEDIDO') then
        begin
          try

            vResult := False;
            
            try

              if GravarSituacaoDadoFiscal('C') then
                if dtmControleNotasFiscaisEletronicas.SelecionarNotas(1,4, qryDadosFiscaischavenota.asInteger) then
                  if dtmControleNotasFiscaisEletronicas.EnviarNotasFiscais('') then
                  begin

                    if (qryDadosFiscaischave_nfe.AsString = '') then
                    begin
                      qryDadosFiscais.ReadOnly := False;
                      qryDadosFiscais.Edit;
                      qryDadosFiscaischave_nfe.AsString := dtmControleNotasFiscaisEletronicas.vchave_nfe;
                      qryDadosFiscais.post;
                    end;

                    if (qryDadosFiscaisnumprotocolonfe.AsString = '') and (dtmControleNotasFiscaisEletronicas.Protocolo<>'') then
                    begin
                      qryDadosFiscais.ReadOnly := False;
                      qryDadosFiscais.Edit;
                      qryDadosFiscaisnumprotocolonfe.AsString := dtmControleNotasFiscaisEletronicas.Protocolo;
                      qryDadosFiscaisstatusnfe.AsString := dtmControleNotasFiscaisEletronicas.status;

                      if (qryDadosFiscaisstatusnfe.AsString = '301') or    //denegada emitente
                         (qryDadosFiscaisstatusnfe.AsString = '302') then  //denegada destinatario
                        qryDadosFiscaissituacao.AsString := 'D';

                      qryDadosFiscais.post;
                    end;

                    if (qryDadosFiscaisnumcancelamentonfe.AsString = '') and (dtmControleNotasFiscaisEletronicas.ProtocoloCancelamento<>'') then
                    begin
                      qryDadosFiscais.ReadOnly := False;
                      qryDadosFiscais.Edit;
                      qryDadosFiscaisnumcancelamentonfe.AsString := dtmControleNotasFiscaisEletronicas.ProtocoloCancelamento;
                      qryDadosFiscais.post;
                    end;

                    if (qryDadosFiscaisnuminutilizacaonfe.AsString = '') and (dtmControleNotasFiscaisEletronicas.ProtocoloInutilizacao<>'') then
                    begin
                      qryDadosFiscais.ReadOnly := False;
                      qryDadosFiscais.Edit;
                      qryDadosFiscaisnuminutilizacaonfe.AsString := dtmControleNotasFiscaisEletronicas.ProtocoloInutilizacao;
                      qryDadosFiscais.post;
                    end;

                    vresult := not qryDadosFiscaisnumcancelamentonfe.isnull or not qryDadosFiscaisnuminutilizacaonfe.isnull;

                    {
                    if result then
                      AcertarMovimentacoesAposCancelamentoNFCe(qryDadosFiscaischavenota.asinteger);
                      }
                  end;
            except
              vresult := false;

              if (dtmBasico.ValorCampodaTabela('dadosfiscais', ['numero'], [qryDadosFiscaischavenota.asinteger], ['numinutilizacaonfe'])[0]='') and
                 (dtmBasico.ValorCampodaTabela('dadosfiscais', ['numero'], [qryDadosFiscaischavenota.asinteger], ['numcancelamentonfe'])[0]='') then
                  GravarSituacaoDadoFiscal(vDadosFiscaissituacao)
              else
                 vResult := True;
            end;

          finally
//              FreeAndNil(ControleNFe);

            if not vresult then
            begin

              if (dtmBasico.ValorCampodaTabela('dadosfiscais', ['numero'], [qryDadosFiscaischavenota.asinteger], ['numinutilizacaonfe'])[0]='') and
                 (dtmBasico.ValorCampodaTabela('dadosfiscais', ['numero'], [qryDadosFiscaischavenota.asinteger], ['numcancelamentonfe'])[0]='') then
                  GravarSituacaoDadoFiscal(vDadosFiscaissituacao)
              else
                 vResult := True;
            end;
          end;
        end;
        qryDadosFiscais.next;
      end;
    end;

  end;

begin
  inherited;
  qryDadosFiscais.GuardarRegistroAtual(False);
  while not qryDadosFiscais.eof do
    qryDadosFiscais.next;
  qryDadosFiscais.VoltarRegistro;

  CancelarNFe;
  sbnGerarClick(nil);

end;

procedure TfrmCancelamentoNFCe.dbgNotasDblClick(Sender: TObject);
begin
  inherited;
  SelecionarRegistro;
end;

procedure TfrmCancelamentoNFCe.SelecionarRegistro;
begin
   dtmBasico.MarcarRegistros(qryDadosFiscais,
                      qryDadosFiscaisselecionar,
                      qryDadosFiscaisvalornota,
                      False,
                      False);

    AtualizarContadores(True);

end;

procedure TfrmCancelamentoNFCe.dbgNotasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and
     (Key   = VK_SPACE) then
    SelecionarRegistro;

end;

procedure TfrmCancelamentoNFCe.sbnGerarClick(Sender: TObject);
begin
  inherited;
  qryDadosFiscais.paramByName('selecionar').asBoolean := false;
  qryDadosFiscais.paramByName('ambiente').asinteger := dtmBasico.NFeAmbiente;
  qryDadosFiscais.paramByName('UsuarioCaixa').asinteger := usuariologin.codigousuario;
  qryDadosFiscais.close;
  qryDadosFiscais.open;

  AtualizarContadores(False);

end;

procedure TfrmCancelamentoNFCe.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F6    : if not CtrlOn and sbnGerar.Enabled then sbnGerar.Click;
    VK_F7    : if not CtrlOn and sbnEnviar.Enabled then sbnEnviar.Click;
  end;
end;

procedure TfrmCancelamentoNFCe.Action1Update(Sender: TObject);
begin
  inherited;
  if edtQtdeMarcados.Text <> '' then
    sbnEnviar.Enabled := StrToInt(edtQtdeMarcados.Text) > 0;
end;

procedure TfrmCancelamentoNFCe.Timer1Timer(Sender: TObject);
begin
  inherited;
  if edtQtdeMarcados.Text <> '' then
    sbnEnviar.Enabled := StrToInt(edtQtdeMarcados.Text) > 0;

  
end;

procedure TfrmCancelamentoNFCe.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  MarcarNotas(ckbSelecionarTodos.Checked, true);
  AtualizarContadores(True);

end;

procedure TfrmCancelamentoNFCe.MarcarNotas(Marcando, Todas: Boolean);
begin
  DtmBasico.MarcarRegistros(qryDadosFiscais,
                  qryDadosFiscaisselecionar,
                  qryDadosFiscaisvalornota,
                  Marcando,
                  Todas);

end;

procedure TfrmCancelamentoNFCe.qryDadosFiscaisAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DtmBasico.TotalMarcados := 0;
  DtmBasico.QtdeMarcados  := 0;

end;

function TfrmCancelamentoNFCe.GetdtmControleNotasFiscaisEletronicas: TdtmControleNotasFiscaisEletronicas;
begin

  if not assigned(fdtmControleNotasFiscaisEletronicas)  then
    fdtmControleNotasFiscaisEletronicas := tdtmControleNotasFiscaisEletronicas.create(self);

  Result := fdtmControleNotasFiscaisEletronicas;


end;

procedure TfrmCancelamentoNFCe.qryDadosFiscaisCalcFields(
  DataSet: TDataSet);
var
  vmb: int64;
begin
  inherited;

  if qryDadosFiscaislimiteminutos.asinteger > 0 then
  begin
    if qryDadosFiscaisdhprocnfe.isnull then
       qryDadosFiscaisMinRestantes.asString := inttostr(qryDadosFiscaislimiteminutos.asinteger)
    else
    begin
      vmb := MinutesBetween(qryDadosFiscaisdhprocnfe.AsDateTime, dtmbasico.DataHoraServidor);
      if qryDadosFiscaislimiteminutos.asinteger - vmb > 0 then
        qryDadosFiscaisMinRestantes.asString := inttostr(qryDadosFiscaislimiteminutos.asinteger - vmb)
      else
        qryDadosFiscaisMinRestantes.asString := 'EXCEDIDO';
    end;    
  end;

end;

procedure TfrmCancelamentoNFCe.qryDadosFiscaisAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryDadosFiscaisCalcFields(qryDadosFiscais);
end;

end.
