unit frcomissao;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, cpnumero, cpdbradiogroup;

type
  TfraComissao = class(TFrame)
    gbxComissao: TGroupBox;
    dtxComissao: TDBEditNumero;
    lblComissao: TLabel;
    rgpTipoComissao: TtecDBRadioGroup;
    rbnPercentual: TtecRadioButton;
    rbnValor: TtecRadioButton;
    procedure dtxComissaoExit(Sender: TObject);
    procedure rbnPercentualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgpTipoComissaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  biblio;

{$R *.dfm}

procedure TfraComissao.dtxComissaoExit(Sender: TObject);
begin
  if dtxComissao.Text <> '' then
    if (StrToFloat(dtxComissao.Text) > 100) and rbnPercentual.Checked then
    begin
      MensagemAviso('O valor da comissão não pode exceder 100%');
      dtxComissao.Text := '0';
    end;
end;

procedure TfraComissao.rbnPercentualKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if dtxComissao.Text <> '' then
    if (StrToFloat(dtxComissao.Text) > 100) and rbnPercentual.Checked then
    begin
      MensagemAviso('O valor da comissão não pode exceder 100%');
      dtxComissao.Text := '0';
    end;
end;

procedure TfraComissao.rgpTipoComissaoChange(Sender: TObject);
begin
  if rgpTipoComissao.ItemIndex = 0 then
    lblComissao.Caption:= 'PERCENTUAL'
  else if rgpTipoComissao.ItemIndex = 1 then
    lblComissao.Caption:= 'VALOR';
end;

end.
