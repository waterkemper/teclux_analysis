unit fmemissaonotasfiscais;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, Grids,
  DBGrids, {Qete,} ComCtrls,
  // Repositorio
  fmajudabt, fmconsultabasica, fmconsultaporcampo,
  // Biblio
  ctconstantes, biblio,
  // Terceiros
  ZQuery,
  // Componentes;
  cpdbtext, cpdbfindcontrols, cpdbgrid,
  // Projeto
  dmemissaonotasfiscais, dmimprimefiscal, dmcadastrocontratos, cpnumero,
  ToolWin;

type
  TfrmEmissaoNotasFiscais = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxEmissaoNotasFiscais: TGroupBox;
    gbxFilial: TGroupBox;
    lblFilial: TLabel;
    dbgSelecionados: TtecDBGrid;
    gbxContratos: TGroupBox;
    lblQtdeContratos: TLabel;
    lblQtdeMarcados: TLabel;
    gbxValores: TGroupBox;
    lblTotalContratos: TLabel;
    lblValoresSelecao: TLabel;
    ckbSelecionarTodos: TCheckBox;
    lblDescricaoFilial: TLabel;
    lblCodigoFilial: TLabel;
    sbnEmissaoNotasFiscais: TSpeedButton;
    ckbNotaOpcional: TCheckBox;
    edtQtdeContratos: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    edtTotalContratos: TEditNumero;
    edtTotalMarcados: TEditNumero;
    procedure sbnEmissaoNotasFiscaisClick(Sender: TObject);
    procedure dbgSelecionadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgSelecionadosDblClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    procedure AtualizarContadores(SoMarcados:Boolean);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    function ComplementarNota: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmEmissaoNotasFiscais: TfrmEmissaoNotasFiscais;
  CadastroContratos: TdtmCadastroContratos;
  ImprimeFiscal: TdtmImprimeFiscal;

implementation

uses
  //Biblio
  clusuario,
  //Repositorio
  dmbasico, fmcomplementarnotafiscalsaida;

{$R *.dfm}

{ TfrmEmissaoNotasFiscais}

constructor TfrmEmissaoNotasFiscais.Create(AOwner: TComponent);
begin
  dtmEmissaoNotasFiscais:= TdtmEmissaoNotasFiscais.Create(Self);
  inherited;
  try
    lblCodigoFilial.Caption   := IntToStr(dtmEmissaoNotasFiscais.FilialBase);
  except
  end;
  lblDescricaoFilial.Caption:= dtmEmissaoNotasFiscais.NomeFilialBase;
  dtmEmissaoNotasFiscais.ContratosEmitirNotas;
  AtualizarContadores(False);
end;

destructor TfrmEmissaoNotasFiscais.Destroy;
begin
  inherited;
  frmEmissaoNotasFiscais:= nil;
end;

procedure TfrmEmissaoNotasFiscais.sbnEmissaoNotasFiscaisClick(Sender: TObject);
var
  UsuarioAut: TtecUsuarios;
begin
  inherited;
  if dtmEmissaoNotasFiscais.QtdeMarcados > 0 then begin
    UsuarioAut := dtmEmissaoNotasFiscais.ObterAutorizacao(taLOGIN, '', '');
    try
      if Assigned(UsuarioAut) then begin
        try
          CadastroContratos := TdtmCadastroContratos.Create(Self);
          with CadastroContratos do begin
            OnComplementarNota := ComplementarNota;
            ImprimeFiscal := TdtmImprimeFiscal.Create(Self);
          end;
          with dtmEmissaoNotasFiscais do begin
            qryContratosEmitirNotas.DisableControls;
            qryContratosEmitirNotas.First;
            while not qryContratosEmitirNotas.Eof do begin
              if qryContratosEmitirNotasselecionar.Value then begin
                with CadastroContratos do begin
                  SelecionarContrato(qryContratosEmitirNotasnumero.AsString);
                  SituacaoContrato := scNOTAFISCAL;
                  if GravarContrato then
                    ImprimeFiscal.ImprimirDocumentosFiscais(qryContratosEmitirNotasnumero.AsString, False)
                end;
              end;
              qryContratosEmitirNotas.Next;
            end;
            qryContratosEmitirNotas.EnableControls;
          end
        finally
          FreeAndNil(CadastroContratos);
          FreeAndNil(ImprimeFiscal);
        end;
      end
      else
        MensagemAviso(Format(ctUSUARIOSEMCADASTRO, ['']))
    finally
      if Assigned(UsuarioAut) then
        UsuarioAut.Free
    end;
  end
  else
    MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['contrato']));
end;

procedure TfrmEmissaoNotasFiscais.dbgSelecionadosKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmEmissaoNotasFiscais.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmEmissaoNotasFiscais.dbgSelecionadosDblClick(Sender: TObject);
begin
  inherited;
  dtmEmissaoNotasFiscais.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmEmissaoNotasFiscais.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmEmissaoNotasFiscais.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmEmissaoNotasFiscais.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F7     : if not CtrlOn then sbnEmissaoNotasFiscais.Click;
  end;
end;

procedure TfrmEmissaoNotasFiscais.AtualizarContadores(SoMarcados:Boolean);
begin
  with dtmEmissaoNotasFiscais do begin
    if not SoMarcados then begin
      edtQtdeContratos.Text  := IntToStr(QtdeContratos);
      edtTotalContratos.Text := Format('%8.2m', [TotalContratos]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure TfrmEmissaoNotasFiscais.FormShow(Sender: TObject);
begin
  inherited;
  if dtmEmissaoNotasFiscais.NenhumContratoEncontrato then
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['contrato']));
end;

function TfrmEmissaoNotasFiscais.ComplementarNota: Boolean;
var
  frmComplementarNotaFiscalSaida: TfrmComplementarNotaFiscalSaida;
begin
  frmComplementarNotaFiscalSaida := TfrmComplementarNotaFiscalSaida.Create(Self);
  try
    Result := frmComplementarNotaFiscalSaida.ShowModal = mrOk;
  finally
    frmComplementarNotaFiscalSaida.Free
  end
end;

end.
