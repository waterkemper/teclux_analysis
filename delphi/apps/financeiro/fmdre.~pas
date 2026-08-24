unit fmdre;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, cpdata, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols, ComCtrls, cppagecontrol, Buttons, ctconstantes, biblio,
  DB, ZQuery, ZPgSqlQuery, cpquery, cpeditioncontrolvalidation,
  fmrelatoriopadrao,
  fmconsultabasica,
  fmconsultaporcampo, frconsultafilialgrupofilial, frconsulta,
  frconsultaippgcm, frconsultacodigo, clparametrossistema, ToolWin;

type
  Tfrmdre = class(TfrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    rgpAgrupamento: TRadioGroup;
    lblA: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    rgpRegime: TRadioGroup;
  private
    { Private declarations }
  protected
    procedure InternoImpressao; override;
  public
    { Public declarations  }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    procedure MontaPesquisa;
    function  ValidarCamposSelecao: Boolean;
  end;

var
  frmdre: Tfrmdre;
  TipoPesquisa      : TtecRelatorioVendas;

implementation

uses dmdre;

{$R *.dfm}

{ Tfrmdre }

constructor Tfrmdre.Create(
  Aowner: Tcomponent);
begin
  inherited;
  dtmdre := Tdtmdre.Create(Self);
  dtmdre.Abre(ctTabelas);
  edtDataInicial.Text := DateToStr(UltimoDiaMesPassado(1));
  edtDataFinal.Text := DateToStr(DataLocal);

  edtDataInicial.setfocus;
  edtDataInicial.selectall;


end;

destructor Tfrmdre.Destroy;
begin
  dtmdre:=nil;
  inherited;
  frmdre:=nil;
end;

procedure Tfrmdre.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

procedure Tfrmdre.MontaPesquisa;
begin
  if ValidarCamposSelecao then begin
    with dtmdre do
    begin
      ParametroCabecalho      := '';
      DataInicial             := edtDataInicial.Text;
      DataFinal               := edtDataFinal.Text;
      AgruparGrupoProduto     := rgpAgrupamento.itemindex = 0;
      AgruparClasseProduto    := rgpAgrupamento.itemindex = 1;
      Regime := rgpRegime.itemindex;

      if AbrirRelatorio then
       ImprimirRelatorio('DEMONSTRATIVO DO RESULTADO DO EXERCÍCIO')
      else
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;
end;

function Tfrmdre.ValidarCamposSelecao: Boolean;
begin
   Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
   if Result then
   begin
    if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
      Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
    if result then
    begin
      Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
      if not Result then
      begin
       MensagemAviso(ctDATAINVALIDA);
       edtDataInicial.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicial.SetFocus;
    end;
   end;
end;

end.
