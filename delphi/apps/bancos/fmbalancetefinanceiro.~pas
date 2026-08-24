unit fmbalancetefinanceiro;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DB,
  StdCtrls, fmrelatoriopadrao, QCheckLst, cpdata, cpnumero, ExtCtrls,
  Buttons, Biblio, frlistafiliais, frconsulta, frconsultacodigo, {Qete,}
  ctconstantes, dmbalancetefinanceiro, Mask,
  cpdbfindcontrols, Grids, DBGrids, cpdbgrid, ToolWin, ComCtrls;

type
  TfrmBalanceteFinanceiro = class(TfrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    rgpBalancete: TRadioGroup;
    lblA: TLabel;
    gbxImprimir: TGroupBox;
    gbxContas: TGroupBox;
    edtDataInicial: TEditMesAno;
    edtDataFinal: TEditMesAno;
    dbgContas: TtecDBGrid;

    ckbSelecionarTodas: TCheckBox;
    stxBalancete: TStaticText;
    ckbSoContasComSaldo: TCheckBox;
    ckbEventosSemMovimento: TCheckBox;
    ckbCodigoEvento: TCheckBox;
    ckbPularLinhaAntesSintetica: TCheckBox;
    ckbDespesasOutraPagina: TCheckBox;
    stxEventoSintetico: TStaticText;

    procedure ckbSelecionarTodasClick(Sender: TObject);
    procedure dbgContasDblClick(Sender: TObject);
    procedure dbgContasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ckbSoContasComSaldoClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function ValidaCampos: Boolean;
    procedure InternoImpressao; override;

  public
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy; override;
    { Public declarations }
  end;

var
  frmbalancetefinanceiro: TfrmBalanceteFinanceiro;

implementation

{$R *.dfm}

{ TfrmBalanceteFinanceiro }



constructor TfrmBalanceteFinanceiro.Create(AOwner: TComponent);
begin
   dtmBalanceteFinanceiro:= TdtmBalanceteFinanceiro.Create(Self);
   inherited;
   ckbSelecionarTodas.Checked:= False;
   ckbSoContasComSaldoClick(Self);

   edtDataInicial.Text:= FormatDateTime('mm/yyyy',PrimeiroDiaMesPassado(1));
   edtDataFinal.  Text:= FormatDateTime('mm/yyyy',UltimoDiaMesPassado(1));
   edtDataInicial.SetFocus;
   edtDataInicial.SelectAll;
end;



destructor TfrmBalanceteFinanceiro.Destroy;
begin
   dtmBalanceteFinanceiro:= nil;
   inherited;
   frmbalancetefinanceiro:= nil;
end;



procedure TfrmBalanceteFinanceiro.InternoImpressao;
begin
   inherited;
   if ValidaCampos
   then with dtmBalanceteFinanceiro do
      ImprimirBalanceteFinanceiro(rgpBalancete.ItemIndex,
                                  edtDataInicial.Text,
                                  edtDataFinal.  Text,

                                  ckbSoContasComSaldo.        Checked,
                                  ckbEventosSemMovimento.     Checked,
                                  ckbCodigoEvento.            Checked,
                                  ckbPularLinhaAntesSintetica.Checked,
                                  ckbDespesasOutraPagina.     Checked);
end;



function TfrmBalanceteFinanceiro.ValidaCampos: Boolean;
begin
   result := (not MesAnoEmBranco(edtDataInicial.text) and not MesAnoEmBranco(edtDataFinal.text));
   if result then begin
      result := edtDataInicial.DataValida and edtDataFinal.DataValida;
      if result then begin
         Result:=StrToDate('01/'+edtDataInicial.Text) <= StrToDate('01/'+edtDataFinal.Text);
         if result then begin
            dtmBalanceteFinanceiro.AtribuirDatas(('01/'+edtDataInicial.Text),('01/'+edtDataFinal.Text));
            Result:= dtmBalanceteFinanceiro.NrMesesIntervalo <= 12;
            if not Result then begin
               MensagemAviso('O período tem mais do que 12 meses');
               edtDataInicial.SetFocus;
            end;
         end
         else begin
            MensagemAviso('A data inicial tem que ser anterior ou igual à data final');
            edtDataInicial.SetFocus;
         end;
      end
      else begin
         MensagemAviso(ctDATAINVALIDA);
         edtDataInicial.SetFocus;
      end;
   end
   else begin
      MensagemAviso(ctDATAEMBRACO);
      edtDataInicial.SetFocus;
   end;
end;



procedure TfrmBalanceteFinanceiro.ckbSelecionarTodasClick(Sender: TObject);
begin
  inherited;
  dtmBalanceteFinanceiro.SelecionarContas(ckbSelecionarTodas.Checked, True);
end;



procedure TfrmBalanceteFinanceiro.dbgContasDblClick(Sender: TObject);
begin
  inherited;
  dtmBalanceteFinanceiro.SelecionarContas(False, False);
end;

procedure TfrmBalanceteFinanceiro.dbgContasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
    if not (gdFocused in State) then
  begin
    if dbgContas.DataSource.DataSet.FieldByName('selecionada').AsBoolean then  begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    end;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmBalanceteFinanceiro.ckbSoContasComSaldoClick(Sender: TObject);
begin
   inherited;
   with dtmBalanceteFinanceiro do begin
      qryContasBancarias.Close;
      qryContasBancarias.ParamByName('SoContasComSaldo').AsBoolean:= ckbSoContasComSaldo.Checked;
      qryContasBancarias.Open;
  end;
end;

end.
