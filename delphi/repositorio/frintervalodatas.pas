unit frintervalodatas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cpdata, biblio, ctconstantes;

type
  TfraIntervaloDatas = class(TFrame)
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidarIntervalo: Boolean;
  end;

implementation

{$R *.dfm}

{ TfraIntervaloDatas }

function TfraIntervaloDatas.ValidarIntervalo: Boolean;
begin
  Result := (Self.edtDataInicial.DataValida and Self.edtDataFinal.DataValida);
  if Result then
  begin
    if (not dataembranco(Self.edtDataInicial.text) and not dataembranco(Self.edtDataFinal.text)) then
      Result:=StrToDate(Self.edtDataInicial.Text) <= StrToDate(Self.edtDataFinal.Text);

    if result then
    begin
      Result:=(not dataembranco(Self.edtDataInicial.text) or not dataembranco(Self.edtDataFinal.text));
      if not Result then
      begin
        MensagemAviso(ctDATAINVALIDA);
        Self.edtDataInicial.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      Self.edtDataInicial.SetFocus;
    end;
  end;

end;

end.
