unit frintervalodatasparametros;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  frintervalodatas, cpdbcombobox, StdCtrls, cpdata, clparametrossistema, biblio,
  dateutils, DBCtrls;

type
  TfraIntervaloDatasParametros = class(TfraIntervaloDatas)
    gbxFormaSelecao: TGroupBox;
    dbcFormaSelecao: TComboBox;
    procedure dbcFormaSelecaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraIntervaloDatasParametros.dbcFormaSelecaoChange(
  Sender: TObject);
begin
  inherited;
  case dbcFormaSelecao.ItemIndex of
  0: begin  //MÊS ANTERIOR
       edtDataInicial.Text := DateToStr(PrimeiroDiaMesPassado(1));
       edtDataFinal.Text := DateToStr(UltimoDiaMesPassado(1));
     end;
  1: begin  //MÊS ATUAL
       edtDataInicial.Text := DateToStr(PrimeiroDiaMesPassado(0));
       edtDataFinal.Text := DateToStr(UltimoDiaMesPassado(0));
     end;
  2: begin  //PERÍODO SELECIONADO
       if edtDataInicial.Text = '' then
         edtDataInicial.Text := DateToStr(date());

       if edtDataFinal.Text = '' then
         edtDataFinal.Text := DateToStr(date());
     end;
  3: begin  //EXERCÍCIO ATUAL
       if edtDataInicial.Text = '' then
       begin
         if ParSistema.EXERCICIOCONTABILIDADE<>0 then
           edtDataInicial.Text := '01/01/'+inttostr(parsistema.EXERCICIOCONTABILIDADE)
         else
           edtDataInicial.Text := '01/01/'+inttostr(YearOf(DataLocal));
       end;

       if edtDataFinal.Text = '' then
       begin
         if ParSistema.EXERCICIOCONTABILIDADE<>0 then
           edtDataFinal.Text := '31/12/'+inttostr(parsistema.EXERCICIOCONTABILIDADE)
         else
           edtDataFinal.Text := '31/12/'+inttostr(YearOf(DataLocal));
       end;
     end;
  4: begin  //EXERCÍCIO anterior
       if edtDataInicial.Text = '' then
       begin
         if ParSistema.EXERCICIOCONTABILIDADE<>0 then
           edtDataInicial.Text := '01/01/'+inttostr(parsistema.EXERCICIOCONTABILIDADE-1)
         else
           edtDataInicial.Text := '01/01/'+inttostr(YearOf(DataLocal)-1);
       end;

       if edtDataFinal.Text = '' then
       begin
         if ParSistema.EXERCICIOCONTABILIDADE<>0 then
           edtDataFinal.Text := '31/12/'+inttostr(parsistema.EXERCICIOCONTABILIDADE-1)
         else
           edtDataFinal.Text := '31/12/'+inttostr(YearOf(DataLocal)-1);
       end;
     end;

  end;
  
  if edtDataInicial.CanFocus then
  begin
    edtDataInicial.SetFocus;
    edtDataInicial.SelectAll;
  end;
end;

end.
