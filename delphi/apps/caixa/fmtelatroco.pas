unit fmtelatroco;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, fmnavcontroles, cpnumero;

type
  Tfrmtelatroco = class(TfrmNavControles)
    GroupBox1: TGroupBox;
    sbnconfirma: TBitBtn;
    Label1: TLabel;
    lblTroco: TLabel;
    Timer: TTimer;
    procedure sbnconfirmaClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    procedure setTroco(const Value: Currency);
    { Private declarations }
  public
    constructor Create(Aowner: TComponent); override;
    destructor destroy; override;
    property Troco: Currency write setTroco;
    procedure CoresLabel;
  end;

var
  frmtelatroco: Tfrmtelatroco;
  Cor: Integer;

implementation

{$R *.dfm}
uses
  //Biblio
  biblio;

{ Tfrmtelatroco }

procedure Tfrmtelatroco.CoresLabel;
begin
  case Cor of
    1: lblTroco.Font.Color:= clBlue;
    2: lblTroco.Font.Color:= clRed;
    3: lblTroco.Font.Color:= clMaroon;
    4: lblTroco.Font.Color:= clGreen;
  end;
end;

constructor Tfrmtelatroco.Create(Aowner: TComponent);
begin
  inherited;
  Cor:= 1;
end;

destructor Tfrmtelatroco.destroy;
begin
  inherited;
  frmtelatroco := nil;
end;

procedure Tfrmtelatroco.sbnconfirmaClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK
end;

procedure Tfrmtelatroco.setTroco(const Value: Currency);
begin
lblTroco.Caption:= 'R$ '+ FormatFloat('#0,' + ThousandSeparator + '00', Value)
end;

procedure Tfrmtelatroco.TimerTimer(Sender: TObject);
begin
  inherited;
  if lblTroco.Visible = True then
    lblTroco.Visible := False
  else
  begin
    CoresLabel;
    inc(Cor);
    lblTroco.Visible:= True;
    if Cor = 5 then
      Cor := 1;
  end;

end;

end.
