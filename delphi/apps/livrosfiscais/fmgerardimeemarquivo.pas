unit fmgerardimeemarquivo;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  //Repositorio
  fmajudabt, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask, Windows,
  clparametrossistema, Grids, DBGrids, cpdbgrid, cpdata, CheckLst, ToolWin;

type
  TfrmGerarDIMEEmArquivo = class(TfrmAjudaBt)
    sbnGerarArquivo: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    gbxPeriodo: TGroupBox;
    edtMesInicial: TEditMesAno;
    edtMesFinal: TEditMesAno;
    gbxFiliais: TGroupBox;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    gbxGrupodeFiliais: TGroupBox;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    dlgArquivoaExportar: TSaveDialog;
    lblA: TLabel;
    gbxArquivo: TGroupBox;
    lblArquivo: TLabel;
    sbnArquivo: TSpeedButton;
    procedure sbnGerarArquivoClick(Sender: TObject);
    procedure sbnArquivoClick(Sender: TObject);
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure clbFiliaisClickCheck(Sender: TObject);
    procedure clbGrupodeFiliaisClickCheck(Sender: TObject);
  protected
    procedure GerarArquivo;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  ValidarCamposSelecao: Boolean;

  public
    constructor Create(AOwner: TComponent); override;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);

  end;

var
  frmGerarDIMEEmArquivo: TfrmGerarDIMEEmArquivo;

implementation

uses
  //CLX
  {Qete,}
  //Biblio
  ctconstantes, biblio,
  //Projeto
  dmgerardimeemarquivo;

{$R *.dfm}

{ TfrmGerarDIMEEmArquivo }

constructor TfrmGerarDIMEEmArquivo.Create(AOwner: TComponent);
begin
  inherited;
  dtmGerarDIMEEmArquivo := TdtmGerarDIMEEmArquivo.Create(Self);
  edtMesInicial.Text := FormatDateTime('mm/yyyy',UltimoDiaMesPassado(1));
  edtMesFinal.  Text := edtMesInicial.Text;

  ObterLista(dtmGerarDIMEEmArquivo.ListaFiliais, clbFiliais);
  ObterLista(dtmGerarDIMEEmArquivo.ListaGruposFiliais, clbGrupodeFiliais);
end;

procedure TfrmGerarDIMEEmArquivo.GerarArquivo;
begin
  if ValidarCamposSelecao then begin
    with dtmGerarDIMEEmArquivo do
    begin
     MesInicial := edtMesInicial.Text;
     MesFinal   := edtMesFinal.Text;
     MontarFiltroFiliais(clbFiliais);
     MontarFiltroGrupoFiliais(clbGrupodeFiliais);
     if AbrirQuadrosDime then
     begin
        if GerarArquivo(lblArquivo.Caption) then
          MensagemAviso(format(ctARQUIVOGERADOSUCESSO,[lblArquivo.Caption]));
     end
     else
       MensagemAviso(ctCONSULTAVAZIA);
    end;
  end;
end;

procedure TfrmGerarDIMEEmArquivo.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = []) and (Key = VK_F6) then
    GerarArquivo
end;

procedure TfrmGerarDIMEEmArquivo.sbnGerarArquivoClick(Sender: TObject);
begin
  inherited;
  GerarArquivo
end;

procedure TfrmGerarDIMEEmArquivo.sbnArquivoClick(Sender: TObject);
begin
  inherited;
  if dlgArquivoaExportar.Execute then
   lblarquivo.Caption:=trim(dlgArquivoaExportar.FileName);
end;

procedure TfrmGerarDIMEEmArquivo.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmGerarDIMEEmArquivo.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, True);
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmGerarDIMEEmArquivo.sbnDesmarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);
end;

procedure TfrmGerarDIMEEmArquivo.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, True);
  MarcarLista(clbFiliais, False);
end;

procedure TfrmGerarDIMEEmArquivo.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmGerarDIMEEmArquivo.clbFiliaisClickCheck(Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmGerarDIMEEmArquivo.clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);
end;

function TfrmGerarDIMEEmArquivo.ValidarCamposSelecao: Boolean;
begin
  result := edtMesInicial.DataValida and edtMesFinal.DataValida;
  if result then
  begin
   result := (not MesAnoEmBranco(edtMesInicial.text) and not MesAnoEmBranco(edtMesFinal.text));
   if result then
   begin
    Result:=StrToDate('01/'+edtMesInicial.Text) <= StrToDate('01/'+edtMesFinal.Text);
    if not result then
    begin
     MensagemAviso(ctDTINICIALMAIORDTFINAL);
     edtMesInicial.SetFocus;
    end;
   end
   else
   begin
     MensagemAviso(ctDATAINVALIDA);
     edtMesInicial.SetFocus;
   end;
  end;

  if result then
   if (ParSistema.CPFContador='') or
     (parsistema.nomeContador='') then
   begin
    result := false;
    MensagemErro(ctDADOSCONTABILISTANAOFINFORMADOS);
   end;

end;

end.
