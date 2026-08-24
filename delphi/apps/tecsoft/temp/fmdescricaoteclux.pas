unit fmdescricaoteclux;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmDescricaoTecLUX = class(TForm)
    bbnOK: TBitBtn;
    imgSobre: TImage;
    lblVersaoSistema: TLabel;
    lblVersaoBanco: TLabel;
    lblLicenciadoPara: TLabel;
    lblSiteEmail: TLabel;
    lblCopyright: TLabel;
    lblVersaoSistema1: TLabel;
    lblVersaoBanco1: TLabel;
    lblLicenciadoPara1: TLabel;
    procedure lblSiteClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

Uses
  //CLX
  versao;

{$R *.dfm}

constructor TfrmDescricaoTecLUX.Create(AOwner: TComponent);
begin
  inherited;
  lblVersaoSistema1.Caption  := GetVersao;
  lblVersaoBanco1.Caption    := VersaoBanco;
  lblLicenciadoPara1.Caption := '';
end;

procedure TfrmDescricaoTecLUX.lblSiteClick(Sender: TObject);
{
var
  Url: String;
}
begin
{
  if Sender = lblSite then
   Url := 'http:\\'
  else
   Url := 'mailto:';
  Url := Url + TLabel(Sender).Caption;
  ShellExecute (0, 'open', PChar(Url), '', '', 1);
}
end;

end.
