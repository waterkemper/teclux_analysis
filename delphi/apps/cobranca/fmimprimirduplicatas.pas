unit fmimprimirduplicatas;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  //Repositorio
  fmajudabt, ComCtrls, Buttons, ExtCtrls, StdCtrls, QCheckLst, Mask,
  Grids, DBGrids, cpdbgrid, cpdata, cpeditioncontrolvalidation,
  ActnList, cpdbfindcontrols, DBCtrls, cpdbtext, ctconstantes,
  zquery, biblio,
  fmconsultabasica, fmconsultaporcampo,  frconsultadadoscliente,
  frconsultadadosclientecod, dmconsultadadoscliente,
  Windows, DB,
  // Constantes
  clparametrossistema,
  // Componenetes
  cpdatasource, cpnumero, ZPgSqlQuery, cpquery, cptexto,
  fmcadastropadrao,fmrelatoriopadrao, cpcep, cpdbcombobox,
  cpdblookupcombobox, ToolWin;

type
  Tfrmimprimirduplicatas = class(TfrmAjudaBt)
    sbnImprimir: TSpeedButton;
    plnFundoJanela: TPanel;
    gbxCliente: TGroupBox;
    dtxNomeCliente: TtecDBText;
    sbnGerarParcelas: TSpeedButton;
    gbxFilial: TGroupBox;
    dtxFilial: TtecDBText;
    edfFiliais: TtecDbEditFind;
    edfClientes: TtecDbEditFind;
    dlgArquivoaExportar: TSaveDialog;
    gbxParcelas: TGroupBox;
    dbgParcelas: TtecDBGrid;
    sbnProcurarFilial: TSpeedButton;
    sbnProcurarCliente: TSpeedButton;
    ckbSelecionarTodas: TCheckBox;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxVencimentos: TGroupBox;
    edtVenctoInicial: TEditData;
    edtVenctoFinal: TEditData;
    gbxFaturamento: TGroupBox;
    edtVendaInicial: TEditData;
    edtVendaFinal: TEditData;
    gbxNrNotas: TGroupBox;
    edtNotaInicial: TEditNumero;
    edtNotaFinal: TEditNumero;
    ckbIncluirSomenteCobrancaemCarteira: TCheckBox;
    gbxLidos: TGroupBox;
    gbxNrLidos: TGroupBox;
    edtQtdeLidas: TEditNumero;
    gbxValorLido: TGroupBox;
    edtTotalLidas: TEditNumero;
    gbxMarcadas: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edtQtdeMarcadas: TEditNumero;
    edtTotalMarcadas: TEditNumero;
    lblFaturamento_A: TLabel;
    lblVencimentos_A: TLabel;
    Label1: TLabel;
    procedure sbnGerarParcelasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbnGerarTxtClick(Sender: TObject);
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarClienteClick(Sender: TObject);
    procedure ckbSelecionarTodasClick(Sender: TObject);
    procedure dbgParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgParcelasDblClick(Sender: TObject);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);

  protected
    Function InternoPesquisar(Titulo: string): Integer; override;
    Function ValidaControles: Boolean;
    Function ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    Function PermitirPesquisa: Boolean;
    Function TabelaDePesquisa: TZdataSet; override;
    Function TituloPesquisa: string;
    Function JanelaPesquisa: TfrmConsultaBasica; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AtualizarContadores(SoMarcados: Boolean);
    procedure ZerarCampos;

  end;

var
  frmimprimirduplicatas: Tfrmimprimirduplicatas;
  TipoPesquisa: TTecImprimirDuplicatas;


implementation

{$R *.dfm}

uses  dmimprimirduplicatas, dmbasico;


Function Tfrmimprimirduplicatas.InternoPesquisar(Titulo: string): Integer;
begin
  Result:= mrNone;
  if PermitirPesquisa then begin
     dtmImprimirDuplicatas.AbreTabelaConsulta(TipoPesquisa);
     Result := inherited InternoPesquisar(TituloPesquisa);
     if Result = mrOK then
        dtmImprimirDuplicatas.Selecionar(TipoPesquisa);

     dtmImprimirDuplicatas.FechaTabelaConsulta(TipoPesquisa);
  end;
end;

Function Tfrmimprimirduplicatas.PermitirPesquisa: Boolean;
begin
   Result := False;
   if CtrlOn
   then if ActiveControl is TtecFindCustom then begin
                if edfFiliais. Focused then TipoPesquisa:= idFILIAIS
           else if edfClientes.Focused then TipoPesquisa:= idCLIENTES;

           Result:= True;
        end;
end;

Function Tfrmimprimirduplicatas.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
   with dtmImprimirDuplicatas do
      case TipoPesquisa of
         idFILIAIS:  Result:= dtmImprimirDuplicatas.ExisteFiliais (NomeCampo, Value);
         idCLIENTES: Result:= dtmImprimirDuplicatas.ExisteClientes(NomeCampo, Value);
         idCONTAS:   Result:= dtmImprimirDuplicatas.ExisteContas  (NomeCampo, Value);
         else         Result:= False;
      end;
end;

Function Tfrmimprimirduplicatas.TabelaDePesquisa: TZdataSet;
begin
   case TipoPesquisa of
      idFILIAIS:  Result:= dtmImprimirDuplicatas.ConsultarFiliais;
      idCLIENTES: Result:= dtmImprimirDuplicatas.ConsultarClientes;
      idCONTAS:   Result:= dtmImprimirDuplicatas.ConsultarContas;
      else         Result := nil;
   end;
end;

Function Tfrmimprimirduplicatas.TituloPesquisa: string;
begin
   case TipoPesquisa of
      idFILIAIS:  Result:= 'Filiais';
      idCLIENTES: Result:= 'Clientes';
      idCONTAS:   Result:= 'Contas';
    end;
end;

Function Tfrmimprimirduplicatas.ValidaControles: Boolean;
begin
   Result := True;

   if ((edtVenctoInicial.Text = '') or (edtVenctoFinal.Text = '')) then
     if ((edtVendaInicial.Text = '') or (edtVendaFinal.Text = '')) then
       if ((edtNotaInicial.Text = '') or (edtNotaFinal.Text = '')) then
       begin
          MensagemAviso('Intervalo de datas ou notas não informados.');
          edtVenctoInicial.SetFocus;
          Result:= False;      Exit;
       end;

   if (edtVenctoInicial.Text <> '') and (edtVenctoFinal.Text <> '')
   then  if StrToDate(edtVenctoInicial.Text) > StrToDate(edtVenctoFinal.Text) then begin
            MensagemAviso(ctDTINICIALMAIORDTFINAL);
            edtVenctoInicial.SetFocus;
            Result:= False;      Exit;
         end;

   if (edtVendaInicial.Text <> '') and (edtVendaFinal.Text <> '')
   then if (StrToDate(edtVendaInicial.Text)) > (StrToDate(edtVendaFinal.Text)) then begin
           MensagemAviso(ctDTINICIALMAIORDTFINAL);
           edtVendaInicial.SetFocus;
           Result:= False;    Exit;
        end;

   if (edtNotaInicial.Text <> '') and (edtNotaFinal.Text <> '')
   then if StrToInt(edtNotaInicial.Text) > StrToInt(edtNotaFinal.Text) then begin
           MensagemAviso( ctNOTAINICIALMAIORQUENOTAFINAL);
           edtNotaInicial.SetFocus;
           Result:= False;    Exit;
        end;

{
   with dtmImprimirDuplicatas do
      case qryContasBanco.AsInteger of
         001: if (cmbCarteira.Text = '') or                 //BANCO DO BRASIL
                 (edtConvenio.Text = '') or
                 (edtVariacao.Text = '') then begin
                 MensagemAviso(ctCARTEIRACONVENIONAOCADASTRADO);
                 cmbCarteira.SetFocus;
                 Result:= False; Exit;
              end;

          237: if edtAutorizacao.Text = '' then begin           // BRADESCO
                  MensagemAviso(ctAUTORIZACAOBRANCO);
                  edtAutorizacao.SetFocus;
                  Result:= False;    Exit;
               end;
      end;
}
   if edfFiliais.Text = '' then begin
      MensagemAviso(ctCODIGOFILIALBRANCO);
      edfFiliais.SetFocus;
      Result:= False;                Exit;
   end;



end;


constructor Tfrmimprimirduplicatas.Create(AOwner: TComponent);
begin
  dtmImprimirDuplicatas:= TdtmImprimirDuplicatas.Create(Self);
  inherited;
  dtmImprimirDuplicatas.Abre(ctConsultaTabelas);

  edtVendaInicial.Text := datetostr(DataLocal);
  edtVendaFinal.Text := datetostr(DataLocal);

  if ParSistema.ClienteUsaContrato then
  begin
    dbgParcelas.Columns[2].FieldName := 'contrato';
//    dbgParcelas.Columns[2].Alignment:=taLeftJustify;
    dbgParcelas.Columns[2].Title.Caption := 'CONTRATO';

    gbxParcelas.       Caption:= 'PARCELAS';
    ckbSelecionarTodas.Caption:= 'MARCAR TODAS AS PARCELAS';
  end
  else
  begin
    dbgParcelas.Columns[2].FieldName := 'nrdocumento';
    dbgParcelas.Columns[2].Alignment := taRightJustify;
    dbgParcelas.Columns[2].Title.Caption := 'NOTA FISCAL';

    gbxParcelas.       Caption:= 'DUPLICATAS';
    ckbSelecionarTodas.Caption:= 'MARCAR TODAS AS DUPLICATAS';
  end;
end;

Function Tfrmimprimirduplicatas.JanelaPesquisa: TfrmConsultaBasica;
var jan: TfrmConsultaPorCampo;
begin
  jan:=TfrmConsultaPorCampo.Create(nil);
  jan.ConsultaInterativa     := not (TipoPesquisa in [idClientes]) and CtrlOn;
  jan.UsarParametrosDaTabela := False;
  Result:=jan;
end;


procedure Tfrmimprimirduplicatas.AtualizarContadores(SoMarcados: Boolean);
begin
   with dtmImprimirDuplicatas do begin
      if not SoMarcados then begin
         edtQtdeLidas. Text:= IntToStr(QtdeLidas);
         edtTotalLidas.Text:= Format('%8.2m', [TotalLidas]);
    end;
    edtQtdeMarcadas. Text:= IntToStr(QtdeMarcados);
    edtTotalMarcadas.Text:= Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure Tfrmimprimirduplicatas.sbnGerarParcelasClick(Sender: TObject);
begin
   inherited;
   if ValidaControles then with dtmImprimirDuplicatas do begin
      Filiais           := edfFiliais.text;
      Clientes          := edfClientes.Text;
      DataVenctoInicial := edtVenctoInicial.Text;
      DataVenctoFinal   := edtVenctoFinal.Text;
      DataVendaInicial  := edtVendaInicial.Text;
      DataVendaFinal    := edtVendaFinal.Text;
      NotaInicial       := edtNotaInicial.Text;
      NotaFinal         := edtNotaFinal.Text;
      IncluirSomenteCobrancaemCarteira         := ckbIncluirSomenteCobrancaemCarteira.Checked;

      if not abrirParcelas then begin
         MensagemAviso(ctCONSULTAVAZIA);
         edtVenctoInicial.SetFocus;
      end
      else begin
         AtualizarContadores(False);
         dbgParcelas.SetFocus;
      end;
      QtdeMarcados := 0;
      TotalMarcados:= 0;
      AtualizarContadores(False);
   end;
end;

procedure Tfrmimprimirduplicatas.FormShow(Sender: TObject);
Var Ano, Mes, Dia: Word;
begin
  inherited;
  DecodeDate(Now, Ano, Mes, Dia);
  sbnProcurarFilial. Enabled:= True;
  sbnProcurarCliente.Enabled:= True;
  edtVendaInicial.SetFocus;
end;

procedure Tfrmimprimirduplicatas.sbnGerarTxtClick(Sender: TObject);
begin
   inherited;
   if ValidaControles then with dtmImprimirDuplicatas do begin

      if qryParcelas.IsEmpty then begin
         MensagemAviso(ctCONSULTAVAZIA);
         edtVenctoInicial.SetFocus;  Exit;
      end;

      ckbIncluirSomenteCobrancaemCarteira.Checked := False;
   end;
end;

destructor Tfrmimprimirduplicatas.Destroy;
begin
  inherited;
  frmImprimirDuplicatas:= nil;
end;

procedure Tfrmimprimirduplicatas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F6 then begin
    if sbnGerarParcelas.Enabled  then
      sbnGerarParcelas.Click;
  end;
  if key = VK_F7 then
  begin
    if sbnImprimir.Enabled then
      ;
  end;
end;


procedure Tfrmimprimirduplicatas.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFiliais.SetFocus;
  InternoPesquisar('')
end;


procedure Tfrmimprimirduplicatas.sbnProcurarClienteClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfClientes.SetFocus;
  InternoPesquisar('')
end;

procedure Tfrmimprimirduplicatas.ckbSelecionarTodasClick(Sender: TObject);
begin
  inherited;
  dtmImprimirDuplicatas.MarcarRegistrosSelecionados(ckbSelecionarTodas.Checked, True);
  AtualizarContadores(True);
end;

procedure Tfrmimprimirduplicatas.dbgParcelasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgParcelas.DataSource.DataSet.FieldByName('selecionar').AsBoolean then begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure Tfrmimprimirduplicatas.dbgParcelasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
       dtmImprimirDuplicatas.MarcarRegistrosSelecionados(ckbSelecionarTodas.Checked, False);
       AtualizarContadores(True);
    end;
end;

procedure Tfrmimprimirduplicatas.dbgParcelasDblClick(Sender: TObject);
begin
  inherited;
  dtmImprimirDuplicatas.MarcarRegistrosSelecionados(ckbSelecionarTodas.Checked, False);
  AtualizarContadores(True);
end;


procedure TfrmImprimirDuplicatas.ZerarCampos;
begin
   edtQtdeLidas.    Clear;
   edtQtdeMarcadas. Clear;
   edtTotalLidas.   Clear;
   edtTotalMarcadas.Clear;
   dtmImprimirDuplicatas.QtdeMarcados := 0;
end;

procedure Tfrmimprimirduplicatas.actHabilitarUpdate(Sender: TObject);
begin
   inherited;
   with dtmImprimirDuplicatas do begin
      sbnImprimir.Enabled := QtdeMarcados > 0;
   end;
end;

procedure Tfrmimprimirduplicatas.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmImprimirDuplicatas.ImprimirDuplicatas;
end;

end.


