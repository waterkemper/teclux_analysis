unit fmconsultaosp;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, dateutils,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, Windows,
  cppagecontrol, Mask, cpdbfindcontrols, DBCtrls, cpdbtext, cpdata,
  Grids, DBGrids, cpdbgrid, cpnumero, cpdbmemo, cpdbdata, cptexto,
  dmconsultaosp, frconsulta, frconsultacodigo, ctconstantes,
  biblio, clparametrossistema, ToolWin, Spin;

type
  TfrmConsultaOsp = class(TfrmCadastroPadrao)
    sbnGerar: TSpeedButton;
    sbnImprmir: TSpeedButton;
    pgcConsultasOSP: TtecPageControl;
    tstParametros: TTabSheet;
    tstregistros: TTabSheet;
    dbgOSP: TtecDBGrid;
    gbxparametroCliente: TGroupBox;
    gbxOSP: TGroupBox;
    pgcDadosOSP: TtecPageControl;
    pnlDadosOSP: TPanel;
    tstOperacoes: TTabSheet;
    tstObservacoes: TTabSheet;
    tstListaComponentes: TTabSheet;
    dbgOperacoes: TtecDBGrid;
    gbxObservacoes: TGroupBox;
    mmoobservacoes: TtecDBMemo;
    gbxDadosMarcacao: TGroupBox;
    mmodadosmarcacao: TtecDBMemo;
    gbxCliente: TGroupBox;
    edtcodigoCliente: TDBEditNumero;
    edtNomeCliente: TDBEditTexto;
    gbxNumeroOSP: TGroupBox;
    edtnumeroOSP: TDBEditNumero;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    edtentrega: TDBEditData;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    gbxNrNoCliente: TGroupBox;
    edtNrNoCliente: TDBEditTexto;
    gbxData: TGroupBox;
    edtDataPedido: TDBEditData;
    gbxProdutonoCliente: TGroupBox;
    gbxProdutoCliente: TGroupBox;
    edtProdutoCliente: TDBEditTexto;
    gbxFinalidade: TGroupBox;
    edtFinalidade: TDBEditTexto;
    gbxOrigem: TGroupBox;
    edtOrigem: TDBEditTexto;
    gbxPN: TGroupBox;
    edtPN: TDBEditTexto;
    gbxQuantidadeProduto: TGroupBox;
    gbxPedida: TGroupBox;
    edtQuantidade: TDBEditNumero;
    gbxEntregue: TGroupBox;
    dtxEntregue: TtecDBText;
    gbxSaldo: TGroupBox;
    dtxSaldo: TtecDBText;
    gbxPrecos: TGroupBox;
    gbxPreco: TGroupBox;
    edtPreco: TDBEditNumero;
    gbxTotal: TGroupBox;
    dtxTotal: TtecDBText;
    dbgComponentes: TtecDBGrid;
    dtxUnidade: TtecDBText;
    fraConsultaClientes: TfraConsultaCodigo;
    dtxSemana: TtecDBText;
    dtxano: TtecDBText;
    dtxPrioridade: TtecDBText;
    GroupBox1: TGroupBox;
    fraConsultaOSPInicial: TfraConsultaCodigo;
    GroupBox2: TGroupBox;
    fraConsultaOSPFinal: TfraConsultaCodigo;
    ckbSelecionarTodas: TCheckBox;
    gbxSemanaEntradaConsultaOSP: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    edtSemanaEntradaConsultaOSP: TSpinEdit;
    edtAnoEntradaConsultaOSP: TSpinEdit;
    gbxSemanaEntregaConsultaOSP: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    edtSemanaEntregaConsultaOSP: TSpinEdit;
    edtAnoEntregaConsultaOSP: TSpinEdit;
    ckbSelecionarSoNaoImpressas: TCheckBox;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnImprmirClick(Sender: TObject);
    procedure dbgOSPDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgOSPDblClick(Sender: TObject);
    procedure fraConsultaOSPInicialedfCodigoMessage(var Msg: String);
    procedure fraConsultaOSPFinaledfCodigoMessage(var Msg: String);
    procedure edtSemanaEntradaExit(Sender: TObject);
    procedure edtSemanaEntregaExit(Sender: TObject);
    procedure edtAnoEntradaConsultaOSPExit(Sender: TObject);
    procedure edtAnoEntregaConsultaOSPExit(Sender: TObject);
    procedure edtSemanaEntregaConsultaOSPExit(Sender: TObject);
    procedure edtSemanaEntradaConsultaOSPExit(Sender: TObject);
    procedure ckbSelecionarTodasClick(Sender: TObject);
    procedure ckbSelecionarSoNaoImpressasClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function ValidarCampos: Boolean;
    
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmConsultaOsp: TfrmConsultaOsp;

implementation

{$R *.dfm}

{ TfrmConsultaOsp }

constructor TfrmConsultaOsp.Create(AOwner: TComponent);
begin
  dtmConsultaOsp := TdtmConsultaOsp.Create(Self);
  inherited;
  DataSet:= dtmConsultaOsp.qryOsp;
  sbnImprmir.Enabled:= False;
  pgcConsultasOSP.ActivePage:= tstParametros;
  fraConsultaClientes.TipoPesquisa:= pesCLIENTES;
  fraConsultaClientes.TipoCliente := 'C';
  fraConsultaOSPInicial.TipoPesquisa:= pesOSP;
  fraConsultaOSPFinal.TipoPesquisa  := pesOSP;
  edtAnoEntradaConsultaOSP.Text:= FStr(YearOf(DataLocal),$41);
  edtAnoEntregaConsultaOSP.Text:= FStr(YearOf(DataLocal),$41);
end;

procedure TfrmConsultaOsp.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarCampos then
  begin
    with dtmConsultaOsp do
    begin
      SemanaEntrada    := edtSemanaEntradaConsultaOSP.Text;
      AnoEntrada       := edtAnoEntradaConsultaOSP.text;

      SemanaEntrega    := edtSemanaEntregaConsultaOSP.Text;
      AnoEntrega       := edtAnoEntregaConsultaOSP.Text;

      Cliente          := fraConsultaClientes.edfCodigo.Text;
      NumeroOSPInicial := fraConsultaOSPInicial.edfCodigo.Text;
      NumeroOSPFinal   := fraConsultaOSPFinal.edfCodigo.Text;

      if GerarConsulta then
      begin
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO, [ctOSP]));
        pgcConsultasOSP.ActivePageIndex:=0;
        edtSemanaEntradaConsultaOSP.SetFocus;
      end
      else
      begin
        pgcConsultasOSP.ActivePageIndex:=1;
        dbgOSP.SetFocus;
        sbnImprmir.Enabled:= True;
      end;
    end;
  end;
end;

procedure TfrmConsultaOsp.sbnImprmirClick(Sender: TObject);
begin
  inherited;
  dtmConsultaOsp.ImprimirRelatorio;
end;

procedure TfrmConsultaOsp.dbgOSPDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
//  TDBGrid(Sender).Canvas.Brush.Color := $0080FFFF;
  TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('imprimir').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clYellow;
//    TDBGrid(Sender).Canvas.Font.Color  := clYellow;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

function TfrmConsultaOsp.ValidarCampos: Boolean;
begin
  result:= True;
  if (((fraConsultaOSPInicial.edfCodigo.Text)<> '') and ((fraConsultaOSPFinal.edfCodigo.Text) <> '')) then
  begin
    if strtoint((fraConsultaOSPInicial.edfCodigo.Text)) > strtoint((fraConsultaOSPFinal.edfCodigo.Text)) then
    begin
      MensagemAviso(Format(ctINTERVALOINCORRETO,['a OSP','OSP']));
      Result:= False;
    end;
  end;

  if result then
  begin
    if ((edtAnoEntradaConsultaOSP.Text) = '') then
    begin
      MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO,['Ano de Entrada']));
      result := false;
      edtAnoEntradaConsultaOSP.SetFocus;
    end;

    if ((edtAnoEntregaConsultaOSP.Text) = '') then
    begin
      MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO,['Ano de Entrega']));
      result := false;
      edtAnoEntregaConsultaOSP.SetFocus;
    end;

    if ((edtSemanaEntregaConsultaOSP.Text) = '') then
    begin
      MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO,['Semana de Entrega']));
      result := false;
      edtSemanaEntregaConsultaOSP.SetFocus;
    end;

    if ((edtSemanaEntradaConsultaOSP.Text) = '') then
    begin
      MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO,['Semana de Entrada']));
      result := false;
      edtSemanaEntradaConsultaOSP.SetFocus;
    end;
  end;
end;

procedure TfrmConsultaOsp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =VK_F6 then
    sbnGerarClick(Self)
  else if Key =VK_F7 then
    sbnImprmirClick(Self);
end;

procedure TfrmConsultaOsp.dbgOSPDblClick(Sender: TObject);
begin
  inherited;
  dtmConsultaOsp.MarcarSelecionados(False,False);
end;

procedure TfrmConsultaOsp.fraConsultaOSPInicialedfCodigoMessage(var Msg: String);
begin
  inherited;
  fraConsultaOSPInicial.edfCodigoMessage(Msg);
  msg := 'OSP não cadastrada';
end;

procedure TfrmConsultaOsp.fraConsultaOSPFinaledfCodigoMessage(var Msg: String);
begin
  inherited;
  fraConsultaOSPFinal.edfCodigoMessage(Msg);
  msg := 'OSP não cadastrada';
end;

procedure TfrmConsultaOsp.edtSemanaEntradaExit(Sender: TObject);
begin
  inherited;
  if edtSemanaEntradaConsultaOSP.Text <> '' then
    edtSemanaEntradaConsultaOSP.Text:= preencheString(edtSemanaEntradaConsultaOSP.Text,'0',2,False);
end;

procedure TfrmConsultaOsp.edtSemanaEntregaExit(Sender: TObject);
begin
  inherited;
  if edtSemanaEntregaConsultaOSP.Text <> '' then
    edtSemanaEntregaConsultaOSP.Text:= preencheString(edtSemanaEntregaConsultaOSP.Text,'0',2,False);
end;

procedure TfrmConsultaOsp.edtAnoEntradaConsultaOSPExit(Sender: TObject);
begin
  inherited;
  if (edtAnoEntradaConsultaOSP.Text<>'') and
     (edtAnoEntradaConsultaOSP.Text<>'0') then
  begin
    edtSemanaEntradaConsultaOSP.MaxValue := WeeksInAYear(strtoint(edtAnoEntradaConsultaOSP.Text));
    if (edtSemanaEntradaConsultaOSP.Text <> '') and
       (strtoint(edtSemanaEntradaConsultaOSP.Text) > edtSemanaEntradaConsultaOSP.MaxValue) then
      edtSemanaEntradaConsultaOSP.Text := inttostr(edtSemanaEntradaConsultaOSP.MaxValue);
  end;
    if (edtAnoEntradaConsultaOSP.Text='') then
  begin
      edtAnoEntradaConsultaOSP.Text := '0';
  end;
  edtSemanaEntregaConsultaOSPExit(nil);
  edtAnoEntregaConsultaOSPExit(nil);

end;

procedure TfrmConsultaOsp.edtAnoEntregaConsultaOSPExit(Sender: TObject);
 begin
   inherited;
    if (edtAnoEntregaConsultaOSP.Text<>'') and
     (edtAnoEntregaConsultaOSP.Text<>'0') then
   begin
     edtSemanaEntregaConsultaOSP.MaxValue := WeeksInAYear(strtoint(edtAnoEntregaConsultaOSP.Text));
     if (edtSemanaEntregaConsultaOSP.Text <> '') and
        (strtoint(edtSemanaEntregaConsultaOSP.Text) > edtSemanaEntregaConsultaOSP.MaxValue) then
       edtSemanaEntregaConsultaOSP.Text := inttostr(edtSemanaEntregaConsultaOSP.MaxValue);

     if (StrToInt(edtAnoEntregaConsultaOSP.Text)) < (StrToInt(edtAnoEntradaConsultaOSP.Text)) then
         edtAnoEntregaConsultaOSP.Text := edtAnoEntradaConsultaOSP.Text;

   end;

    if (edtAnoEntregaConsultaOSP.Text='') then
   begin
      edtAnoEntregaConsultaOSP.Text := '0';

   end;
 end;
procedure TfrmConsultaOsp.edtSemanaEntregaConsultaOSPExit(Sender: TObject);
begin
  inherited;

  if (edtSemanaEntregaConsultaOSP.Text='') then
    edtSemanaEntregaConsultaOSP.Text := '0';

  if (edtAnoEntregaConsultaOSP.Text<>'') and
     (edtAnoEntregaConsultaOSP.Text<>'0') then
  begin
   if (edtAnoEntradaConsultaOSP.Text<>'') and
      ((strtoint(edtAnoEntradaConsultaOSP.Text)) = (StrToInt(edtAnoEntregaConsultaOSP.Text))) and
      ((StrToInt(edtSemanaEntradaConsultaOSP.Text)) >= (StrToInt(edtSemanaEntregaConsultaOSP.Text))) then
          edtSemanaEntregaConsultaOSP.Text := edtSemanaEntradaConsultaOSP.Text;
  end;


end;

procedure TfrmConsultaOsp.edtSemanaEntradaConsultaOSPExit(Sender: TObject);
begin
  inherited;
  if (edtSemanaEntradaConsultaOSP.Text='') then
  begin
      edtSemanaEntradaConsultaOSP.Text := '0';
  end;
  edtSemanaEntregaConsultaOSPExit(nil);
end;

procedure TfrmConsultaOsp.ckbSelecionarTodasClick(Sender: TObject);
begin
  inherited;
  dtmConsultaOsp.MarcarSelecionados(ckbSelecionarTodas.Checked, true);
end;

procedure TfrmConsultaOsp.ckbSelecionarSoNaoImpressasClick(Sender: TObject);
begin
  inherited;
  dtmConsultaOsp.MarcarSoNaoImpressas(ckbSelecionarSoNaoImpressas.Checked, true);
end;

end.


