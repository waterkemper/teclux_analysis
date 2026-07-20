unit fmtiposmovimentosestoque;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Mask,
  StdCtrls, DBCtrls, ExtCtrls, Buttons, ComCtrls,
  //Terceiros
  ZQuery,
  //Biblio
  ctconstantes,
  //Componentes
  cpdbfindcontrols, cpdbtext, cpdbdata, cptexto,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, ToolWin;

type
  TfrmTiposMovimentosDoEstoque = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    sbnTransferencia: TSpeedButton;
    edtDescricaoMovimentos: TDBEditTexto;
    edtInativoMovimentos: TDBEditData;
    dtxTransferencia: TtecDBText;
    edfMovimento: TtecDbEditFind;
    flkTransferencia: TtecDBFindLookup;
    gbxOperacao: TGroupBox;
    bvlDivisor: TBevel;
    edtEmEstoque: TEdit;
    edtReservado: TEdit;
    lblEmEstoque: TLabel;
    lblReservado: TLabel;
    edtTransito: TEdit;
    edtDemonstracao: TEdit;
    edtConserto: TEdit;
    edtFuturo: TEdit;
    edtDanificado: TEdit;
    edtEstoqueFisico_8: TEdit;
    lblTransito: TLabel;
    lblDemonstracao: TLabel;
    lblConserto: TLabel;
    lblFuturo: TLabel;
    lblDanificado: TLabel;
    lblUltimaEntrada: TLabel;
    edtReservaPrevia: TEdit;
    edtUltimaEntrada: TEdit;
    edtUltimaCompra: TEdit;
    edtFinanceiro: TEdit;
    lblUltimaCompra: TLabel;
    lblFinanceiro: TLabel;
    lblTotalizaVenda: TLabel;
    lblTotalizaCompra: TLabel;
    edtTotalizaVenda: TEdit;
    edtTotalizaCompra: TEdit;
    edtValorMoeda: TEdit;
    edtAcabados_16: TEdit;
    edtSemFuncao18: TEdit;
    edtSemiAcabados_17: TEdit;
    edtSemFuncao20: TEdit;
    edtSemFuncao19: TEdit;
    lblEstoqueFisico: TLabel;
    lblReservaPrevia: TLabel;
    lblValorMoeda: TLabel;
    lblAcabados: TLabel;
    lblSemiAcabados: TLabel;
    lblSemFuncao18: TLabel;
    lblSemFuncao19: TLabel;
    lblSemFuncao20: TLabel;
    gbxCodigo: TGroupBox;
    gbxDescricao: TGroupBox;
    gbxTransferencia: TGroupBox;
    gbxInativo: TGroupBox;
    procedure edtOperacoesChange(Sender: TObject);
    procedure edfProcuraMovimentoFound(Found: Boolean);
    procedure sbnTransferenciaClick(Sender: TObject);
  protected
    Decodificando: Boolean;
    TipoPesquisa: TtecPesquisa;
    function  CodificarOperacao: String;
    procedure DecodificarOperacao;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoCancelar: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    procedure Keydown(var Key: Word; Shift: TShiftState); override;
    function  PesquisaHabilitada: Boolean;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmTiposMovimentosDoEstoque: TfrmTiposMovimentosDoEstoque;

implementation

Uses
  //CLX
  Windows,
  //Biblio
  biblio,
  //repositorio
  fmconsultaporcampo,
  //Projeto
  dmtiposmovimentosestoque, fmajuda;


{$R *.dfm}

function TfrmTiposMovimentosDoEstoque.CodificarOperacao: String;
var
  cnt: Integer;
begin
  Result := '';
  for cnt := 0 to gbxOperacao.ControlCount - 1 do
    if gbxOperacao.Controls[cnt] is TEdit then
      Result := Result + TEdit(gbxOperacao.Controls[cnt]).Text;
end;

constructor TfrmTiposMovimentosDoEstoque.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  dtmTiposMovimentosDoEstoque := TdtmTiposMovimentosDoEstoque.Create(Self);
  dtmTiposMovimentosDoEstoque.Abre(ctTabelaMovimentos);
  DataSet := dtmTiposMovimentosDoEstoque.TabelaMovimentos;
end;

procedure TfrmTiposMovimentosDoEstoque.DecodificarOperacao;
var
  cnt1, cnt2, Cont: Integer;
begin
  Decodificando := True;
  try
    cnt2 := 1;
    Cont := Length(dtmTiposMovimentosDoEstoque.OperacaoTipoMovimento);
    if Cont = 0 then
    begin
      for cnt1:= 0 to gbxOperacao.ControlCount - 1 do
        if gbxOperacao.Controls[cnt1] is TEdit then
        begin
          TEdit(gbxOperacao.Controls[cnt1]).Text := '*';
          TEdit(gbxOperacao.Controls[cnt1]).ReadOnly := dtmTiposMovimentosDoEstoque.ReadOnly
        end
    end
    else
      for cnt1:= 0 to gbxOperacao.ControlCount - 1 do
        if gbxOperacao.Controls[cnt1] is TEdit then
        begin
          TEdit(gbxOperacao.Controls[cnt1]).Text := dtmTiposMovimentosDoEstoque.OperacaoTipoMovimento[cnt2];
          TEdit(gbxOperacao.Controls[cnt1]).ReadOnly := dtmTiposMovimentosDoEstoque.ReadOnly;
          Inc(cnt2);
        end;
  finally
    Decodificando := False
  end
end;

destructor TfrmTiposMovimentosDoEstoque.Destroy;
begin
  inherited;
  frmTiposMovimentosDoEstoque := nil;
end;

procedure TfrmTiposMovimentosDoEstoque.edfProcuraMovimentoFound(Found: Boolean);
begin
  if Found then
    DecodificarOperacao
end;

procedure TfrmTiposMovimentosDoEstoque.edtOperacoesChange(Sender: TObject);
begin
  inherited;
  if Not (Decodificando or dtmTiposMovimentosDoEstoque.ReadOnly) then
    dtmTiposMovimentosDoEstoque.qryMovimentos.Edit
end;

function TfrmTiposMovimentosDoEstoque.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmTiposMovimentosDoEstoque.ExisteMovimentos(NomeCampo, Value);
end;

function TfrmTiposMovimentosDoEstoque.InternoCancelar: Boolean;
begin
  Result := inherited InternoCancelar;
  DecodificarOperacao
end;

function TfrmTiposMovimentosDoEstoque.InternoExcluir: Boolean;
begin
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o MOVIMENTO'])) = smbOk then begin
    Result := dtmTiposMovimentosDoEstoque.ExcluirMovimentos;
    if Result then
      DecodificarOperacao
  end else
    Result := False
end;

function TfrmTiposMovimentosDoEstoque.InternoGravar: Boolean;
begin
  if dtmTiposMovimentosDoEstoque.ReadOnly then
    Result := False
  else begin
    Result := dtmTiposMovimentosDoEstoque.GravarMovimentos(CodificarOperacao);
    if Result then
      Result := inherited InternoGravar
  end
end;

function TfrmTiposMovimentosDoEstoque.InternoIncluir: Boolean;
begin
  Result := dtmTiposMovimentosDoEstoque.IncluirMovimentos;
  if Result then
    DecodificarOperacao
end;

function TfrmTiposMovimentosDoEstoque.InternoPesquisar(Titulo: String): Integer;
var
  Tabela: Integer;
begin
  Result:= mrNone;
  if PesquisaHabilitada then begin
    case TipoPesquisa of
      pesCODIGOFISCAL : begin
                          Titulo := 'Código Fiscal';
                          Tabela := ctConsultaCodigosFiscais
                        end;
      pesTRANSFERENCIA: begin
                          Titulo := 'Transferência';
                          Tabela := ctConsultaTiposMovimentos
                        end;
      pesNENHUMA: Begin
                    Titulo := 'Movimentos';
                    Tabela := ctConsultaTiposMovimentos;
                  end
    else
      Tabela := -1
    end;
    dtmTiposMovimentosDoEstoque.Abre(Tabela);
    Result:= inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      case TipoPesquisa of
        pesTRANSFERENCIA: dtmTiposMovimentosDoEstoque.AtribuirTransferencia;
        pesNENHUMA: begin
                      dtmTiposMovimentosDoEstoque.SelecionarMovimento;
                      DecodificarOperacao
                    end
      end;
    dtmTiposMovimentosDoEstoque.Fecha(Tabela);
  end;
end;
 {

 tbeMOVIMENTOS: begin
                      Abre(ctConsultaTiposMovimentos);
                      Abre();
                   end;
    tbeMOVIMENTOS: begin
                      Fecha();
                      Fecha(ctConsultaCodigosFiscais);
                   end;
    tbeMOVIMENTOS: case Pesquisa of
                    pesCODIGOFISCAL: begin
                                        AtribuirCodigoFiscal;
                                        RefazConsulta(qryProcuraCodigosFiscais, [0], [qryMovimentoscodigofiscal.AsInteger]);
                                     end;
                    pesTRANSFERENCIA: begin
                                        AtribuirTransferencia;
                                        RefazConsulta(qryProcuraTransferencias, [0], [qryMovimentostransferencia.AsString]);
                                      end;
                    else              begin
                                        ReFazConsulta(qryMovimentos, [0], [CodigoConsultaMovimentos]);
                                        RefazConsulta(qryProcuraCodigosFiscais, [0], [qryMovimentoscodigofiscal.AsInteger]);
                                        RefazConsulta(qryProcuraTransferencias, [0], [qryMovimentostransferencia.AsString]);
                                      end;
                   end;
}


function TfrmTiposMovimentosDoEstoque.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmTiposMovimentosDoEstoque.Keydown(var Key: Word; Shift: TShiftState);
begin
  if ActiveControl.Parent = gbxOperacao then
    if  (Key >= 32) and (Key <= 255) then
      if not ((Key = Ord('*')) or
              (Key = Ord('-')) or
              (Key = Ord('+')) or
              (Key = Ord('=')) or
             ((Key = Ord('C') ) and edtFinanceiro.Focused))
      then
        Key := 0;
  inherited;
end;

function TfrmTiposMovimentosDoEstoque.PesquisaHabilitada: Boolean;
begin
  if CtrlOn then begin
    if ActiveControl is TtecDBFindLookup then begin
      TipoPesquisa:= pesTRANSFERENCIA;
      Result:= True;
    end else
      Result:= False;
  end else begin
    TipoPesquisa:= pesNENHUMA;
    Result:= True;
  end;
end;

procedure TfrmTiposMovimentosDoEstoque.sbnTransferenciaClick(Sender: TObject);
begin
  CtrlOn := True;
  flkTransferencia.SetFocus;
  TipoPesquisa:= pesTRANSFERENCIA;
  InternoPesquisar('');
end;

function TfrmTiposMovimentosDoEstoque.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmTiposMovimentosDoEstoque.ConsultarMovimentos;
end;

end.
