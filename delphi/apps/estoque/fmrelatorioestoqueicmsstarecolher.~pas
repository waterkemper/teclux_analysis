unit fmrelatorioestoqueicmsstarecolher;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, frconsulta, DateUtils,
  frconsultacodigo, cpdata, CheckLst, ComCtrls, cppagecontrol,
  dmrelatorioestoqueicmsstarecolher, frlistafiliais, ctconstantes, Biblio,
  cpnumero, ToolWin;

type
  Tfrmrelatorioestoqueicmsstarecolher = class(TfrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    edtDataInventario: TEditData;
    edtLivro: TEditNumero;
    edtPagina: TEditNumero;
    edtMaximo: TEditNumero;
    gbxFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    GroupBox1: TGroupBox;
    gbxLivro: TGroupBox;
    gbxPagina: TGroupBox;
    gbxMaximo: TGroupBox;
  private
    { Private declarations }
    ListaFiliais : String;
    Fornecedor   : String;
    Produto      : String;
    DataInicial  : String;
    DataFinal    : String;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function  ValidarCamposSelecao: Boolean;
    procedure InternoImpressao; override;
  public
    { Public declarations }
  end;

var
  frmrelatorioestoqueicmsstarecolher: Tfrmrelatorioestoqueicmsstarecolher;

implementation

{$R *.dfm}

{ Tfrmrelatorioestoqueicmsstarecolher }

constructor Tfrmrelatorioestoqueicmsstarecolher.Create(AOwner: TComponent);
begin
  inherited;
  dtmrelatorioestoqueicmsstarecolher:= Tdtmrelatorioestoqueicmsstarecolher.Create(Self);
  edtDataInventario.Text :=  '30/04/2010';
  fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaFilial.edfCodigo.Text := inttostr(dtmrelatorioestoqueicmsstarecolher.filialbase);
  fraconsultafilial.edfCodigo.Exist;
end;

destructor Tfrmrelatorioestoqueicmsstarecolher.Destroy;
begin
  inherited;
  dtmrelatorioestoqueicmsstarecolher:= nil;
end;

procedure Tfrmrelatorioestoqueicmsstarecolher.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    with dtmrelatorioestoqueicmsstarecolher do
    begin
      filial := strtoint(fraConsultaFilial.edfCodigo.text);
      DataInventario  := strtodatetime(edtDataInventario.text);
      ParametroLivro  := edtlivro.ValorSemFormatacao;
      ParametroPagina := edtpagina.ValorSemFormatacao;
      ParametroMaximo := edtMaximo.ValorSemFormatacao;
      ImprimirRelatorio;
    end;
  end
end;

function Tfrmrelatorioestoqueicmsstarecolher.ValidarCamposSelecao: Boolean;
begin
  result := true;
  if DataEmBranco(edtDataInventario.Text) then
  begin
    Result:= False;
    MensagemErro('A data do inventário não foi informada.')
  end
  else
  if fraConsultaFilial.qryProcuraFiliais.RecordCount = 0 then
  begin
    result := false;
    MensagemErro('A filial não foi informada.')
  end;
end;

end.
