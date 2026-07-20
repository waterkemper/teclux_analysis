unit fmsituacaocarta;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, DBCtrls, Mask, dmaviso,
  // Biblio
   biblio,
  // Constantes
  ctconstantes,
  // Repositorio
  fmcadastropadrao,
  // Componentes
  cpdbdata, ComCtrls, ToolWin;

type
  TfrmSituacaoCarta = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxSituacaoCarta: TGroupBox;
    lblDevolvida: TLabel;
    edtDevolvida: TDBEditData;
    lblConfirmada: TLabel;
    edtConfirmada: TDBEditData;
    ckbMarcar: TDBCheckBox;
    ckbConfirmarTodasCartas: TCheckBox;
    procedure ckbMarcarClick(Sender: TObject);
    procedure edtConfirmadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
    dtmAviso: TdtmAviso;
    function  InternoGravar: Boolean; override;
    function ValidaSituacaoCarta: Boolean;
  public
    procedure  SetDataModulo(Dtm: TdtmAviso);
    destructor Destroy; override;
  end;

var
  frmSituacaoCarta: TfrmSituacaoCarta;

implementation

{$R *.dfm}

destructor TfrmSituacaoCarta.Destroy;
begin
  inherited;
  frmSituacaoCarta := nil;
end;

function TfrmSituacaoCarta.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
   if ValidaSituacaoCarta and sbnSalvar.Enabled then
   begin
     dtmAviso.GravarAlteracoesCarta(ckbConfirmarTodasCartas.Checked);
     Close;
   end;
end;

function TfrmSituacaoCarta.ValidaSituacaoCarta: Boolean;
begin
 result := (edtDevolvida.DataValida and edtConfirmada.DataValida);
 if result then
   if (not DataEmBranco(edtDevolvida.Text)) then
   begin
     result := strtodate(edtDevolvida.Text) >= StrToDate(copy(dtmAviso.Cartaenviada,1,10));
     if not result then
     begin
       MensagemErro(ctDEVOLUCAOMENORENVIO);
       edtDevolvida.SetFocus;
       edtDevolvida.SelectAll;
     end;
   end;
 if result then
   if (not DataEmBranco(edtConfirmada.Text)) then
   begin
     result := strtodate(edtConfirmada.text) >= strtodate(copy(dtmAviso.Cartaenviada,1,10));
     if not result then
     begin
       MensagemErro(ctCONFIRMACAOMENORENVIO);
       edtConfirmada.SetFocus;
       edtConfirmada.SelectAll;
     end;
   end;
end;

procedure TfrmSituacaoCarta.ckbMarcarClick(Sender: TObject);
begin
  inherited;
  dtmAviso.MarcarCartasSelecionadas(False, False);
end;

procedure TfrmSituacaoCarta.edtConfirmadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterouReturn(Key) and (Shift =[]) then
    InternoGravar;
end;

procedure TfrmSituacaoCarta.SetDataModulo(Dtm: TdtmAviso);
begin
  dtmAviso := Dtm;
end;

end.
