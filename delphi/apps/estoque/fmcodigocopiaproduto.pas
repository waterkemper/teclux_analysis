unit fmcodigocopiaproduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TfrmCodigoCopiaProduto = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edCodigoProduto: TMaskEdit;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCodigoCopiaProduto: TfrmCodigoCopiaProduto;

implementation

{$R *.dfm}

procedure TfrmCodigoCopiaProduto.BitBtn1Click(Sender: TObject);
begin
   Self.ModalResult:=mrOk;
end;

procedure TfrmCodigoCopiaProduto.BitBtn2Click(Sender: TObject);
begin
  Self.ModalResult:=mrCancel;
end;

end.
