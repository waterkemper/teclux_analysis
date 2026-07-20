unit fmatualizacaomonetaria;

interface

uses
  SysUtils, Windows, Types, Classes, Graphics, Controls, Forms, Dialogs, {Qete,}
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, cpdata, DateUtils,
  //Repositorio
  fmcadastropadrao, frLancamentoContabilidade, fmajudabt, frconsulta,
  frconsultacodigo,
  //Biblio
  Biblio, ctconstantes, clparametrossistema,
  //Projeto
  dmatualizacaomonetaria, fmprocessando, ToolWin;

type
  Tfrmatualizacaomonetaria = class(TfrmAjudaBt)
    sbnGerarParcelas: TSpeedButton;
    sbnExcluir: TSpeedButton;
    pnlDados: TPanel;
    gbxPeriodo: TGroupBox;
    edtPeriodo: TEditMesAno;
    lblMesDa: TLabel;
    lblAtualizacao: TLabel;
    procedure sbnGerarParcelasClick(Sender: TObject);
  private
    { Private declarations }

  protected
    procedure ObterParametros;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    { Public declarations }
  end;

var
  frmatualizacaomonetaria: Tfrmatualizacaomonetaria;

implementation


{$R *.dfm}

{ Tfrmatualizacaomonetaria }

constructor Tfrmatualizacaomonetaria.Create(AOwner: TComponent);
begin
  inherited;
  dtmatualizacaomonetaria := Tdtmatualizacaomonetaria.Create(Self);
end;

destructor Tfrmatualizacaomonetaria.Destroy;
begin
  dtmatualizacaomonetaria:= Nil;
  inherited;
end;

procedure Tfrmatualizacaomonetaria.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F6 then
    sbnGerarParcelasClick(Self);
end;

procedure Tfrmatualizacaomonetaria.ObterParametros;
begin
  dtmatualizacaomonetaria.Mes:= MonthOf(strtodate('01/'+edtPeriodo.Text));
  dtmatualizacaomonetaria.Exercicio:= YearOf(strtodate('01/'+edtPeriodo.Text));
end;

procedure Tfrmatualizacaomonetaria.sbnGerarParcelasClick(Sender: TObject);
begin
  inherited;
  if edtPeriodo.Text <> '' then
  begin
    if (StrToDate('01/'+ edtPeriodo.Text) > ParSistema.DataContabil) then
    begin
      ObterParametros;
      if dtmatualizacaomonetaria.GerarAtualizacaoMonetaria then
        MensagemAviso(ctOPERACAOREALIZADACOMSUCESSO)
      else
        MensagemAviso(format(ctCAMPODEVESERPREENCHIDO,['Período']));
    end
    else
         MensagemAviso(format(ctDATACONTABILMAIORPERIODO,[edtPeriodo.Text, ParSistema.DataContabilString]));
  end;
end;

end.
