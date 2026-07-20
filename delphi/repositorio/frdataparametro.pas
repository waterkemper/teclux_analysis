unit frdataparametro;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  frintervalodatas, cpdbcombobox, StdCtrls, cpdata, clparametrossistema, biblio,
  dateutils, DBCtrls;

type
  TfraDataParametro = class(Tframe)
    gbxFormaSelecao: TGroupBox;
    dbcFormaSelecao: TtecDBComboBox;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataFinal: TEditData;
    procedure dbcFormaSelecaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraDataParametro.dbcFormaSelecaoChange(
  Sender: TObject);
begin
  inherited;
  case dbcFormaSelecao.ItemIndex of
  0: begin  //MÊS ANTERIOR
       edtDataFinal.Text := DateToStr(UltimoDiaMesPassado(1));
     end;
  1: begin  //MÊS ATUAL
       edtDataFinal.Text := DateToStr(UltimoDiaMesPassado(0));
     end;
  2: begin  //PERÍODO SELECIONADO
         edtDataFinal.Text := DateToStr(date());
     end;
  end;

  if edtDataFinal.CanFocus then
  begin
    edtDataFinal.SetFocus;
    edtDataFinal.SelectAll;
  end;
end;

end.
