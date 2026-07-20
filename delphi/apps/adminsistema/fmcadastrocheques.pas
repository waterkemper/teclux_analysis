unit fmcadastrocheques;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  Windows, Grids, DBGrids, DBCtrls, StdCtrls, Mask, ComCtrls, ExtCtrls,
  Buttons,DateUtils,
  // Terceiros
  ZQuery,
  // Constantes
  ctconstantes, biblio, clparametrossistema,
  // Componentes
  cpdbtext, cpnumero, cpdbdata, cptexto, cpdbfindcontrols, cpdbgrid,
  cppagecontrol, cpdbcombobox,
  // Repositorio
  fmcadastropadrao, fmconsultabasica, DB, ZPgSqlQuery, cpquery,
  cpdbradiogroup, ActnList, frcmc7, cpdbmemo, ToolWin;

type
  TfrmCadastroCheques = class(TfrmCadastroPadrao)
    pgcCheques: TtecPageControl;
    tstCheques: TTabSheet;
    edtTitular: TDBEditTexto;
    flkFilial: TtecDBFindLookup;
    flkCliente: TtecDBFindLookup;
    edtValor: TDBEditNumero;
    dbgParcelas: TtecDBGrid;
    dtxFilial: TtecDBText;
    dtxCliente: TtecDBText;
    sbnCliente: TSpeedButton;
    sbnFilial: TSpeedButton;
    tstResgate: TTabSheet;
    pnlFundoJanela: TPanel;
    rgpSituacao: TtecDBRadioGroup;
    ckbNormal: TtecRadioButton;
    ckbDevolvido: TtecRadioButton;
    ckbCancelado: TtecRadioButton;
    aclHabilitar: TActionList;
    actHabilitarCampos: TAction;
    edtCancelado: TDBEditData;
    gbxCobrador: TGroupBox;
    sbnProcuraCobrador: TSpeedButton;
    flkCobrador: TtecDBFindLookup;
    dtxCobrador: TtecDBText;
    edt1Devolucao: TDBEditData;
    edt2Devolucao: TDBEditData;
    edtDataEmissao: TDBEditData;
    edtDataVencimento: TDBEditData;
    gbx1Remessa: TGroupBox;
    edtRemessaNumero: TDBEditNumero;
    edtRemessaData: TDBEditData;
    edtRemessaNumero2: TDBEditNumero;
    edtRemessaData2: TDBEditData;
    edtReapresentar: TDBEditData;
    gbxMotivo: TGroupBox;
    flkMotivo: TtecDBFindLookup;
    sbnProcurarMotivos: TSpeedButton;
    dtxMotivos: TtecDBText;
    fraCMC7Cheque: TfraCMC7;
    dbxSituacaoCheque: TtecDBText;
    mmoChequesObservacao: TtecDBMemo;
    gbxCliente: TGroupBox;
    gbxFilial: TGroupBox;
    gbxTitular: TGroupBox;
    gbxValor: TGroupBox;
    gbxVencimento: TGroupBox;
    gbxEmissao: TGroupBox;
    gbxDevolucoes: TGroupBox;
    gbx1aDevolucao: TGroupBox;
    gbxReapresentacao: TGroupBox;
    gbx2aDevolucao: TGroupBox;
    gbxCancelado: TGroupBox;
    Panel1: TPanel;
    gbxObservacoes: TGroupBox;
    gbxData1aRemessa: TGroupBox;
    gbxNr1aRemessa: TGroupBox;
    lblPrimeira: TLabel;
    lblSegunda: TLabel;
    HeaderControl1: THeaderControl;
    tstRepasse: TTabSheet;
    dbgChequesRepassados: TtecDBGrid;
    gbxObservacaoChequeRepassado: TGroupBox;
    mmoObservacao: TtecDBMemo;
    gbxRepassadoPor: TGroupBox;
    lblDataRepassadoPor: TLabel;
    dtxNomeRepassador: TtecDBText;
    dtxCodigoRepassador: TtecDBText;
    dtxDataRepasse: TtecDBText;
    gbxExcluidoPor: TGroupBox;
    Label4: TLabel;
    dtxNomeExcluidor: TtecDBText;
    dtxCodigoExcluidor: TtecDBText;
    dtxDataExclusao: TtecDBText;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dtxNomeDevolvedor: TtecDBText;
    dtxCodigoDevolvedor: TtecDBText;
    dtxDataDevolucao: TtecDBText;
    lblChequesEmVermelho: TLabel;
    shCopiar: TShape;
    ckbIncobravel: TtecRadioButton;
    procedure sbnClienteClick(Sender: TObject);
    procedure sbnFilialClick(Sender: TObject);
    procedure sbnProcurarMotivosClick(Sender: TObject);
    procedure actHabilitarCamposUpdate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraCMC7ChequeedtCMC7Exit(Sender: TObject);
    procedure edtDataVencimentoEnter(Sender: TObject);
    procedure sbnProcuraCobradorClick(Sender: TObject);
    procedure fraCMC7ChequeedtManual3Exit(Sender: TObject);
    procedure dbgChequesRepassadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  protected
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  InternoCancelar: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  TabelaDePesquisa: TZDataSet; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure SelecionarCheque(ListadeCheques: Array of String);
    
  end;

var
  frmCadastroCheques: TfrmCadastroCheques;
  TipoConsulta: TtecChequeCadastroConsulta;

implementation

uses
  //Repositorio
  fmlerdata, fmconsultaporcampo,
  // Projeto
  dmcadastrocheques;

{$R *.dfm}

{ TfrmCadastroCheques }

procedure TfrmCadastroCheques.actHabilitarCamposUpdate(Sender: TObject);
begin
  inherited;
  sbnProcurar.Enabled      := (pgcCheques.ActivePage = tstCheques);

  edtCancelado.ReadOnly    := not ((rgpSituacao.ItemIndex = 2) and                                                    {esteja cancelado e não tenha remessa para banco}
                                   (dtmCadastroCheques.qryChequesremessanumero.IsNull) and                            {não tenha remessa para banco}
                                   (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString <> 'REPASSADO') and {não foi repassado}
                                   (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString <> 'RESGATE PARCIAL') and
                                   (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString <> 'RESGATADO'));   {não foi resgatado pelo cliente}


  flkMotivo.ReadOnly       := not ((rgpSituacao.ItemIndex = 1) and                                                    {esteja devolvido }
                                   (dtmCadastroCheques.PodeAtribuirMotivo) and                                        {não tiver datas de devolução}
                                   (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString <> 'REPASSADO') and {não foi repassado}
                                   (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString <> 'RESGATE PARCIAL') and
                                   (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString <> 'RESGATADO'));   {não foi resgatado pelo cliente}


  flkCobrador.ReadOnly     := not (ckbDevolvido.Checked and                                                           {esteja devolvido}
                                  (dtmCadastroCheques.PodeAtribuirCobrador) and                                       {tenha a 2º devolução}
                                  (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString <> 'REPASSADO') and  {não foi repassado}
                                   (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString <> 'RESGATE PARCIAL') and
                                  (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString <> 'RESGATADO'));    {não foi resgatado pelo cliente}


  if (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString = 'REPASSADO') or        {foi repassado}
     (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString = 'RESGATE PARCIAL') or
     (dtmCadastroCheques.qryChequessituacaochequecalculada.AsString = 'RESGATADO') then      {foi resgatado pelo cliente}
  begin
    dtmCadastroCheques.SetarCamposSomenteLeitura(true);
    rgpSituacao.ReadOnly := true;
    ckbNormal.ReadOnly := true;
    ckbDevolvido.ReadOnly := true;
    ckbCancelado.ReadOnly := true;
  end
  else
  if ckbNormal.Checked then
  begin

    dtmCadastroCheques.SetarCamposSomenteLeitura(false);

    ckbNormal.Enabled := true;
    ckbDevolvido.Enabled := true;
    ckbCancelado.Enabled := true;
    gbxDevolucoes.Enabled := false;
    gbx1aDevolucao.Enabled := false;
    gbxReapresentacao.Enabled := false;
    gbx2aDevolucao.Enabled := false;
    gbxCancelado.Enabled := false;
    gbxMotivo.Enabled := false;
    gbxCobrador.Enabled := false;

  end
  else
  if ckbDevolvido.Checked then
  begin
    dtmCadastroCheques.SetarCamposSomenteLeitura(false);

    ckbDevolvido.Enabled := true;
    gbxDevolucoes.Enabled := true;
    gbx1aDevolucao.Enabled   := not ParSistema.ControlarSomente2Devolucao;
    gbxReapresentacao.Enabled:= not ParSistema.ControlarSomente2Devolucao;
    gbx2aDevolucao.Enabled := true;
    gbxCancelado.Enabled := false;
    gbxMotivo.Enabled := true;
    gbxCobrador.Enabled := true;

    if not dtmCadastroCheques.ExistePagamento then
    begin
      ckbNormal.Enabled := true;
      ckbCancelado.Enabled := true;
    end
    else
    begin
      ckbNormal.Enabled := false;
      ckbCancelado.Enabled := false;
    end;
  end
  else
  if ckbCancelado.Checked then
  begin
    dtmCadastroCheques.SetarCamposSomenteLeitura(true);

    ckbCancelado.Enabled := true;
    ckbDevolvido.Enabled := true;
    ckbNormal.Enabled := true;
    gbxDevolucoes.Enabled := true;
    gbx1aDevolucao.Enabled := false;
    gbxReapresentacao.Enabled := false;
    gbx2aDevolucao.Enabled := false;
    gbxMotivo.Enabled := true;
    gbxCobrador.Enabled := true;
    gbxCancelado.Enabled := true;
  end;
end;

constructor TfrmCadastroCheques.Create(AOwner: TComponent);
begin
  dtmCadastroCheques := TdtmCadastroCheques.Create(Self);
  inherited;
  DataSet := dtmCadastroCheques.TabelaCheques;
  dtmCadastroCheques.Abre(ctChequesCadastro);
  pgcCheques.ActivePage := tstCheques;
  self.FocusActiveControl := true;
  self.ActiveControl := fraCMC7Cheque.edtCMC7;
  fraCMC7Cheque.edtCMC7.SetFocus;
end;

destructor TfrmCadastroCheques.Destroy;
begin
  dtmCadastroCheques:=nil;
  inherited;
  frmCadastroCheques:= nil;
end;

function TfrmCadastroCheques.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoConsulta of
    cccCLIENTES : Result := dtmCadastroCheques.ExisteCliente(NomeCampo, Value);
    cccFILIAIS  : Result := dtmCadastroCheques.ExisteFilial(NomeCampo,Value);
    cccMOTIVOS  : Result := dtmCadastroCheques.ExisteMotivo(NomeCampo,Value);
    cccCobrador : Result := dtmCadastroCheques.ExisteCobrador(NomeCampo,Value);
    else          Result := dtmCadastroCheques.ExisteCheque(NomeCampo,Value);
  end;
end;

procedure TfrmCadastroCheques.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_ESCAPE: begin
                  fraCMC7Cheque.LimparCampos;
                  dtmCadastroCheques.ReFazConsultaCheques;
                end;
  end;
end;

function TfrmCadastroCheques.InternoCancelar: Boolean;
begin
  Result := inherited InternoCancelar;
  if Result then
    dtmCadastroCheques.RefazConsultaParcelas
end;

function TfrmCadastroCheques.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if not CtrlOn then begin
    if Result then
      if dtmCadastroCheques.ExcluirCheque then
        fraCMC7Cheque.LimparCampos;
  end
end;

function TfrmCadastroCheques.InternoGravar: Boolean;
begin
  Result:= True;
  if (ActiveControl is TtecFindCustom) and (TtecFindCustom(ActiveControl).Text <> '') then
   Result:= TtecFindCustom(ActiveControl).Exist;
  if Result then
   Result := fraCMC7Cheque.ChequeValido;
  if Result then
   Result:= inherited InternoGravar;
  if Result then
    dtmCadastroCheques.GravarCheque;
end;

function TfrmCadastroCheques.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then begin
    if Result then begin
      dtmCadastroCheques.IncluirCheque;
      pgcCheques.ActivePage:= tstCheques;
      if fraCMC7Cheque.edtCMC7.CanFocus then
        fraCMC7Cheque.edtCMC7.SetFocus;
      if fraCMC7Cheque.edtCMC7.Text <> '' then
        fraCMC7Cheque.LimparCampos;
    end;
  end
end;

function TfrmCadastroCheques.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if ActiveControl is TtecFindCustom and CtrlOn then begin
    if (ActiveControl = flkCliente) and not dtmCadastroCheques.qryChequescliente.ReadOnly then begin
      TipoConsulta := cccCLIENTES;
      Titulo       := 'Clientes';
    end
    else if (ActiveControl = flkFilial) and not dtmCadastroCheques.qryChequesfilial.ReadOnly then begin
      TipoConsulta := cccFILIAIS;
      Titulo       := 'Filiais';
    end
    else if (ActiveControl = flkMotivo) and not flkMotivo.ReadOnly then begin
      TipoConsulta := cccMotivos;
      Titulo       := 'Motivos';
    end
    else if (ActiveControl = flkCobrador) and not flkCobrador.ReadOnly then begin
      TipoConsulta := cccCobrador;
      Titulo       := 'Cobradores';
    end
    else TipoConsulta:= cccNenhum;
  end
  else begin
    TipoConsulta := cccCheques;
    Titulo       := 'Cheques';
  end;

  if TipoConsulta <> cccNenhum then begin
    with dtmCadastroCheques do begin
      AbrirTabelas(TipoConsulta);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOk then
        Selecionar(TipoConsulta);
        if TipoConsulta = cccCheques then begin
          fraCMC7Cheque.Numero_1 := Manual1;
          fraCMC7Cheque.edtManual1.Text:= Manual1;
          fraCMC7Cheque.Numero_2 := Manual2;
          fraCMC7Cheque.edtManual2.Text:= Manual2;
          fraCMC7Cheque.Numero_3 := Manual3;
          fraCMC7Cheque.edtManual3.Text:= Manual3;
          fraCMC7Cheque.edtManual3Exit(fraCMC7Cheque.edtManual3);
          dtmCadastroCheques.ChequeCadastrado(NumeroChequeConsulta);
          flkCliente.Exist;
          if flkCliente.CanFocus then
            flkCliente.SetFocus;
        end;
      FecharTabelas(TipoConsulta);
    end;
  end;
end;

function TfrmCadastroCheques.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if (TipoConsulta in [cccCLIENTES, cccCHEQUES]) then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmCadastroCheques.sbnClienteClick(Sender: TObject);
begin
  inherited;
  if fraCMC7Cheque.ValidarCMC7 then
  begin
    CtrlOn:= True;
    flkCliente.SetFocus;
    InternoPesquisar('');
  end;
end;

procedure TfrmCadastroCheques.sbnFilialClick(Sender: TObject);
begin
  inherited;
  if fraCMC7Cheque.ValidarCMC7 then begin
    CtrlOn:= True;
    flkFilial.SetFocus;
    InternoPesquisar('');
  end;
end;

procedure TfrmCadastroCheques.sbnProcurarMotivosClick(Sender: TObject);
begin
  inherited;
  if fraCMC7Cheque.ValidarCMC7 then begin
    CtrlOn:= True;
    flkMotivo.SetFocus;
    InternoPesquisar('');
  end;
end;

function TfrmCadastroCheques.TabelaDePesquisa: TZDataSet;
begin
  case TipoConsulta of
    cccCLIENTES : Result := dtmCadastroCheques.TabelaConsultaClientes;
    cccFILIAIS  : Result := dtmCadastroCheques.TabelaConsultaFiliais;
    cccMotivos  : Result := dtmCadastroCheques.TabelaConsultaMotivos;
    cccCobrador : Result := dtmCadastroCheques.TabelaConsultaCobradores;
    else          Result := dtmCadastroCheques.TabelaConsultaCheques;
  end;
end;

procedure TfrmCadastroCheques.fraCMC7ChequeedtCMC7Exit(Sender: TObject);
begin
  inherited;
  fraCMC7Cheque.edtCMC7Exit(Sender);
  if fraCMC7Cheque.ChequeValido then
  begin
    dtmCadastroCheques.ChequeCadastrado(fraCMC7Cheque.NumeroCheque);
    ActiveControl:= flkCliente;
  end
end;

procedure TfrmCadastroCheques.fraCMC7ChequeedtManual3Exit(Sender: TObject);
begin
  inherited;
  fraCMC7Cheque.edtManual3Exit(Sender);
  if fraCMC7Cheque.ChequeValido then
  begin
    dtmCadastroCheques.ChequeCadastrado(fraCMC7Cheque.NumeroCheque);
    ActiveControl:= flkCliente;
  end;
end;

procedure TfrmCadastroCheques.edtDataVencimentoEnter(Sender: TObject);
begin
  inherited;
  if not DataEmBranco(edtDataEmissao.Text) then
    edtdatavencimento.Minimo := DaysBetween(dtmCadastroCheques.DataServidor, StrToDate(edtDataEmissao.Text));
end;

procedure TfrmCadastroCheques.sbnProcuraCobradorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkCobrador.SetFocus;
  internoPesquisar(ctCOBRADORES);
end;


procedure TfrmCadastroCheques.dbgChequesRepassadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (dbgChequesRepassados.DataSource.DataSet.FieldByName('situacao').AsString='DEVOLVIDO') then
    TDBGrid(Sender).Canvas.Font.Color := clRed;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmCadastroCheques.SelecionarCheque(ListadeCheques: array of String);
var
  a: Integer;
begin
  for a := 0 to High(ListadeCheques) do
    if ListadeCheques[a] = dtmCadastroCheques.qryChequesnumero.AsString then
    begin
      try
        dtmCadastroCheques.RefazConsultaCheque;
        break;
      except
      end;
    end
end;

end.
